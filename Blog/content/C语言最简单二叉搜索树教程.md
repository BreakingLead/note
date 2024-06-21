---
title: "C语言最简单二叉搜索树教程"
date: 2023-02-22T03:11:41+08:00
---

本文识别码为: 23B22-B:4

# 二叉搜索树（Binary Search Tree）

虽然我的文风很烂，但我保证这个二叉搜索树教程很容易看懂。

## 前言

> 二叉查找树是指一棵空树或者具有下列性质的二叉树：
> 若任意节点的左子树不空，则左子树上所有节点的值均小于它的根节点的值；
> 若任意节点的右子树不空，则右子树上所有节点的值均大于它的根节点的值；
> 任意节点的左、右子树也分别为二叉查找树；
> -- Wikipedia

## 实现

### 普通的二叉树

首先要注明，二叉搜索树其实原理非常简单。
我们先写个树的结构体。
这里用 int 存了个值，其实在实际的生产中肯定不是 int 而是别的东西。

```c
typedef struct tree_node {
    int               value;
    struct tree_node* left;
    struct tree_node* right;
} tree_node;
```

由于 C 中所有类型都是值类型（学过 rust 的肯定会有体会的），所以存储另一个结构体只能用指针指向那个结构体的位置。

#### 创建节点的函数

有了节点之后，我们需要用一个函数来自动创建节点，不然手动设置起来很麻烦。

```c
static tree_node* create_node(int value)
{
    // malloc 是开辟内存用的，你如果不想用或者不会用也可以用全局变量之类的玩意
    tree_node* result = (tree_node*)malloc(sizeof(tree_node));
    if (result != NULL) {
        result->value = value;
        result->left  = NULL;
        result->right = NULL;
    }
    return result;
}
```

注意这里的`static`，其实就和其他语言中的`private`差不多，如果函数被其修饰就意味着只能本文件中用，修饰变量其实还有点不一样，这个可以自行去查百科之类的。
这个代码很简单，就是说如果成功申请了内存就把节点里的值赋下来，并让左右节点成为一个空指针并返回。

#### 打印树（遍历树）

现在要是想测试的话，先拟一组数据（别忘了把 static 移掉，或者直接在一个文件里面写也可以）

```c
int main()
{
  // 1 代表左子树，2代表右子树，不过你想怎么命名也无所谓
  tree_node* a1 = create_node(11);
  tree_node* a1_1 = create_node(12);
  tree_node* a1_2 = create_node(13);
  tree_node* a1_2_1 = create_node(14);
  tree_node* a1_2_2 = create_node(15);
  tree_node* a1_2_2_1 = create_node(16);
  a1->left     = a1_1;
  a1->right    = a1_2;
  a1_2->left   = a1_2_1;
  a1_2->right  = a1_2_2;
  a1_2_2->left = a1_2_2_1;
}
```

然后我们来写一个前序遍历这个树的函数，这是一个递归函数。思路就是如果这个节点为空，那么我们就返回，不然就打印这个节点，并递归打印其左节点和右节点。

```c
// 打印layer个四空格缩进
static void print_tab(int layer)
{
    for (int i = 1; i <= layer; i++) {
        printf("    ");
    }
}

void print_tree(tree_node* root, int layer)
{
    if (root == NULL) {
        return;
    }
    print_tab(layer);
    printf("%d\n", root->value);
    layer++;
    print_tree(root->right, layer);
    print_tree(root->left, layer);
}
```

注意那个`layer`每递归一层就加一，是为了缩进用的，这个不难看懂吧。打印出来后这个图要横着看，左边是左子树，右边是右子树。所以我是先打印右后打印左的。

输出:

```
我稍微注释了一下，注意要横着看
11
    13(right)
        15(right)
            --(right)
            16(left)
        14(left)
    12(left)

```

### 二叉搜索树

#### 插入节点

那么我们依照维基百科来实现插入节点的功能，首先分析思路:

1. 如果给定的树为空，那么直接新建一个节点插入就好。
2. 如果给定的值等于树的根节点，那么直接返回无法插入。
3. 如果给定的值小于根节点，那么把根节点的左节点看成根节点递归插入，直到节点为空后就能插进去了。
4. 如果给定的值大于根节点，那么把根节点的右节点看成根节点递归插入，直到节点为空后就能插进去了。

非常简单对吧，但是注意，由于我们如果有个空节点，我们需要将其改写成有一个值的节点，所以我们传入的指针是一个双重指针，这样才能改变指向的那个节点指针指向的值，是不是绕晕了？没关系，你可以试着用单指针实现下面用注释括起来的部分，看看怎么实现比较好。

