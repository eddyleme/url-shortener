class Url < ApplicationRecord
	validates :short, uniqueness: true
	before_validation :generate , on: :create

	def generate
		self.short = SecureRandom.hex(3)
		while Url.where(short: self.short).exists?
			self.short = SecureRandom.hex(3)
		end
	end


end
