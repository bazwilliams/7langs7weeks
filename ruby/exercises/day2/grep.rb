#!/usr/bin/ruby -w

class Grep
	attr_accessor :filename, :compare

	def initialize(filename, compare)
		@filename=filename
		@compare=compare
	end

	def grep()
		line_num = 0
		File.open(filename, 'r') {|f| 
			f.each_line { |line|
				line_num = line_num + 1
				if line =~ /#{@compare}/
					puts "#{line_num}: #{line}"
				end
			}
		}
	end
end

grep = Grep.new(ARGV[0], ARGV[1])
grep.grep()