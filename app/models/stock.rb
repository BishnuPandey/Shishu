class Stock < ActiveRecord::Base
  validates_presence_of :item_name,:item_description,:item_quantity,:item_unit_rate,:buying_rate
  validates_numericality_of :item_quantity,:item_unit_rate,:buying_rate,:min_stock,:max_stock,:greater_than_or_equal_to=>0
  validates_uniqueness_of :item_name
has_many :temps
belongs_to :vaccine
has_many :stock_vendor_details, :dependent=>:destroy
  before_save :check_type
  
  def check_type
    self.item_type=nil if self.item_type=='other' || self.item_type==''
  end
end
