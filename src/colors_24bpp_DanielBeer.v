/* Atari on an FPGA
Masters of Engineering Project
Cornell University, 2007
Daniel Beer
TIAColorTable.v
Synchronous color lookup table that maps the Atari indexed colors to RGB.
*/
module TIAColorTable(clk, // Clock input
							lum, // 4 bit luminance input
							hue, // 4 bit hue input
							mode, // Mode input (0 = NTSC, 1 = PAL, 2 = SECAM)
							outColor); // 24 bit color output

	input clk;
	input [3:0] lum;
	input [3:0] hue;
	input [1:0] mode;
	output [23:0] outColor;

	// Output register
	reg [23:0] outColor;
	
	// Implicit instantiation of ROM on the FPGA to store the color table
	always @(posedge clk)
	begin
		case ({mode, hue, lum[3:1]})
		// NTSC Colors
		9'd0: outColor = 24'h000000;
		9'd1: outColor = 24'h404040;
		9'd2: outColor = 24'h6C6C6C;
		9'd3: outColor = 24'h909090;
		9'd4: outColor = 24'hB0B0B0;
		9'd5: outColor = 24'hC8C8C8;
		9'd6: outColor = 24'hDCDCDC;
		9'd7: outColor = 24'hECECEC;
		9'd8: outColor = 24'h444400;
		9'd9: outColor = 24'h646410;
		9'd10: outColor = 24'h848424;
		9'd11: outColor = 24'hA0A034;
		9'd12: outColor = 24'hB8B840;
		9'd13: outColor = 24'hD0D050;
		9'd14: outColor = 24'hE8E85C;
		9'd15: outColor = 24'hFCFC68;
		9'd16: outColor = 24'h702800;
		9'd17: outColor = 24'h844414;
		9'd18: outColor = 24'h985C28;
		9'd19: outColor = 24'hAC783C;
		9'd20: outColor = 24'hBC8C4C;
		9'd21: outColor = 24'hCCA05C;
		9'd22: outColor = 24'hDCB468;
		9'd23: outColor = 24'hECC878;
		9'd24: outColor = 24'h841800;
		9'd25: outColor = 24'h983418;
		9'd26: outColor = 24'hAC5030;
		9'd27: outColor = 24'hC06848;
		9'd28: outColor = 24'hD0805C;
		9'd29: outColor = 24'hE09470;
		9'd30: outColor = 24'hECA880;
		9'd31: outColor = 24'hFCBC94;
		9'd32: outColor = 24'h880000;
		9'd33: outColor = 24'h9C2020;
		9'd34: outColor = 24'hB03C3C;
		9'd35: outColor = 24'hC05858;
		9'd36: outColor = 24'hD07070;
		9'd37: outColor = 24'hE08888;
		9'd38: outColor = 24'hECA0A0;
		9'd39: outColor = 24'hFCB4B4;
		9'd40: outColor = 24'h78005C;
		9'd41: outColor = 24'h8C2074;
		9'd42: outColor = 24'hA03C88;
		9'd43: outColor = 24'hB0589C;
		9'd44: outColor = 24'hC070B0;
		9'd45: outColor = 24'hD084C0;
		9'd46: outColor = 24'hDC9CD0;
		9'd47: outColor = 24'hECB0E0;
		9'd48: outColor = 24'h480078;
		9'd49: outColor = 24'h602090;
		9'd50: outColor = 24'h783CA4;
		9'd51: outColor = 24'h8C58B8;
		9'd52: outColor = 24'hA070CC;
		9'd53: outColor = 24'hB484DC;
		9'd54: outColor = 24'hC49CEC;
		9'd55: outColor = 24'hD4B0FC;
		9'd56: outColor = 24'h140084;
		9'd57: outColor = 24'h302098;
		9'd58: outColor = 24'h4C3CAC;
		9'd59: outColor = 24'h6858C0;
		9'd60: outColor = 24'h7C70D0;
		9'd61: outColor = 24'h9488E0;
		9'd62: outColor = 24'hA8A0EC;
		9'd63: outColor = 24'hBCB4FC;
		9'd64: outColor = 24'h000088;
		9'd65: outColor = 24'h1C209C;
		9'd66: outColor = 24'h3840B0;
		9'd67: outColor = 24'h505CC0;
		9'd68: outColor = 24'h6874D0;
		9'd69: outColor = 24'h7C8CE0;
		9'd70: outColor = 24'h90A4EC;
		9'd71: outColor = 24'hA4B8FC;
		9'd72: outColor = 24'h00187C;
		9'd73: outColor = 24'h1C3890;
		9'd74: outColor = 24'h3854A8;
		9'd75: outColor = 24'h5070BC;
		9'd76: outColor = 24'h6888CC;
		9'd77: outColor = 24'h7C9CDC;
		9'd78: outColor = 24'h90B4EC;
		9'd79: outColor = 24'hA4C8FC;
		9'd80: outColor = 24'h002C5C;
		9'd81: outColor = 24'h1C4C78;
		9'd82: outColor = 24'h386890;
		9'd83: outColor = 24'h5084AC;
		9'd84: outColor = 24'h689CC0;
		9'd85: outColor = 24'h7CB4D4;
		9'd86: outColor = 24'h90CCE8;
		9'd87: outColor = 24'hA4E0FC;
		9'd88: outColor = 24'h003C2C;
		9'd89: outColor = 24'h1C5C48;
		9'd90: outColor = 24'h387C64;
		9'd91: outColor = 24'h509C80;
		9'd92: outColor = 24'h68B494;
		9'd93: outColor = 24'h7CD0AC;
		9'd94: outColor = 24'h90E4C0;
		9'd95: outColor = 24'hA4FCD4;
		9'd96: outColor = 24'h003C00;
		9'd97: outColor = 24'h205C20;
		9'd98: outColor = 24'h407C40;
		9'd99: outColor = 24'h5C9C5C;
		9'd100: outColor = 24'h74B474;
		9'd101: outColor = 24'h8CD08C;
		9'd102: outColor = 24'hA4E4A4;
		9'd103: outColor = 24'hB8FCB8;
		9'd104: outColor = 24'h143800;
		9'd105: outColor = 24'h345C1C;
		9'd106: outColor = 24'h507C38;
		9'd107: outColor = 24'h6C9850;
		9'd108: outColor = 24'h84B468;
		9'd109: outColor = 24'h9CCC7C;
		9'd110: outColor = 24'hB4E490;
		9'd111: outColor = 24'hC8FCA4;
		9'd112: outColor = 24'h2C3000;
		9'd113: outColor = 24'h4C501C;
		9'd114: outColor = 24'h687034;
		9'd115: outColor = 24'h848C4C;
		9'd116: outColor = 24'h9CA864;
		9'd117: outColor = 24'hB4C078;
		9'd118: outColor = 24'hCCD488;
		9'd119: outColor = 24'hE0EC9C;
		9'd120: outColor = 24'h442800;
		9'd121: outColor = 24'h644818;
		9'd122: outColor = 24'h846830;
		9'd123: outColor = 24'hA08444;
		9'd124: outColor = 24'hB89C58;
		9'd125: outColor = 24'hD0B46C;
		9'd126: outColor = 24'hE8CC7C;
		9'd127: outColor = 24'hFCE08C;
		// PAL Colors
		9'd128: outColor = 24'h000000;
		9'd129: outColor = 24'h282828;
		9'd130: outColor = 24'h505050;
		9'd131: outColor = 24'h747474;
		9'd132: outColor = 24'h949494;
		9'd133: outColor = 24'hB4B4B4;
		9'd134: outColor = 24'hD0D0D0;
		9'd135: outColor = 24'hECECEC;
		9'd136: outColor = 24'h000000;
		9'd137: outColor = 24'h282828;
		9'd138: outColor = 24'h505050;
		9'd139: outColor = 24'h747474;
		9'd140: outColor = 24'h949494;
		9'd141: outColor = 24'hB4B4B4;
		9'd142: outColor = 24'hD0D0D0;
		9'd143: outColor = 24'hECECEC;
		9'd144: outColor = 24'h805800;
		9'd145: outColor = 24'h947020;
		9'd146: outColor = 24'hA8843C;
		9'd147: outColor = 24'hBC9C58;
		9'd148: outColor = 24'hCCAC70;
		9'd149: outColor = 24'hDCC084;
		9'd150: outColor = 24'hECD09C;
		9'd151: outColor = 24'hFCE0B0;
		9'd152: outColor = 24'h445C00;
		9'd153: outColor = 24'h5C7820;
		9'd154: outColor = 24'h74903C;
		9'd155: outColor = 24'h8CAC58;
		9'd156: outColor = 24'hA0C070;
		9'd157: outColor = 24'hB0D484;
		9'd158: outColor = 24'hC4E89C;
		9'd159: outColor = 24'hD4FCB0;
		9'd160: outColor = 24'h703400;
		9'd161: outColor = 24'h885020;
		9'd162: outColor = 24'hA0683C;
		9'd163: outColor = 24'hB48458;
		9'd164: outColor = 24'hC89870;
		9'd165: outColor = 24'hDCAC84;
		9'd166: outColor = 24'hECC09C;
		9'd167: outColor = 24'hFCD4B0;
		9'd168: outColor = 24'h006414;
		9'd169: outColor = 24'h208034;
		9'd170: outColor = 24'h3C9850;
		9'd171: outColor = 24'h58B06C;
		9'd172: outColor = 24'h70C484;
		9'd173: outColor = 24'h84D89C;
		9'd174: outColor = 24'h9CE8B4;
		9'd175: outColor = 24'hB0FCC8;
		9'd176: outColor = 24'h700014;
		9'd177: outColor = 24'h882034;
		9'd178: outColor = 24'hA03C50;
		9'd179: outColor = 24'hB4586C;
		9'd180: outColor = 24'hC87084;
		9'd181: outColor = 24'hDC849C;
		9'd182: outColor = 24'hEC9CB4;
		9'd183: outColor = 24'hFCB0C8;
		9'd184: outColor = 24'h005C5C;
		9'd185: outColor = 24'h207474;
		9'd186: outColor = 24'h3C8C8C;
		9'd187: outColor = 24'h58A4A4;
		9'd188: outColor = 24'h70B8B8;
		9'd189: outColor = 24'h84C8C8;
		9'd190: outColor = 24'h9CDCDC;
		9'd191: outColor = 24'hB0ECEC;
		9'd192: outColor = 24'h70005C;
		9'd193: outColor = 24'h842074;
		9'd194: outColor = 24'h943C88;
		9'd195: outColor = 24'hA8589C;
		9'd196: outColor = 24'hB470B0;
		9'd197: outColor = 24'hC484C0;
		9'd198: outColor = 24'hD09CD0;
		9'd199: outColor = 24'hE0B0E0;
		9'd200: outColor = 24'h003C70;
		9'd201: outColor = 24'h1C5888;
		9'd202: outColor = 24'h3874A0;
		9'd203: outColor = 24'h508CB4;
		9'd204: outColor = 24'h68A4C8;
		9'd205: outColor = 24'h7CB8DC;
		9'd206: outColor = 24'h90CCEC;
		9'd207: outColor = 24'hA4E0FC;
		9'd208: outColor = 24'h580070;
		9'd209: outColor = 24'h6C2088;
		9'd210: outColor = 24'h803CA0;
		9'd211: outColor = 24'h9458B4;
		9'd212: outColor = 24'hA470C8;
		9'd213: outColor = 24'hB484DC;
		9'd214: outColor = 24'hC49CEC;
		9'd215: outColor = 24'hD4B0FC;
		9'd216: outColor = 24'h002070;
		9'd217: outColor = 24'h1C3C88;
		9'd218: outColor = 24'h3858A0;
		9'd219: outColor = 24'h5074B4;
		9'd220: outColor = 24'h6888C8;
		9'd221: outColor = 24'h7CA0DC;
		9'd222: outColor = 24'h90B4EC;
		9'd223: outColor = 24'hA4C8FC;
		9'd224: outColor = 24'h3C0080;
		9'd225: outColor = 24'h542094;
		9'd226: outColor = 24'h6C3CA8;
		9'd227: outColor = 24'h8058BC;
		9'd228: outColor = 24'h9470CC;
		9'd229: outColor = 24'hA884DC;
		9'd230: outColor = 24'hB89CEC;
		9'd231: outColor = 24'hC8B0FC;
		9'd232: outColor = 24'h000088;
		9'd233: outColor = 24'h20209C;
		9'd234: outColor = 24'h3C3CB0;
		9'd235: outColor = 24'h5858C0;
		9'd236: outColor = 24'h7070D0;
		9'd237: outColor = 24'h8484E0;
		9'd238: outColor = 24'h9C9CEC;
		9'd239: outColor = 24'hB0B0FC;
		9'd240: outColor = 24'h000000;
		9'd241: outColor = 24'h282828;
		9'd242: outColor = 24'h505050;
		9'd243: outColor = 24'h747474;
		9'd244: outColor = 24'h949494;
		9'd245: outColor = 24'hB4B4B4;
		9'd246: outColor = 24'hD0D0D0;
		9'd247: outColor = 24'hECECEC;
		9'd248: outColor = 24'h000000;
		9'd249: outColor = 24'h282828;
		9'd250: outColor = 24'h505050;
		9'd251: outColor = 24'h747474;
		9'd252: outColor = 24'h949494;
		9'd253: outColor = 24'hB4B4B4;
		9'd254: outColor = 24'hD0D0D0;
		9'd255: outColor = 24'hECECEC;
		// SECAM Colors
		9'd256: outColor = 24'h000000;
		9'd257: outColor = 24'h2121FF;
		9'd258: outColor = 24'hF03C79;
		9'd259: outColor = 24'hFF50FF;
		9'd260: outColor = 24'h7FFF00;
		9'd261: outColor = 24'h7FFFFF;
		9'd262: outColor = 24'hFFFF3F;
		9'd263: outColor = 24'hFFFFFF;
		9'd264: outColor = 24'h000000;
		9'd265: outColor = 24'h2121FF;
		9'd266: outColor = 24'hF03C79;
		9'd267: outColor = 24'hFF50FF;
		9'd268: outColor = 24'h7FFF00;
		9'd269: outColor = 24'h7FFFFF;
		9'd270: outColor = 24'hFFFF3F;
		9'd271: outColor = 24'hFFFFFF;
		9'd272: outColor = 24'h000000;
		9'd273: outColor = 24'h2121FF;
		9'd274: outColor = 24'hF03C79;
		9'd275: outColor = 24'hFF50FF;
		9'd276: outColor = 24'h7FFF00;
		9'd277: outColor = 24'h7FFFFF;
		9'd278: outColor = 24'hFFFF3F;
		9'd279: outColor = 24'hFFFFFF;
		9'd280: outColor = 24'h000000;
		9'd281: outColor = 24'h2121FF;
		9'd282: outColor = 24'hF03C79;
		9'd283: outColor = 24'hFF50FF;
		9'd284: outColor = 24'h7FFF00;
		9'd285: outColor = 24'h7FFFFF;
		9'd286: outColor = 24'hFFFF3F;
		9'd287: outColor = 24'hFFFFFF;
		9'd288: outColor = 24'h000000;
		9'd289: outColor = 24'h2121FF;
		9'd290: outColor = 24'hF03C79;
		9'd291: outColor = 24'hFF50FF;
		9'd292: outColor = 24'h7FFF00;
		9'd293: outColor = 24'h7FFFFF;
		9'd294: outColor = 24'hFFFF3F;
		9'd295: outColor = 24'hFFFFFF;
		9'd296: outColor = 24'h000000;
		9'd297: outColor = 24'h2121FF;
		9'd298: outColor = 24'hF03C79;
		9'd299: outColor = 24'hFF50FF;
		9'd300: outColor = 24'h7FFF00;
		9'd301: outColor = 24'h7FFFFF;
		9'd302: outColor = 24'hFFFF3F;
		9'd303: outColor = 24'hFFFFFF;
		9'd304: outColor = 24'h000000;
		9'd305: outColor = 24'h2121FF;
		9'd306: outColor = 24'hF03C79;
		9'd307: outColor = 24'hFF50FF;
		9'd308: outColor = 24'h7FFF00;
		9'd309: outColor = 24'h7FFFFF;
		9'd310: outColor = 24'hFFFF3F;
		9'd311: outColor = 24'hFFFFFF;
		9'd312: outColor = 24'h000000;
		9'd313: outColor = 24'h2121FF;
		9'd314: outColor = 24'hF03C79;
		9'd315: outColor = 24'hFF50FF;
		9'd316: outColor = 24'h7FFF00;
		9'd317: outColor = 24'h7FFFFF;
		9'd318: outColor = 24'hFFFF3F;
		9'd319: outColor = 24'hFFFFFF;
		9'd320: outColor = 24'h000000;
		9'd321: outColor = 24'h2121FF;
		9'd322: outColor = 24'hF03C79;
		9'd323: outColor = 24'hFF50FF;
		9'd324: outColor = 24'h7FFF00;
		9'd325: outColor = 24'h7FFFFF;
		9'd326: outColor = 24'hFFFF3F;
		9'd327: outColor = 24'hFFFFFF;
		9'd328: outColor = 24'h000000;
		9'd329: outColor = 24'h2121FF;
		9'd330: outColor = 24'hF03C79;
		9'd331: outColor = 24'hFF50FF;
		9'd332: outColor = 24'h7FFF00;
		9'd333: outColor = 24'h7FFFFF;
		9'd334: outColor = 24'hFFFF3F;
		9'd335: outColor = 24'hFFFFFF;
		9'd336: outColor = 24'h000000;
		9'd337: outColor = 24'h2121FF;
		9'd338: outColor = 24'hF03C79;
		9'd339: outColor = 24'hFF50FF;
		9'd340: outColor = 24'h7FFF00;
		9'd341: outColor = 24'h7FFFFF;
		9'd342: outColor = 24'hFFFF3F;
		9'd343: outColor = 24'hFFFFFF;
		9'd344: outColor = 24'h000000;
		9'd345: outColor = 24'h2121FF;
		9'd346: outColor = 24'hF03C79;
		9'd347: outColor = 24'hFF50FF;
		9'd348: outColor = 24'h7FFF00;
		9'd349: outColor = 24'h7FFFFF;
		9'd350: outColor = 24'hFFFF3F;
		9'd351: outColor = 24'hFFFFFF;
		9'd352: outColor = 24'h000000;
		9'd353: outColor = 24'h2121FF;
		9'd354: outColor = 24'hF03C79;
		9'd355: outColor = 24'hFF50FF;
		9'd356: outColor = 24'h7FFF00;
		9'd357: outColor = 24'h7FFFFF;
		9'd358: outColor = 24'hFFFF3F;
		9'd359: outColor = 24'hFFFFFF;
		9'd360: outColor = 24'h000000;
		9'd361: outColor = 24'h2121FF;
		9'd362: outColor = 24'hF03C79;
		9'd363: outColor = 24'hFF50FF;
		9'd364: outColor = 24'h7FFF00;
		9'd365: outColor = 24'h7FFFFF;
		9'd366: outColor = 24'hFFFF3F;
		9'd367: outColor = 24'hFFFFFF;
		9'd368: outColor = 24'h000000;
		9'd369: outColor = 24'h2121FF;
		9'd370: outColor = 24'hF03C79;
		9'd371: outColor = 24'hFF50FF;
		9'd372: outColor = 24'h7FFF00;
		9'd373: outColor = 24'h7FFFFF;
		9'd374: outColor = 24'hFFFF3F;
		9'd375: outColor = 24'hFFFFFF;
		9'd376: outColor = 24'h000000;
		9'd377: outColor = 24'h2121FF;
		9'd378: outColor = 24'hF03C79;
		9'd379: outColor = 24'hFF50FF;
		9'd380: outColor = 24'h7FFF00;
		9'd381: outColor = 24'h7FFFFF;
		9'd382: outColor = 24'hFFFF3F;
		9'd383: outColor = 24'hFFFFFF;
		endcase
	end
endmodule