# Question and Answer

#### 1. What is root class in swift:
In swift programming language, there is not root class, however, all class can inherit from NSObject to gain access to addition functionalities
defined by NSObject class

#### 2. What is optionals:
Optionals are constant or variable that can hold a value OR no value. The value can or cannot be nil. It is denoted by appending a “?” 
after the type declaration.
We can unwrap an optional either with optional binding structures such as if let, guard let or switch statement.
OR Optional chaining: to safely access the properties and methods of a wrapped instance, using the postfix optional chaining operator ? 
or using the Nil-Coelescing operator to provide default value in case optional instance is nil.
We can also force unwrap which is not recommended

#### 3. Different initialisers:
memberwise initializers :
Convenient initializer :
Custom initializer:

#### 4. Class vs struct:
Structs share similar syntax and functionality  with classes, but they're useful for different situations. 
While classes are well-suited to complex data structures,  structs are better suited to modelling simple objects 
that don't need inheritance or reference capabilities.

1. Classes can be inherited , Structs can't be inherited
2. Class uses dynamic dispatch as a dispatch method.
3. Class type-casting allows for interpreting the type of a class instance at runtime.
4. Deinitializers enable an instance of a class to free up any resources it has assigned.
5. Structs are value type , Classes are reference type
6. Structs stored in Stack memory , Classes are stored in Heap Memory 
7. Structs are faster compare to Classes
8. Structs are immutable by default , classes are mutable
9. Unlike Classes, Structures don’t require initialization to work.
10. No innate mutability. Being a value type, structures create a new copy every time we mutate the instance. The original structure remains unmodified.
11. Uses static dispatch as dispatching method
Commonality: 
Define properties to store values
Define methods to provide functionality
Provide access to their values using subscript syntax
Define initializers to set up their initial state 
Expand their functionality beyond a default implementation
Conform to protocols to provide standard functionality.

#### 5. How do you write tests:
I  follow TDD RGR approach, I also test API calls with Mock and Stubs. 

#### 6. Different App States:
- Not Running
- Launching
- Initialized
-Active (User interface is displayed, and it’s receiving and processing events.
- Inactive(Background, app is not terminated instantly,it can still execute short tasks, but its user interface is not being displayed)
- Waking Up
- Background
- Terminating

#### 7. Escaping vs non escaping:
By default closure are non-escaping and are reference type. 
Escaping will stay in memory even if function returns, and non escaping will not stay in memory once function returns, 
so escaping we can use in API calls to send result back to calling class basically escaping closure is used in async calls
