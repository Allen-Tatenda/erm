import '../enums/profile_roles.dart';

class ProfileUtils {
  static String getRoleName(ProfileRole role) {
    switch (role) {
      case ProfileRole.manager:
        return 'Manager';
      case ProfileRole.user:
        return 'Sales Person';
      case ProfileRole.orgAdmin:
        return 'Organisation Administrator';
      case ProfileRole.sysAdmin:
        return 'System Administrator';
      case ProfileRole.receptionist:
        return 'Receptionist';
    }
  }

  static ProfileRole getUserRole(String roleId) {
    switch (roleId) {
      case 'SYS_ADMIN':
        return ProfileRole.sysAdmin;
      case 'MANAGER':
        return ProfileRole.manager;
      case 'USER':
        return ProfileRole.user;
      case 'RECEPT':
        return ProfileRole.receptionist;
      default:
        return ProfileRole.user;
    }
  }
}
