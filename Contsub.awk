BEGIN			{		FS=" --> ";
						OFS="/"; 
						NTEX=0; 
						NSEC=0
						NTIEM=0}

!/^[0-9]+:/ && !/[0-9]+$/ && !/^$/  {	
						#print $0; 
						NTEX++; }

/^[0-9]+$/		{		#print $0 ;
				 		NSEC++ }

/^[0-9]+:/		{		#print $0 ;
				 		NTIEM++ }

END 			{		print "Texto nomal: " NTEX;
						print "Secuencias: " NSEC;
						print "Tiempos: " NTIEM}
