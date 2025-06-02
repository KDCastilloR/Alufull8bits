module SHIFT_RIGHT (
  input wire [7:0] sumrest,
  input wire [2:0] MovR,
  output reg [7:0] Shift_Right);
    
  always @(*)
        begin
            case (MovR)
                3'd0: Shift_Right = sumrest;
                3'd1: begin
                    Shift_Right[0] = sumrest[1];
                    Shift_Right[1] = sumrest[2];
                    Shift_Right[2] = sumrest[3];
                    Shift_Right[3] = sumrest[4];
                    Shift_Right[4] = sumrest[5];
                    Shift_Right[5] = sumrest[6];
                    Shift_Right[6] = sumrest[7];
                    Shift_Right[7] = 1'b0;
                end
                3'd2: begin
                    Shift_Right[0] = sumrest[2];
                    Shift_Right[1] = sumrest[3];
                    Shift_Right[2] = sumrest[4];
                    Shift_Right[3] = sumrest[5];
                    Shift_Right[4] = sumrest[6];
                    Shift_Right[5] = sumrest[7];
                    Shift_Right[6] = 1'b0;
                    Shift_Right[7] = 1'b0;
                end
                3'd3: begin
                    Shift_Right[0] = sumrest[3];
                    Shift_Right[1] = sumrest[4];
                    Shift_Right[2] = sumrest[5];
                    Shift_Right[3] = sumrest[6];
                    Shift_Right[4] = sumrest[7];
                    Shift_Right[5] = 1'b0;
                    Shift_Right[6] = 1'b0;
                    Shift_Right[7] = 1'b0;
                end
                3'd4: begin
                    Shift_Right[0] = sumrest[4];
                    Shift_Right[1] = sumrest[5];
                    Shift_Right[2] = sumrest[6];
                    Shift_Right[3] = sumrest[7];
                    Shift_Right[4] = 1'b0;
                    Shift_Right[5] = 1'b0;
                    Shift_Right[6] = 1'b0;
                    Shift_Right[7] = 1'b0;
                end
                3'd5: begin
                    Shift_Right[0] = sumrest[5];
                    Shift_Right[1] = sumrest[6];
                    Shift_Right[2] = sumrest[7];
                    Shift_Right[3] = 1'b0;
                    Shift_Right[4] = 1'b0;
                    Shift_Right[5] = 1'b0;
                    Shift_Right[6] = 1'b0;
                    Shift_Right[7] = 1'b0;
                end
                3'd6: begin
                    Shift_Right[0] = sumrest[6];
                    Shift_Right[1] = sumrest[7];
                    Shift_Right[2] = 1'b0;
                    Shift_Right[3] = 1'b0;
                    Shift_Right[4] = 1'b0;
                    Shift_Right[5] = 1'b0;
                    Shift_Right[6] = 1'b0;
                    Shift_Right[7] = 1'b0;
                end
                3'd7: begin
                    Shift_Right[0] = sumrest[7];
                    Shift_Right[1] = 1'b0;
                    Shift_Right[2] = 1'b0;
                    Shift_Right[3] = 1'b0;
                    Shift_Right[4] = 1'b0;
                    Shift_Right[5] = 1'b0;
                    Shift_Right[6] = 1'b0;
                    Shift_Right[7] = 1'b0;
                end
            endcase
        end
endmodule
