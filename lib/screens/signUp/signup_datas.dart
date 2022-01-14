List<String> names = [];
List<String> phoneNumber = [];
List<List> validateaccounts = [];

createAccount() {
  if (names.isNotEmpty && phoneNumber.isNotEmpty) {
    validateaccounts.add(names);
    validateaccounts.add(phoneNumber);
  }
}
