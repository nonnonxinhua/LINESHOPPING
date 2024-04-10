class Customer < ApplicationRecord
   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
        # :recoverable, :rememberable, :validatable

  def full_name
    user_name = last_name.to_s + first_name.to_s
    return user_name
  # id.to_s + email
    #id.to_s + "_"+ email
  # "test"
  end

  def self.select_data
   if self.all.any?
    self.all.map { |o| [ "〒#{ o.postal_code } #{ o.address } #{ o.last_name }#{ o.first_name } ", o.id ]}
   else
    []
   end

  end
  
 
  
   has_many :orders
   has_many :cart_items, dependent: :destroy
end
