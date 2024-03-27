## Chapter 7 Scope, Duration, and Linkage

### inline keyword

`inline` means "multiple definitions are allowed (for a function, if C++17 variable is able)". Every definition must be same. Then the linker will merge/consolidate them into one .

Usage: define a function in a `.h` file so when it's included many times it won't violate *one-definition-rule*.


### static keyword

It has 2 **different** usage.
1. gives a global identifier a *internal linkage*. While linking, another file won't know them.
2. like this:

```c++
#include <iostream>

int get_id() {
    static int x{0};
    x += 10;
    return x;
}

int main(int argc, const char **argv) {
    std::cout << get_id() << std::endl;
    std::cout << get_id() << std::endl;
    std::cout << get_id() << std::endl;
    return 0;
}
```

**Constant global variable are internal by default.**


### extern keyword

It has 2 **different** usage.
1. Give this variable *external linkage*.
2. This variable is defined somewhere else. But I want to use it now.

**Non-constant global variables are external by default** (if used, the `extern` keyword will be ignored).


### Sharing global constants across multiple files (using inline variables in C++17)

Before C++ 17 you can:

```c++
#ifndef CONSTANTS_H
#define CONSTANTS_H

// define your own namespace to hold constants
namespace constants
{
    constexpr double pi { 3.14159 };
    constexpr double avogadro { 6.0221413e23 };
}
#endif
```

Constants have internal linkage by default so when it's included many times there won't be errors. But, if you modify a constant value, you have to compile all of the source files which includes this file.


## Chapter 10 Function Overloading and Function Templates
### Deleting Functions

```cpp
#include <iostream>
void printInt(int x){
    std::cout << x << '\n';
}
void printInt(char) = delete; // calls to this function will halt compilation
int main(){
    printInt(97);   // okay
    printInt('a');  // compile error: function deleted
    printInt(true); // compile error: function deleted
    return 0;
}
```

Delete all except what we wanted.

```cpp
#include <iostream>

void printInt(int x){
    std::cout << x << '\n';
}

// Other will be deleted
template <typename T>
void printInt(T x) = delete;

int main(){
    printInt(97);   // okay
    printInt('a');  // compile error
    printInt(true); // compile error

    return 0;
}
```

### Function Templates

```cpp
template <typename T> // this is the template parameter declaration
T max(T x, T y) // this is the function template definition for max<T>
{
    return (x < y) ? y : x;
}
```

You can instantiate it like this: `max<int>`

### Non-type Template Parameters
```cpp
#include <iostream>
template <int N> 
void print(){
    std::cout << N << '\n';
}

int main(){
    print<5>(); 
    return 0;
}
```

## Chapter 16 Dynamic arrays: std::vector





## Chapter 20 Functions

`std::function<int(int,int)>` is just like `int (*p)(int,int)`

Lambdas: `[<captures>](<args>) {<body>}`
`[=]() {}` means capture all in body by value.
`[&]() {}` means capture all in body by reference.
`[&]() mutable {}` allows you to modify the captured value.





## Miscs and TODO

`explicit` which disable the implicit construction of a class.