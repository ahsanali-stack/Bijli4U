class ColorObject{
  final int _red;

  ColorObject(this._red, this._green, this._blue, this._opacity);

  final int _green;
  final int _blue;
  final double _opacity;

  int get red => _red;

  int get green => _green;

  double get opacity => _opacity;

  int get blue => _blue;
}