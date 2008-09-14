(define (construct-optimal-bst root)
  (let* ((n (car (array-dimensions root)))
         (parents (make-stack (make-vector n #f) -1))
         (iter (rec (iter i j)
                    (let ((r (array-ref root i j)))
                      (if (stack-empty? parents)
                          (begin
                            (format #t "k~A is the root~%" r)
                            (push! parents r)
                            (iter i (- r 1))
                            (iter (+ r 1) j))
                          (let ((parent (peek parents)))
                            (format #t "i: ~A; j: ~A; parent: ~A~%" i j parent)
                            (if (> i j)
                                (if (<= i parent)
                                    (format #t "d~A is the left child~%" r)
                                    (format #t "d~A is the right child~%" r))
                                (begin
                                  (if (<= i parent)
                                      (format #t "k~A is the left child~%" r)
                                      (format #t "k~A is the right child~%" r))
                                  (iter i (- r 1))
                                  (iter (+ r 1) j)))))))))
    (iter 0 (- n 1))))