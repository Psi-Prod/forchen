module ANSI_Forchen = Forchen.Make (Forchen.Colors.ANSI) (Mirage_crypto_rng)

let () =
  Mirage_crypto_rng_unix.initialize (module Mirage_crypto_rng.Fortuna);
  print_endline
  @@ ANSI_Forchen.fortune ~msg_list:Forchen.Fortune.all ~mode:`Complex ()
