phonebook="phonebook.txt"

if [ "$#" -ne 2 ]; then
  echo "잘못된 입력입니다. 사용법: $0 이름 전화번호"
  exit 1
fi

name=$1
phone=$2

# 1588-1588 같은 대표 번호도 사용 하려면? -> 지역 번호 의미 없어짐.
if ! [[ $phone =~ ^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$ ]]; then
  echo "잘못된 전화번호 형식입니다. 형식: 0NZ-XXXX-YYYY"
  exit 1
fi

area_code=$(echo $phone | cut -d'-' -f1)

case $area_code 
in
  "010") area_name="휴대폰" ;;
  "02") area_name="서울" ;;
  "031") area_name="경기" ;;
  "032") area_name="인천" ;;
  "033") area_name="강원" ;;
  "041") area_name="충남" ;;
  "042") area_name="대전" ;;
  "043") area_name="충북" ;;
  "044") area_name="세종" ;;
  "051") area_name="부산" ;;
  "052") area_name="울산" ;;
  "053") area_name="대구" ;;
  "054") area_name="경북" ;;
  "055") area_name="경남" ;;
  "061") area_name="전남" ;;
  "062") area_name="광주" ;;
  "063") area_name="전북" ;;
  "064") area_name="제주" ;;
  "070") area_name="인터넷" ;;
  *) echo "알 수 없는 지역 번호입니다."
  exit 1 ;;
esac

# 전화번호 검색
if grep -q "$phone" "$phonebook"; then
  echo "해당 전화번호의 정보를 찾았습니다:"
  grep "$phone" "$phonebook"
else
  # 전화번호부에 없으면 새로운 정보 추가
  echo "$name, $phone, $area_name" >> "$phonebook"
  echo "$name의 정보를 전화번호부에 추가했습니다: $phone ($area_name)"
fi
