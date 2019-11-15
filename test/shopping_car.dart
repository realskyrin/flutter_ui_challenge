class Meta {
  double price;
  String name;

  Meta(this.name, this.price);
}

// 定义商品 Item 类
class Item extends Meta {
  Item(name, price) : super(name, price);

  // 重载了 + 运算符
  Item operator +(Item item) => Item(name+ '、' + item.name, price + item.price);
}

// 定义购物车类
class ShoppingCart extends Meta with PrintHelper {
  DateTime date;
  String code;
  List<Item> bookings;

  double get price =>
      bookings?.reduce((value, element) => value + element)?.price ?? 0;

  String get product =>
      bookings?.reduce((value, element) => value + element)?.name ?? "";

  int get count => bookings?.length ?? 0;

  ShoppingCart.withCode({name, this.code})
      : date = DateTime.now(),
        super(name, 0);

  ShoppingCart({name}) : this.withCode(name: name, code: null);

  getInfo() => '''
  购物车信息:
  -----------------------------
  用户名: $name
  优惠码: ${code ?? " 没有 "}
  商品: [$product]
  商品数: $count
  总价: $price
  Date: $date
  -----------------------------
  ''';
}

abstract class PrintHelper {
  printInfo() => print(getInfo());

  getInfo();
}

void main() {
  ShoppingCart.withCode(name: 'zhangsan', code: '123123')
    ..bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)]
    ..printInfo();

  ShoppingCart.withCode()
    ..bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)]
    ..printInfo();

  ShoppingCart.withCode()
//    ..bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)]
    ..printInfo();
}
