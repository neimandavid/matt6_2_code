#!/usr/bin/env python2

import rospy
import copy
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu
from geometry_msgs.msg import PoseStamped, Vector3Stamped, Quaternion, PoseWithCovarianceStamped
from fiducial_msgs.msg import FiducialTransform, FiducialTransformArray
from apriltag_ros.msg import AprilTagDetectionArray, AprilTagDetection
from aprilslam.msg import Apriltags, Apriltag

position = -1
orientation = -1
imagecount = 0

def callbackOdometry(data):
    rospy.loginfo("Odom")
    print("Odom")
    global position
    global orientation
    if data.pose.pose.position.x == 0.0 and data.pose.pose.position.y == 0.0 and data.pose.pose.position.z == 0.0:
        #Garbage data, ignore
        return
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

def callbackRtabmap(data):
    rospy.loginfo("Odom")
    print("Odom")
    if data.pose.pose.position.x == 0.0 and data.pose.pose.position.y == 0.0 and data.pose.pose.position.z == 0.0:
        #Garbage data, ignore
        return
    mposition = data.pose.pose.position
    morientation = copy.deepcopy(data.pose.pose.orientation)
    morientation.z = -data.pose.pose.orientation.w
    morientation.w = data.pose.pose.orientation.z
    if not orientation == -1:
        rospy.loginfo("Position: %s \n Orientation: %s", position, orientation)
        msg = PoseStamped()
        msg.header = data.header
        msg.pose.orientation = morientation
        msg.pose.position = mposition
        pub = rospy.Publisher('/pose', PoseStamped, queue_size=10)
        pub.publish(msg)

def callbackAprilTags(data):
    global imagecount
    msg = FiducialTransformArray()
    msg.header = data.header
    msg.image_seq = imagecount
    imagecount = imagecount + 1
    msg.transforms = list()
    for i in range(len(data.detections)):
        temp = FiducialTransform()
        temp.transform.translation = data.detections[i].pose.pose.pose.position
        temp.transform.rotation = data.detections[i].pose.pose.pose.orientation
        temp.fiducial_id = data.detections[i].id[0]
        #Make up some numbers to make SLAM not immediately blow up
        temp.image_error = 0.01
        temp.object_error = 0.01
        temp.fiducial_area = 10000
        msg.transforms.append(temp)
    pub = rospy.Publisher('/fiducial_transforms', FiducialTransformArray, queue_size=10)
    pub.publish(msg)
    
    

def callbackAprilTags2(data):
    global imagecount
    msg = Apriltags()
    msg.header = data.header
    msg.header.seq = imagecount
    imagecount = imagecount + 1
    msg.apriltags = list()
    for i in range(len(data.detections)):
        temp = Apriltag()
        temp.id = data.detections[i].id[0]
        temp.family = "36h11"
        temp.size = 0.172
        temp.hamming_distance = 0
        temp.pose = data.detections[i].pose.pose.pose
        #Need corners?? In pixel space????
        msg.apriltags.append(temp)
    pub = rospy.Publisher('/camera_forward/color/apriltags', Apriltags, queue_size=10)
    pub.publish(msg)

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("/position", Odometry, callbackOdometry) #From Total Station
    rospy.Subscriber("/imu/data", Imu, callbackImu)
    rospy.Subscriber("/fiducial_pose", PoseWithCovarianceStamped, callbackFiducialPose)
    #rospy.Subscriber("/fused_pose", Odometry, callbackFiducialPose)
    rospy.Subscriber("/rtabmap/odom", Odometry, callbackRtabmap) #From RTabMap
    rospy.Subscriber("/tag_detections", AprilTagDetectionArray, callbackAprilTags2)
    rospy.spin()

if __name__ == '__main__':
    listener()
