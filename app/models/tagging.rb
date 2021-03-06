# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  movie_id   :integer          not null
#  genre_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tagging < ActiveRecord::Base
  validates :movie, :genre, presence: true
  belongs_to :movie
  belongs_to :genre
end
