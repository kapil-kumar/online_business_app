class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  
  has_attached_file :picture
        
        
  def self.from_omniauth(auth)
    user = User.where("email = '#{auth.info.email}' and uid = '#{auth.uid}'").first
    unless user
      user = User.new(:email => auth.info.email,:first_name => auth.info.first_name,:last_name => auth.info.last_name,:provider => auth.provider,:uid => auth.uid,:access_token => auth.credentials.token)
      if auth.info.image.present?
        avatar_url = process_uri(auth.info.image)
        user.picture = URI.parse(avatar_url)
      end
      user.save(:validate => false)
      user.confirm!
    end
    return user
  end 
  
  def name
    self.first_name+" "+self.last_name
  end
  
  def self.process_uri(uri)
    require 'open-uri'
    require 'open_uri_redirections'
    open(uri, :allow_redirections => :safe) do |r|
      r.base_uri.to_s
    end
  end 
end
