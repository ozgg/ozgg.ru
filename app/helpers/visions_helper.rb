module VisionsHelper
  def vision_body(vision)
    "<p>#{vision.gsub("\n", "</p><p>")}</p>"
  end
end
