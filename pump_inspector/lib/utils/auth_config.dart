/// Credenciales fijas del login (sin backend todavía).
///
/// TEMPORAL: cuando construyamos el superadmin real (cuentas por cliente,
/// gestión de usuarios), esto se reemplaza por una verificación contra una
/// base de datos/backend. Por ahora, cámbialas aquí si necesitas otro
/// usuario/contraseña.
class AuthConfig {
  AuthConfig._();

  static const String username = 'petrov';
  static const String password = 'petrov2026';
}
