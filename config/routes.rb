Blogit::Engine.routes.draw do

  # Keep these above the posts resources block
  get "/page/:page" => "posts#index"
  get "/tagged/:tag" => 'posts#tagged', as: :tagged_blog_posts

  resources :posts, :path => "/" do
    resources :comments, only: [:create, :destroy]
  end

  get "/" => "posts#index", as: :blog_root
end
