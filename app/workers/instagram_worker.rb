class InstagramWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 2

  def perform
    Instagram.retrieve_popular_images
  end

end
