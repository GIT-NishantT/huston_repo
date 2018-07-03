[di6116@v-dev-mgt-yum-1 ~]$ cat /opt/new_alerting.sh
echo > /opt/topline_server_summary
echo -e "Hi Unix Team," >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary
echo -e "PF LINUX SYSTEM REPORT for Date# `date +%b-%d-%Y`" >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary
echo Date# `date +%b-%d-%Y`"     "Time# `date +%r` >>  /opt/topline_server_summary
echo -e "=====================================================" >> /opt/topline_server_summary
echo -e "               Linux Server List (uptime < 1 day)             " >> /opt/topline_server_summary
#echo -e "[S.No] [Interface] [IP Address] [hostname] [ uptime ]         " >> /opt/topline_server_summary
echo -e "[S.No] [IP Address] [hostname] [ uptime ]         " >> /opt/topline_server_summary
#echo -e "=====================================================" >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary

c=0 ; b=1 ; for i in `cat /opt/new_alerting_hnmelist` ; do a=`ping -c 2 $i | grep time= | wc -l` ;if [ "$a" == "2" ] ;then c="UP" ; else c="Not Reachable" ; fi ; echo -e "<Linux>" "$b." "$i" " ($c)" |egrep "Not Reachable" ;b=`expr $b + 1`;done >>  /opt/topline_server_summary

echo -e >> /opt/topline_server_summary
echo -e "=====================================================" >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary
#clear; b=1;for i in `cat /opt/uniqservlist_S_test` ; do echo -e "$b."     " `ssh -q -o ConnectTimeout=60 $i ifconfig | awk '{print $1}' | grep eth` " "$i" `ssh -q -o ConnectTimeout=60 $i hostname` "\t" "   "`ssh -q -o ConnectTimeout=60 $i uptime |cut -c 11-21`| egrep -v days |grep eth ; b=`expr $b + 1` ;done >>  /opt/topline_server_summary

#clear; b=1;for i in `cat /opt/uniqservlist_S_test` ; do echo -e "$b."     "$i" `ssh -q -o ConnectTimeout=60 $i hostname` "\t" "   "`ssh -q -o ConnectTimeout=60 $i uptime |cut -c 11-21`| egrep -v days |grep eth ; b=`expr $b + 1` ;done >>  /opt/topline_server_summary

#clear; b=1;for i in `cat /opt/uniqservlist_S_test` ; do echo -e "$b.  "  "$i" `ssh -q $i hostname` "\t" `ssh -q $i uptime |cut -c 11-21`|egrep -v "days" ; b=`expr $b + 1` ;done >>  /opt/topline_server_summary

#clear; b=1;for i in `cat` ; do echo -e "$b." "$i" `ssh -q $i hostname` "   "`ssh -q $i uptime |cut -c 11-21`|egrep -v days |grep eth ; b=`expr $b + 1` ;done >>  /opt/topline_server_summary

 clear; b=1;for i in `cat /opt/new_alerting_hnmelist` ; do echo -e "$b." "$i" `ssh -q $i hostname` "   "`ssh -q $i uptime |cut -c 11-21`|egrep -vw "days"  ; b=`expr $b + 1` ;done >>  /opt/topline_server_summary


echo -e "=====================================================" >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary
echo -e "=====================================================" >> /opt/topline_server_summary
#echo -e "    TOP ALERTS (Linux Server FileSystem Use% > 80%)  " >> /opt/topline_server_summary
echo -e "    TOP ALERTS (Linux Server FileSystem Use% >= 90%)  " >> /opt/topline_server_summary
#echo -e "=====================================================" >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary
#b=1;for i in `cat /opt/uniqservlist_S_test` ; do echo -e "$b." "  " "$i""*""`ssh -q -o ConnectTimeout=60 $i hostname`#  "`ssh -q -o ConnectTimeout=60 $i df -h | awk '{if ($5==""){flag =1;} else if (flag==1){flag=0;print "("$4,$5")"} else { print "("$5,$6 ")" }}'| sed "1d"|egrep "80%|81%|82%|83%|84%|85%|86%|87%|88%|89%|90%|91%|92%|93%|94%|95%|96%|97%|98%|99%|100%" `| egrep %  ;b=`expr $b + 1`; done >> /opt/topline_server_summary

