module ApplicationHelper
  def bootstrap_flash_class(flash_type)
    map = {
      notice: 'info',
      success: 'success',
      error: 'danger',
      alert: 'warning',
    }
    "alert alert-#{map[flash_type.to_sym]}"
  end
end
