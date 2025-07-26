class AppValidators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!value.contains("@")) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  static String? categoryNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Category name is required";
    }
    return null;
  }

  static String? mealNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Meal name is required";
    }
    return null;
  }

  static String? mealPriceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Meal price is required";
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return "Enter a valid meal price";
    }
    return null;
  }
}
