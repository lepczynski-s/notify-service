module Utils
  module ModelRepositoryBase

    def to_s(translate=false)
      (I18n.t("models.#{name}") if translate) or super()
    end

    def obtain_from(params)
      self[params[:id]]
    end

    def obtain_available
      self.all
    end

  end
end
