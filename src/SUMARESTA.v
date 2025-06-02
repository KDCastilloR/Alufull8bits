module SUMARESTA (
  input wire [7:0] A,B,
  input wire ALU0,
  output wire CarryOut,
  output wire [7:0] SumRest
);
  wire [7:0] b;
    
  assign b = ALU0 ? ~B : B;
  
  fulladder_8bits sumador(
    .A(A),
    .B(b),
    .Cin(ALU0),
    .Cout(CarryOut),
    .Suma(SumRest)
  );
        
endmodule
