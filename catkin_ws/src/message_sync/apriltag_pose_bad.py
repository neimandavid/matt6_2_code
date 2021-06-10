#!/usr/bin/env python

import rospy
#import tf
import tf2_ros
import tf2_geometry_msgs
from tf2_msgs.msg import TransformStamped
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu
from geometry_msgs.msg import PoseStamped, Vector3Stamped, Quaternion, PoseWithCovarianceStamped

position = -1
orientation = -1
tf_buffer = -1

def callbackOdometry(data):
    rospy.loginfo("Odom")
    print("Odom")
    global position
    global orientation
    position = data.pose.pose.position
    if not orientation == -1:
        rospy.loginfo("Position: %s \n Orientation: %s", position, orientation)
        msg = PoseStamped()
        msg.header = data.header
        msg.pose.orientation = orientation
        msg.pose.position = position
        pub = rospy.Publisher('/pose', PoseStamped, queue_size=10)
        pub.publish(msg)

def callbackImu(data): 
    rospy.loginfo("IMU")
    print("IMU")
    global position
    global orientation
    orientation = data.orientation
    if not position == -1:
        rospy.loginfo("Position: %s \n Orientation: %s", position, orientation)
        msg = PoseStamped()
        msg.header = data.header
        msg.pose.orientation = orientation
        msg.pose.position = position
        pub = rospy.Publisher('/pose', PoseStamped, queue_size=10)
        pub.publish(msg)

def callbackFiducialPose(data):
    rospy.loginfo("FiducialPose")
    print("FiducialPose")
    msg = PoseStamped()
    msg.header = data.header
    msg.pose = data.pose.pose 
    pub = rospy.Publisher('/pose', PoseStamped, queue_size=10)
    pub.publish(msg)

def callbackTF(data):
    return
    global tf_buffer
    rospy.loginfo("FiducialTF")
    print("FiducialTF")
    #print(data)
    msg = PoseStamped()
    #msg.header = data.header
    #transform = tf_buffer.lookup_transform('base_link', data.header.frame_id)
    #transform = tf_buffer.lookup_transform('/base_link', '/base_link', rospy.Time(0))
    #msg.pose = tf2_geometry_msgs.do_transform_pose(data.pose, transform)
    pub = rospy.Publisher('/pose', PoseStamped, queue_size=10)
    pub.publish(msg)
    

def listener():
    #global tf_buffer
    #tf_buffer = tf2_ros.Buffer(rospy.Duration(1200.0))
    #tf_listener = tf2_ros.TransformListener(tf_buffer)
    
    #rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("/position", Odometry, callbackOdometry)
    rospy.Subscriber("/imu/data", Imu, callbackImu)
    rospy.Subscriber("/fiducial_pose", PoseWithCovarianceStamped, callbackFiducialPose)
    #rospy.Subscriber("/fused_pose", Odometry, callbackFiducialPose)
    
    #rospy.Subscriber("/tf", PoseStamped, callbackTF)
    #rospy.Subscriber("/tf", TransformStamped, callbackTF)

    rospy.spin()

if __name__ == '__main__':
    listener()
