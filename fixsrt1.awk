BEGIN			{		FS=" --> ";
					OFS="/"; 
					NTEX=0; 
					NSEC=0;
					NTIEM=0;
					EST=0;	}
					
#1.-Secuencia
/^[0-9]+$/		{		#print $0;
					NSEC++; 
					EST=1;	
			}
#2.-Tiempos
/^[0-9]+:/		{		#print $0;
				 	NTIEM++;	
				 	EST=2;	
				 	print " Anterior en " NR > "/dev/stderr";}	 		

#2.-Tiempos mal formados
#00:00:04,246 --> 00:00:05,167
/^[0-9]+:/ && !/^[0-9][0-9]:[0-9][0-9]:[0-9][0-9],[0-9][0-9][0-9] --> [0-9][0-9]:[0-9][0-9]:[0-9][0-9],[0-9][0-9][0-9]$/ {
					print " Error Tiempo en " NR > "/dev/stderr";
					}
						
#3.-Textos
!/^[0-9]+:/ && !/^[0-9]+$/ && !/^$/	{	
					#print $0; 
					NTEX++;	
					EST=3;	
					print }
#4. Espacios (Separador)
/^$/			{		if(EST==2)
					{
						print "Linea sin texto en " NR > "/dev/stderr";
						print "-\n";
					}
					if(EST==4)
						print "Doble espacio en " NR > "/dev/stderr";
					if( EST==3 ) 
						print
					EST = 4; } 

END 			{		print "Texto nomal: " NTEX > "/dev/stderr";
					print "Secuencias: " NSEC > "/dev/stderr";
					print "Tiempos: " NTIEM > "/dev/stderr";	}
