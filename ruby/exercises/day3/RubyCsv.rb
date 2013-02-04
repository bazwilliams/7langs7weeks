#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   

    attr_accessor :headers, :rows

    def read
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      
      @rows = []
      file.each_line do |row|
        row_contents = row.chomp.split(', ')
        @rows.push(Row.new(headers, row_contents))
      end
    end
    
    def each(&block)
      @rows.each &block
    end

    def initialize
      read 
    end
  end
end

class Row
  attr_accessor :row_contents, :csv_headers
  def initialize(csv_headers, row_contents)
    @row_contents = row_contents
    @csv_headers = csv_headers
  end

  def method_missing name, *args
    index = @csv_headers.index(name.to_s)
    return @row_contents[index]
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

#m = RubyCsv.new
#puts m.headers.inspect
#puts m.rows.inspect

csv = RubyCsv.new
csv.each { |row| puts row.one }