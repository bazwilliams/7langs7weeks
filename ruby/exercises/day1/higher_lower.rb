#!/usr/bin/ruby -w

secret = rand(10)
begin
guess = gets().to_i
print "Too Low!" if guess < secret
print "Too High!" if guess > secret
end while guess != secret
print "Yay!"
