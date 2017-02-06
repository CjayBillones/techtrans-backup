module ArticlesHelper

  def subfeatured_articles(subfeatured_articles)
    articles = []

    if !subfeatured_articles.empty?
      subfeatured_articles.each do |a|
        articles.push(Article.find(a.article_id))
      end
    end

    while articles.count != 4
      article = Article.find(rand(1...Article.count+1))
      articles.push(article) if !articles.include?(article)
    end

    return articles
  end

end
