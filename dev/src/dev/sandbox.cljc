(ns dev.sandbox
  "This is a namespace."
  (:require [clojure.test :as t]))

(defn add
  "Hello, World!
  This is a function."
  [a b]
  (+ a b))

(do
  (print "foo ")
  (print "bar ")
  (println "baz")
  (print "new line")
  (print " same!\n")
  (println "     some indentation")
  (println "last on own"))

; :ConjureConfig clojure.nrepl/refresh.after "dev.sandbox/after-refresh"
(defn after-refresh []
  (println "All done!"))

(range 30)

(meta #'add)
(time (add 10 20))
(println "foo" #?(:clj :clojure! :cljs :clojurescript!))

*1 *2 *3 *e

(t/deftest test-a
  (t/testing "foo"
    (t/is (= 10 10))))

(t/deftest test-b
  (t/testing "bar"
    (t/is (= 10 10))))

(comment
  (throw (Error. "ohno"))
  (do (Thread/sleep 5000)
      (println "FOO"))
  (future
    (do (Thread/sleep 5000)
        (println "BAR")))

  (tap> :foo)

  (read)
  (read-line)

  ;; Piggieback.
  ; :ConjureEval (require 'cljs.repl.node)
  ; :ConjurePiggieback (cljs.repl.node/repl-env)
  (require '[cider.piggieback :as piggieback]
           '[cljs.repl.node :as node-repl])
  (piggieback/cljs-repl (node-repl/repl-env))

  (clojure.string/split-lines (slurp "/home/oliver/Downloads/cities.csv"))

  ;; Shadow.
  ; :ConjureShadowSelect app
  (shadow.cljs.devtools.api/nrepl-select :app)

  (enable-console-print!)
  (throw (js/Error. "ohno"))
  :cljs/quit)
