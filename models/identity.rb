class Identity < Sequel::Model

  include Utils::ModelBase
  extend Utils::ModelRepositoryBase

  many_to_one :email_adapter, :key => :email_adapter_id, :class => Adapter
  many_to_one :phone_adapter, :key => :phone_adapter_id, :class => Adapter

  def before_save
    super

    self.token ||= ::Utils::TokenProcessor.generate
    self.secret ||= ::Utils::TokenProcessor.generate
  end

  def validate
    validates_unique(
      :name
    )

    validates_presence([
      :name,
      :email_adapter_id,
      :phone_adapter_id
    ])
  end

  def self.editable_params
    [
      :name,
      :email_adapter_id,
      :phone_adapter_id
    ]
  end

end
