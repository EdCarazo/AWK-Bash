BEGIN	{ mayor=0 }
NR>1	{  
		if( $2 > mayor )
		{
			mayor=$2;
			#print mayor;
		}		
	}
END	{	print mayor;	}	
#cat procesos.txt | grep pts/0
