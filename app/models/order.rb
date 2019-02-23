class order
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :flighting_date, type: Date
  field :total, type: Integer, default: 0
  enum :status, [:pending, :completed, :failed], :default => :pending

  belongs_to :passenger
  has_many :flights
end
