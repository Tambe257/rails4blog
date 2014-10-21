class Post < ActiveRecord::Base

  belongs_to :user

  acts_as_taggable
  
  def self.search(search)
    if search
      losearch = search.downcase
      find(:all, :conditions => ['lower(title) LIKE ? OR lower(body) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%"], order: "created_at desc")
    else
      find(:all, order: "created_at desc")
    end
  end 
end
