# ---------------------------------------------
# Padrino form helpers with semantic ui support
# ---------------------------------------------

module Utils
  module FormHelpers

    def merge_class(options, klass)
      unless options[:class] then klass else "#{klass} #{options[:class]}" end
    end

    def form_for(object, url, options={}, &block)
      options[:class] = merge_class options, 'ui form'
      super
    end

    def select_tag(name, options={})
      options[:class] = merge_class options, 'ui dropdown'
      super
    end

    def extract_option_tags!(options={})
      ["<option value=\"\">Select</option>".html_safe] + super
    end

  end
end
