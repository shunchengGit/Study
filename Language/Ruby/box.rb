#!/usr/bin/ruby

module Box
	class MainBox
		attr_accessor :width, :height
		def initialize (w, h)
			@width = w
			@height = h
		end

		def getArea
			@width * @height
		end
	end

	class BigBox < MainBox
		def getArea
			area = @width * @height
			puts "面积是#{area}"
		end
	end
end