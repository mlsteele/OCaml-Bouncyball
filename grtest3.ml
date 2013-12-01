(* To compile this example: ocamlc graphics.cma grtest2.ml -o grtest2 *)

Random.self_init ();;
Graphics.open_graph " 640x480";;

(* bouncyball state stored as (y, yvel) *)
let rec bouncyball x =
  match x with
  | 0 -> (200, 0)
  | _ -> let (y, yvel) = bouncyball (x-1) in
    (y + yvel, yvel - 1);;

for x = 0 to 640 do
  Graphics.plot x (fst (bouncyball x))
done;;

read_line ();;
