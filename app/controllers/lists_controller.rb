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
    redirect_to "/top"
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
