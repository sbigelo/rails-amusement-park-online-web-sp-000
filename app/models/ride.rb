class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

   def take_ride
    update_user_attributes if valid_ride?
    load_prompt
  end

  private

  def enough_tickets?
    self.user.tickets > self.attraction.tickets
  end

  def tall_enough?
    self.user.height > self.attraction.min_height
  end

  def valid_ride?
    enough_tickets? && tall_enough?
  end

  def update_user_attributes
    self.user.update(
      tickets: (self.user.tickets - self.attraction.tickets),
      nausea: (self.user.nausea + self.attraction.nausea_rating),
      happiness: (self.user.happiness + self.attraction.happiness_rating)
    )
  end

  def load_prompt
    if !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}." 
    else
      "Thanks for riding the #{self.attraction.name}!"
    end
  end


end
