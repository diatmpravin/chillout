class Bar
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, :type => String
  field :owner, :type => String
  field :phone, :type => Integer
  field :city, :type => String
  field :website, :type => String
  field :address, :type => String
  
  # RELATIONS
	belongs_to :user
	has_many :services, dependent: :delete
	  
  #VALIDATIONS
	validates_presence_of :name, :message => 'Please provide name to your bar!'
  validates_presence_of :owner, :message => 'Please introduce a owner of your bar!'
	validates_presence_of :phone, :message => 'Please provide contact no of owner.'
	validates_presence_of :city, :message => 'Where your bar is located?'
	validates_presence_of :address, :message => 'What is mailing address of bar?'
end	
