(require-extension syntax-case check (srfi 11))
(require '../16.1/section)
(import section-16.1)
(let* ((activities '((0 . 0)
                     (1 . 4)
                     (3 . 5)
                     (0 . 6)
                     (5 . 7)
                     (3 . 8)
                     (5 . 9)
                     (6 . 10)
                     (8 . 11)
                     (8 . 12)
                     (2 . 13)
                     (12 . 14)
                     (+inf . +inf))))
  (check (recursive-activity-selector activities) =>
         '((1 . 4) (5 . 7) (8 . 11) (12 . 14)))
  ;; Defective null case (0 . 0)
  (check (recursive-activity-selector-last activities) =>
         '((12 . 14) (8 . 11) (5 . 7) (1 . 4) (0 . 0))))

;;; The same greedy and optimality arguments for earliest-first apply
;;; to latest-first, since latest-first is symmetrical to earliest-
;;; first; and relies merely upon the reversal of time.
