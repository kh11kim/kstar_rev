;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain KITCHEN)
  (:requirements :strips :typing)
  (:types
    movable region - object
    sink oven dish - region
    food - movable
  )

  (:predicates 
    (on ?parent - region ?obj - food)
	  (handempty)
	  (holding ?obj - food)
    (clear ?obj - food)
    (is-dirty ?obj - food)
    (is-clean ?obj - food)
    (is-raw ?obj - food)
    (is-cooked ?obj - food)
	)

  (:action wash
	     :parameters (?obj - food ?parent - sink)
	     :precondition (and (is-dirty ?obj) (on ?parent ?obj))
	     :effect
	     (and (not (is-dirty ?obj)) (is-clean ?obj)))
  
  (:action cook
	     :parameters (?obj - food ?parent - oven)
	     :precondition (and (is-raw ?obj) (on ?parent ?obj) (is-clean ?obj))
	     :effect
	     (and (not (is-raw ?obj)) (is-cooked ?obj)))

  (:action pick-up
	     :parameters (?obj - food ?parent - region)
	     :precondition (and (clear ?obj) (on ?parent ?obj) (handempty))
	     :effect
	     (and (not (on ?parent ?obj))
		   (not (clear ?obj))
		   (not (handempty))
		   (holding ?obj)))

  (:action put-down
	     :parameters (?obj - food ?parent - region)
	     :precondition (holding ?obj)
	     :effect
	     (and (not (holding ?obj))
		   (clear ?obj)
		   (handempty)
		   (on ?parent ?obj))))

  ; (:action stack
	;      :parameters (?x ?y)
	;      :precondition (and (holding ?x) (clear ?y))
	;      :effect
	;      (and (not (holding ?x))
	; 	   (not (clear ?y))
	; 	   (clear ?x)
	; 	   (handempty)
	; 	   (on ?x ?y)))
  ; (:action unstack
	;      :parameters (?x ?y)
	;      :precondition (and (on ?x ?y) (clear ?x) (handempty))
	;      :effect
	;      (and (holding ?x)
	; 	   (clear ?y)
	; 	   (not (clear ?x))
	; 	   (not (handempty))
	; 	   (not (on ?x ?y)))))
