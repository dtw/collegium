#!/usr/bin/env ruby

# declare local variables
$a = ('a'..'z').to_a
$v = %w[a e i o u]
$c = $a - $v
$r = []

def show_help
  puts 'Asura name generator by dibs'
  puts 'Options:'
  puts ' -c : provide a "crib" where v is a vowel, c is a consonant and r repeats'
  puts '      the last letter.'
  puts ' -l : generate a name of length arg (3,4,5)'
  puts ' -s : the number of suggestions generated'
end
  
def generate_name name_crib
  name = ""
  #loop over the crib to select letters
  name_crib.each do |item|
    if name.length == 0 then
      $r[0] = item[rand(item.length)]
      name += $r[0].upcase
    elsif item == $v or item == $c
      $r[0] = item[rand(item.length)]
      name += $r[0]
    else
      name += $r[0]
    end
  end
  return name
end

def arg_check? argv
  if argv[0] == '-'
    return 'switch'
  elsif argv[0] == 'c' or argv[0] == 'v' or argv[0] == 'r'
  return 'crib'
  # this makes everything else an integer
  elsif argv[0] != '-'
    return 'integer'
  else
    return 'invalid'
    #puts "Invalid arguement: " + argv
  end
end

length = 0
no_suggest = 0
name_crib = []
if ARGV.length == 0 then
  show_help
else ARGV.each_with_index do |arg,index|
    if arg_check?(arg) == 'switch' then
      if index+2 <= ARGV.length then
        if arg_check?(ARGV[index+1]) == 'integer' then
          if arg[1,arg.length] == 'l' then
            length = ARGV[index+1].to_i
            print length
          elsif arg[1,arg.length] == 's' then
            no_suggest = ARGV[index+1].to_i
          end
        elsif arg_check?(ARGV[index+1]) == 'crib' then
      i = 0
      while i < ARGV[index+1].length do
        if ARGV[index+1][i] == 'c'
          name_crib.push $c
        elsif ARGV[index+1][i] == 'v'
          name_crib.push $v
        elsif ARGV[index+1][i] == 'r'
          name_crib.push $r
        end
        i += 1
      end
        else
          puts 'No arg supplied for ' + arg + '!'
          exit
        end
      else
        puts 'No arg supplied for ' + arg + '!'
        exit
      end
    elsif arg_check?(arg) == 'integer' then
      if index+1.to_i == ARGV.length then
        pass_length = arg.to_i
      end
    elsif arg_check?(arg) == 'invalid' then
    show_help
    end
end

#puts 'Name length? (3,4,5)'
#length = gets.chomp.to_i
#puts 'Number of suggestions?'
#no_suggest = gets.chomp.to_i

if length == 3 then
  name_crib = [$c,$v,$c]
elsif length == 4
  name_crib = [$c,$v,$c,$r]
elsif length == 5 
  name_crib = [$c,$v,$c,$r,$v]
end

no_suggest.times do
  puts 'Name: ' + generate_name(name_crib)
  no_suggest -= 1
end
end
