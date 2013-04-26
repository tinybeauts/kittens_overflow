namespace :counters do
  desc "Retroactively update the vote count for stories and images"
  task :update_votes => :environment do
    Image.all.each do |i|
      i.votes_count = i.votes.count
      i.save
    end

    Story.all.each do |s|
      s.update_attribute(:votes_count, s.votes.count)
    end
  end
end
