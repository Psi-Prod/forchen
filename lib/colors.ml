module type S = sig
  type t

  module Style : sig
    val default : string -> t
    val bold : string -> t
  end

  module Simple : sig
    type c

    val red : c
    val green : c
    val yellow : c
    val blue : c
    val magenta : c
    val cyan : c
    val white : c
    val colorize : ?i:string -> string -> Fortune.all -> t
  end

  module Complex : sig
    type c

    val reply_hazy : c
    val excellent_luck : c
    val good_luck : c
    val average_luck : c
    val bad_luck : c
    val good_news : c
    val aware_raan : c
    val kita_tori : c
    val handsome_stranger : c
    val better_not : c
    val outlook_good : c
    val very_bad : c
    val godly_luck : c
    val le_ebin : c
    val get_dick : c
    val ayy_lmao : c
    val banned : c
    val get_shrekt : c
    val the_game : c
    val senpai_baka : c
    val colorize : ?i:string -> string -> Fortune.all -> t
  end

  val nocolor : string -> t
end

module ANSI = struct
  type t = string

  module Style = struct
    let bold s = "\x1B[1m" ^ s
    let default s = s ^ "\x1B[0m"
  end

  module Simple = struct
    type c = t

    let red = "\x1B[;31m"
    let green = "\x1B[;32m"
    let yellow = "\x1B[;33m"
    let blue = "\x1B[;34m"
    let magenta = "\x1B[;35m"
    let cyan = "\x1B[;36m"
    let white = "\x1B[;37m"

    let colorize ?(i = "") s c =
      (match c with
      | `REPLY_HAZY -> red
      | `EXCELLENT_LUCK -> red
      | `GOOD_LUCK -> yellow
      | `AVERAGE_LUCK -> yellow
      | `BAD_LUCK -> green
      | `GOOD_NEWS -> green
      | `AWARE_RAAN -> green
      | `KITA_TORI -> cyan
      | `HANDSOME_STRANGER -> blue
      | `BETTER_NOT -> blue
      | `OUTLOOK_GOOD -> magenta
      | `VERY_BAD -> magenta
      | `GODLY_LUCK -> magenta
      | `LE_EBIN -> blue
      | `GET_DICK -> blue
      | `AYY_LMAO -> magenta
      | `BANNED -> red
      | `GET_SHREKT -> green
      | `THE_GAME -> white
      | `SENPAI_BAKA -> magenta)
      ^ i ^ s
      |> Style.default
  end

  module Complex = struct
    type c = t

    let reply_hazy = "\x1B[38;2;245;28;106m"
    let excellent_luck = "\x1B[38;2;253;77;50m"
    let good_luck = "\x1B[38;2;231;137;12m"
    let average_luck = "\x1B[38;2;186;194;0m"
    let bad_luck = "\x1B[38;2;127;236;17m"
    let good_news = "\x1B[38;2;67;253;59m"
    let aware_raan = "\x1B[38;2;22;241;116m"
    let kita_tori = "\x1B[38;2;0;203;176m"
    let handsome_stranger = "\x1B[38;2;8;147;225m"
    let better_not = "\x1B[38;2;42;86;251m"
    let outlook_good = "\x1B[38;2;96;35;248m"
    let very_bad = "\x1B[38;2;157;5;218m"
    let godly_luck = "\x1B[38;2;211;2;167m"
    let le_ebin = "\x1B[38;2;38;0;208m"
    let get_dick = "\x1B[38;2;42;86;251m"
    let ayy_lmao = "\x1B[38;2;233;65;227m"
    let banned = "\x1B[38;2;255;0;0m"
    let get_shrekt = "\x1B[38;2;104;146;58m"
    let the_game = "\x1B[38;2;140;140;140m"
    let senpai_baka = "\x1B[38;2;136;28;202m"

    let colorize ?(i = "") s c =
      (match c with
      | `REPLY_HAZY -> reply_hazy
      | `EXCELLENT_LUCK -> excellent_luck
      | `GOOD_LUCK -> good_luck
      | `AVERAGE_LUCK -> average_luck
      | `BAD_LUCK -> bad_luck
      | `GOOD_NEWS -> good_luck
      | `AWARE_RAAN -> aware_raan
      | `KITA_TORI -> kita_tori
      | `HANDSOME_STRANGER -> handsome_stranger
      | `BETTER_NOT -> better_not
      | `OUTLOOK_GOOD -> outlook_good
      | `VERY_BAD -> very_bad
      | `GODLY_LUCK -> godly_luck
      | `LE_EBIN -> le_ebin
      | `GET_DICK -> get_dick
      | `AYY_LMAO -> ayy_lmao
      | `BANNED -> banned
      | `GET_SHREKT -> get_shrekt
      | `THE_GAME -> the_game
      | `SENPAI_BAKA -> senpai_baka)
      ^ i ^ s
      |> Style.default
  end

  let nocolor = Fun.id
end
