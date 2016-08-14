class UserSelection < ActiveRecord::Base
  belongs_to :user
  belongs_to :region
  belongs_to :country

  validates :region_id, uniqueness: {scope: :user_id}, unless: Proc.new { |selection| selection.region.nil? }
  validates :country_id, uniqueness: {scope: :user_id}, unless: Proc.new { |selection| !selection.region.nil? }
end