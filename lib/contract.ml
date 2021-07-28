type currency = float

type time = float

type t =
  | Zero : t
  | One : currency -> t
  | Give : t -> t
  | And : t * t -> t
  | Or : t * t -> t
  | If : bool Observable.t * t * t -> t
  | Scale : float Observable.t * t -> t
  | Until : bool Observable.t * t -> t
  | When : bool Observable.t * t -> t
  | Anytime : bool Observable.t * t -> t
  | Delay : time Observable.t * t -> t

let rec simplify = function
  | Zero -> Zero
  | One k -> One k
  | Give Zero -> Zero
  | Give c -> Give (simplify c)
  | And (c, Zero) -> simplify c
  | And (Zero, c) -> simplify c
  | And (c1, c2) -> And (simplify c1, simplify c2)
  | Or (Zero, Zero) -> Zero
  | Or (c1, c2) -> Or (simplify c1, simplify c2)
  | Scale (_, Zero) -> Zero
  | Scale (f, c) -> Scale (f, simplify c)
  | If (_, Zero, Zero) -> Zero
  | If (b, c1, c2) -> If (b, simplify c1, simplify c2)
  | Delay (_, Zero) -> Zero
  | Delay (t, c) -> Delay (t, simplify c)
  | Until (_, Zero) -> Zero
  | Until (b, c) -> Until (b, simplify c)
  | When (_, Zero) -> Zero
  | When (b, c) -> When (b, simplify c)
  | Anytime (_, Zero) -> Zero
  | Anytime (b, c) -> Anytime (b, simplify c)
