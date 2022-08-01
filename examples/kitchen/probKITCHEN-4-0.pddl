(define (problem KITCHEN-4-0)
(:domain KITCHEN)
(:objects
    A B C D - food
    s1 - sink
    d1 - dish
    o1 - oven
)
(:init (clear A) (clear B) (clear C) (clear D) 
    (on d1 A) (on d1 B) (on d1 C) (on d1 D) 
    (is-dirty A) (is-dirty B) (is-dirty C) (is-dirty D)
    (is-raw A) (is-raw B) (is-raw C) (is-raw D)
    (handempty))
(:goal (and (is-cooked A) (is-cooked B) (is-cooked C) (is-cooked D))))
