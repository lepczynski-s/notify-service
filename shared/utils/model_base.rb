module Utils
  module ModelBase

    def setup(params)
      self.set_fields params[self.class.name.underscore.to_sym], self.class.editable_params
    end

  end
end
