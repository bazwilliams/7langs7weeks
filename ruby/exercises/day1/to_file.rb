#!/usr/bin/ruby -w

# Version of to_file.rb without using a block
module ToFileNB
  def filename
      "object_#{self.object_id}.txt"
  end
  def to_f
  	  f=File.open(filename, 'w')
  	  f.write(to_s)
  	  f.close()
  end
end

  class Person
  include ToFileNB
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  def to_s
    name
  end
end

Person.new('matz').to_f