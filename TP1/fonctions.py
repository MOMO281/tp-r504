def puissance(a, b):

	if not isinstance(a, int) or not isinstance(b, int):
		raise TypeError("Only integers are allowed")

	return a ** b
