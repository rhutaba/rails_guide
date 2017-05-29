class ArticlesController < ApplicationController
  # indexとshowページは認証済みユーザーのみ使えるように制限する
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  # インデックスページ
  def index
    @articles = Article.all
  end

  # ブログ記事の新規作成
  def new
    @article = Article.new
  end

  # ブログ記事の各参照
  def show
    @article = Article.find(params[:id])
  end

  # ブログ記事の作成
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # ブログ記事の編集
  def edit
    @article = Article.find(params[:id])
  end

  # ブログ記事の更新
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # ブログ記事の削除
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  # ブログ記事の内容チェック
  def article_params
    params.require(:article).permit(:title, :text)

  end
end
