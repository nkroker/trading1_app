class User < ApplicationRecord
  validates :contact_no, presence: true
  validates :contact_no, length: { is: 10 }
  validates :password,  format: { with: /[A-Za-z0-9]/, message: "Password must be in alpha numeric format" }
  # validates :password, presence: false

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:login]

  has_one_attached :image




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
    # binding.pry
    image.attachment.present? ? image : "default_user_pic.png"
  end

end
