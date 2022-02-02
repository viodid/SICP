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
    return abs((square(guess) / x) - 1) < 0.0001


def improve(guess, x):
    quotient = x / guess
    return (quotient + guess) / 2


def square(x):
    return x * x


# print(sqrt(0.00002))


# --------------


def moneyChange(amount, coinTypes):
    if amount == 0:
        return 1
    if amount < 0 or coinTypes == 0:
        return 0

    return moneyChange(amount, coinTypes - 1) + moneyChange(
        amount - kindOfCoins(coinTypes), coinTypes
    )


def kindOfCoins(coinTypes):
    if coinTypes == 1:
        return 1
    elif coinTypes == 2:
        return 5
    elif coinTypes == 3:
        return 10
    elif coinTypes == 4:
        return 25
    elif coinTypes == 5:
        return 50


print(moneyChange(15, 5))
