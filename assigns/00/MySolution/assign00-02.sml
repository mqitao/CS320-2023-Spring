fun rePrime(n0 : int, n1 : int) : bool = 
	if not(n0 mod n1 = 0) then rePrime(n0, n1+1) else not(n0 > n1);
fun isPrime(n0: int): bool = if (n0 < 2) then false else rePrime(n0, 2); 