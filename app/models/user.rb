class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :critiques
  acts_as_liker
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "50x50#" },
  							:storage => :s3,
  							:bucket => ENV['dopecritiqueassets']
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :full_name
end
