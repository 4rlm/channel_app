class Channel < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions

  ############################


  # AdHocBkg.joins(:adhoc_bkg_status, :invoice_trans => [ :meal, { :invoice_hdr => [ :supplier, :client ] } ]).
  # where("adhoc_bkg_statuses.abstatdesc='Billed' and invoice_trans.id = (select max(id) from invoice_trans as it where it.ad_hoc_bkg_id=ad_hoc_bkgs.id)").
  # order("suppliers.suppname desc, clients.clientname desc, invoice_hdrs.invno desc, invoice_trans.invtrndate, meals.mealsortseq desc")
  #
  #
  # scope :samps1, -> { where("channel.id > 5") }
  #
  # scope :espn, -> { where(name: 'ESPN') }
  #
  #

# Client.order("created_at")

# chans = Channel.order("samps1")

# scope :published_and_commented, -> { published.where("comments_count > 0") }

# scope :ind, -> { joins(:country).where("countries.name like %india%") }


  ###########################

  # Channel.all.map(&:users).uniq.count
  # Channel.all.map(&:users).uniq.count

  # Channel.all.where("channel.id = subscriptions.channel_id").group('channel.id')


# Channel.joins(:subscriptions).group('channel.id')

# Project.joins(:vacancies).group('projects.id')

  # scope :ind, -> { joins(:country).where("countries.name like %india%") }

  # Company.joins(:roles).group(:company_id).having('count(company_id)= ?', 3)

  # scope :sub_counts, -> { select(count("subscriptions.channel_id)").joins(:subscriptions) }

  # scope :sub_counts, -> { select("channels.id, count(subscriptions.channel_id)").joins(:subscriptions).group("channels.id") }

    # scope :ind, -> { joins(:country).where("countries.name like %india%") }
    # scope :sample, -> { joins(:country).where("countries.name like %india%") }


    # .where("subscriptions.channel_id = channel.id") }


  # scope :top5, -> { select("channels.id, count(subscriptions.channel_id) AS uniq_channel_count").
  # joins(:subscriptions).
  # group("channels.id").
  # order("uniq_channel_count DESC") }

  # scope :top_subs1, -> { select("channels.id, count(subscriptions.user_id) AS users_per_channel").joins(:subscriptions).group("channels.id") }

  # scope :top_subs2, -> { select("channels.id, count(subscriptions.user_id) AS users_per_channel").joins(:subscriptions).group("channels.id") }

  # scope :top_subs3, -> { select("channels.id, count(subscriptions.user_id)").joins(:subscriptions).group("channels.id") }

  # scope :top_subs4, -> { where("channels.id, count(subscriptions.user_id)").joins(:subscriptions) }

  # scope :red, where(color: 'red')
  # scope :red, -> { where(color: 'red') }
  # scope :ind, -> { joins(:country).where("countries.name like %india%") }
  # Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")
  # scope :sample_scope, -> { where(published: true) }


# class Song
  # has_many :listens
  # scope :top5,
  # select("songs.id, OTHER_ATTRS_YOU_NEED, count(listens.id) AS listens_count").
  # joins(:listens).
  # group("songs.id").
  # order("listens_count DESC").
  # limit(5)


  # default_scope :include => :availabilities, :order => "availabilities.price ASC"

end
