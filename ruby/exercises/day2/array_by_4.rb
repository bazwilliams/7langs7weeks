#!/usr/bin/ruby -w

a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

index = 0
a.each { |a| 
	index=index+1
	if index%4==0
		puts "#{a}\n" 
	else
		print "#{a} "
	end
}

