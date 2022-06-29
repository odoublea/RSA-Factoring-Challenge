#!/usr/bin/python3
from sys import argv

def mult_arr(arr):
    prod = 1
    for x in arr:
        prod *= x
    return prod

def factorializer(n):
    primefactors = []
    d = 2
    while d * d <= n:
        while (n % d) == 0:
            primefactors.append(d)
            n //= d
        d += 1
    if n > 1:
       primefactors.append(n)
    q = primefactors.pop(0)
    return (mult_arr(primefactors), q)

def main():
    with open(argv[1]) as f:
        for line in f:
            print('{}={}*{}'.format(line.rstrip('\n'), *factorializer(int(line))))

if __name__ == '__main__':
    main()
