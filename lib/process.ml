type eval_mode =
  | Disc
  | NonDisc

type acquisition_mode =
  | Must
  | Can

type currency =
  | GBP
  | USD

type time = float

type _ t =
  (* float process *)
  | K : float -> float t
  | Time : time t
  | Lag : float * float t -> float t
  | Val : currency * eval_mode * acquisition_mode * 'a Observable.t t * 'b Observable.t t * float t -> float t
  | Exch : currency * currency -> float t
  | Add : float t * float t -> float t
  | Mul : float t * float t -> float t
  | Max : float t * float t -> float t
  | Neg : float t -> float t
  (* bool process *)
  | LtEq : bool t * bool t -> bool t
  | Eq : bool t * bool t -> bool t
  | And : bool t * bool t -> bool t
  | Or : bool t * bool t -> bool t
  | Not : bool t -> bool t
  (* both *)
  | If : 'b Observable.t t * 'r t * 'r t -> 'r t
