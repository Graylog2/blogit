Blogit::Engine.routes.draw do

  # Keep these above the posts resources block
  get "/blog/page/:page" => "posts#index"
  get "/blog/tagged/:tag" => 'posts#tagged', as: :tagged_blog_posts

  resources :posts, :path => "blog" do
    resources :comments, only: [:create, :destroy]
  end

  get "/" => "posts#index", as: :blog_root
end
