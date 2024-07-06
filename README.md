[![Actions Status](https://github.com/FCO/Functional-Stack/actions/workflows/test.yml/badge.svg)](https://github.com/FCO/Functional-Stack/actions)

NAME
====

Functional::Stack - Functional Stack

SYNOPSIS
========

```raku
use Functional::Stack;
Functional::Stack.mutate: {
   for ^10 -> $value { say .push: $value }
   say .peek;
   say .pop while .elems;
}
```

DESCRIPTION
===========

Functional::Stack is a implementation of a functional data structure stack. It's immutable and thread-safe.

It has a `mutate` method that topicalise the object and will always topicalise the new generated stack. And that's gives the impression of mutating and makes it easier to interact with those objects.

AUTHOR
======

Fernando Corrêa de Oliveira <fco@cpan.org>

COPYRIGHT AND LICENSE
=====================

Copyright 2024 Fernando Corrêa de Oliveira

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

