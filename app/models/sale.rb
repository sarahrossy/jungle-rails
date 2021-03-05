class Sale < ActiveRecord::Base
  
  # AR Scope
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?",
    Date.current, Date.current)
  end  
  
  #question mark methods imply booleans, return is implicit
  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
