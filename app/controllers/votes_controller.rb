class VotesController < ApplicationController

  def create
    obj_class = params[:object_type].camelize.constantize
    obj = obj_class.find_by_id(params[:object_id])
    vote = obj.votes.build
    vote.user = current_user
      
    respond_to do |format|

      if vote.save
        format.html
        format.json { render :json => obj.reload.votes_count }
      else
        format.html
        format.json { 401 }
      end
    end
  end
end
