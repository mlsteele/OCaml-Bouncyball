(* Draw bouncyballs. *)

module G = Graphics;;
Random.self_init ();;
G.open_graph " 640x480";;

let make_ball y yvel =
  let initial_state = (y, yvel) in
  (* bouncyball state stored as (y, yvel) *)
  let rec bouncyball x =
    match x with
    | 0 -> initial_state
    | _ -> let (y, yvel) = bouncyball (x-1) in
      (* Bounce if below the ground. *)
      if (y < 0.0) then (0.0, -0.7 *. yvel)
      (* Else continue falling. *)
      else (y +. yvel, yvel -. 0.1)
  in bouncyball;;

(* Initialize bouncyballs. *)
let ball1 = make_ball 400.0 0.0;;
let ball2 = make_ball 300.0 1.0;;

(* Draw each column of the picture. *)
for x = 0 to 640 do
  G.set_color G.red;
  G.plot x (int_of_float (fst (ball1 x)));

  G.set_color G.blue;
  G.plot x (int_of_float (fst (ball2 x)));
done;;

read_line ();;
