# Verify a user is logged in before letting them comment
before "/comments" do
  check_login
end

post '/comments' do
  check_login
  @comment = Comment.new(body: params[:body], commentable_id: params[:commentable_id], commentable_type: params[:commentable_type])
  @comment.commenter_id = current_user.id
  @question = Question.find(params[:question_id])
  @commentable = (@comment.commentable_type.constantize).find(@comment.commentable_id)

  if @commentable.comments << @comment
      if request.xhr?
        erb :_comment_guts, layout: false, locals: {comment: @comment}
      else
        redirect "/questions/#{@question.id}"
      end
  else
    if request.xhr? && logged_in?
      status 422
    elsif request.xhr?
      status 401
    else
      @errors = @comment.errors.full_messages
      erb :"questions/show"
    end
  end
end
