class Article < ApplicationRecord
  # enable searchkick
  searchkick

  # validates                                                                                                                                                                                                                              
  validates_presence_of :title, :content
end
