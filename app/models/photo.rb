class Photo < ActiveRecord::Base
  #we use paperclip here to attach photos
  has_attached_file :image,
                    :styles => {
                        :original => {
                            :geometry => "256x256<",
                            :processors => [:qresize,:watermark],
                            :watermark_path => "#{Rails.root}/app/assets/images/watermark.jpg",
                            :position => "Center"


  },
                        :thumbnail => {
                            :geometry => "100x100"
                        }
                    }


  #relatioships
  belongs_to :flat
end
