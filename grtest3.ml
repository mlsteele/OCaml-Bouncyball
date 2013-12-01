(* To compile this example: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph " 640x480";;

(* bouncyball state stored as (y, yvel) *)
let rec bouncyball x =
  match x with
  | 0 -> (400.0, 0.0)
  | _ -> let (y, yvel) = bouncyball (x-1) in
    if (y < 0.0) then (0.0, -0.7 *. yvel)
    else (y +. yvel, yvel -. 0.1);;

for x = 0 to 640 do
  let y = fst (bouncyball x) in
  Graphics.plot x (int_of_float y)
done;;

read_line ();;
