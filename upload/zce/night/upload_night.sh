#!/bin/bash
DAY_NIGHT=night

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
	# 910017
	echo "-------------------explorer: begin proc 910017"
	ssh -p 8012								u910019@1.193.38.91 'rm /home/u910019/trade/zce_night17/x-zce/*night.so'
	ssh -p 8012								u910019@1.193.38.91 'rm /home/u910019/trade/zce_night17/x-zce/st*.txt'
	ssh -p 8012								u910019@1.193.38.91 'rm /home/u910019/trade/zce_night17/x-zce/tools/st*.txt'
	scp -Cp -P 8012 ./lib/packaged/st*night.so	u910019@1.193.38.91:/home/u910019/trade/zce_night17/x-zce/
	scp -Cp -P 8012 ./ev/st.txt					u910019@1.193.38.91:/home/u910019/trade/zce_night17/x-zce/
	scp -Cp -P 8012 ./ev/st.txt					u910019@1.193.38.91:/home/u910019/trade/zce_night17/x-zce/tools/
	scp -Cp -P 8012 ./17/*.csv					u910019@1.193.38.91:/home/u910019/trade/zce_night17/x-zce/
	scp -Cp -P 8012 ./17/*.csv					u910019@1.193.38.91:/home/u910019/trade/zce_night17/x-zce/tools/
	ssh -C -p 8012								u910019@1.193.38.91 'rm /home/u910019/trade/zce_night17/x-zce/tools/*.log'
	ssh -C -p 8012								u910019@1.193.38.91 '/home/u910019/trade/zce_night17/x-zce/tools/configurator.py'
	scp -Cp -P 8012								u910019@1.193.38.91:/home/u910019/trade/zce_night17/x-zce/tools/configurator.log ./
	cat ./configurator.log
	echo "-------------------explorer: end proc 910017"

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
