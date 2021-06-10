
(cl:in-package :asdf)

(defsystem "state_feedback-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "JointFeedback" :depends-on ("_package_JointFeedback"))
    (:file "_package_JointFeedback" :depends-on ("_package"))
  ))