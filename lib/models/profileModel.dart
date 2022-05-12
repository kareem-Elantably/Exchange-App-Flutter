
class profile_model{
  final String Name;
  final String Phone;
  final String id;
  final String email;
  
  profile_model(this.Name, this.Phone, this.id, this.email);
  
  Map<String, dynamic> toJson() => {
        'name': Name,
        'phone': Phone,
        'id': id,
        'Email' : email,
      };

  static profile_model fromJson(Map<String, dynamic> json) => profile_model(
    json['name'],
    json['phone'],
    json['id'],
    json['Email']

  );
}
