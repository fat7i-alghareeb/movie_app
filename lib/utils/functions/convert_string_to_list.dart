List<String> convertStringToList(String names) {
  return names.split(',').map((name) => name.trim()).toList();
}
