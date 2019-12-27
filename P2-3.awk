BEGIN	{ FS = "/" }
!/\[/ && !/\//	{	print $8 "\n" NF }
!/\[/ && /\//	{	print "--"$8 "\n" NF	}
