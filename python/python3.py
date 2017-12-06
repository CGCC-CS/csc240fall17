#!/usr/bin/python3
'''
   Multi-line
   comment
'''

# Single line comment
print("Hello, world!")

# Variables

a = 10
print(a)
a = 'Hi!'
print(a)

# Strings
str1 = "This is a string."
str2 = 'You can use single or double quotes.'
# append using +
print(str1 + '  ' + str2)

# Lists
lst = [1, 2, 3, 4, 5]
lst.append(6)
print(lst)

lst2 = [1, 'Hello', a, 4]
print(lst2)

print('\nContents of lst:')
output=''
for thing in lst:
    output = output + str(thing)
print(output)
print('lst = {0}'.format(lst))

for thing in lst2:
    print(thing)

# Slicing a list
print(lst[:3])
print(lst[3:])
print(lst[2:4])
print(lst[::-1])

# List comprehension
evens = [x for x in lst if x % 2 == 0]
print('Evens: {0}'.format(evens))

# Function
def fact(n):
    if n < 1:
        return 1
    else:
        return n * fact(n-1)

def get_evens(lst):
    return [x for x in lst if x % 2 == 0]

# Functions are first-class objects
def do_something(something, x):
    return something(x)

do_something(print, 'First-class objects')
fact10 = do_something(fact, 10)
print('10! = {0}'.format(fact10))


# Decorators
def does_it_have_any(func):
    def func_wrapper(parm):
        if len(func(parm)) > 0 :
            return True
        else:
            return False
    return func_wrapper

@does_it_have_any
def has_evens(lst):
    return get_evens(lst)

print('\nDecorator testing:')
print(has_evens([1,2,3,4,5,6,7]))
print(has_evens([1,3,5,7]))

# Objects
class MyClass:
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def too_big(self):
        return self.a > 10

    def __str__(self):
        return '{0} : {1}'.format(self.a,self.b)

myObject = MyClass(5, 'MyObject')
print()
print(myObject)
if myObject.too_big():
    print('Too big!')
else:
    print('Too small!')


if __name__ == '__main__':
    print('Inside main function')
