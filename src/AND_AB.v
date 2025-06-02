module AND_AB (
  input wire [7:0] A, B,
  output wire [7:0] and_ab
);
    
    assign and_ab = A & B;
endmodule
