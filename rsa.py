def factors(num):
    fac_num = []
    fac_num2 = []
    while num > 1:
        for i in range(1, num):
            if num % i == 0:
                fac_num.append(i)
        break
    print(fac_num)
    print("{}={}*{}".format(num, fac_num[-2], fac_num[1]))

factors(77)