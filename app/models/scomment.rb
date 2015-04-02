class Scomment < ActiveRecord::Base
  belongs_to :user , dependent: :destroy
  belongs_to :song, dependent: :destroy
end
