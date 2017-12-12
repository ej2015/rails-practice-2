class BasePresenter
  attr_reader :view, :obj

  def initialize(obj, view)
    view.class_eval { include Haml::Helpers }
    view.init_haml_helpers
    @view = view
    @obj = obj
  end

end
