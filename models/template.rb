class Template < Sequel::Model

  include Utils::ModelBase
  extend Utils::ModelRepositoryBase

  def validate
    super

    validates_unique(
      :name
    )

    validates_presence([
      :name,
      :content
    ])
  end

  def self.editable_params
    [
      :name,
      :content
    ]
  end

  def render(recipient, notification)
    ::Liquid::Template.parse(content).render({
      'recipient' => {
        'name' => recipient.name,
        'surname' => recipient.surname
      },
      'notification' => {
        'subject' => notification.subject,
        'content' => notification.content
      }
    })
  end

end
