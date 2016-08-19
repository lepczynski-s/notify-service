class Recipient < Sequel::Model

  include Utils::ModelBase
  extend Utils::ModelRepositoryBase

  def validate
    super

    validates_unique(
      :email
    )

    validates_presence([
      :email,
      :name,
      :surname
    ])

    validates_format Utils::RegexPatterns::EMAIL, :email, :message => 'is not valid'
  end

  def self.editable_params
    [
      :email,
      :phone,
      :name,
      :surname
    ]
  end

end
