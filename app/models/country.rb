class Country < ActiveRecord::Base
  has_many :regions
  has_many :user_selections

  def self.region_select
    Country.includes(:regions).map{ |c| {c.id => c.regions.map{|r| [r.id, r.name] }}}.inject(:merge).to_json
  end
end

