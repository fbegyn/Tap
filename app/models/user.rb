# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  remember_created_at :datetime
#  sign_in_count       :integer          default("0"), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string
#  last_sign_in_ip     :string
#  admin               :boolean
#  dagschotel_id       :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  orders_count        :integer          default("0")
#  koelkast            :boolean          default("f")
#  name                :string
#  encrypted_password  :string           default(""), not null
#  private             :boolean          default("f")
#

class User < ActiveRecord::Base
  include Statistics, Avatarable, FriendlyId
  friendly_id :name, use: :finders

  devise :database_authenticatable, :omniauthable, :omniauth_providers => [:zeuswpi]

  has_many :orders, -> { includes :products }
  has_many :products, through: :orders
  belongs_to :dagschotel, class_name: 'Product'

  scope :members, -> { where koelkast: false }
  scope :publik,  -> { where private: false }

  def self.from_omniauth(auth)
    where(name: auth.uid).first_or_create do |user|
      user.name = auth.uid
      user.avatar = Identicon.data_url_for auth.uid
    end
  end

  def debt
    42.15
  end
end
