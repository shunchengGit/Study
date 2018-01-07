#!/usr/bin/ruby

$LOAD_PATH << '.'
require "box"

a = Box::MainBox.new(2, 3)
puts a.getArea

b = Box::BigBox.new(4, 5)
b.getArea
