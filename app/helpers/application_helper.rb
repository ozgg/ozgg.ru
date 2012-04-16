module ApplicationHelper
  def process_entry_body(body)
    '<p>' + body.gsub("\n", '</p><p>') + '</p>'
  end
end
