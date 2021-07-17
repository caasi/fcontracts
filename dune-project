(lang dune 2.8)

(name fcontracts)

(generate_opam_files true)

(license ISC)

(authors "caasih <caasi.igd@gmail.com>")

(maintainers "caasih <caasi.igd@gmail.com>")

(source
  (github caasi/fcontracts))

(bug_reports "https://github.com/caasi/fcontracts/issues")

(homepage "https://github.com/caasi/fcontracts/")

(package
  (name fcontracts)
  (description "Learning financial contracts.")
  (depends
    (alcotest :with-test)
    (ocaml
      (>= 4.08.1))
    dune))
