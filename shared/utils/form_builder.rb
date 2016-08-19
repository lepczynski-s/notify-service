# --------------------------------------------
# Custom form builder with semantic ui classes
# --------------------------------------------

module Utils
  class FormBuilder < ::Padrino::Helpers::FormBuilder::AbstractFormBuilder

    include ::Padrino::Helpers::TagHelpers
    include ::Padrino::Helpers::FormHelpers
    include ::Padrino::Helpers::AssetTagHelpers
    include ::Padrino::Helpers::OutputHelpers

    # StandardFormBuilder
    #
    #   text_field_block(:username, { :class => 'long' }, { :class => 'wide-label' })
    #   text_area_block(:summary, { :class => 'long' }, { :class => 'wide-label' })
    #   password_field_block(:password, { :class => 'long' }, { :class => 'wide-label' })
    #   file_field_block(:photo, { :class => 'long' }, { :class => 'wide-label' })
    #   check_box_block(:remember_me, { :class => 'long' }, { :class => 'wide-label' })
    #   select_block(:color, :options => ['green', 'black'])
    #

    (self.field_types + [
        :datetime_field,
        :datetime_local_field
      ] - [
        :hidden_field,
        :radio_button
      ]
    ).each do |field_type|

      class_eval <<-EOF
      def #{field_type}_block(field, options={}, label_options={})
        html = label_for(field, options, label_options)
        html << #{field_type}(field, options)
        @template.content_tag(:div, html, :class => field_class_for(field))
      end
      EOF

    end

    def label_for(field, options, label_options)
      if options[:caption]
        label_text = options.delete(:caption) + explanation_for(field)
        label_options.reverse_merge!(:caption => label_text.html_safe)
      else
        label_text = label_options[:caption] + explanation_for(field)
        label_options[:caption] = label_text.html_safe
      end
      label(field, label_options)
    end

    def field_class_for(field)
      unless object.errors.include? field then 'field' else 'error field' end
    end

    def explanation_for(field)
      if object.errors.include? field
        explanation_text = " - #{object.errors[field].join(content_tag(:em, ' and '))}"
        content_tag(:span, explanation_text.html_safe, :class => 'explanation')
      else
        String.new
      end
    end

    def additional_problems_message
      errors_list = object.errors.map do |k,v|
        if k.kind_of? Array
          index_text = (k.map { |e| I18n.t("models.#{e.to_s.gsub('_id', '').capitalize}") }).join(' - ')
          content_tag(:li, I18n.t('errors.validation.composite_index', :index => index_text.capitalize))
        end
      end.join.html_safe
      if not errors_list.blank?
        errors_header = content_tag(:div, I18n.t('errors.additional_problems_header'), :class => 'header')
        errors_list = content_tag(:ul, errors_list, :class => 'list')
        content_tag(:div, errors_header + errors_list, :class => 'ui info message')
      end
    end

    # def submit_block(caption, options={})
    #   submit_html = self.submit(caption, options)
    #   @template.content_tag(:div, submit_html, :class => 'field')
    # end
    #
    # def image_submit_block(source, options={})
    #   submit_html = self.image_submit(source, options)
    #   @template.content_tag(:div, submit_html,  :class => 'form-group')
    # end

  end
end
