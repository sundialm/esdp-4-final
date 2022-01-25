scp ..\target\demo-0.0.1-SNAPSHOT.jar root@116.203.34.218:/var/lib/demo/demo.jar
ssh root@116.203.34.218 systemctl restart demo.service
pause
