#!/usr/bin/env python3
#Copying most of this off the Hebi Python API docs

import rospy
import hebi
from time import sleep, time
from std_msgs.msg import Float32
from geometry_msgs.msg import Quaternion
from sensor_msgs.msg import Imu
#from state_feedback.msg import JointFeedback

rospy.init_node('state_sender', anonymous=True)
lookup = hebi.Lookup()
sleep(2.0)


names = []
#pubs = []
pospubs = []
velpubs = []
effpubs = []
imupubs = []
for i in range(6):
    names.append('elbow'+str(i+1))
    #pubs.append(rospy.Publisher('matt6_elbow'+str(i+1)+'_state', JointFeedback, queue_size=10))
    pospubs.append(rospy.Publisher('matt6_elbow'+str(i+1)+'_position', Float32, queue_size=10))
    velpubs.append(rospy.Publisher('matt6_elbow'+str(i+1)+'_velocity', Float32, queue_size=10))
    effpubs.append(rospy.Publisher('matt6_elbow'+str(i+1)+'_effort', Float32, queue_size=10))
    names.append('shoulder'+str(i+1))
    #pubs.append(rospy.Publisher('matt6_shoulder'+str(i+1)+'_state', JointFeedback, queue_size=10))
    pospubs.append(rospy.Publisher('matt6_shoulder'+str(i+1)+'_position', Float32, queue_size=10))
    velpubs.append(rospy.Publisher('matt6_shoulder'+str(i+1)+'_velocity', Float32, queue_size=10))
    effpubs.append(rospy.Publisher('matt6_shoulder'+str(i+1)+'_effort', Float32, queue_size=10))
    names.append('base'+str(i+1))
    #pubs.append(rospy.Publisher('matt6_base'+str(i+1)+'_state', JointFeedback, queue_size=10))
    pospubs.append(rospy.Publisher('matt6_base'+str(i+1)+'_position', Float32, queue_size=10))
    velpubs.append(rospy.Publisher('matt6_base'+str(i+1)+'_velocity', Float32, queue_size=10))
    effpubs.append(rospy.Publisher('matt6_base'+str(i+1)+'_effort', Float32, queue_size=10))
    imupubs.append(rospy.Publisher('matt6_baseimu'+str(i+1)+'/data', Imu, queue_size=10))

group = lookup.get_group_from_names(['hexapod'], names)

group_feedback = hebi.GroupFeedback(group.size)
group.feedback_frequency = 200.0

imupub = rospy.Publisher('imu/data', Imu, queue_size=10)
while not rospy.is_shutdown():
    fbk = group_feedback
    group_feedback = group.get_next_feedback(reuse_fbk=group_feedback)
    if group_feedback is None:
        #group_feedback = fbk #Reuse old feedback
        continue #Skip it and wait for something to happen
    #print(group_feedback.position)
    for i in range(18):
        #msg = JointFeedback()
        #msg.position = group_feedback.position[i]
        #msg.velocity = group_feedback.velocity[i]
        #msg.effort = group_feedback.effort[i]
        #pubs[i].publish(msg)
        pospubs[i].publish(group_feedback.position[i])
        velpubs[i].publish(group_feedback.velocity[i])
        effpubs[i].publish(group_feedback.effort[i])
        if i%3 == 2:
            temp = group_feedback.orientation[i]
            imumsg = Imu()
            imumsg.angular_velocity.x = group_feedback.gyro[i][0]
            imumsg.angular_velocity.y = group_feedback.gyro[i][1]
            imumsg.angular_velocity.z = group_feedback.gyro[i][2]
            
            #Acceleration
            imumsg.linear_acceleration.x = group_feedback.accelerometer[i][0]
            imumsg.linear_acceleration.y = group_feedback.accelerometer[i][1]
            imumsg.linear_acceleration.z = group_feedback.accelerometer[i][2]
            
            #Orientation
            msg = Quaternion()        
            msg.w = temp[3]
            msg.x = temp[2]
            msg.y = temp[1]
            msg.z = -temp[0]
            imumsg.orientation = msg
            imupubs[i//3].publish(imumsg)
            if i//3 == 4:
                imupub.publish(imumsg)
