BEGIN			{		FS=",";
					cad="0\n" "00:00:00,000 --> 00:00:01,000\n" "Corrector aplicado\n"; 
					oldt="000";
					cade="";
					cadena="";
					NTEX=0; 
					NSEC=0;
					NTIEM=0;
					NTIE=0;
					EST=0;	
					band=0;
					error=0;
					error2=0;
					aux="";
					cont=0;
					i=1;}

#si ya esta el corrector que ya no haga nada
/^0$/	{band=1;}
/^00:00:00,000 --> 00:00:01,000$/	{band=2;}
/^Corrector aplicado$/	{	
				if(band==2)
				{
					print "\tYa esta corregido";
					exit(0);
				}
			}

#1.-Secuencia
/^[0-9]+$/	{	#print $0;
			NSEC++; 
			EST=1;	
			sec[i]= $0;
		}

#TIEMPOS
#00:00:06,595 --> 00:00:07,940
/^[0-9]+:/ && /,.+/	{
				dato1[i]= substr ( $2, 1 , 3);
				if(dato1[i] < oldt)
				{
					cade=oldt;
					aux=substr ( anterior, 4 , length(anterior)-1);
					cadc = old "," dato1[i-1] "" aux "," dato1[i];
					error=1;
				}
				old=$1;
				anterior=$2;
				oldt=$3;
				NTIE++;
				EST=2;
				tiem[i]=$0;
				if(error==1)
				{
					tiem[i-1]=cadc;
					error=0;
				}
				cadenita="";
			}

#3 textos
!/^[0-9]+:/ && !/^[0-9]+$/ && !/^$/ {
	NTEX=NTEX+1;
	EST=3;
	cadenita= cadenita $0 "\n";
	}                                                                                                                

#4 Espacios (Separador)
/^$/	{	
		if(EST==2)
		{
			ca="-\n";
			tex[i]=ca;
			i++;		
		}
		if(EST==3)
		{
			tex[i]=cadenita;
			EST=4;
			i++;
		}
	}


END			{	
				if(band==0)
				{
					print cad;
					for(j=1;j<=i;j++)
					{
						print sec[j];
						print tiem[j];
						print tex[j];
					}
				}
			}
