module alu_control (
  input wire [7:0] A,B,
  input wire [2:0] ALUcontrol,
  input wire [2:0] MovLeft,MovRight,
  output wire [7:0] Resultado,
  output wire [3:0] ALU_flags
);
    wire carryout;
    wire [7:0] sumarest;
    reg [7:0] resultado;
    wire [7:0] andab,orab;
    wire [7:0] DespIzq,DespDer;
    wire [3:0] flags;
    
    SumaResta sumaresta(
      .A(A),
      .B(B),
      .ALU0(ALUcontrol[0]),    // define si es suma o resta 
      .CarryOut(carryout),
      .SumRest(sumarest)
    );
    AND_AB AND_ab(
      .A(A),
      .B(B),
      .and_ab(andab)
    );
    OR_AB OR_ab(
      .A(A),
      .B(B),
      .or_ab(orab)
    );
    SHIFT_LEFT ShiftLeft(
      .sumrest(sumarest),
      .MovL(MovLeft),
      .Shift_Left(DespIzq)
    );
    SHIFT_RIGHT ShiftRight(
      .sumrest(sumarest),
      .MovR(MovRight),
      .Shift_Right(DespDer)
    );
    
  always @(*) 
        begin
            case(ALUcontrol)
                3'd0: resultado = sumarest;    // Suma
                3'd1: resultado = sumarest;    // Resta
                3'd2: resultado = andab;       // AND
                3'd3: resultado = orab;        // OR
                3'd4: resultado = DespDer;    // Desplazamiento Derecha en Suma
                3'd5: resultado = DespDer;    // Desplazamiento Derecha en Resta
                3'd6: resultado = DespIzq;    // Desplazamiento Izquierda en Suma
                3'd7: resultado = DespIzq;    // Desplazamiento Izquierda en Resta
            endcase
        end
    
    assign Resultado = resultado;
    
    ALU_FLAGS ALU_Flag(
      .a7(A[7]),
      .b7(B[7]),
      .sumrest7(sumarest[7]),
      .result(resultado),
      .carry(carryout),
      .ALU(ALUcontrol),
      .ALU_Flags(flags)
    );
    
    assign ALU_flags = flags;
    
endmodule
