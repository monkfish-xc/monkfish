module PostsHelper
	def prepend_url(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
end