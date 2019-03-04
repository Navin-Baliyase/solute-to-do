class Todolist < ApplicationRecord
	validates :title, presence: true
	#Navin's Comment : As per the instruction i made it exactly with charaters limit, minimum amd maximum value can be passed as required
	validates :title, length: {is: 120}
	validates :description, length: {is: 160}, allow_blank: true
	belongs_to :user
end
