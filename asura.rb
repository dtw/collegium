#!/usr/bin/env ruby

a = ('a'..'z').to_a
v = %w[a e i o u]
c = a - v
r = []

name = r[rand(r.length)]
			puts name
			
def generate_name name_crib
	name_crib.each do |item|
		puts item
		if name.length == 0 then
			name = item[rand(item.length)]
			puts name
		elsif item = v or item = c
			name += r[0]
			puts name
		else
			r[0] = item[rand(item.length)]
			name += r[0]
			puts name
		end
	end
	return name
end

name_crib = 

puts 'Name: ' + generate_name([c,v,c,r])
