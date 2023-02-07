fun 
xlist_size(xs: 'a xlist) : int =
(
case xs of
xlist_nil => 0
|
xlist_cons(x1, xs) => 1 + xlist_size(xs)
|
xlist_snoc(xs, x1) => 1 + xlist_size(xs)
|
xlist_append(xs, ys) => xlist_size(xs) + xlist_size(ys)
|
xlist_reverse(xs) => xlist_size(xs)
);

 
fun xlist_sub(xs:'a xlist, i0: int): 'a=
if i0 >= xlist_size(xs) then raise XlistSubscript
else
(
case xs of
xlist_cons(x1, xs) => (case i0 of 0 => x1 | i0 => xlist_sub(xs, i0 - 1))
|
xlist_snoc(xs, x1) => (case (i0 = xlist_size(xs)) of true => x1 | false => xlist_sub(xs, i0))
|
xlist_append(xs,ys) => (case (i0 < xlist_size(xs)) of true => xlist_sub(xs, i0) | false => xlist_sub(ys, i0 -xlist_size(xs)))
|
xlist_reverse(xs) => xlist_sub(xs, xlist_size(xs) - i0 - 1)
|
xlist_nil => raise XlistSubscript
);

