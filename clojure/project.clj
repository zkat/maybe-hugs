(defproject maybe-hugs "0.1.0-SNAPSHOT"
  :description "A Clojure implementation of zkat's maybe-hugs"
  :url "https://github.com/zkat/maybe-hugs/"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.7.0"]]
  :main ^:skip-aot maybe-hugs.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
