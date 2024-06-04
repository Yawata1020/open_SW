PHONEBOOK="phonebook.txt"

if [ "$#" -ne 2 ]; then
  echo "잘못된 입력입니다. 사용법: $0 이름 전화번호"
  exit 1
fi

NAME=$1
PHONE=$2

if ! [[ $PHONE =~ ^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$ ]]; then
  echo "잘못된 전화번호 형식입니다. 형식: 0NZ-XXXX-YYYY"
  exit 1
fi

AREA_CODE=$(echo $PHONE | cut -d'-' -f1)

case $AREA_CODE 
in
  "010") AREA_NAME="휴대폰" ;;
  "02") AREA_NAME="서울" ;;
  "031") AREA_NAME="경기" ;;
  "032") AREA_NAME="인천" ;;
  "033") AREA_NAME="강원" ;;
  "041") AREA_NAME="충남" ;;
  "042") AREA_NAME="대전" ;;
  "043") AREA_NAME="충북" ;;
  "044") AREA_NAME="세종" ;;
  "051") AREA_NAME="부산" ;;
  "052") AREA_NAME="울산" ;;
  "053") AREA_NAME="대구" ;;
  "054") AREA_NAME="경북" ;;
  "055") AREA_NAME="경남" ;;
  "061") AREA_NAME="전남" ;;
  "062") AREA_NAME="광주" ;;
  "063") AREA_NAME="전북" ;;
  "064") AREA_NAME="제주" ;;
  "070") AREA_NAME="인터넷" ;;
  *) echo "알 수 없는 지역 번호입니다."
  exit 1 ;;
esac

# 전화번호 검색
if grep -q "$PHONE" "$PHONEBOOK"; then
  echo "해당 전화번호의 정보를 찾았습니다:"
  grep "$PHONE" "$PHONEBOOK"
else
  # 전화번호부에 없으면 새로운 정보 추가
  echo "$NAME, $PHONE, $AREA_NAME" >> "$PHONEBOOK"
  echo "$NAME의 정보를 전화번호부에 추가했습니다: $PHONE ($AREA_NAME)"
fi

# 이름이 동일한 사람 번호가 다를 때 -> 인수 2개 받으면 전화번호 추가
# 전화번호 검색 시, 이름으로만 검색 불가능.