class ErrorObject
  def self.get_error_object(attribute_name, attribute_value)
    e=ErrorObject.new
    e.class.module_eval { attr_accessor attribute_name}
    e.instance_variable_set("@#{attribute_name}".to_sym, attribute_value)
    return e
  end
end