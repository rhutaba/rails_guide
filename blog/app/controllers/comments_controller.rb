class CommentsController < ApplicationController

  # 削除機能は認証済みユーザーだけ使えるように制限する
  http_basic_authenticate_with name: "dhh", password: "secret", pnly: :destroy

  # 記事の作成
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  # コメント削除
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  # コメント本文のチェック
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
