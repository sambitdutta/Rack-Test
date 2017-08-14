require File.join(File.dirname(__FILE__), 'router.rb')

class RackTest
  attr_reader :router

  def initialize
    @router = Router.new
  end
end
