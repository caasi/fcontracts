open Fcontracts.Observable
open Fcontracts.Print

let observable = Alcotest.testable pp equal

let test () =
  Alcotest.(check observable) "same observable" (konst "foobar") (konst "foobar")

let () =
  let open Alcotest in
  run "Fcontracts" [
    "Observable", [
      test_case "Observable" `Quick test;
    ];
  ]
