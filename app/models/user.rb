# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  password   :string
#  phone      :string
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

  before_save :encrypt_password
  after_save :clear_password


  has_many :addresses
  has_many :orders
  has_many :devices
  
  attr_accessor :password, :isSocialLogin

  validates :email,  :presence => true, :uniqueness => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, :confirmation => true #password_confirmation attr
  #validates_length_of :password, :in => 6..20, :on => :create

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def clear_password
    self.password = nil
  end

  def set_default_role
    if User.count == 0
      self.role ||= :admin
    else
      self.role ||= :user
    end
  end

  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     #user.provider = auth['provider']
  #     user.id = auth['uid']
  #     if auth['info']
  #        user.name = auth['info']['name'] || ""
  #     end
  #   end
  # end

end
