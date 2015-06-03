module Sortable
  def method_missing(method, *args)
    if (method.to_s =~ /^sort_by/)
      #puts "Method: #{method} Args: (#{args.join(', ')})"
      args.each do |a|
        self.elements.sort_by! { |x| x[a]}
      end
      self
    else
      super.method_missing(method, *args, &block)
    end
  end
  def module_sort_by (params)
     puts params
    self.elements.sort_by! { |x| x[params]}
    self
  end
end

class Storage
  include Sortable
  attr_reader :elements

  def initialize
    @elements = []
  end

  def inspect
    "<storage with #{@elements.count} elements>"
  end

  def insert(element)
    @elements << element
    self
  end

  def bulk_insert(elements)
    elements.each {|x| self.insert x}
    self
  end

  alias :<< :insert
  alias :+ :bulk_insert
end

class SortedStorage < Storage
  attr_reader :sort_order

  def initialize
    @sort_order = []
    super
  end

  def method_missing(method, *args)
  # puts method.to_s
  #  if (method.to_s =~ /^sort_by/)
  #    if args.length >=0
  #      @sort_order << args
  #      puts sort_order.to_s + 'Sorted'
  #    end
  #    super.sort_by(sort_order)
  #  else
       super.method_missing(method, *args)
  #  end
  end

  def insert(element)
    super
  end
end

a = Storage.new
a + [{a: 1, b: 2, c: 3}, {a: 2, b: 4, c:1}, {a: 1, b: 4, c: 7}, {a: 5, b: 3, c: 2}]
puts a.elements
a.sort_by(:c, :a).elements
puts a.elements


