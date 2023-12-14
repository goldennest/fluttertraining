// EXTENDS
//==========
// This is the typical OOP inheritance that can be used when you want to add new features in a subclass.

// When you use class B extends A {} you are NOT forced to override every method of class A. Inheritance takes place so you can override as many methods as you want.

// You can use extends only on classes (Dart supports single inheritance).

// IMPLEMENTS
//==========
// Interfaces are useful when you don’t want to provide an implementation of methods but just their API. It’s like if the interface was a wall socket and the class was the plug to insert.

// When you use class B implements A {} you must override every method of class A. Inheritance does NOT take place because methods just provide an API and not a concrete implementation.

// You can use implements with one or more classes.

// MIXIN
//==========
// Mixins are useful when you need code sharing without using inheritance.

// When you use class B with A {} you are importing every method of mixin A into your class B. Optionally, the usage of a mixin can be constrained to a certain type using the on keyword.

// You can use with with one or more mixins.

import 'dart:math';

 abstract class Shape {
  //Base Class
  num area();
}

class Rectangle extends Shape {
  //Derived Class
  final num l, b;
  Rectangle(this.l, this.b);

  @override
  num area() {
    return l * b;
  }

  num perimeter() => 2 * (l + b);
}

class Circle implements Shape {
  //Derived Class using Interface
  final num r;
  Circle(this.r);

  @override
  num area() {
    return pi * pow(r, 2);
  }

  num circumference() => 2 * pi * r;
}

class A {
  //Baseclass
}

mixin CanWalk {
  //Derived Class using Mixins
  walk() {
    print("walking");
  }
}

mixin CanRun {
  run() {
    print("running");
  }
}

class B with CanWalk, CanRun {
  work() {
    print("working");
  }

}

test() {
  final s1 = Rectangle(10, 20);
  print(s1.area());

  final b = B();
  b.run();
  b.work();
}
