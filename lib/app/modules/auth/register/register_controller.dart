import '../../../core/notifiers/default_change_notifier.dart';
import '../../../data/exceptions/auth_exception.dart';
import '../../../data/services/user/i_user_service.dart';

class RegisterController extends DefaultChangeNotifier {
  final IUserService _userService;

  RegisterController({
    required IUserService userService,
  }) : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      final user = await _userService.register(email, password);

      if (user != null) {
        success();
      } else {
        setError('Erro ao registrar usuário.');
      }
    } on AuthException catch (err) {
      setError(err.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
