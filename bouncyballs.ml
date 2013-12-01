module G = Graphics;;
Random.self_init ();;
G.open_graph " 640x480";;

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
let ball2 = make_ball 300.0 1.0;;

for x = 0 to 640 do
  G.set_color G.red;
  G.plot x (int_of_float (fst (ball1 x)));
  G.set_color G.blue;
  G.plot x (int_of_float (fst (ball2 x)));
done;;

read_line ();;