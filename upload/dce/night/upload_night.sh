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
echo -e "\e[41;37m  警告！！！\n 保证不要覆盖服务器端的最新K线文件 \033[0m"
read -p "" confirm

###################
# explore
###############
	# 910028
	echo "-----------explorer: begin proc 910028-----------------------"
	ssh -p 44153							u910019@101.231.3.117 'rm /home/u910019/explorer/night28/x-dce/*night.so'
	ssh -p 44153							u910019@101.231.3.117 'rm /home/u910019/explorer/night28/x-dce/st*.txt'
	ssh -p 44153							u910019@101.231.3.117 'rm /home/u910019/explorer/night28/x-dce/tools/st*.txt'
	scp -Cp -P 44153 ./lib/packaged/st*_night.so		u910019@101.231.3.117:/home/u910019/explorer/night28/x-dce/
	scp -Cp -P 44153 ./ev/st.txt					u910019@101.231.3.117:/home/u910019/explorer/night28/x-dce/
	scp -Cp -P 44153 ./ev/st.txt					u910019@101.231.3.117:/home/u910019/explorer/night28/x-dce/tools/
	scp -Cp -P 44153 ./28/*.csv					u910019@101.231.3.117:/home/u910019/explorer/night28/x-dce/
	scp -Cp -P 44153 ./28/*.csv					u910019@101.231.3.117:/home/u910019/explorer/night28/x-dce/tools/
	ssh -C -p 44153							u910019@101.231.3.117 'rm /home/u910019/explorer/night28/x-dce/tools/*.log'
	ssh -C -p 44153							u910019@101.231.3.117 '/home/u910019/explorer/night28/x-dce/tools/configurator.py'
	scp -Cp -P 44153							u910019@101.231.3.117:/home/u910019/explorer/night28/x-dce/tools/configurator.log ./
	cat ./configurator.log
	echo "-----------explorer: end proc 910028-----------------------"

	# 910100
	echo "-----------explorer: begin proc 910100-----------------------"
	ssh -Cp -p 44153							u910019@101.231.3.117 'rm /home/u910019/explorer/night100/x-dce/*night.so'
	ssh -Cp -p 44153							u910019@101.231.3.117 'rm /home/u910019/explorer/night100/x-dce/st*.txt'
	ssh -Cp -p 44153							u910019@101.231.3.117 'rm /home/u910019/explorer/night100/x-dce/tools/st*.txt'
	scp -Cp -P 44153 ./lib/packaged/st*_night.so		u910019@101.231.3.117:/home/u910019/explorer/night100/x-dce/
	scp -Cp -P 44153 ./ev/st.txt					u910019@101.231.3.117:/home/u910019/explorer/night100/x-dce/
	scp -Cp -P 44153 ./ev/st.txt					u910019@101.231.3.117:/home/u910019/explorer/night100/x-dce/tools/
	scp -Cp -P 44153 ./100/*.csv				u910019@101.231.3.117:/home/u910019/explorer/night100/x-dce/
	scp -Cp -P 44153 ./100/*.csv				u910019@101.231.3.117:/home/u910019/explorer/night100/x-dce/tools/
	ssh -C -p 44153							u910019@101.231.3.117 'rm /home/u910019/explorer/night100/x-dce/tools/*.log'
	ssh -C -p 44153							u910019@101.231.3.117 '/home/u910019/explorer/night100/x-dce/tools/configurator.py'
	scp -Cp -P 44153							u910019@101.231.3.117:/home/u910019/explorer/night100/x-dce/tools/configurator.log ./
	cat ./configurator.log
	echo "-----------explorer: end proc 910100-----------------------"
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
