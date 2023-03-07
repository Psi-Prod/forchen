module ANSI_Forchen = Forchen.Make (Forchen.Colors.ANSI) (Mirage_crypto_rng)

let usage_msg = Printf.sprintf "%s [--mode MODE]" Sys.argv.(0)
let mode = ref `Complex

let speclist =
  [
    ( "--mode",
      Arg.String
        (function
        | "nocolor" -> mode := `NoColor
        | "simple" -> mode := `Simple
        | "complex" -> mode := `Complex
        | s -> failwith @@ "Unknown mode " ^ s),
      "Select color mode (nocolor, simple or complex)" );
  ]

let () =
  Mirage_crypto_rng_unix.initialize (module Mirage_crypto_rng.Fortuna);
  Arg.parse speclist (fun _ -> ()) usage_msg;
  print_endline
  @@ ANSI_Forchen.fortune ~msg_list:Forchen.Fortune.all ~mode:!mode ()
