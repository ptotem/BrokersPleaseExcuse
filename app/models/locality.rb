class Locality < ActiveRecord::Base
  belongs_to :area
  belongs_to :quality
  has_many :locality_notes, :dependent => :destroy
  has_many :pois, :dependent => :destroy
  has_many :poi_types, :through => :pois
  has_many :building_localities, :dependent => :destroy
  has_many :primary_localities, :dependent => :destroy
  has_many :buildings, :through => :primary_localities

  validates_presence_of :name
  validates_presence_of :area_id, :message => "can't be empty or incorrect"

  rails_admin do
    list do
      field :name
      field :area
    end
    edit do
      field :name
      field :area
      field :quality
      field :locality_notes
    end
  end

end
