module fulladder_8bits  (
  input wire Cin,
  input wire [7:0] A,B,
  output wire [7:0] Suma,
  output wire Cout
);
                    
  wire [6:0] outs;     // Variable de Carry interno por cada suma
    
    // 32 sumas debido a cada bits de la señales de entrada 
  full_adder Adder0(.A(A[0]), .B(B[0]), .cin(Cin), .Sum(Suma[0]), .cout(outs[0]));
  full_adder Adder1(.A(A[1]), .B(B[1]), .cin(outs[0]), .Sum(Suma[1]), .cout(outs[1]));
  full_adder Adder2(.A(A[2]), .B(B[2]), .cin(outs[1]), .Sum(Suma[2]), .cout(outs[2]));
  full_adder Adder3(.A(A[3]), .B(B[3]), .cin(outs[2]), .Sum(Suma[3]), .cout(outs[3]));
  full_adder Adder4(.A(A[4]), .B(B[4]), .cin(outs[3]), .Sum(Suma[4]), .cout(outs[4]));
  full_adder Adder5(.A(A[5]), .B(B[5]), .cin(outs[4]), .Sum(Suma[5]), .cout(outs[5]));
  full_adder Adder6(.A(A[6]), .B(B[6]), .cin(outs[5]), .Sum(Suma[6]), .cout(outs[6]));
  full_adder Adder7(.A(A[7]), .B(B[7]), .cin(outs[6]), .Sum(Suma[7]), .cout(Cout));
endmodule
