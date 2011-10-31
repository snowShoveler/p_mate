# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  first_name         :string(75)
#  last_name          :string(75)
#  email              :string(255)
#  address            :string(255)
#  city               :string(100)
#  state              :string(25)
#  zip                :string(25)
#  office_phone       :string(25)
#  cell_phone         :string(25)
#  fax                :string(25)
#  user_type          :integer
#  approver_level_id  :integer
#  employee           :boolean
#  supervisor_id      :integer
#  ccb_member         :integer
#  encrypted_password :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  salt               :string(255)
#

require 'digest'

class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessor   :full_name
  
  attr_accessible :first_name,
                  :last_name,
                  :email,
                  :address,
                  :city,
                  :state,
                  :zip,
                  :office_phone,
                  :cell_phone,
                  :fax,
                  :user_type,
                  :approver_level_id,
                  :employee,
                  :supervisor_id,
                  :ccb_member,
                  :password,
                  :password_confirmation
                  
                
  attr_readonly   :created_at, :updated_at, :full_name

  #for email validating
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :last_name, :presence=> true,
                        :length=> {:maximum=>50}

  validates :email,     :presence=> true,
                        :length=>{:maximum=>255},
                        :format=>{:with=>email_regex},
                        :uniqueness=>{:case_sensitive=> false}

  # Automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }

  before_save :encrypt_password

  # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    # Compare encrypted_password with the encrypted version of
    # submitted_password.
    encrypted_password == encrypt(submitted_password)
  end

  #here's how we log in
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  #a nice way to return the full users name
  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
  

    private

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end






end