b=1;for i in `cat /opt/new_alerting_hnmelist` ; do echo -e "$b." "  " "$i""*""`ssh -q -o ConnectTimeout=60 $i hostname`#  "`ssh -q -o ConnectTimeout=60 $i df -h | awk '{if ($5==""){flag =1;} else if (flag==1){flag=0;print "("$4,$5")"} else { print "("$5,$6 ")" }}'| sed "1d"|egrep "90%|91%|92%|93%|94%|95%|96%|97%|98%|99%|100%" `| egrep %  ;b=`expr $b + 1`; done >> /opt/topline_server_summary

echo -e "=====================================================" >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary

echo -e "=====================================================" >> /opt/topline_server_summary
#echo -e "    TOP ALERTS (Linux Server CPU/MEM Use% > 80%)  " >> /opt/topline_server_summary
echo -e "    TOP ALERTS (Linux Server CPU/MEM Use% >= 90%)  " >> /opt/topline_server_summary
#echo -e "=====================================================" >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary
echo -e "[S.No] [IP Address] [hostname] [  MEM & CPU used %  ]  " >> /opt/topline_server_summary


#b=1 ; for i in `cat /opt/uniqservlist_S_test` ; do echo -e "$b."     "" "$i"*"`ssh -q -o ConnectTimeout=60 $i hostname`""#" "  ["`ssh -q -o ConnectTimeout=60 $i free | grep Mem | awk '{ printf("Mem_used: %.2f%\n", $3/$2 * 100.0)}'`"]" "  [CPU_used: "`ssh -q -o ConnectTimeout=60 $i top -bn1 | egrep Cpu|  awk '{print $5}'| tr -d %id,| awk '{ print(100-$1)}'`"%""]""\t" | egrep "used: 99.|used: 98.|used: 98.|used: 97.| used: 96.| used: 95.| used: 94.| used: 93.| used: 92.| used: 91.| used: 90.|used: 89.|used: 88.|used: 87.| used: 86.| used: 85.| used: 84.| used: 83.| used: 82.| used: 81.| used: 80." ; b=`expr $b + 1`;done >> /opt/topline_server_summary

b=1 ; for i in `cat /opt/new_alerting_hnmelist` ; do echo -e "$b."     "" "$i"*"`ssh -q -o ConnectTimeout=60 $i hostname`""#" "  ["`ssh -q -o ConnectTimeout=60 $i free | grep Mem | awk '{ printf("Mem_used: %.2f%\n", $3/$2 * 100.0)}'`"]" "  [CPU_used: "`ssh -q -o ConnectTimeout=60 $i top -bn1 | egrep Cpu|  awk '{print $5}'| tr -d %id,| awk '{ print(100-$1)}'`"%""]""\t" | egrep "used: 99.|used: 98.|used: 98.|used: 97.| used: 96.| used: 95.| used: 94.| used: 93.| used: 92.| used: 91.| used: 90." ; b=`expr $b + 1`;done >> /opt/topline_server_summary
echo -e "=====================================================" >> /opt/topline_server_summary

echo -e >> /opt/topline_server_summary
#echo -e "=====================================================" >> /opt/topline_server_summary
#echo -e "         Linux Server (pts|tty-Details)              " >> /opt/topline_server_summary
#echo -e "[S.No] [IP Address] [hostname] [ pts|tty-Details ]         " >> /opt/topline_server_summary
#echo -e "=====================================================" >> /opt/topline_server_summary
#echo -e >> /opt/topline_server_summary
#b=1;for i in `cat /opt/uniqservlist_S_test` ; do echo -e  "$b." ""$i"*"`ssh -q -o ConnectTimeout=60 $i hostname`"# "`ssh -q -o ConnectTimeout=60 $i who`| egrep "pts|tty" | egrep -v "bansalp|guptab|shaikt|reddym|kumarr|loganav|kumara|tyagip|kotians|ghosha" | grep -vw "10.66.144.102" ; b=`expr $b + 1`; done >> /opt/topline_server_summary
#echo -e >> /opt/topline_server_summary
#echo -e "=====================================================" >> /opt/topline_server_summary


