import 'dart:typed_data';

class User {
  int? Id;
  String? Name;
  String? Age;
  String? UserName;
  String? Email;
  String? Address;
  String? Password;
  String? Phone;
  Uint8List? Image;
  String? Study;
  String? Paypal;

  User({
    this.Id,
    this.Name,
    this.Phone,
    this.Email,
    this.Address,
    this.Password,
    this.Paypal,
    this.Image,
    this.Study,
    this.Age,
    this.UserName,
  });

  User.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    Study = json['study'];
    Name = json['name'];
    Age = json['age'];
    Phone = json['phone'];
    Email = json['email'];
    Address = json['address'];
    Password = json['password'];
    Paypal = json['paypal'];
    UserName = json['userName'];
    Image = json['image'] == null
        ? null
        : Uint8List.fromList(List<int>.from(json['image']!));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id ?? 0;
    json['study'] = Study;
    json['age'] = Age == null ? null : Age!;
    json['name'] = Name;
    json['phone'] = Phone == null ? null : Phone!;
    json['email'] = Email;
    json['address'] = Address;
    json['password'] = Password;
    json['userName'] = UserName;
    json['paypal'] = Paypal == null ? null : Paypal!;
    json['image'] = Image == null ? null : Uint8List.fromList(Image!);

    return json;
  }
}
