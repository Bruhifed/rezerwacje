class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Udostępnia metody w widokach
  helper_method :current_user, :logged_in?

  # Zwraca obecnie zalogowanego użytkownika (jeśli istnieje)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Sprawdza, czy użytkownik jest zalogowany
  def logged_in?
    current_user.present?
  end

  # Wymaga zalogowania użytkownika przed dostępem do określonych stron
  def require_login
    unless logged_in?
      flash[:alert] = "Musisz być zalogowany aby mieć dostęp do tej sekcji"
      redirect_to login_path
    end
  end

  # Wylogowuje użytkownika
  def log_out
    session[:user_id] = nil
    @current_user = nil
  end
end
