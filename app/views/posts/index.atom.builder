atom_feed do |feed|
  feed.title("Isotope11 Blog")
  feed.updated(@posts.first.created_at)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, :type => 'html')
      entry.author { |author| author.name(post.user) }
    end
  end
end
