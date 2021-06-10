#!/usr/bin/env python

import rospy
import tf
from tf2_msgs.msg import TFMessage
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu
from geometry_msgs.msg import PoseStamped, Vector3Stamped, Quaternion, PoseWithCovarianceStamped, TransformStamped

position = -1
orientation = -1
tflistener = -1

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
    #global tflistener
    msg = PoseStamped()
    msg.header = data.transforms[0].header
    #(trans,rot) = tflistener.lookupTransform('/base_link', '/camera_forward_color_optical_frame', rospy.Time(0))
    msg.pose.position = data.transforms[0].transform.translation
    msg.pose.orientation = data.transforms[0].transform.rotation
    pub = rospy.Publisher('/pose', PoseStamped, queue_size=10)
    pub.publish(msg)
    #return

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("/position", Odometry, callbackOdometry)
    rospy.Subscriber("/imu/data", Imu, callbackImu)
    rospy.Subscriber("/fiducial_pose", PoseWithCovarianceStamped, callbackFiducialPose)
    #rospy.Subscriber("/fused_pose", Odometry, callbackFiducialPose)
    rospy.Subscriber("/tf", TFMessage, callbackTF)
    rospy.spin()

if __name__ == '__main__':
    #tflistener = tf.TransformListener()
    listener()
