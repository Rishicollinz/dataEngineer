### Python

**What is python?**
- Python is a popular programming language. It was created by Guido van Rossum, and released in 1991.

- It is used for:
    - web development (server-side),
    - software development,
    - mathematics,
    - system scripting.

**Check version:**
`python3 --version`

**Indention:**
- Indentation refers to the spaces at the beginning of a code line.

- Where in other programming languages the indentation in code is for readability only, the indentation in Python is very important.

- Python uses indentation to indicate a block of code.

**Comment:**
- single line - #
- multiline line - """ """

**Variable:**
- No command to declare a variable.
- A variable is created the moment you assign a value to it.

**Casting:**
- To make a variable of specific type, this can be done with casting.
x = str(3) # here it is in string
y = int(3) # here it is in number

**Get the type:**
- you can get the data type of variable with type() function.

**Variable Names:**
- Normal syntax
- Alpha Numeric
- Start with _ or chars
- Don't start with num
- No keywords

**Output:**
- print()
- print(x+y) #string append
- print(x,y) #will print with space in-between # supports multiple data types

**Global keyword:**:
- A variable not inside a function is global variable and can be accessed anywhere.
- To change a global variable inside a function use global keyword
```python
x = "awesome"

def myfunc():
  global x
  x = "fantastic"

myfunc()

print("Python is " + x)
```

**Local keyword:**
- A variable inside a function is local variable.
- It can be accessed only inside a function.
- To make it accessable outside a function, use global keyword.
```python
def myfunc():
    global x
    x = "fan"
myfunc()
print(x)
```
**Data type:**

- Text type:
    - str

- Numeric types:
    - int, float, complex

- Sequence types:
    - list, tuple, range

- Mapping type:
    - dict

- Set types:
    - set, frozenset

- Boolean type:
    - bool

- Binary types:
    - bytes, bytearray, memoryview

- None type:
    - NoneType

#### Python Numbers:

##### Types:
- **Int:**
    - It is a whole number, positive or negative, without decimals, of unlimited length.

- **Float:**
    - It contains decimal.
    - Float can also be scientific numbers with an "e" to indicate the power of 10.
    ```python
    y = 12E4
    print(y) # 120000.0
    ```

- **Complex:**
    - Complex numbers are written with a "j" as the imaginary part:

    ```python
    x = 3+5j
    y = 5j
    z = -5j

    print(type(x))
    print(type(y))
    print(type(z))
    ```

##### Type Conversion:
- You can convert from one type to another with the int(), float() and complex() methods.
- we can't convert complex to other types.
```python
x = 1    # int
y = 2.8  # float
z = 1j   # complex

#convert from int to float:
a = float(x)

#convert from float to int:
b = int(y)

#convert from int to complex:
c = complex(x)

print(a)
print(b)
print(c)

print(type(a))
print(type(b))
print(type(c))
```

##### Random Numbers:
- Import the random module:
```python
import random
print(random.random())
print(random.randrange(1,20))
```

##### Casting:
```python
x = int(1)   # x will be 1
y = int(2.8) # y will be 2
z = int("3") # z will be 3
x = float(1)     # x will be 1.0
y = float(2.8)   # y will be 2.8
z = float("3")   # z will be 3.0
w = float("4.2") # w will be 4.2
x = str("s1") # x will be 's1'
y = str(2)    # y will be '2'
z = str(3.0)  # z will be '3.0'
```
