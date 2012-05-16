class Service
  include Mongoid::Document
  field :title, :type => String
  field :description, :type => String
  field :availability, :type => Date
  field :buy_price, :type => Integer
  field :min_bid_price, :type => Integer
  field :no_of_guest, :type => Integer
  field :status, :type => Integer
  field :highest_bid, :type => Integer
  
  # RELATIONS
	belongs_to :bar
  
  #VALIDATIONS
	validates_presence_of :title, :message => 'Please provide title to your service'
  validates_presence_of :description, :message => 'Please introduce brief discription of service'
	validates_presence_of :buy_price, :message => 'Please list buy price of service'
	validates_presence_of :min_bid_price, :message => 'What will be the minmum bid of servie'
	validates_presence_of :status, :message => 'Is servie active?'
end
