(require-extension check)
(require '../20.2/section)
(require '../util/util)
(import* util debug)
(import section-20.2)
(let ((heap (figure-20.3)))
  (check (fibonacci-node-key (fibonacci-heap-extract-min! heap))
         => 3)
  (check (fibonacci-node-key (fibonacci-heap-extract-min! heap))
         => 7)
  (check (fibonacci-heap->list fibonacci-node-key heap) =>
         '((17 (30) (38 (41)) (18 (39) (21 (52))))
           (23)
           (24 (26 (35)) (46)))))
