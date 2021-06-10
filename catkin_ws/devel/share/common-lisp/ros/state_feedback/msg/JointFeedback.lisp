; Auto-generated. Do not edit!


(cl:in-package state_feedback-msg)


;//! \htmlinclude JointFeedback.msg.html

(cl:defclass <JointFeedback> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0)
   (effort
    :reader effort
    :initarg :effort
    :type cl:float
    :initform 0.0))
)

(cl:defclass JointFeedback (<JointFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_feedback-msg:<JointFeedback> is deprecated: use state_feedback-msg:JointFeedback instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <JointFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_feedback-msg:position-val is deprecated.  Use state_feedback-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <JointFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_feedback-msg:velocity-val is deprecated.  Use state_feedback-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'effort-val :lambda-list '(m))
(cl:defmethod effort-val ((m <JointFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_feedback-msg:effort-val is deprecated.  Use state_feedback-msg:effort instead.")
  (effort m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointFeedback>) ostream)
  "Serializes a message object of type '<JointFeedback>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointFeedback>) istream)
  "Deserializes a message object of type '<JointFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'effort) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointFeedback>)))
  "Returns string type for a message object of type '<JointFeedback>"
  "state_feedback/JointFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointFeedback)))
  "Returns string type for a message object of type 'JointFeedback"
  "state_feedback/JointFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointFeedback>)))
  "Returns md5sum for a message object of type '<JointFeedback>"
  "f903e6dd4b5ac686ff7bb7721bb6721b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointFeedback)))
  "Returns md5sum for a message object of type 'JointFeedback"
  "f903e6dd4b5ac686ff7bb7721bb6721b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointFeedback>)))
  "Returns full string definition for message of type '<JointFeedback>"
  (cl:format cl:nil "float32 position~%float32 velocity~%float32 effort~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointFeedback)))
  "Returns full string definition for message of type 'JointFeedback"
  (cl:format cl:nil "float32 position~%float32 velocity~%float32 effort~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointFeedback>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'JointFeedback
    (cl:cons ':position (position msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':effort (effort msg))
))
