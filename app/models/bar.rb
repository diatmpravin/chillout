class Bar
  include Mongoid::Document
  field :name, :type => String
  field :owner, :type => String
  field :phone, :type => Integer
  field :city, :type => String
  field :website, :type => String
  field :address, :type => String
end