NR>1		{	if( !($3 in ppid) )
				ppid[$3]=1;
		}
END		{
			for(x in ppid)
			{
				print x;
				#print usu[x];
			}
		}
