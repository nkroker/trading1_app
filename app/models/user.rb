class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:login]
  
  rolify
  resourcify

  has_many :investments
  has_one_attached :image

  validates :contact_no,{ presence: true, uniqueness: true, length: { is: 10 } }
  validates :password,{ format: { with: /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$%\^&\*])/, message: "Password must contain at least 1 digit, 1 special char, 1 Capital Letter, 1 Small Letter and minimum 8 character"}, presence: true, allow_nil: true}
  validates_presence_of :first_name, :last_name

  attr_writer :login
  
  def login
  	@login || self.contact_no || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["contact_no = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:contact_no].nil?
        where(conditions).first
      else
        where(contact_no: conditions[:contact_no]).first
      end
    end
  end

  def user_image
    image.attachment.present? ? image : "default_user_pic.png"
  end

  def fullname
    first_name + " " + last_name
  end

  def create_stripe_customer customer_token
    begin
      customer = Stripe::Customer.create({
          source: customer_token,
          email: email
      })
      self.stripe_customer = customer.id
      self.save
    rescue
      errors.add(:base, "something went wrong")
      false
    end
  end
end
