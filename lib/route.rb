require File.join(File.dirname(__FILE__), '../', 'app', 'controllers', 'base_controller')
# require File.expand_path('app/controllers/base_controller.rb')

class Route
  
  attr_accessor :klass_name, :path, :instance_method
  
  def initialize route_array
    @path            = route_array.first
    @file_name       = route_array.last[:klass] + '_controller'
    @klass_name      = @file_name.split('_').join(' ').gsub(/\b\w/){|s| s.upcase}.gsub(/\s+/, '')
    @instance_method = route_array.last[:method]
    handle_requires
  end

  def klass
    Module.const_get(klass_name)
  end

  def execute(env)
    klass.new(env).send(instance_method.to_sym)
  end

  def handle_requires
    require File.join(File.dirname(__FILE__), '../', 'app', 'controllers', @file_name.downcase + '.rb')
    # require File.expand_path('app/controllers/'+@file_name.downcase+'.rb')
  end

end
