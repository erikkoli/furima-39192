class CommentChannel < ApplicationCable::Channel
  def subscribed
    @exhibit = Exhibit.find(params[:exhibit_id])
    stream_for @exhibit
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
