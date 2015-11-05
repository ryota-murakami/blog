class CommentMailer < ApplicationMailer
  def comment_email(post, comment)
    @title = post.title
    @commenter = comment.commenter
    @body = comment.body

    mail to: "dolce1048@i.softbank.jp", subject: @title + " にコメントだよ！！"
  end
end
