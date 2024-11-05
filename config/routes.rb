Rails.application.routes.draw do
  # 投稿画面設定
  get 'lists/new'
  post "lists" => "lists#create"
  
  # トップページ設定
  get "/top" => "homes#top"
  
  # 一覧ページ設定
  get "lists" => "lists#index"
  
  # 詳細画面表示
  get "lists/:id" => "lists#show", as: "list"
  
  # 編集画面
  get "lists/:id/edit" => "lists#edit", as: "edit_list"
  patch "lsits/:id" => "lists#update", as: "update_list"

  # 削除機能
  delete "lists/:id" => "list#destroy", as: "destroy_list"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end