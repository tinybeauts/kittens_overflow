class VotesController < ApplicationController

  def create
    obj_class = params[:object_type].camelize.constantize
    obj = obj_class.find_by_id(params[:object_id])
    vote = obj.votes.build
    vote.user = current_user
    if vote.save
      render obj.votes.count.to_s
    else
      401
    end
  end
end
