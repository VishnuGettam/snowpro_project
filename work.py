def user_add(a, b):

    try:
        a = int(a)
        b = int(b)

        op = a + b
        return op
    except Exception as ve:
        print(ve)


print(user_add("i", 6))
