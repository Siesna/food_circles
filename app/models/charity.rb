class Charity < ActiveRecord::Base
  image_accessor :image

  belongs_to :charity
  belongs_to :region
  belongs_to :state

  def as_json(options={})
    { :id => self.id,
      :name => self.name,
      :address => self.address,
      :city => self.city,
      :description => self.description,
      :state => self.state.name,
      :image => self.image.url
    }
  end

  def full_address
    "#{self.address}, #{self.city}, #{self.state.name}"
  end

end
