#  +---------------+
#  |  EXERCISE 1.6|
#  +---------------+

# This is f****** awesome
def sqrt(x):
    return sqrtIter(1.0, x)


def sqrtIter(guess, x):
    if goodEnough(guess, x):
        return guess
    return sqrtIter(improve(guess, x), x)


def goodEnough(guess, x):
    return abs(square(guess) - x) < 0.001


def improve(guess, x):
    quotient = x / guess
    return (quotient + guess) / 2


def square(x):
    return x * x


print(sqrt(2))
