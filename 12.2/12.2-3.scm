(require-extension syntax-case check)
(require '../12.1/section)
(require '../12.2/section)
(import section-12.1)
(import section-12.2)
(check (bt-node-datum (bt-successor figure-12.2/root)) => 17)
(check (bt-node-datum (bt-successor figure-12.2/13)) => 15)
(check (bt-node-datum (bt-predecessor figure-12.2/root)) => 13)
(check (bt-node-datum (bt-predecessor figure-12.2/17)) => 15)
