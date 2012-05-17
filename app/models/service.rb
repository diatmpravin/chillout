class Service
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  include Mongoid::Paperclip
  include ActiveAdmin::Mongoid::Patches

  field :title, :type => String
  field :description, :type => String
  field :availability, :type => Date
  field :buy_price, :type => Integer
  field :min_bid_price, :type => Integer
  field :no_of_guest, :type => Integer
  field :status, :type => Integer
  field :highest_bid, :type => Integer
  
  has_mongoid_attached_file :image,
      :styles => {:thumb => "150x150!"},
      :default_url => '/images/servicelisting-noimage.jpg'
   
      attr_accessible :image, :title, :description, :availability, :buy_price, :min_bid_price, :no_of_guest, :status, :highest_bid
  
  # RELATIONS
	belongs_to :bar
  
  #VALIDATIONS
	validates_presence_of :title, :message => 'Please provide title to your service'
  validates_presence_of :description, :message => 'Please introduce brief discription of service'
	validates_presence_of :buy_price, :message => 'Please list buy price of service'
	validates_presence_of :min_bid_price, :message => 'What will be the minmum bid of servie'
	validates_presence_of :status, :message => 'Is servie active?'
end
