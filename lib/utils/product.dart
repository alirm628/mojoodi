class product {
  String _id;
  String _name;
  String _code;
  String _amount;

  get id => _id;

  set id(value) => _id = value;

  get name => _name;

  set name(value) => _name = value;

  get code => _code;

  set code(value) => _code = value;

  get amount => _amount;

  set amount(value) => _amount = value;

  product(this._id, this._name, this._code, this._amount);
}
