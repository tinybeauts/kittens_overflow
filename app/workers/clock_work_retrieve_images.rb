# require 'clockwork'
# require '../../config/boot'
# require '../../config/environment'
# require 'instagram_worker'

# require 'clockwork'
# include Clockwork

# # class InstagramWorker
# #   include Sidekiq::Worker
# #   sidekiq_options :retry => 2

# #   def perform
# #     Instagram.retrieve_popular_images
# #   end

# # end

# every(4.hours, "Retrieving Instagram Pictures") do
#   puts "Retrieving Instagram images"
#   # Instagram.retrieve_popular_images
#   InstagramWorker.perform_async
#   puts "Finished retrieving images"
# end



# # while true
# #   puts "sleep"
# #   sleep(1)
# # end
