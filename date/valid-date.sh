# 주워진 월의 앞글자를 소문자로 변환한 후 각각의 월과 비교하여 맞는 형태로 변환
case ${1,,} in
  jan* | 1) month="Jan" ;;
  feb* | 2) month="Feb" ;;
  mar* | 3) month="Mar" ;;
  apr* | 4) month="Apr" ;;
  may* | 5) month="May" ;;
  jun* | 6) month="Jun" ;;
  jul* | 7) month="Jul" ;;
  aug* | 8) month="Aug" ;;
  sep* | 9) month="Sep" ;;
  oct* | 10) month="Oct" ;;
  nov* | 11) month="Nov" ;;
  dec* | 12) month="Dec" ;;
  *) month="not exist" ;;
esac

# 입력값 확인
if [ "$#" -ne 3 ]; then
  echo "입력값 오류"
  exit 1
fi

if [ "$month" == "not exist"]; then
echo "존재하지 않은 달: ${1}는 존재하지 않는다"
  exit 1
fi

if ! [[ "$2" =~ ^[0-9]+$ ]] || ! [[ "$3" =~ ^[0-9]+$ ]]; then
  echo "존재하지 않은 날짜: ${1} ${2} ${3}는 존재하지 않는다"
  exit 1
fi

# 윤년인지 
year=$3
if (( year % 4 != 0 )); then
  flag=0
elif (( year % 400 == 0 )); then
  flag=1
elif (( year % 100 == 0 )); then
  flag=0
else
  flag=1
fi 

# 월 일수의 정의
case $month in
  "Jan" | "Mar" | "May" | "Jul" | "Aug" | "Oct" | "Dec") days_in_month=31 ;;
  "Apr" | "Jun" | "Sep" | "Nov") days_in_month=30 ;;
  "Feb")
    if [ $flag -eq 1 ]; then
      days_in_month=29
    else
      days_in_month=28
    fi
    ;;
  *) 
    echo "존재하지 않은 달"
    exit 1
    ;;
esac

date=$2
echo "${month^} $date $year"