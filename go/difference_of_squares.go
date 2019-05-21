package diffsquares

// SquareOfSum calculates the square of the sums
func SquareOfSum(n int) int {
	sum := 0
	for i := 1; i <= n; i++ {
		sum += i
	}
	return sum * sum
}

// SumOfSquares calculates the sum of the squares
func SumOfSquares(n int) int {
	sum := 0
	for i := 1; i <= n; i++ {
		sum += i * i
	}
	return sum
}

// Difference calculates the difference of square of the sums and sum of the squares
func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
