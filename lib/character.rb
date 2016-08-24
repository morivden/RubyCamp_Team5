class Character < Sprite
  private

  def image_path(filename)
    return File.join(File.dirname(__FILE__), "..", "images", filename)
  end
end
