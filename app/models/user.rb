class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:admin, :contact_id, :name

  validates_presence_of :name
  validates_presence_of :email

  belongs_to :contact

  after_create :make_contact

  def make_contact
    @contact=Contact.new
    @contact.name=self.name.humanize
    @email=Email.create!(:name=>self.email)
    @contact.emails<<@email
    @contact.contact_types<<ContactType.find_by_name("Employee")
    @contact.save
    self.contact_id=@contact.id
    self.save!
  end

end
