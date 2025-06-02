module SHIFT_LEFT (
  input wire [7:0] sumrest,
  input wire [2:0] MovL,
  output reg [7:0] Shift_Left
);

    //6'd# quiere decir: # numero en base decimal en 6 bits
    
  always @(*) 
     begin 
       case (MovL) 
         3'd0: Shift_Left = sumrest; 
         3'd1: begin
           Shift_Left[0] = 1'b0;
           Shift_Left[1] = sumrest[0];
           Shift_Left[2] = sumrest[1];
           Shift_Left[3] = sumrest[2];
           Shift_Left[4] = sumrest[3];
           Shift_Left[5] = sumrest[4];
           Shift_Left[6] = sumrest[5];
           Shift_Left[7] = sumrest[6];
         end
         3'd2: begin
           Shift_Left[0] = 1'b0;
           Shift_Left[1] = 1'b0;
           Shift_Left[2] = sumrest[0];
           Shift_Left[3] = sumrest[1];
           Shift_Left[4] = sumrest[2];
           Shift_Left[5] = sumrest[3];
           Shift_Left[6] = sumrest[4];
           Shift_Left[7] = sumrest[5];
         end
         3'd3: begin
           Shift_Left[0] = 1'b0;
           Shift_Left[1] = 1'b0;
           Shift_Left[2] = 1'b0;
           Shift_Left[3] = sumrest[0];
           Shift_Left[4] = sumrest[1];
           Shift_Left[5] = sumrest[2];
           Shift_Left[6] = sumrest[3];
           Shift_Left[7] = sumrest[4];
         end
         3'd4: begin
             Shift_Left[0] = 1'b0;
             Shift_Left[1] = 1'b0; 
             Shift_Left[2] = 1'b0; 
             Shift_Left[3] = 1'b0; 
             Shift_Left[4] = sumrest[0]; 
             Shift_Left[5] = sumrest[1]; 
             Shift_Left[6] = sumrest[2]; 
             Shift_Left[7] = sumrest[3]; 
           end
           3'd5: begin
             Shift_Left[0] = 1'b0; 
             Shift_Left[1] = 1'b0; 
             Shift_Left[2] = 1'b0; 
             Shift_Left[3] = 1'b0; 
             Shift_Left[4] = 1'b0; 
             Shift_Left[5] = sumrest[0]; 
             Shift_Left[6] = sumrest[1]; 
             Shift_Left[7] = sumrest[2]; 
           end
           3'd6: begin
             Shift_Left[0] = 1'b0; 
             Shift_Left[1] = 1'b0; 
             Shift_Left[2] = 1'b0; 
             Shift_Left[3] = 1'b0; 
             Shift_Left[4] = 1'b0; 
             Shift_Left[5] = 1'b0;
             Shift_Left[6] = sumrest[0]; 
             Shift_Left[7] = sumrest[1]; 
           end
           3'd7: begin
             Shift_Left[0] = 1'b0; 
             Shift_Left[1] = 1'b0; 
             Shift_Left[2] = 1'b0; 
             Shift_Left[3] = 1'b0; 
             Shift_Left[4] = 1'b0; 
             Shift_Left[5] = 1'b0; 
             Shift_Left[6] = 1'b0; 
             Shift_Left[7] = sumrest[0]; 
           end 
       endcase
      end
endmodule
