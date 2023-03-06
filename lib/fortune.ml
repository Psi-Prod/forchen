type original =
  [ `REPLY_HAZY
  | `EXCELLENT_LUCK
  | `GOOD_LUCK
  | `AVERAGE_LUCK
  | `BAD_LUCK
  | `GOOD_NEWS
  | `AWARE_RAAN
  | `KITA_TORI
  | `HANDSOME_STRANGER
  | `BETTER_NOT
  | `OUTLOOK_GOOD
  | `VERY_BAD
  | `GODLY_LUCK ]

type esfores =
  [ `LE_EBIN
  | `GET_DICK
  | `AYY_LMAO
  | `BANNED
  | `GET_SHREKT
  | `THE_GAME
  | `SENPAI_BAKA ]

type all = [ original | esfores ]

let original =
  [
    `REPLY_HAZY;
    `EXCELLENT_LUCK;
    `GOOD_LUCK;
    `AVERAGE_LUCK;
    `BAD_LUCK;
    `GOOD_NEWS;
    `AWARE_RAAN;
    `KITA_TORI;
    `HANDSOME_STRANGER;
    `BETTER_NOT;
    `OUTLOOK_GOOD;
    `VERY_BAD;
    `GODLY_LUCK;
  ]

let esfores =
  [
    `LE_EBIN;
    `GET_DICK;
    `AYY_LMAO;
    `BANNED;
    `GET_SHREKT;
    `THE_GAME;
    `SENPAI_BAKA;
  ]

let all = original @ esfores

module Strings = struct
  let your_fortune = "Your fortune: "
  let reply_hazy = "Reply hazy, try again"
  let excellent_luck = "Excellent Luck"
  let good_luck = "Good Luck"
  let average_luck = "Average Luck"
  let bad_luck = "Bad Luck"
  let good_news = "Good news will come to you by mail"
  let aware_raan = "（　´_ゝ`）ﾌｰﾝ"
  let kita_tori = "ｷﾀ━━━━━━(ﾟ∀ﾟ)━━━━━━ !!!!"
  let handsome_stranger = "You will meet a dark handsome stranger"
  let better_not = "Better not tell you now"
  let outlook_good = "Outlook good"
  let very_bad = "Very Bad Luck"
  let godly_luck = "Godly Luck"
  let le_ebin = "le ebin dubs xDDDDDDDDDDDD"
  let get_dick = "you gon' get some dick"
  let ayy_lmao = "ayy lmao"
  let banned = "(YOU ARE BANNED)"
  let get_shrekt = "Get Shrekt"
  let the_game = "YOU JUST LOST THE GAME"
  let senpai_baka = "NOT SO SENPAI BAKA~KUN"

  let string_of_fortune ?(intro = your_fortune) f =
    intro
    ^
    match f with
    | `REPLY_HAZY -> reply_hazy
    | `EXCELLENT_LUCK -> excellent_luck
    | `GOOD_LUCK -> good_luck
    | `AVERAGE_LUCK -> average_luck
    | `BAD_LUCK -> bad_luck
    | `GOOD_NEWS -> good_news
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
    | `SENPAI_BAKA -> senpai_baka
end
