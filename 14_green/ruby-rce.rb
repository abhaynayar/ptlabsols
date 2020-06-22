ObjectSpace.each_object(::Class) do |obj|
  all_methods = obj.instance_methods + obj.protected_instance_methods + obj.private_instance_methods

  if all_methods.include? :marshal_load
    method_origin = obj.instance_method(:marshal_load).inspect[/\((.*)\)/,1] || obj.to_s

    puts obj
    puts "  marshal_load defined by #{method_origin}"
    puts "  ancestors = #{obj.ancestors}"
    puts
  end
end

