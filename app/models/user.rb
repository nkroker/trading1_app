class User < ApplicationRecord
  has_many :investments
  # has_one :role
  validates :contact_no, presence: true
  validates :password,  format: { with: /\A[a-zA-Z0-9]*\z/, message: "Password must be in alpha numeric format" }, on: :create
  validates :password,  format: { with: /\A[a-zA-Z0-9]*\z/, message: "Password must be in alpha numeric format" }, on: :update
  validates :contact_no, uniqueness: true
  validates :contact_no, length: { is: 10 }
  # validates :password, presence: false
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:login]

  has_one_attached :image

  # after_create :assign_default_role

  # def assign_default_role
  #   add_role(:customer)
  # end

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

  def set_stripe_customer_id stripe_customer_id
    stripe_customer = stripe_customer_id
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
