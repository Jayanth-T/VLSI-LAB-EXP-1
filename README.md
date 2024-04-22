# VLSI-LAB-EXPERIMENTS
AIM: To simulate and synthesis Logic Gates,Adders and Subtractor using Xilinx ISE.

APPARATUS REQUIRED: Xilinx 14.7 Spartan6 FPGA

PROCEDURE: STEP:1 Start the Xilinx navigator, Select and Name the New project. STEP:2 Select the device family, device, package and speed. STEP:3 Select new source in the New Project and select Verilog Module as the Source type. STEP:4 Type the File Name and Click Next and then finish button. Type the code and save it. STEP:5 Select the Behavioral Simulation in the Source Window and click the check syntax. STEP:6 Click the simulation to simulate the program and give the inputs and verify the outputs as per the truth table. STEP:7 Select the Implementation in the Sources Window and select the required file in the Processes Window. STEP:8 Select Check Syntax from the Synthesize XST Process. Double Click in the Floorplan Area/IO/Logic-Post Synthesis process in the User Constraints process group. UCF(User constraint File) is obtained. STEP:9 In the Design Object List Window, enter the pin location for each pin in the Loc column Select save from the File menu. STEP:10 Double click on the Implement Design and double click on the Generate Programming File to create a bitstream of the design.(.v) file is converted into .bit file here. STEP:12 Load the Bit file into the SPARTAN 6 FPGA STEP:11 On the board, by giving required input, the LEDs starts to glow light, indicating the output.

Logic Diagram :

Logic Gates:
![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/ee17970c-3ac9-4603-881b-88e2825f41a4)


Half Adder:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/0e1ecb96-0c25-4556-832b-aeeedfdfe7b9)


Full adder:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/9bb3964c-438f-469d-a3de-c1cca6f323fb)


Half Subtractor:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/731470b7-eb4e-49f8-8bb7-2994052a7184)



Full Subtractor:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/d66f874b-c1f2-44b3-a035-7149b56430c1)



8 Bit Ripple Carry Adder

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/7385a408-40a5-4203-8050-b72818622d79)



VERILOG CODE:
# Full Adder:
```
module fulladder (sum, cout, a,b,c);
input a,b,c;
output sum, cout;
wire w1,w2,w3,w4,w5;
xor x1(w1,a,b);
xor x2(sum,w1,c);
and al(w2,a,b);
and a2(w3,b,c);
and a3(w4,a,c);
or o1(w5,w2,w3); or o2(cout,w5,w4);
endmodule
```
# Full Subractor:
```
module full_subtractor(a, b, c,D, Bout);
input a, b, c;
output D, Bout;
assign D = a^b^c;
assign Bout = (~a & b) | (~(a^ b) & c);
endmodule
```

# Half Adder:
```
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
or(sum,a,b);
and(carry,a,b);
endmodule
```

