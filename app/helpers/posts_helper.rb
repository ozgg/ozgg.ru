module PostsHelper
  def preview_post(body, limit)
    preview   = ''
    processed = 0
    parts     = body.split("\n")
    parts.each do |row|
      preview   += "<p>#{row}</p>"
      processed += 1
      break if processed >= limit
    end

    preview += '<p>&#0133;</p>' if processed < parts.length

    preview
  end
end
