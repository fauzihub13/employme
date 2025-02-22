extension CurrencyFormatter on int {
  String toDollarCurrency() {
    return '\$${toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}';
  }
}
