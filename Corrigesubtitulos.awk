BEGIN			{		FS=" --> ";
					OFS="/"; 
					NTEX=0; 
					NSEC=0;
					NTIEM=0;
					EST=0;	}
					
#1.-Secuencia
/^[0-9]+$/		{		#print $0;
					NSEC++; 
					EST=1;	}
#2.-Tiempos
/^[0-9]+:/		{		#print $0;
				 	NTIEM++;	
				 	EST=2;	}	 		

#2.-Tiempos mal formados
#00:00:04,246 --> 00:00:05,167
/^[0-9]+:/ && !/^[0-9][0-9]:[0-9][0-9]:[0-9][0-9],[0-9][0-9][0-9] --> [0-9][0-9]:[0-9][0-9]:[0-9][0-9],[0-9][0-9][0-9]$/ {
					print "ok " NR;
					}
						
#3.-Textos
!/^[0-9]+:/ && !/^[0-9]+$/ && !/^$/	{	
					#print $0; 
					NTEX++;	
					EST=3;	}
#4. Espacios (Separador)
/^$/			{	
					if( EST==2 ) 
						print "Error en " NR;
						EST = 4;
				
				} 

END 			{		print "Texto nomal: " NTEX;
					print "Secuencias: " NSEC;
					print "Tiempos: " NTIEM;
						}
