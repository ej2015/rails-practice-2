class PostPresenter < BasePresenter

  def body 
    view.simple_format obj.body
  end

  def obj_id
    obj.id
  end

  def title
    view.t obj.title,  scope: "posts.index"
  end

  def category
    view.t obj.category,  scope: "posts.index"
  end

end
