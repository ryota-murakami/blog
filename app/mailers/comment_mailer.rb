class CommentMailer < ApplicationMailer
  def comment_email(post, comment)
    @title = post.title
    @commenter = comment.commenter
    @body = comment.body

    mail to: "dojce1048@gmail.com", subject: @title + " にコメントだよ！！"
  end
end
