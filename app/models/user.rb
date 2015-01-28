class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :critiques
  acts_as_liker
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "50x50#" },
  							:storage => :s3,
  							:bucket => ENV['dopecritiqueassets'],
  							:s3_credentials => {
                    :access_key_id => ENV['AKIAIBPRHVSOQYLDGMGQ'],
                    :secret_access_key => ENV['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']
                },
                :s3_permissions => 'private',
                :url => ":s3_domain_url",
                :path => "/:class/avatars/:id_:basename.:style.:extension"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :full_name
end
