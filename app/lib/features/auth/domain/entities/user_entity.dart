class UserEntity {
  final String id;
  final String fullname;
  final String email;
  final String token; 

  const UserEntity({
    required this.id,
    required this.fullname,
    required this.email,
    required this.token,
  });
}