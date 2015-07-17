function build
	if [ "$FTPDelivery" = "" ]
		echo "FTPDelivery not set.  If you to deploy the deliverables then set this to point to your FTP server"
	end
	set -x JobIdentifier (uuidgen)
	echo "JobId $JobIdentifier was assigned to this build"
	bash -c "source /opt/rh/devtoolset-2/enable ; make JobIdentifier=$JobIdentifier FTPDelivery=$FTPDelivery deliver"
end
