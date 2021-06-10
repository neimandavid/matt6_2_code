;; Auto-generated. Do not edit!


(when (boundp 'state_feedback::JointFeedback)
  (if (not (find-package "STATE_FEEDBACK"))
    (make-package "STATE_FEEDBACK"))
  (shadow 'JointFeedback (find-package "STATE_FEEDBACK")))
(unless (find-package "STATE_FEEDBACK::JOINTFEEDBACK")
  (make-package "STATE_FEEDBACK::JOINTFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude JointFeedback.msg.html


(defclass state_feedback::JointFeedback
  :super ros::object
  :slots (_position _velocity _effort ))

(defmethod state_feedback::JointFeedback
  (:init
   (&key
    ((:position __position) 0.0)
    ((:velocity __velocity) 0.0)
    ((:effort __effort) 0.0)
    )
   (send-super :init)
   (setq _position (float __position))
   (setq _velocity (float __velocity))
   (setq _effort (float __effort))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:effort
   (&optional __effort)
   (if __effort (setq _effort __effort)) _effort)
  (:serialization-length
   ()
   (+
    ;; float32 _position
    4
    ;; float32 _velocity
    4
    ;; float32 _effort
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _position
       (sys::poke _position (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _effort
       (sys::poke _effort (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _position
     (setq _position (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _effort
     (setq _effort (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get state_feedback::JointFeedback :md5sum-) "f903e6dd4b5ac686ff7bb7721bb6721b")
(setf (get state_feedback::JointFeedback :datatype-) "state_feedback/JointFeedback")
(setf (get state_feedback::JointFeedback :definition-)
      "float32 position
float32 velocity
float32 effort

")



(provide :state_feedback/JointFeedback "f903e6dd4b5ac686ff7bb7721bb6721b")


