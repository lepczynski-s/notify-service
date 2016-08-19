class Notification < Sequel::Model

  include Utils::ModelBase
  extend Utils::ModelRepositoryBase

  many_to_one :adapter
  many_to_one :recipient

  def validate
    validates_presence([
      :adapter_id,
      :recipient_id,
      :subject,
      :content
    ])
  end

  def self.editable_params
    [
      :adapter_id,
      :recipient_id,
      :external_id,
      :subject,
      :content,
      :digest_for,
      :schedule_for
    ]
  end

end
