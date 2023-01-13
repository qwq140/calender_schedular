String? timeValidator(String? value) {
  if(value == null) return '값을 입력해주세요';

  int? number;

  try {
    number = int.parse(value);
  } catch(e){
    return '숫자를 입력해주세요';
  }

  if(number < 0 || number > 24) return '0시부터 24시 사이를 입력해주세요';
  return null;
}

String? contentValidator(String? value){
  if(value == null || value.isEmpty) return '값을 입력해주세요';
  return null;
}