class Deal < ActiveRecord::Base
  belongs_to :flat
  belongs_to :deal_stage

  has_many :deal_contacts, :dependent => :destroy
  has_many :contacts, :through => :deal_contacts

  accepts_nested_attributes_for :deal_contacts

  before_create :calculate_net_commission

  def calculate_net_commission
    self.net_commission=self.tenant_commission+self.landlord_commission-self.expenses
  end

end
