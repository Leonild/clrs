(define (except? thunk)
  (call-with-current-continuation
   (lambda (return)
     (with-exception-handler
      (lambda (exception) (return #t))
      (lambda () (thunk) #f)))))
