class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :journeys
  belongs_to :role
  has_many :places

  validates :first_name, presence: true
  validates :last_name, presence: true

  before_validation :set_default_role 

  def full_name
    "#{first_name} #{last_name}"
  end

  def count_tickets journey
    Place.where(user_id: id, journey_id: journey.id).count
  end

  def places journey
    num = ''
    @numbers = Place.where(user_id: id, journey_id: journey.id).pluck(:number)
    @numbers.map{|n,i| num << n.to_s + ' '}
    num
  end

  private
  
  def set_default_role
  	self.role ||= Role.find_by_name('registered')
  end
end
