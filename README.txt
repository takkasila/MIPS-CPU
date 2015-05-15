Project  : 
	Single­Cycle MIPS Control
Subject  : 
	204225 Computer Organization
====================================================
Member :
	Takkasila 	Saichol		5610501962	
	Pimvanat		Kosiyakul	5610503922	
====================================================
File :
	A register file (ไฟล์register.v)
	A Program Counter (PC) register ( เป็น register หนึ่งใน processor )
	A 2­input mux parameterized to support multiple widths (ไฟล์mux.v)
	An adder (ไฟล์adder.v)
	A sign­extender (ไฟล์signextender.v)
	A controller (ไฟล์controller.v)
====================================================
วิธีการรัน :
1) จะต้อง initial Memory ก่อน เพื่อโหลด MIPS เข้า memory โดย
	­ เปลี่ยน path ในไฟล์ data_memory.v ในบรรทัดที่ 45­48 ให้เป็น 
absolute path ไปยัง ไฟล์ data_ramX.memh ที่แนบไปใน folder test
	­ เปลี่ยน path ในไฟล์ inst_rom.v ในบรรทัดที่ 22 ให้เป็น absolute path 
ไปยัง ไฟล์ inst_rom.memh ที่แนบไปใน folder test
2)คำสั่งที่ใช้รัน
	iverilog testbench.v ­o processor
	vvp processor ­lxt2
	gtkwave testbench.vcd
	rm processor
====================================================

	