# Half Subractor:
```
module half_subtractor(D,Bo,A,B);
input A,B;
output D,Bo;
assign D=A^B;
assign Bo=(~A)&B;
endmodule
```
# Logic Gates:
```
module logicgates(a,b,andgate,orgate,xorgate,nandgate,norgate,xnorgate,notgate);
input a,b;
output andgate,orgate,xorgate,nandgate,norgate,xnorgate,notgate;
and(andgate,a,b);
or(orgate,a,b);
xor(xorgate,a,b);
nand(nandgate,a,b);  
nor(norgate,a,b);
xnor(xnorgate,a,b);
not(notgate,a);
endmodule
```
# Ripple Carry Adder 4Bit:
```
module rippe_adder(S, Cout, X, Y,Cin);
 input [3:0] X, Y;// Two 4-bit inputs
 input Cin;
 output [3:0] S;
 output Cout;
 wire w1, w2, w3;fulladder u1(S[0], w1,X[0], Y[0], Cin);
 fulladder u2(S[1], w2,X[1], Y[1], w1);
 fulladder u3(S[2], w3,X[2], Y[2], w2);
 fulladder u4(S[3], Cout,X[3], Y[3], w3);
endmodule
module fulladder(S, Co, X, Y, Ci);
  input X, Y, Ci;
  output S, Co;  
  wire w1,w2,w3;  
  xor G1(w1, X, Y); 
  xor G2(S, w1, Ci);
  and G3(w2, w1, Ci);
  and G4(w3, X, Y);
  or G5(Co, w2, w3);
endmodule
```
# Ripple Carry Adder 8bit
```
module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire w1,w2,w3;
xor(w1,a,b);
xor(sum,w1,c);
and(w2,w1,c);
and(w3,a,b);
or(carry,w2,w3);
endmodule

module rca_8bit(a,b,cin,s,cout);
input [7:0]a,b;
input cin;
output [7:0]s;
output cout;
wire [7:1]w;
fulladder f1(a[0], b[0], cin, s[0], w[1]);
fulladder f2(a[1], b[1], w[1], s[1], w[2]);
fulladder f3(a[2], b[2], w[2], s[2], w[3]);
fulladder f4(a[3], b[3], w[3], s[3], w[4]);
fulladder f5(a[4], b[4], w[4], s[4], w[5]);
fulladder f6(a[5], b[5], w[5], s[5], w[6]);
fulladder f7(a[6], b[6], w[6], s[6], w[7]);
fulladder f8(a[7], b[7], w[7], s[7], cout);
endmodule
```
# OUTPUT:

# Full Adder

![319674071-5861d9cc-f439-4d6f-9637-e207327496d9](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/22107c6d-d04c-4bef-aec0-eeed5a79c44a)

<img width="632" alt="324388464-77971412-b208-47e6-a7a3-83ed932000c4" src="https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/492ae14a-c23e-409a-8182-969b5b2b4c2b">


# Full Subractor

![319674378-9cba1528-e76b-488b-b225-a2d1d1719521](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/085e478a-dbd1-4afc-92c8-1107327e6ada)

<img width="490" alt="324392598-2fb76565-dba4-4d30-8307-ddbd07374350" src="https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/4cf9ad2c-06c7-4fba-875a-215221954321">

# Half Adder

![319674536-ef26f9ed-47ad-465f-abba-e1c83fcd7ae4](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/2e11b29e-a43e-41bd-91dd-11ddfa0049bd)

![324386315-f80953ae-1db6-4e23-a04b-ace1dfedbebe](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/9d50e021-22e8-48e9-820e-e1062eac93ff)


# Half Subractor

![319674711-bd30eda2-6717-4c26-9457-4ab8c7ae86c4](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/6a4ca03b-935a-4def-be95-cb9cae73a07b)

<img width="488" alt="324392329-fcf37701-b2ac-4d85-905e-b593841d4afe" src="https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/381744ae-7a6c-4824-a167-f70f69d932bb">

# Logic Gates

![319674842-2d24d1a6-a293-41ef-b8a9-e84471cd9c54](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/400d2234-6df2-42bf-ae50-7a191c1b52a7)

<img width="556" alt="324391651-51100cd9-c792-4faa-9c9b-1b5de2260066" src="https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/e2f52b34-b8bd-441f-8d48-b024cb366f5e">

# Ripple Carry Adder 4bit

![319674949-a9e07040-1295-4b54-a60d-59b0c8ad9f5c](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/43fe924e-9a74-4359-a83e-ea0956df124b)

<img width="632" alt="324388178-ea7e9859-5a42-45f4-aaec-bfd7efeece9c" src="https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/4ab2d8b9-2f06-43be-a42e-945359c4793b">

# Ripple Carry Adder 8bit

![319675048-5c0ad9e4-b9ae-40e9-8036-98295a896dea](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/8dd8b2d4-057f-4a2a-9496-2775480038d5)

<img width="631" alt="324387760-517604ec-80d3-406b-917b-37d8927487f1" src="https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/da885a29-0c7e-4c71-a8e1-1c9dbd3e555e">



RESULT:
Thus the simulation and synthesis Logic Gates,Adders and Subtractor using VIVADO 2023.2 has been verified.
