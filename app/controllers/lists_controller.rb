class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end
  
  # 保存機能の作成
  def create
    # 1&2.データを受け取り、新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3.データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4.トップ画面へのリダイレクト
    redirect_to list_path(list.id)
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
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  # ストロングパラメータ
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
