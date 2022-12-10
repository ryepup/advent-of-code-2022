(in-package :asdf-user)

(defsystem "advent-2022"
  :version "0.0.0"
  :author "Ryan Davis <ryepup@gmail.com>"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                        :components
                        ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "advent-2022/tests"))))

(defsystem "advent-2022/tests"
  :author "Ryan Davis <ryepup@gmail.com>"
  :license "MIT"
  :depends-on ("advent-2022" "fiveam")
  :components ((:module "tests"
                        :components
                        ((:file "main"))))
  :description "Test system for advent-2022"
  :perform (test-op (op c) (symbol-call :fiveam :run! :advent-2022)))
