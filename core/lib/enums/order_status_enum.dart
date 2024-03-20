enum OrderStatus {
  accepted('Accepted'),///When system receives order from buyer
  completed('Completed'),///When order is completed but not received by buyer
  cancelled('Cancelled'),///When its cancelled for any reason
  received('Received');///When order is received by buyer

  final String value;

  const OrderStatus(this.value);
}
