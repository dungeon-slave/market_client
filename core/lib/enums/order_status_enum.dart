enum OrderStatus {
  accepted('Accepted'),///When system receives order from buyer
  ready('Ready'),///When order is ready but not received by buyer
  canceled('Canceled'),///When its cancelled for any reason
  completed('Completed');///When order is received by buyer

  final String value;

  const OrderStatus(this.value);
}
