class Photo < ActiveRecord::Base
  #we use paperclip here to attach photos
  has_attached_file :image,
                    :styles => {
                        :original => {
                            :geometry => "256x256<",
                            :processors => [:qresize, :watermark],
                            #:watermark_path => "#{Rails.root}/app/assets/images/watermark.jpg",
                            :position => "Center"
                        },
                        :thumbnail => {
                            :geometry => "100x100"
                        }
                    }


  #relatioships
  belongs_to :flat

  before_create :name_photo_from_file
  after_create :assign_sequence_number

  def name_photo_from_file
    self.name=self.image_file_name.split(".")[0]
  end

  def assign_sequence_number
    self.sequence_number=self.flat.photos.count
    self.save!

  end
end
