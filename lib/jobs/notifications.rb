module Jobs
  class Notifications

    def self.instant_notifications_job
      instant_notifications.each { |notification| send notification }
    end

    def self.scheduled_notifications_job
      scheduled_notifications.each { |notification| send notification }
    end

    def self.digested_notifications_job
      # TODO: Digest message sending.
    end

    def self.old_notifications_job
      delete_old_notifications
    end

    # private

    def self.send(notification)
      client = Object.const_get "Clients::#{notification.adapter.client}"
      notification.external_id = client.perform notification
      notification.sent_at = Time.now
      notification.save
    end

    def self.instant_notifications
      ::Notification.
      eager(:adapter, :recipient).
      where(
        :sent_at => nil,
        :digest_for => nil,
        :schedule_for => nil
      ).all
    end

    def self.scheduled_notifications
      ::Notification.
      eager(:adapter, :recipient).
      where(
        :sent_at => nil,
        :digest_for => nil
      ){ schedule_for < Time.now }.all
    end

    def self.delete_old_notifications
      ::Notification.where{ sent_at < Date.today - 7 }.delete
    end

  end
end
