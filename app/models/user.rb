class User < ActiveRecord::Base

  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    @email = email.delete(' ').downcase
    user = User.find_by(email: @email)
    if user && user.authenticate(password)
      return user
    else 
      nil  
    end
  end
end
