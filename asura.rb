#!/usr/bin/env ruby

a = ('a'..'z').to_a
v = %w[a e i o u]
c = a - v

name = c[rand(c.length)].upcase
name += v[rand(v.length)] 
name += c[rand(c.length)] * 2
name += v[rand(v.length)] 

puts 'Name: ' + name
