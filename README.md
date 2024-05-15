# SIMULATION OF LOGIC GATES ,ADDERS AND SUBTRACTORS

# AIM:
To simulate and synthesis Logic Gates,Adders and Subtractor using Vivado 2023.1.

# APPARATUS REQUIRED:
Vivado 2023.1.

# PROCEDURE:
1. Open Vivado: Launch Xilinx Vivado software on your computer.

2.Create a New Project: Click on "Create Project" from the welcome page or navigate through "File" > "Project" > "New".

3.Project Settings: Follow the prompts to set up your project. Specify the project name, location, and select RTL project type.

4.Add Design Files: Add your Verilog design files to the project. You can do this by right-clicking on "Design Sources" in the Sources window, then selecting "Add Sources". Choose your Verilog files from the file browser.

5.Specify Simulation Settings: Go to "Simulation" > "Simulation Settings". Choose your simulation language (Verilog in this case) and simulation tool (Vivado Simulator).

6.Run Simulation: Go to "Flow" > "Run Simulation" > "Run Behavioral Simulation". This will launch the Vivado Simulator and compile your design for simulation.

7.Set Simulation Time: In the Vivado Simulator window, set the simulation time if it's not set automatically. This determines how long the simulation will run.

8.Run Simulation: Start the simulation by clicking on the "Run" button in the simulation window.

9.View Results: After the simulation completes, you can view waveforms, debug signals, and analyze the behavior of your design.

# Logic Diagram :
![318383369-567b87e6-13f3-4abf-898d-f7943aa3e6fc](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/f11c6378-915c-4d4b-8d9f-e5e4170c7887)

# Half Adder:
![318383763-9bd27cf5-9efa-4135-9de5-dd29001ba477](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/5fdd54ae-9bd2-40ed-9621-9aea405bdacc)


# Full adder:
![318383951-a64ed39b-0751-499e-a857-f5d075813bd3](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/558a75f6-6e85-4f39-a6be-ddc5ea6c1bfb)

# Half Subtractor:
![318384173-d5881631-510c-4cbd-adc0-38cb82ab038b](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/fe0560ff-5d15-48c6-9567-5da904536433)

# Full Subtractor:
![318384289-c90a7708-2024-4711-8473-e4862d01e20e](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/a04bd49e-555e-4308-9e2f-727291c533f9)


# 8 Bit Ripple Carry Adder
![318384435-8e7571dd-189d-4044-986e-a3250f4700b4](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/566b63bb-d94a-4273-a9c6-d1c83e89f274)

# VERILOG CODE:
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
assign Bout = (a & b) | ((a^ b) & c);
endmodule
Half Adder:
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
or(sum,a,b);
and(carry,a,b);
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
# full adder
![318386212-0a976f22-c773-48cd-b3ce-d53aa590312f](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/c1712156-70cb-4a1f-b3e7-6beaef13327d)

# Full Subractor
![318389969-f0ba4be8-64ca-4487-817e-676dec3fbc2a](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/dcddc3f6-af10-49a4-a6fc-451f526b05b8)

# Half Adder
![318388701-1336ec39-cbc6-4f0a-9f5c-5e2b2ba0ff56](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/3e457a97-a0f1-4f6f-8357-f05647d78dca)

# Half Subractor
![318389470-3a73f477-3033-4ab5-8785-b4e1bd592b3a](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/dba5f8eb-7ceb-4603-8c2f-4a01fef4c0ac)

# Logic Gates
![318389666-2e9deaae-f82e-4757-a687-0e065b079034](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/56682163-e53b-4fc3-ba8c-6882d58adfac)

# Ripple Carry Adder 4bit
![324391486-a58181a3-2ad6-4888-9b55-64abfc34486e](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/e15fff44-2e93-46e5-b529-42667257bc03)

# Ripple Carry Adder 8bit
![324391648-0dcfea29-b8d6-4ebf-9470-81e13f19a6c9](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/9d846717-e7a7-482d-8264-bf662ae7c8f4)

# RTL Design:
# Full Adder
![324395673-a38bcc68-5f5c-4c9a-b500-4dcaf0f8e637](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/f93e8601-b9af-4b82-bf62-f24a3b677bb1)


# Full Subractor
![324396105-e1b9759b-2ccf-4d6d-bb09-1273faaa5f02](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/85b5752a-e00b-45c1-9100-88994039688a)

# Half Adder
![324397407-eae04214-1590-456c-8b62-33fc72e852b5](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/3a9b91c1-cb5b-408d-9035-597e864f5305)


# Half Subractor
![324397515-875ede9a-e5d9-40a0-afbf-5a921675c646](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/8db34254-22a4-4792-bd5f-b0951d9417b6)


# Logic Gates
![324397773-55394c15-129e-45e5-a05b-704c7e9ed301](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/91c33344-70fa-4c7c-aaa6-8d81a26bd8fd)


# Ripple Carry Adder 4bit
![324397849-c767f829-822c-4dc6-b8d1-cb93bca5c4d8](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/187c9ed1-7a07-46b8-ae34-c0d3d2b9de3a)


# Ripple Carry Adder 8bit
![324397927-db686f08-2449-4e25-8952-f8bf48a69bef](https://github.com/Jayanth-T/VLSI-LAB-EXP-1/assets/106177371/f347591d-f853-441c-b5c2-39537c2f7fed)


# Result:
Thus the simulate Logic Gates ,Adders and Subtractors is done and verified.
