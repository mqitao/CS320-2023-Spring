use "./../../../mysmlib/mysmlib-cls.sml"

val abs = fn(x:int) => if x>= 0 then x else ~x 

fun quiz02_02(xs: int list, ys: int list) : bool =
	(case ys of nil => false
	|y1::ys => 
	let 
  val res = list_reduce_left(xs, [], fn(r,x) => abs(y1 - x) ::r)
			
	in list_exists(res, fn(x) => x < 10) orelse quiz02_02(xs, ys)
  end) 