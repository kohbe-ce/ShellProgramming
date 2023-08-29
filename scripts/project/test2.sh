#!/bin/bash


# Variable Definition
result=~/scripts/project/test2.txt
> $result

#
# Start Point
#
echo "Program Start!!!"

#
# Target URL
#
URL="https://unipass.customs.go.kr/csp/myc/adddclr/ovgdpbacelctbid/OvgdPbacElctBidMtCtr/retrieveBidPban.do"

#
# YUM jq  library cunfirm
#
jq=`rpm -qa | grep jq`

echo "---------------------------------------------------"
if [ "$jq" = "" ] ; then
    echo "[ No Library ] : Please execute 'yum install epel-release -y'"
else
    echo "[ Exists Library ] : $jq."
fi
echo "---------------------------------------------------"

#
# curl data parsing
#
list_cnt=`curl -k -s "$URL" | jq '.count'`
echo "---------------------------------------------------"
echo "공고 진행중인 공매는 총 $list_cnt 개 입니다."
echo "---------------------------------------------------"


names=`curl -k -s "$URL" | jq ' .items[].pbacCstmSgnNm?'`
# names=`curl -k "$URL" | jq ' .items[] | {pbacCstmSgnNm}'`

echo "$names" >> $result

for i in $(seq $list_cnt)
do
    num=$i
    mess=$(sed -n "$i"p $result)
    echo "$num : $mess"
done

on=no   
while [ "$on" = 'no' ]
do 

echo "---------------------------------------------------"
echo -n "자세한 정보를 위해 해당 번호를 입력하시오.(Exit : x) : "
read choice
echo "---------------------------------------------------"

if [ $choice = "x" ]; then
    echo "[ X ] Stop Program"
    break
else
    echo "선택한 번호가 $choice : $(sed -n "$choice"p $result)이 맞습니까?"
    read confirm
fi

case $confirm in
    yes|y) 
        on=yes 
        curl "https://unipass.customs.go.kr/csp/myc/adddclr/ovgdpbacelctbid/OvgdPbacElctBidMtCtr/retrieveBidPban.do" | jq ".items[$(expr $choice - 1)] | {pbacCstmSgnNm, pbacDgcnt, pbacPbanKcdNm, pbanDt, pbacPbanTtle, inqrTelno, pbacPrgsStNm}"
        ;;
    no|n) 
        on=no ;;
    *) 
        echo "yes or no"
        on=no ;; 
esac
done
