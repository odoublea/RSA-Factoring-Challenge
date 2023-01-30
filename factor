#!/usr/bin/python3
from random import randint

def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

def _pollard_brent(c, n, x):
    y = (x ** 2 + c) % n
    return y

def factorize_b(n, iterations=None):
    y, c = randint(1, n - 1), randint(1, n - 1)
    r, q, g = 1, 1, 1
    while g == 1:
        x = y
        for i in range(r):
            y = _pollard_brent(c, n, y)
        k = 0
        while k < r and g == 1:
            ys = y
            for j in range(min(1000, r - k)):
                y = _pollard_brent(c, n, y)
                q = (q * abs(x - y)) % n
            g = gcd(q, n)
            k += 1000
        r *= 2
        if iterations and iterations == i:
            return None
    if g == n:
        while True:
            ys = _pollard_brent(c, n, ys)
            g = gcd(abs(x - ys), n)
            if g > 1:
                break
    return g

if __name__ == '__main__':
        from sys import argv

        if len(argv) != 2:
                exit(1)
        with open(argv[1], "r") as f:
                for i in f:
                        n = int(i[:-1])
                        factors = factorize_b(n)
                        print("{}={}*{}".format(n, n // factors, factors))