#echo -e >> /opt/topline_server_summary
#echo -e "=====================================================" >> /opt/topline_server_summary
#echo -e "             AIX NOT-Reachable Device Detail                     " >> /opt/topline_server_summary
#echo -e "[S.No] [ hostname ] [IP Address] [Serial Number] [Server Status] " >> /opt/topline_server_summary
#echo -e "=====================================================" >> /opt/topline_server_summary
#echo -e >> /opt/topline_server_summary
# c=0 ; b=1 ; for i in `cat /opt/uniqservlist_S_AIX |cut -d: -f1` ; do a=`ping -c 2 $i | grep time= | wc -l` ; u=`cat /opt/uniqservlist_S_AIX | egrep -w $i | cut -d: -f2`;y=`cat /opt/uniqservlist_S_AIX | egrep -w $i | cut -d: -f3`;if [ "$a" == "2" ] ;then c="UP" ; else c="Not Reachable" ; fi ; echo -e "$b." " ""$u" "  [""$i""]" " " $y "   (""$c"")" | egrep "Not Reachable"  ;b=`expr $b + 1`;done >>  /opt/topline_server_summary
#echo -e "=====================================================" >> /opt/topline_server_summary
#echo -e >> /opt/topline_server_summary

echo -e >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary
echo -e "=====================================================" >> /opt/topline_server_summary

echo -e >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary


echo -e "Thanks & Regards," >> /opt/topline_server_summary
echo -e >> /opt/topline_server_summary
#mailx -s "ABSTRACT INVENTORY_`date +%b-%d-%Y`" amit.k.ghosh@axaltacs.com ashok.kumar@axaltacs.com bharat.gupta@axaltacs.com loganathan.velusamy@axaltacs.com maheshwar.r.gade@axaltacs.com pbansal@axaltacs.com  punit.kumar@axaltacs.com ravi.maidam@axaltacs.com sandeep.kotian@axaltacs.com tshaik@axaltacs.com < /opt/topline_server_summary
#mailx -s "summary"  bharat.gupta@axaltacs.com  < /opt/topline_server_summary
echo > /opt/hist500.rtf
echo "***********************************************"> /opt/hist500.rtf
echo "`hostname` "  " `date` ">> /opt/hist500.rtf
echo "***********************************************">> /opt/hist500.rtf
#cat /root/.bash_history | tail -500 |grep -v "#" >> /opt/hist500.rtf
tac /root/.bash_history | head -500 |grep -v "#" >> /opt/hist500.rtf
echo "**********************END**********************">> /opt/hist500.rtf
#mailx  -a /opt/hist500.rtf -s "ABSTRACT INVENTORY_`date +%b-%d-%Y`" amit.k.ghosh@axaltacs.com ashok.kumar@axaltacs.com  lalit.kumar02@axaltacs.com maheshwar.r.gade@axaltacs.com pbansal@axaltacs.com  ravi.maidam@axaltacs.com sandeep.kotian@axaltacs.com tshaik@axaltacs.com < /opt/topline_server_summary
mailx  -r noreply@axaltacs.com -s "LINUX_SYSTEM_REPORT_`date +%b-%d-%Y`" narender.singh@axaltacs.com     sarvar.husain@axaltacs.com      nishant.k.tamta@axaltacs.com    kumar.gaurav@axaltacs.com       puneet.singhal@axaltacs.com      sandeep.kotian@axaltacs.com    < /opt/topline_server_summary
echo > /opt/hist500.rtf

