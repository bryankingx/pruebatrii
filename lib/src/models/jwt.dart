class JwtToken {
  String access_token = '';
  String token_type = '';
  String refresh_token = '';
  int expires_in = 0;
  String scope = '';
  int user_id = 0;
  String user_name = '';
  String idTransaction = '';
  String jti = '';

  JwtToken(this.access_token);
  factory JwtToken.fromJson(dynamic json) {
    return JwtToken(json['access_token'] as String);
  }
}
