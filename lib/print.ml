open Format
open Observable

let pp ppf obs =
  fprintf ppf "%s" (run obs)
