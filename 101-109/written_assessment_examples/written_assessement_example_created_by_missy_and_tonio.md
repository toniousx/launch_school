#### Welcome to the written assesment test.

Before you start, please follow the instructions and take a look on the recommendations on the [Readme file](https://github.com/nelantone/launch_school_learn_and_refinement/tree/main/101-109/written_assessment_examples).



<details>
<summary>Question 1</summary>

</br>

1. What does this code output and return? Why? What is the value of name?
```ruby .numberLines
name = ‘missy’

puts "Hi, #{name.capitalize!}"
```

</br>
</details>
</br>

On `line 1` we initialize the local variable `name` to `missy`.

On `line 2` we call the method `puts` and we pass a string object as an argument. Inside the string object
we have a string interpolation and we pass on it the destructive method `capitalize!` on the variable `name` that
references `missy`.

The method `puts` always returns nil and it just outputs the object passed as an argument.
The method `capitalize!` upcase the first character of a string object and returns nil in case is capitalized.

For this reason on `line 3` the output is `Missy` and the return value is `nil`


<details>
<summary>Question 2</summary>

</br>

2. What does this code output and return? Why?
```ruby .numberLines
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```


</br>
</details>
</br>

On `line 1` we call the method `any?` on a hash collection with `:a,:b,:c` symbols as values and `'ant','bear','cat'` strings as keys, and we pass as an argument a `do..end` block with the block parameters `key` and `value`.

On `line 2` within the block we use the operator (greater than) `>` comparing each of the passing elements values calling `size` method on each `'ant','bear','cat'` (that returns `3`,`4` and `3`) that on each iteration `num` is pointing at to the integer `4`.

The method `any?` looks at the truthiness of the block's return value in order to determine what the method's return value will be. If the block returns a "truthy" value for any element in the collection, then the method will return `true`.
In this case any of the  element size is greater than `4`. for this reason, the return value of the block will be `false`.

The concept we demostrate here is **how works the method `any?` and  always returns a boolean if any of the return values of the block returns evaluates to `true`*


<details>
<summary>Question 3</summary>

</br>

3. What does this code output? Why?
```ruby .numberLines
animal = "dog"

loop do |x|
  animal = "cat"
  break
end

puts animal
```
On `line 1` we initialize the local variable `animal` to `"dog"`.

On `line 3` we call the method `loop` passing in the `do..end` block as an argument and `x` as block parameter.
On `line 4` we reassign the variable `animal` to `"cat"`
On `line 5` we call `break` to exti the one iteration loop.

On `line 7` we call the method puts that always return `nil` and in this case outputs `cat`

The concept that we demostrate are:

* variables as pointers:
Variables are pointers to physical space in memory. In other words, variables are essentially labels we create to refer to some physical memory address in our computer.

As in this case on `line 4` we reassign a variable a we reassign to completely different address in memory, is now pointing to an entirely new string #= does.

* variable scope:
Variables initialized in an outer scope can be acceessed in an inner scope, but no biceversa



</br>
</details>
</br>


<details>
<summary>Question 4</summary>

</br>

4. Why do we get an error when this code is run? How could we fix it?
```ruby .numberLines
qualities = ['fluffy', 'orange']

def say_qualities
 puts "The cat is #{qualities[0]}."
 puts "The cat is #{qualities[1]}."
end

say_qualities
```

On `line 4` we raise an exception as `undefined local variable or method qualities for main:Object`
Because:
- In our method defintion on `line 3`  we don't pass a parameter to expect ana rgument in the method call.
- In our method invocation on `line 8` we don't pass an argument to pass the local variable.

We can fix it adding the parameter and the specific local variable as
- `def say_wqualities(qualities_ary)` on `line 3`
- `say_qualities(qualities)`  on `line 8`

* Here we can demostrate how affects the method definition the method invokation and how local variables only can pass insida a method as an argument perviously defining the parameter on the method definition.
</br>
</details>
</br>

<details>
<summary>Question 5</summary>

</br>

5. What is output on lines 5 and 6, and why?
```ruby .numberLines
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd
p even
```

On `line 1` we initialize on one line the variables `odd` and `even` to
the return value of the merthod `partiton` on  an array `[1, 2, 3]` passing
as argument a `do..end` block with `num` as block parameter.

The metod `partition` returns 2 new arrays, the first one with the block returns that evaluate to `true` and the second with the rest of values(the ones that evaluates to `false`).

On `line 2` we call the method `odd?` on `num` that represents each element of the iteration. In case the number is odd it will be placed on the first variable `odd` who's pointing to a new array object, otherwise will be placed in the new array object assigned to variable `even`.

For this reason we have as return and ouput(as we us `p` method that inspect the object passed as argument and it return/outputs the result)
On `line 5` return/output: `[1,3]`
On `line 6` return/outout: `[2]`

The concept we demostrate here is: **how works the method `partition` creating 2 news arrays, the first with the `truthy` return values of the block and the secon with the `falsey` return values of the block.***


</br>
</details>
</br>

<details>
<summary>Question 6</summary>

</br>

6. What are s and t? Why?
```ruby .numberLines
def fix(value)
 value[1] = 'x'
 value
end

s = 'abc'
t = fix(s)
```
On `line 5` we initialize the local variable `s` to a string object `abc`
On `line 6` we initalize the local variable `t` to the return value of the method `fix` passing `s` that references `'abc'`.

On `line 1-4` we have the method `fix` definition.
On `line 1` we define `fix` passing the parameter `value`. At this point
when `on line 6` we call the method `fix` we see that `s` and `value` points to the same object `"abc"`

On `line 2` we use the element assigment operator `[]=` on the object `"abc"` reassigning at index `1` that in this case is the character `'b'`. We reassign `'b'` to `'x'` and as `element assigment` on a string object is a destructive method, we will mutate the method and `value` and `s` will be still pointing to the same object.

* Here we desmotrate the concept of variables as pointers inside a method:
 Variables are essentially labels we create to refer to some physical memory address in our computer.
 Some operations mutate the address space in memory.  Ruby **acts** like
`pass by reference` for *mutable objects*.


</br>
</details>
</br>

<details>
<summary>Question 7</summary>

</br>

7. What does the last line of this code return? Why?
```ruby .numberLines
num = 3

num = 2 * num
```


On `line 1` we initialize the local variable `num` to the integer `3`
On `line 3` we reassign `num` to the return value of calling the method `*`
on `2` and passing as an argument `num` that points to `5`.
As `*` method it returns the product of in this case 2 integers(one as a caller and another as an argumnent). This is the reason why the return value is `5`.


</br>
</details>
</br>

<details>
<summary>Question 8</summary>

</br>

8. What does the last line of this code output? Why?
```ruby .numberLines
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

On `line 5` we intialize the local variable `names` to an array object `['bob', 'kim']`.
On `line 6` we call the method `add_name` passing 2 arguments, the first is `names` that points to `['bob', 'kim']` and as second argument`'jim'`

On `lines 1-3` we are defining the method `example` which takes 1 parameter.

On `line 1` we define `add_name` method with 2 parameters `arr` and `name`.
When we call `on line 6` the method `add_name` we can see that `names` and `arr` pointi to the same object ` ['bob', 'kim']` and `name` points to `'jim'`.
On `line 2` (inside the method) we reassign the local variable `arr`.
At this point `arr` and `names` stop pointing to the same object. `arr` and `names` are different objects. For this reason the changes we will do will not affect the object that `names` points at.

For this reason when `on line 7` when we call the method `puts` and we pass `names` as an argument. names will still be `['bob', 'kim']`

Here we demostrate the concept of **variables as pointers**.

variables are essentially labels we create to refer to some physical memory address in our computer.

simply change the variable to point to a different address space like this example. When we reassign a variable a we reassign to completely different address in memory, is now pointing to an entirely new string #= does . In this case we can say that ruby acts like `pass by value` for *immutable objects*.


</br>
</details>
</br>


<details>
<summary>Question 9</summary>

</br>

9. What does this code return? Why?
```ruby .numberLines
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```
On `line 1` we initialize the local variable `array` to `[1, 2, 3, 4, 5]`.

On `line 3` we call the select method on variable `array` assigned to an array collection passing a `do..end` block as an argument with `num` as a block parameter.

The method `select`, selects the element if the return value of the block is truthy (if it evaluates to true). Because in ruby everything evealuates to `true` except `false` and `nil`.

On `line 4` we call the `puts` method and as `puts` always return `nil` and just ouputs the object pass as argument. each return value of the block will be `nil`. As `nil` evaluates to `false` any of the elements will be selected.
For this reason the method `select` returns a new array object `[]`


</br>
</details>
</br>

<details>
<summary>Question 10</summary>

</br>

10. What does this code output? What does it return? Why?
```ruby .numberLines
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
  puts n
end

p new_array
```

On `line 1` we initialize the local variable `array` to `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On `line 3`  we initialize the local variable `new_array` to the return value of `map` on` arr` that points to `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` and
we pass as an argument a `do..end` block with a block parameter `n`.

The method `map`is called on the array object and it returns a new array object populated with the return values of the block in each iteration.  The method `map` transforms the original array based on the return value of the block in each iteration.

As the return value of the block is the last line we focus on `line 5` where
we call the method `puts` passing as an argument `n` that references to each element iteration. And as `puts` alwayrs returns `nil`. the return value of each iteration will be nil.

on `line 7` when we call the `p` method that always returns/outputs object passed as anrgument calling `inspect` method.

For this reason `On line 7` the ouput and return value of new_array is ` [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`


</br>
</details>
</br>

<details>
<summary>Question 11</summary>

</br>

11. All variables are pointing to the same object? Why/Why not? If not, how can we fix it in order to point all variables to the same object and then what will be the return value?
```ruby .numberLines
a = [1, 2, 3, 3]
b = a
c = a.uniq
```

On this example `a` and `b` are pointing to the same object `[1, 2, 3, 3]`
As we initialized `b` to the object that `a` is pointing to.
`c` is initialized to the return value  of the method `uniq` on `a` pointing to ` [1, 2, 3, 3]`

The method `uniq` on an array obejct, returns a new array with the unique elements of the array passed as a caller. For this reason `c` will point to `[1, 2, 3]`

To make pointing all variables to the same object we can use `on line 3` the destructive version of `uniq` with the bang operator `uniq!` this will mutate the object. to `[1, 2, 3]` and `a` `b` and `c` will reference the same object.

In this example we can demostrate the concept of variables as pointers.
Some operations mutate the address space in memory(`uniq!`), but others simply change the variable to point to a different address space(`uniq`)

</br>
</details>
</br>

<details>
<summary>Question 12</summary>

</br>



12. What does the following code return and output on the last line? Why? Which concept demonstrates?
```ruby .numberLines
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```

On `line 6` we initialize the local variable `test_str` to `'Written Assessment'`.

On line `7` we are calling the method `test` and passing in the variable `test_str` that refers to `'Written Assessment'` as an argument to it. At this `argum_str` and `str` are pointing to the same string object.

On lines `1-4` we are defining the method `example` which takes one parameter `str`.

On `line 2` we call `+=` pseudooperator (that acts like a combined assigment operator), but is simply an abbreviation for  `str = str + '!'` where we reassign x to the return value of the method `+` on variable `str`   passing as an argument `'!'`. and returning the addition `'Written Assessment' + '!'` and as a restult we reference the object `'Written Assessment!'`.

At this point `test_str` and `str` stops pointing to the same object and the changes inside the method will not affect the object `'Written Assessment'` that points local variable `a`.

On `line 8` we call the method `puts` and passing in a local variable `test_str` to it as an argument, `puts` always returns `nil`. For this reason and for the ones mentioned above the return value is `nil` and the output is
`'Written Assessment'`

The concept we demostrat here is variables as pointers:

*  Variables are essentially labels we create to refer to some physical memory address in our computer.
In this example. When we reassign a variable a we reassign to completely different address in memory, is now pointing to an entirely new string #= does . In this case we can say that ruby acts like `pass by value` for *immutable objects*.
</br>
</details>
</br>


<details>
<summary>Question 13</summary>

</br>

13.  What do the following code blocks return?  What does it output? Why?
```ruby .numberLines
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
```
On `line 1` we initialize the local variable `array1` to `["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]`.
<!-- On `line 2` we initialize the local variable `array2` to and empty array `[]`. -->

As `each`  ignores the return value of the block and it always returns the object caller. On `line 3` and `line 4` will return the same object that `array1` points at `["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]`. The is no ouput in these two lines.

Here we can demostrate how works the method `each` and how ignores the return value of the block an returns the caller object.

</br>
</details>
</br>

<details>
<summary>Question 14</summary>

</br>

14. What does this code return? Why?
```ruby .numberLines
sorted =  ['cot', 'bed', 'mat'].sort_by do |word|
 word[1]
end

p sorted
```

On `line 1`  we initialize the local variable `sorted` to the return value of `sort_by` on an array obejct `['cot', 'bed', 'mat']` passing a `do..end` block with a block parameter `word`.

On `line 2` we use the `index` method `[]` in `word` that points to each element object in the iteration.
each return value of this block will be the second character of each element `o`, `e` and `a` respectively.

Sort receives and comapres each return value fof the block to map over the collection.

On `line 5` we call the `p` method passing as an argument the variable `sorted` refering to the object  `["mat", "bed", "cot"]` . The `p` method `inspect` the referenced object.

For this reasons, the return and output on `line 5` is `["mat", "bed", "cot"]` 

</br>
</details>
</br>

<details>
<summary>Question 15</summary>

</br>

15. The 3 variables have the same return value? Why/Why not? There is a way that we can mutate and uppercase the 3 variables changing one line of this code?
```ruby .numberLines
arr1 = ["a", "b", "c"]
arr2 = arr1
arr3 = arr2.map do |char|
 char.upcase
end
```

In this example, `arr1` and `arr2` have the same return value `["a", "b", "c"]` but `arr3` no.
On `line 3` we initialize `arr3` to the returtn value of the method `map` on the object that `arr2` points at ` ["a", "b", "c"]` and we pass as block parameter `char`.
On `line 4` we upcase each elment that `char` is pointing at.

The method `map` transforms the original array based on the return value of the block in each iteration.

This is why on line `5`, `arr3` returns `["A", "B", "C"]`

</br>
</details>
</br>

<details>
<summary>Question 16</summary>

</br>

16. What would be the return value of `a` and `b`  inside the block? And outside the block? why?
```ruby .numberLines
a = ['a', 'b', 'c']
b = ['e', 'f', 'g']

a = a.each_with_object([]) do|b, ary|
  ary << b
  p b, a
end

p a
```

Inside the block:
- `a` return value is: `['a', 'b', 'c']` for each iteration
- `b` return value is: `'a'` `b` and `c` for each iteration
Outside the block
- `a` return value is: `['a', 'b', 'c']`
- `b` return value is: `['e', 'f', 'g']`

Here we can demostrate the concept of variable shadowing.
When we had a variable named in the outer scope(n) as  the block parameter |n|

We'd essentially have two local variables in the inner scope with the same name.

Ruby variable shadowing prevents us from making changes to the outer scoped `b`. On the same time we can access `b` inner scope variable inside.

* We want to avoid variable shadowing, as it's almost never what you intended to do.


</br>
</details>
</br>

<details>
<summary>Question 17</summary>

</br>

17. What is the underlying principle by which the order here was determined, and how was it implemented?
```ruby .numberLines
["ab", "c", "aaa", "b", "aa"].sort
```
the return value in this case is:
`["aa", "aaa", "ab", "b", "c"]`

The reason is because the method `sort` uses the spaceship operator `<=>` on each string object.

The order here is determined first with each first character string.
in this case `aa` goes first, and inc case are have the same characters like `aa` and `aaa` form the size of the sring.
in case the first charcater is the same, but the second is different it will be sorted later the 2 same character with different size.


</br>
</details>
</br>

<details>
<summary>Question 18</summary>

</br>

18. What is the return value of  `a`, `b` and  `c` ? Why?  Which concept demonstrates?
```ruby .numberLines
a = ['a', 'b', 'c']
b = ['e', 'f', 'g']
c = ['x']

a.each do |b|
 c = ['h', 'i', 'j']
 b = 'ups!'
end

a
b
c
```

`a` return value is `['a', 'b', 'c']` as we don't mutate the object and stays as it was initialized.

`b` return value is  still `['e', 'f', 'g']` as we pass `b` as block parameter and we have variable shadowing.

Ruby variable shadowing prevents us from making changes to the outer scoped `b`. On the same time we can access `b` inner scope variable inside as `ups!`.

`c`  return value is ` ['h', 'i', 'j']` as we reassign `c` to a new object inside the block.  The concept that we can demostrate is that variables initialized in an outer scope can be acceessed in an inner scope, but no biceversa

</br>
</details>
</br>

<details>
<summary>Question 19</summary>

</br>

19. What is the output and return value of this code? Why ? how we can convert the return value to an object array?
```ruby .numberLines
hsh = {a: 1, b: 2, c: 3}
hsh.map { |k, v| [k.to_s, v - 1] }

p hsh
```


</br>
</details>
</br>

On `line 1`  we initialize the local variable `hsh` to a hash `{a: 1, b: 2, c: 3}`.


`map`is called on the array object and it returns a new array object populated with the return values of the block in each iteration.  The method `map` transforms the original array based on the return value of the block in each iteration.

But as `map` is not a destructive method the return value will be the same as the initialized.

This is why the return value is `{:a=>1, :b=>2, :c=>3}`
We can return and array using `to_a` method on `hsh` it will create a `key`-`value` array of pairs inside the array.

<details>
<summary>Question 20</summary>

</br>

20. What is the output and return value of this code? Why?
```ruby .numberLines
people = { Kate: 27, john: 25, Mike: 18, Lisa:14 }
people.select! { |_, age| age >= 18 }
p people.sort { |name1, name2| name1[0].to_s <=> name2[0].to_s }
```
On `line 1` we initialize the local variable `people` to  a hash `{ Kate: 27, john: 25, Mike: 18, Lisa:14 }`.
On `line 2` we call the select! destructive method on variable `people` assigned to an hash collection passing a `{}` block as an argument with `_` and `age` as a block parameters.

`select`  act as a kind of filter to each object of the collection and it returns the same array mutated with the filtered values evaluating the return value of the block and only cares about its truthiness.

On `line 2` we use the `index` method `[]` in `word` that points to each element object in the iteration.
each return value of this block will be the second character of each element `o`, `e` and `a` respectively.

Because in ruby everything evealuates to `true` except `false` and `nil`, select returns the filtered object `{:Kate=>27, :john=>25, :Mike=>18}`.

Sort recieves and compares each return value fof the block to map over the collection.

On `line 5` we call the `p` method passing as an argument the variable `sorted` refering to the object  `["mat", "bed", "cot"]` . The `p` method `inspect` the referenced object.


This is why the out and return `on line 3` is `[[:Kate, 27], [:Mike, 18], [:john, 25]]`


</br>
</details>
</br>

This test was made by course examples, another student examples and with some our own solved doubts.

*Copy left by Missy and Tonio*