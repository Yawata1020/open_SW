#입력값 예시: ./valid-date.sh may 27 2024


#인수가 3개가 아닐 경우
if [ $# -ne 3 ]
then 
  echo "입력값 오류"
  exit 1
fi

#입력값 받기
month=$1
day=$2
year=$3

#월을 대문자로 변경
#패턴 매칭으로 인해 오류도 정답으로 처리됨. May* 등으로 입력시
#mays -> May..
case $1
in
  january|jan|1) month="Jan" ;; 
  february|feb|2) month="Feb" ;;
  march|mar|3) month="Mar" ;;
  april|apr|4) month="Apr" ;;
  may|5) month="May" ;;
  june|jun|6) month="Jun" ;;
  july|jul|7) month="Jul" ;;
  august|aug|8) month="Aug" ;;
  september|sep|9) month="Sep" ;;
  october|oct|10) month="Oct" ;;
  november|nov|11) month="Nov" ;;
  december|dec|12) month="Dec" ;;
  *) echo "이유 : {$1}는 유효하지 않습니다"
  exit 1 ;;
esac

#윤년 판별
leap=0 #윤년이 아님을 기본값으로 설정

if [ $((year % 4)) -eq 0 ] 
then
  if [ $((year % 100)) -eq 0 ]
  then
    if [ $((year % 400)) -eq 0 ]
    then
      leap=1
    fi
  else
    leap=1
  fi
fi

#일이 29일인지 확인

case $month 
in
"Jan" | "Mar" | "May" | "Jul" | "Aug" | "Oct" | "Dec") max_day=31 ;;
"Apr" | "Jun" | "Sep" | "Nov") max_day=30 ;;
"Feb")
  if [ $leap -eq 1 ]
  then
    max_day=29
  else
    max_day=28
  fi
  ;;
esac

#일이 유효한지 확인
#일이 0과 같거나 작으면 다음으로, 일이 max_day보다 크면 다음으로
if [ "$day" -le 0 ] || [ "$day" -gt "$max_day" ]
then
  echo "이유 : ${year} ${month} ${day}는 유효하지 않습니다"
  exit 1
else
  echo "${month} ${day} ${year}"
fi