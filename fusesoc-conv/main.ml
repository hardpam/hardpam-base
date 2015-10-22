open Printf

let read_core chan = 
  let st = Yojson.init_lexer () in
  let lex = Lexing.from_channel chan in
  (fun () -> Cores_j.read_core st lex)

let read_core = read_core stdin

let rec read_all () = 
  match read_core () with
  | json -> json :: read_all ()
  | exception _ -> []

let cores = read_all ()
let () = printf "%i cores\n" (List.length cores)

