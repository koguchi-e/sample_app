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
  
  get 'lists/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
