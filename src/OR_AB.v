module OR (
  input wire [7:0] A, B,
  output wire [7:0] or_ab);
    
    assign or_ab = A | B;
endmodule
