module full_adder (
  input wire A,B,cin,
  output wire cout,Sum
);
  wire P,G;    // señales internas generasas de propagacion y generacion de Carry out
    
  assign P = A^B;    // Señal de propagacion de Carry debido a las entradas
  assign G = A&B;    // Señal de generacion de Carry
  assign Sum = P ^ cin;    // Suma debido a los bits A o B y el Carry in
  assign cout = G | ( P & cin );    // Salida de Carry debido a las entradas y el carry in
    
endmodule
