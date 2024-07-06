use ValueClass;
use Functional::LinkedList;

unit value-class Functional::Stack;

my $both-default = True;

has Functional::LinkedList $.list;
has Bool                   $.both = $both-default;

multi method mutate(::?CLASS:U: &block) { self.new.mutate: &block }

multi method mutate(::?CLASS:D: &block) {
  my $*STACK = self;
  block $*STACK;
  $*STACK
}

method !mutable($node, $value, Bool :$both = self.defined ?? $!both !! $both-default, :$internal = False) {
  return $node, $value if $internal;
  do if $*STACK !~~ Failure {
    $*STACK = $($node);
    $value
  } else {
    return $node, $value if $both;
    $node
  }
}

multi method size(::?CLASS:U:) { 0 }
multi method size(::?CLASS:D:) { $!list.elems }
method elems { $.size }

method push(\value) {
  self!mutable: self.new(:list($!list.unshift(value).head)), value
}

method pop {
  my ($list, \value) = $!list.shift: :both;
  self!mutable: $.new(:$list), value
}

method peek { $!list.value }

=begin pod

=head1 NAME

Functional::Stack - Functional Stack

=head1 SYNOPSIS

=begin code :lang<raku>

use Functional::Stack;
Functional::Stack.mutate: {
   for ^10 -> $value { say .push: $value }
   say .peek;
   say .pop while .elems;
}

=end code

=head1 DESCRIPTION

Functional::Stack is a implementation of a functional data structure
stack. It's immutable and thread-safe.

It has a C<mutate> method that topicalise the object and will always topicalise
the new generated stack. And that's gives the impression of mutating and makes
it easier to interact with those objects.

=head1 AUTHOR

Fernando Corrêa de Oliveira <fco@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2024 Fernando Corrêa de Oliveira

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
