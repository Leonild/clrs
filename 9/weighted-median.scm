(define elt-weights '((1 . 1/16)
                      (9 . 1/16)
                      (8 . 1/4)
                      (2 . 1/8)
                      (5 . 1/16)
                      (6 . 1/16)
                      (7 . 3/8)))

(define (weighted-median-with-sort elt-weights)
  (let ((elts (heapsort (map car elt-weights))))
    (loop continue ((for elt (in-list elts))
                    (with total-weight 0)
                    (with index 0 (+ index 1))
                    (until (> total-weight (/ 1 2))))
          => (list-ref elts (- index 1))
          (let ((weight (cdr (assoc elt elt-weights))))
            (continue (=> total-weight (+ total-weight weight)))))))

(define (weighted-median-with-select elt-weights)
  (let ((A (list->vector (map car elt-weights))))
    (define (total-weight p r)
      (loop ((for x (in-vector A p (+ r 1)))
             (with weight 0 (+ weight (cdr (assoc x elt-weights)))))
            => weight))
    (let continue ((p 0)
                   (r (- (vector-length A) 1)))
      (let* ((n (- r p -1))
             (median (lower-median n)))
        (if (< n 3)
            (begin
              (loop ((for x (in-vector A p (+ r 1)))
                     (with local-max -inf.0 (max local-max x)))
                    => local-max))
            (let ((pivot (+ p median)))
              (partition-median! A p r)
              (let ((weight-left (total-weight p (- pivot 1)))
                    (weight-right (total-weight (+ pivot 1) r)))
                (let ((weight-indices
                       `((,weight-left . (,p . ,pivot))
                         (,weight-right . (,pivot . ,r)))))
                  (if (and (< weight-left 1/2)
                           (< weight-right 1/2))
                      (vector-ref A pivot)
                      (let ((indices (cdr (assoc (max weight-left
                                                      weight-right)
                                                 weight-indices))))
                        (continue (car indices) (cdr indices))))))))))))
