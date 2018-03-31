class Url < ApplicationRecord
	validates :short, uniqueness: true
	before_validation :generate, on: :create

	def generate
		self.short = SecureRandom.hex(3)
		while Url.where(short: self.short).exists?
			self.short = ('a'..'z').to_a.shuffle.take(1).join + SecureRandom.hex(2) + ('a'..'z').to_a.shuffle.take(1).join
		end
	end

end
