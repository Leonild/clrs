(require-extension syntax-case)
(require '../15.5/section)
(import section-15.5)
(let ((root (list->array 2 '((1 1 2 2 2)
                             (0 2 2 2 4)
                             (0 0 3 4 5)
                             (0 0 0 4 5)
                             (0 0 0 0 5)))))
  (construct-optimal-bst root)
  )