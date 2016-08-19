module Utils
  module LocaleHelpers

    def stringify_values(hash)
      hash.each { |k, v| hash[k] = v.to_s(true) }
    end

    def title_for(action, hash={})
      stringify_values(hash)
      I18n.t("titles.#{action}", hash).capitalize
    end

    def caption_for(field, hash={})
      stringify_values(hash)
      I18n.t("captions.#{field}", hash).capitalize
    end

    def model_caption_for(klass)
      I18n.t("models.#{klass}").capitalize
    end

    def list_caption_for(klass)
      I18n.t("lists.#{klass}").capitalize
    end

    def message_for(event, hash={})
      stringify_values(hash)
      I18n.t("messages.#{event}", hash).capitalize
    end

  end
end
