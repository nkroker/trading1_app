class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]
  has_one_attached :image




  attr_writer :login
  
  def login
  	@login || self.contact_no || self.email
  end


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["contact_no = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:contact_no) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
