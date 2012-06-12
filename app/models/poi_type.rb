class PoiType < ActiveRecord::Base
  has_many :pois
  has_many :localities, :through => :pois

  has_attached_file :avatar,
                    :path => ":rails_root/app/assets/images/article_images/:id/:style_:basename.:extension",
                    :url => "/assets/article_images/:id/:style_:basename.:extension"


end
