#!/bin/bash
DAY_NIGHT=day

function encrypt_so
{
	rm ./lib/packaged/*.so
	for cur_so in `ls  ./lib/bare/`
	do
		echo "process ${cur_so}"
		tar -czvf - -C ./lib/bare ${cur_so} | openssl des3 -salt -k 617999 -out ./lib/packaged/${cur_so}  
	done

}


function upload_files
{
###################
# explore
###############
	# 910019
	echo "--------------explorer: begin proc 910019-----------------------"
	ssh -p 44163							u910019@101.231.3.117 'rm /home/u910019/trade/day19/x-shfe/*day.so'
	ssh -p 44163							u910019@101.231.3.117 'rm /home/u910019/trade/day19/x-shfe/st*.txt'
	ssh -p 44163							u910019@101.231.3.117 'rm /home/u910019/trade/day19/x-shfe/tools/st*.txt'
	scp -Cp -P 44163 ./lib/packaged/st*_day.so	u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/

	scp -Cp -P 44163 ./ev/st_rbx.txt			u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/
	scp -Cp -P 44163 ./ev/st_rbx.txt			u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/tools/
	scp -Cp -P 44163 ./ev/st.txt				u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/
	scp -Cp -P 44163 ./ev/st.txt				u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/tools/
	scp -Cp -P 44163 ./ev/kline*.txt				u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/st_data/
	scp -Cp -P 44163 ./ev/5xx_ev.txt				u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/ev/
	scp -Cp -P 44163 ./ev/5xx_ev.txt				u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/
	scp -Cp -P 44163 ./ev/5xx_ev.txt				u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/tools/

	scp -Cp -P 44163 ./19/*.csv					u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/
	scp -Cp -P 44163 ./19/*.csv					u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/tools/
	ssh -C -p 44163							u910019@101.231.3.117 'rm /home/u910019/trade/day19/x-shfe/tools/*.log'
	ssh -C -p 44163						   	   u910019@101.231.3.117 '/home/u910019/trade/day19/x-shfe/tools/configurator.py'
	scp -Cp -P 44163						    u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/tools/configurator.log ./
	cat ./configurator.log
	echo "--------------explorer: end proc 910019-----------------------"

	# 910063
	echo "-------------explorer: begin proc 910063--------------"
	ssh -p 44163								u910019@101.231.3.117 'rm /home/u910019/trade/day63/x-shfe/*day.so'
	ssh -p 44163								u910019@101.231.3.117 'rm /home/u910019/trade/day63/x-shfe/st*.txt'
	ssh -p 44163								u910019@101.231.3.117 'rm /home/u910019/trade/day63/x-shfe/tools/st*.txt'
	scp -Cp -P 44163 ./lib/packaged/st*_day.so		u910019@101.231.3.117:/home/u910019/trade/day63/x-shfe/
	scp -Cp -P 44163 ./ev/st.txt					u910019@101.231.3.117:/home/u910019/trade/day63/x-shfe/
	scp -Cp -P 44163 ./ev/st.txt					u910019@101.231.3.117:/home/u910019/trade/day63/x-shfe/tools/
	scp -Cp -P 44163 ./ev/st_rbx.txt				u910019@101.231.3.117:/home/u910019/trade/day63/x-shfe/
	scp -Cp -P 44163 ./ev/st_rbx.txt				u910019@101.231.3.117:/home/u910019/trade/day63/x-shfe/tools/
	scp -Cp -P 44163 ./63/*.csv						u910019@101.231.3.117:/home/u910019/trade/day63/x-shfe/
	scp -Cp -P 44163 ./63/*.csv						u910019@101.231.3.117:/home/u910019/trade/day63/x-shfe/tools/
	ssh -C -p 44163								u910019@101.231.3.117 'rm /home/u910019/trade/day63/x-shfe/tools/*.log'
	ssh -C -p 44163								   u910019@101.231.3.117 '/home/u910019/trade/day63/x-shfe/tools/configurator.py'
	scp -Cp -P 44163								u910019@101.231.3.117:/home/u910019/trade/day63/x-shfe/tools/configurator.log ./
	cat ./configurator.log
	echo "-------------explorer: end proc 910063--------------"

	# 910109
	echo "-------------explorer: begin proc 910109--------------"
	ssh -p 44163							u910019@101.231.3.117 'rm /home/u910019/trade/day109/x-shfe/*day.so'
	ssh -p 44163							u910019@101.231.3.117 'rm /home/u910019/trade/day109/x-shfe/st*.txt'
	ssh -p 44163							u910019@101.231.3.117 'rm /home/u910019/trade/day109/x-shfe/tools/st*.txt'
	scp -Cp -P 44163 ./lib/packaged/st*_day.so	u910019@101.231.3.117:/home/u910019/trade/day109/x-shfe/
	scp -Cp -P 44163 ./ev/st_rbx.txt			u910019@101.231.3.117:/home/u910019/trade/day109/x-shfe/
	scp -Cp -P 44163 ./ev/st_rbx.txt			u910019@101.231.3.117:/home/u910019/trade/day109/x-shfe/tools/
	scp -Cp -P 44163 ./ev/st.txt	            u910019@101.231.3.117:/home/u910019/trade/day109/x-shfe/
	scp -Cp -P 44163 ./ev/st.txt	            u910019@101.231.3.117:/home/u910019/trade/day109/x-shfe/tools/
	scp -Cp -P 44163 ./109/*.csv				u910019@101.231.3.117:/home/u910019/trade/day109/x-shfe/
	scp -Cp -P 44163 ./109/*.csv				u910019@101.231.3.117:/home/u910019/trade/day109/x-shfe/tools/
	ssh -C -p 44163							u910019@101.231.3.117 'rm /home/u910019/trade/day109/x-shfe/tools/*.log'
	ssh -C -p 44163							   u910019@101.231.3.117 '/home/u910019/trade/day109/x-shfe/tools/configurator.py'
	scp -Cp -P 44163							u910019@101.231.3.117:/home/u910019/trade/day109/x-shfe/tools/configurator.log ./
	cat ./configurator.log
	echo "-------------explorer: end proc 910109--------------"

	# 910111
	echo "-------------explorer: begin proc 910111--------------"
	ssh -p 44163						u910019@101.231.3.117 'rm /home/u910019/trade/day111/x-shfe/*day.so'
	ssh -p 44163						u910019@101.231.3.117 'rm /home/u910019/trade/day111/x-shfe/st*.txt'
	ssh -p 44163						u910019@101.231.3.117 'rm /home/u910019/trade/day111/x-shfe/tools/st*.txt'
	scp -Cp -P 44163 ./lib/packaged/st*_day.so	u910019@101.231.3.117:/home/u910019/trade/day111/x-shfe/
	scp -Cp -P 44163 ./ev/st.txt	u910019@101.231.3.117:/home/u910019/trade/day111/x-shfe/
	scp -Cp -P 44163 ./ev/st.txt	u910019@101.231.3.117:/home/u910019/trade/day111/x-shfe/tools/
	scp -Cp -P 44163 ./111/*.csv			u910019@101.231.3.117:/home/u910019/trade/day111/x-shfe/
	scp -Cp -P 44163 ./111/*.csv			u910019@101.231.3.117:/home/u910019/trade/day111/x-shfe/tools/
	ssh -C -p 44163						u910019@101.231.3.117 'rm /home/u910019/trade/day111/x-shfe/tools/*.log'
	ssh -C -p 44163						u910019@101.231.3.117 '/home/u910019/trade/day111/x-shfe/tools/configurator.py'
	scp -Cp -P 44163						u910019@101.231.3.117:/home/u910019/trade/day111/x-shfe/tools/configurator.log ./
	cat ./configurator.log
	echo "-------------explorer: end proc 910111--------------"

}

###################
# enter working directory
###########################
function  enter_wd
{
	 this_dir=`pwd`
	 dirname $0|grep "^/" >/dev/null
	 if [ $? -eq 0 ];then
			 this_dir=`dirname $0`
	 else
			 dirname $0|grep "^\." >/dev/null
			 retval=$?
			 if [ $retval -eq 0 ];then
					 this_dir=`dirname $0|sed "s#^.#$this_dir#"`
			 else
					 this_dir=`dirname $0|sed "s#^#$this_dir/#"`
			 fi
	 fi

	cd $this_dir
}

enter_wd
encrypt_so
upload_files
