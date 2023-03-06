module Colors = Colors
module Fortune = Fortune

module type S = sig
  type t

  val fortune :
    ?i:string ->
    ?msg_list:Fortune.all list ->
    ?mode:[ `NoColor | `Simple | `Complex ] ->
    unit ->
    t
end

module Make (C : Colors.S) (R : Mirage_random.S) : S with type t := C.t = struct
  let random l =
    let cstr = R.generate 2 in
    Cstruct.BE.get_uint16 cstr 0 mod List.length l |> List.nth l

  let fortune ?i ?(msg_list = Fortune.original) ?(mode = `NoColor) () =
    let msg = random msg_list in
    match mode with
    | `NoColor -> Fortune.Strings.string_of_fortune msg |> C.nocolor
    | `Simple ->
        C.Simple.colorize ?i (Fortune.Strings.string_of_fortune msg) msg
    | `Complex ->
        C.Complex.colorize ?i (Fortune.Strings.string_of_fortune msg) msg
end
