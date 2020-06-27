class UserModel {
  String nome;
  int idade;
  double altura;
  double peso;

  UserModel({this.nome, this.idade, this.altura, this.peso});

  UserModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    idade = json['idade'];
    altura = json['altura'];
    peso = json['peso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    data['altura'] = this.altura;
    data['peso'] = this.peso;
    return data;
  }
}
