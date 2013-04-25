class Instagram
  include HTTParty

  def self.retrieve_popular_images
    response = HTTParty.get('https://api.instagram.com/v1/media/popular?access_token=8245362.1fb234f.1d5692912cc048cebdf216211762c378')
    images = []

    response['data'].each do |image|
      images << image['images']['low_resolution']['url']
    end
    images
  end
  # respond['data'][0]['images']['standard_resolution']['url']

end
