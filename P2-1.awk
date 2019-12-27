BEGIN	{ contador=0 }
/pts\/0/	{ cont++; }
END	{	print cont;	}	
#cat procesos.txt | grep pts/0
