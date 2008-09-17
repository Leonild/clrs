(require-extension syntax-case check array-lib)
(require '../util/util)
(require '../15.5/section)
(import* util round-array)
(import section-15.5)
(let ((p (array-align (list->array 1 '(#f 0.04 0.06 0.08 0.02 0.10 0.12 0.14)) -1))
      (q (array-align (list->array 1 '(0.06 0.06 0.06 0.06 0.05 0.05 0.05 0.05)) -1)))
  (let-values (((e root) (memoized-bst p q)))
    (check (array->list (round-array e)) =>
           '((#f #f #f #f #f #f #f #f #f)
             (0.0 0.0 1.0 1.0 1.0 2.0 2.0 3.0 #f)
             (#f 0.0 0.0 1.0 1.0 1.0 2.0 3.0 #f)
             (#f #f 0.0 0.0 1.0 1.0 1.0 2.0 #f)
             (#f #f #f 0.0 0.0 1.0 1.0 2.0 #f)
             (#f #f #f #f 0.0 0.0 1.0 1.0 #f)
             (#f #f #f #f #f 0.0 0.0 1.0 #f)
             (#f #f #f #f #f #f 0.0 0.0 #f)
             (#f #f #f #f #f #f #f 0.0 #f)))
    (check (array->list root) =>
           '((#f #f #f #f #f #f #f #f #f)
             (#f 0 1 1 1 2 2 4 #f)
             (#f #f 1 2 2 2 4 4 #f)
             (#f #f #f 2 2 3 4 4 #f)
             (#f #f #f #f 3 4 4 5 #f)
             (#f #f #f #f #f 4 5 5 #f)
             (#f #f #f #f #f #f 5 6 #f)
             (#f #f #f #f #f #f #f 6 #f)
             (#f #f #f #f #f #f #f #f #f)))))