```c
// 注意，返回的是是否成功插入，bool 类型需要 #include<stdbool.h>才能用，不过返回int也可以。
bool insert_number(tree_node** to_root, int value)
{
    //** */
    tree_node* root = *to_root;
    if (root == NULL) {
        *to_root = create_node(value);
        return true;
    }
    //** */
    if (value == root->value) {
        return false;
    }
    if (value < root->value) {
        insert_number(&(root->left), value);
    } else {
        insert_number(&(root->right), value);
    }
}
```

#### 寻找值是否在树中

这个过程基本和上面一样，只是反过来而已，详见代码，不过这次我们不需要改写树，所以直接传根节点的指针就行。

```c
bool find_number(tree_node* root, int value)
{
    if (root == NULL) return false;
    if (root->value == value) {
        return true;
    }
    if (root->value > value) {
        find_number(root->left, value);
    } else {
        find_number(root->right, value);
    }
}
```

### 测试

那么你可以自行构建测试数据来进行测试。下面是我的测试，请自行比对结果，`free()`函数是将`malloc()`函数申请的空间还回去的。

```c
#include <stdlib.h>

#include "binarytree.h"

int main()
{
    tree_node* tree = NULL;
    insert_number(&tree, 5);
    insert_number(&tree, 2);
    insert_number(&tree, 8);
    insert_number(&tree, 7);
    insert_number(&tree, 1);
    insert_number(&tree, 4);
    insert_number(&tree, 14);
    print_tree(tree, 0);

    printf("find 4   ?: %d\n", find_number(tree, 4));
    printf("find 11  ?: %d\n", find_number(tree, 11));

    free(tree);
    return 0;
}
// Result:
/*
5
    8
        14
        7
    2
        4
        1
find 4   ?: 1
find 11  ?: 0
*/
```

## 后记

这种二叉搜索树在数据一个比一个大的时候就变成链表了，查询时间最坏为 O(n)，所以还有一种东西叫做 AVL 树，其可以自动平衡，比如将那个链表的中间节点作为根节点，这样查起来快，下次我会讲。

# 完整代码

文件: binarytree.h

```c
#ifndef BINARYTREE_H
#define BINARYTREE_H

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct tree_node {
    int               value;
    struct tree_node* left;
    struct tree_node* right;
} tree_node;

static void print_tab(int layer);

void print_tree(tree_node* root, int layer);
bool insert_number(tree_node** to_root, int value);
bool find_number(tree_node* root, int value);


#endif  // !BINARYTREE_H

```

文件: binarytree.c

```c
#include "./binarytree.h"

static tree_node* create_node(int value)
{
    tree_node* result = (tree_node*)malloc(sizeof(tree_node));
    if (result != NULL) {
        result->value = value;
        result->left  = NULL;
        result->right = NULL;
    }
    return result;
}

static void print_tab(int layer)
{
    for (int i = 1; i <= layer; i++) {
        printf("    ");
    }
}

void print_tree(tree_node* root, int layer)
{
    if (root == NULL) {
        return;
    }
    print_tab(layer);
    printf("%d\n", root->value);
    layer++;
    print_tree(root->right, layer);
    print_tree(root->left, layer);
}

bool insert_number(tree_node** to_root, int value)
{
    tree_node* root = *to_root;
    if (root == NULL) {
        *to_root = create_node(value);
        return true;
    }
    if (value == root->value) {
        return false;
    }
    if (value < root->value) {
        insert_number(&(root->left), value);
    } else {
        insert_number(&(root->right), value);
    }
}

bool find_number(tree_node* root, int value)
{
    if (root == NULL) return false;
    if (root->value == value) {
        return true;
    }
    if (root->value > value) {
        find_number(root->left, value);
    } else {
        find_number(root->right, value);
    }
}


```

文件: main.c

```c
#include <stdlib.h>

#include "binarytree.h"

int main()
{
    tree_node* tree = NULL;
    insert_number(&tree, 5);
    insert_number(&tree, 2);
    insert_number(&tree, 8);
    insert_number(&tree, 7);
    insert_number(&tree, 1);
    insert_number(&tree, 4);
    insert_number(&tree, 14);
    print_tree(tree, 0);

    printf("find 4   ?: %d\n", find_number(tree, 4));
    printf("find 11  ?: %d\n", find_number(tree, 11));

    free(tree);
    return 0;
}
```

文件: makefile

```makefile

main: main.o binarytree.o
	cc -o main main.o binarytree.o

main.o: main.c
	cc -c main.c

binarytree.o: binarytree.c
	cc -c binarytree.c

clear:
	rm *.o main

run: main
	./main
```
