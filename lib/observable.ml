type +'a t = 'a

let konst (x : 'a) : 'a t = x

let run (x : 'a t) : 'a = x

let equal (a : 'a t) (b : 'a t) : bool = a = b
