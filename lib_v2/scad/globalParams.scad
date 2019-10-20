//base params
gFn 			= 1; 											// $fn parameter
gLengthBase 	= 300; 											// mm
gM				= 8;											// use M8 bars
gbTestInPlace  = false;										// used to test modules in place
gMB				= 4;											// use M4 bolts;		
gPrnRes			= 0.4;											// printer resolution

gEcho			= true;											// to output detail count
gEchoFull		= false;											// to output datail full info

//additional params
gLengthBaseX 	= gLengthBase;
gLengthBaseY 	= gLengthBase;
gLengthBaseZ 	= gLengthBase;
gM_2			= (gM/2);
gM_4			= (gM/4);
gM2				= (gM*2);
gMB_2			= (gMB/2);

gRBHole 		= (gMB_2+gPrnRes);