class Journey < ApplicationRecord
  include Filterable
  has_and_belongs_to_many :users
  has_many :places, dependent: :destroy
  has_many :stations, dependent: :destroy

  validates :count_of_seats, presence: true
  validates :place_of_departure, presence: true
  validates :date_of_departure, presence: true
  validates :place_of_arrive, presence: true
  validates :date_of_arrive, presence: true

  validate :only_future_date_of_departure
  validate :only_future_date_of_arrive
  validate :correct_departure_and_arrive

  scope :place_of_dep, -> (name) { where 'place_of_departure like ?', "%#{name}%" }
  scope :place_of_arr, -> (name) { where 'place_of_arrive like ?', "%#{name}%" }
  scope :date_of_dep,  -> (name) { where 'date_of_departure like ?', "%#{name}%" }
	
  def only_future_date_of_departure
    if date_of_departure && date_of_departure < Time.now
      errors.add(:date_of_departure, "can't be in the past")
    end
  end

  def only_future_date_of_arrive
    if date_of_arrive && date_of_arrive < Time.now
      errors.add(:date_of_arrive, "can't be in the past")
    end
  end

  def correct_departure_and_arrive
    if date_of_arrive && date_of_departure && date_of_arrive < date_of_departure
      errors.add(:date_of_arrive, "can`t be less than Date of departure")
    end
  end 

  def free_place(journey, number)
    @place = Place.find_by(journey_id: journey.id, number: number)
    if @place.present?
      true
    else
      false
    end
  end

  def free_places
    count_of_seats - places.count
  end
end
