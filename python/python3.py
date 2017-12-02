#!/usr/bin/python3

"""
    Multi-line
    Comment
"""

# Single line comment
print('Hello, world!')

# Variables
a = 10
s = 'Hi!'

# Strings
str1 = "This is a string."
str2 = 'You can use single or double quotes.'
# append using +
print(str1 + "  " + str2)

# Lists
lst = [1, 2, 3, 4, 5]
lst.append(6)
lst2 = [1, 'Hello', a, 4]

print('\nContents of list:')
# Blocks are indicated by indention (be careful to be consistent with tabs / spaces!)
output = ''
for thing in lst:
    output = output + str(lst)
print(lst)
print('lst = {0} '.format(lst))
for thing in lst2:
    print(thing)

# Slicing a list
print(lst[:3])
print(lst[3:])
print(lst[2:4])
print(lst[::-1])

# List comprehensions
evens = [x for x in lst if x % 2 == 0]
print ('Evens: {0}'.format(evens))

# Functions

# Decorators

# Objects



