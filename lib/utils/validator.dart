String? titleValidator(String? value){
  if(value == null || value.isEmpty) return '값을 입력해주세요';
  return null;
}

String? contentValidator(String? value){
  if(value == null || value.isEmpty) return '값을 입력해주세요';
  return null;
}