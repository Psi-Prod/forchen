module ANSI_Forchen = Forchen.Make (Forchen.Colors.ANSI) (Mirage_crypto_rng)

let usage_msg = Printf.sprintf "%s [--mode MODE]" Sys.argv.(0)
let mode = ref `Complex
let msg_list = ref Forchen.Fortune.original

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
    ( "--fortunes",
      Arg.String
        (function
        | "original" -> msg_list := Forchen.Fortune.original
        | "esfores" -> msg_list := Forchen.Fortune.esfores
        | "all" -> msg_list := Forchen.Fortune.all
        | s -> failwith @@ "Unknown fortunes " ^ s),
      "Select fortunes (original, esfores or al)" );
  ]

let () =
  Mirage_crypto_rng_unix.initialize (module Mirage_crypto_rng.Fortuna);
  Arg.parse speclist (fun _ -> ()) usage_msg;
  print_endline @@ ANSI_Forchen.fortune ~msg_list:!msg_list ~mode:!mode ()
