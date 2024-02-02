class UserProfileModel {
  
  final String? email;
  final String? password;
  final String? username;

  UserProfileModel(
      {this.password = '',
      this.email = '',
      this.username = ''});
}
