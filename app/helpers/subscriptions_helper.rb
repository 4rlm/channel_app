module SubscriptionsHelper

  def self.channel_user_status(channel_id, user)
    user.subscriptions.find_by(channel_id: channel_id).present?
  end

  def self.users_per_channel(channel_id)
    binding.pry
    user.subscriptions.find_by(channel_id: channel_id)
  end

  def self.total_subscriptions_cost(user)
    total = user.subscriptions.map { |obj| obj.channel.price_per_month.truncate(2).to_s('F').to_f }
    total = total.inject(0){|sum,x| sum + x }.round(2).to_s

    splitted = total.split('.')
    (total = total + '0') if (splitted.length > 1 && splitted[-1].length == 1)
    (total = total + '.00') if !splitted[1].present?
    p total
  end

  # def self.channel_stats(channel)
  #   binding.pry
  # end

end
helpers SubscriptionsHelper

# SubscriptionsHelper::channel_user_status(channel_id, user)
