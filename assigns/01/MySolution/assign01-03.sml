fun xlist_remove_reverse(xs:'a xlist): 'a xlist =
(
case xs of
xlist_nil => xlist_nil
|
xlist_cons(x1, xs) => xlist_cons(x1, xlist_remove_reverse(xs))
|
xlist_snoc(xs, x1) => xlist_snoc(xlist_remove_reverse(xs), x1)
|
xlist_append(xs, ys) => xlist_append(xlist_remove_reverse(xs), xlist_remove_reverse(ys))
|
xlist_reverse(xs) => let fun reverse_helper(xs:'a xlist): 'a xlist =
    (
        case xs of
        xlist_nil => xlist_nil
        |
        xlist_cons(x1, xs) => xlist_snoc(reverse_helper(xs), x1)
        |
        xlist_snoc(xs, x1) => xlist_cons(x1, reverse_helper(xs))
        |
        xlist_append(xs, ys) => xlist_append(reverse_helper(ys), reverse_helper(xs))
        |
        xlist_reverse(xs) => xlist_remove_reverse(xs)
    )
in
    reverse_helper(xs)
end
);

