class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end
  
  # 保存機能(11/6,8章修正)
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  # 一覧ページ設定
  def index
    # Listテーブルに登録されたデータ全てを@インスタンス変数に代入
    @lists = List.all
  end

  # 詳細画面設定
  def show
    # インスタンス変数@list（一個だから単数）に
    # paramsでハッシュを使ってidを見つけ出す
    @list = List.find(params[:id])
  end

  # 編集機能
  def edit
    # Listテーブルからデータを取ってきて、インスタンス変数に格納
    @list = List.find(params[:id])
  end
  
  # 編集機能(更新機能)
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  # 削除機能
  def destroy
    # データ（レコード）を1件取得(変数listに代入)
    list = List.find(params[:id])
    # データ（レコード）を削除（代入したものを削除）
    list.destroy
    # 投稿一覧画面へリダイレクト  
    redirect_to "/lists"
  end

  
  # ストロングパラメータ
  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
