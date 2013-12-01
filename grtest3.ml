(* To compile this example: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph " 640x480";;

(* bouncyball state stored as (y, yvel) *)
let make_ball y yvel =
  let initial_state = (y, yvel) in
  let rec bouncyball x =
    match x with
    | 0 -> initial_state
    | _ -> let (y, yvel) = bouncyball (x-1) in
      if (y < 0.0) then (0.0, -0.7 *. yvel)
      else (y +. yvel, yvel -. 0.1)
  in bouncyball;;

let ball1 = make_ball 400.0 0.0;;
let ball2 = make_ball 300.0 0.0;;
let ball3 = make_ball 300.0 4.0;;

for x = 0 to 640 do
  Graphics.plot x (int_of_float (fst (ball1 x)));
  Graphics.plot x (int_of_float (fst (ball2 x)));
  Graphics.plot x (int_of_float (fst (ball3 x)));
done;;

read_line ();;
