module ApplicationHelper

  def has_role?(role)
    current_user && current_user.has_role?(role)
  end

  def markdown_to_html(text)
   Kramdown::Document.new(text, input: "GFM").to_html
  end

  def topic_author(topic)
    user_signed_in? && current_user.id == topic.user_id
  end

  def reply_author(reply)
    user_signed_in? && current_user.id = reply.user_id
  end
end
