# Structs pt 2
We can't talk about any complex data structure 
without talking about access control.
In swift we have a bit more types of access levels
than most languages.
If you write a function in a struct as it is it will be public by default 
To make something private we can use the 
`private` key word, this will work just like in any other language would.
bu we have `fileprivate` what will allow the user to access the 
variable in the current file but not elsewhere.
and you can use `public` explicitly as well.
But we have a special one what is beeing used in production code usually
which is `private(set)` this will allow the getter to be public but 
it won't able to set it outside of the struct.

It is important to mention that swift won't be able to generate the private init
function for a struct if there is a private variable in it.

`static` works just like in C++

There is one another exciting concept,
we have `self` which will refer the current value of 
the struct, but we have `Self` which will refer the current 
type of the struct.
