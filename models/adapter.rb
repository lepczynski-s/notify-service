class Adapter < Sequel::Model

  include Utils::ModelBase
  extend Utils::ModelRepositoryBase

  def validate
    validates_unique(
      :name
    )

    validates_presence([
      :name,
      :sender,
      :client,
      :host,
      :user,
      :pass
    ])
  end

  def self.editable_params
    [
      :name,
      :sender,
      :client,
      :host,
      :user,
      :pass,
      :port
    ]
  end

end
