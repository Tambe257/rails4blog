class Post < ActiveRecord::Base

  belongs_to :user

  acts_as_taggable
  
  def self.search(search)
    if search
      losearch = search.downcase
      where('lower(title) LIKE ? OR lower(body) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%")
    end  
  end 
end
