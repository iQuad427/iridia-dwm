;; Auto-generated. Do not edit!


(when (boundp 'communication::Distance)
  (if (not (find-package "COMMUNICATION"))
    (make-package "COMMUNICATION"))
  (shadow 'Distance (find-package "COMMUNICATION")))
(unless (find-package "COMMUNICATION::DISTANCE")
  (make-package "COMMUNICATION::DISTANCE"))

(in-package "ROS")
;;//! \htmlinclude Distance.msg.html


(defclass communication::Distance
  :super ros::object
  :slots (_robot_id _distance _color ))

(defmethod communication::Distance
  (:init
   (&key
    ((:robot_id __robot_id) 0)
    ((:distance __distance) 0.0)
    ((:color __color) "")
    )
   (send-super :init)
   (setq _robot_id (round __robot_id))
   (setq _distance (float __distance))
   (setq _color (string __color))
   self)
  (:robot_id
   (&optional __robot_id)
   (if __robot_id (setq _robot_id __robot_id)) _robot_id)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:serialization-length
   ()
   (+
    ;; int16 _robot_id
    2
    ;; float32 _distance
    4
    ;; string _color
    4 (length _color)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _robot_id
       (write-word _robot_id s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _robot_id
     (setq _robot_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get communication::Distance :md5sum-) "cd8303e074167b796d0380292be4fd56")
(setf (get communication::Distance :datatype-) "communication/Distance")
(setf (get communication::Distance :definition-)
      "int16 robot_id
float32 distance
string color

")



(provide :communication/Distance "cd8303e074167b796d0380292be4fd56")


