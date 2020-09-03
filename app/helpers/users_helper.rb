module UsersHelper
  def gravatar_for user, options = {size: Settings.gravartar.size_default}
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    size = options[:size]
    gravatar_url = "#{Settings.links.gravatar.secure}#{gravatar_id}"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end
end
