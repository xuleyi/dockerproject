#docker run -d --name lntest myal:testln1&
#gnome-terminal -x python lnclient_dc.py&

bash h1run.sh&
gnome-terminal -x bash -c "bash dcrun.sh; exec bash"&
