module BANDERAS_ALU (
    input wire a7,                  // bit más significativo de A
    input wire b7,                  // bit más significativo de B
    input wire sumrest7,           // bit más significativo del resultado de suma/resta
    input wire [7:0] resultado,    // salida de la ALU
    input wire llevar,             // carry generado por la operación
    input wire [2:0] ALU_OP,       // código de operación de la ALU
    output wire [3:0] Banderas_ALU // [Overflow, Carry, Zero, Negativo]
);

    wire rebosar, carry_flag, cero, negativo;
    wire z0, z1;

    // Overflow solo válido para suma/resta: operación 000 (suma), 001 (resta)
    assign rebosar = (~(ALU_OP[0] ^ a7 ^ b7)) & (a7 ^ sumrest7) & (~ALU_OP[1]) & (~ALU_OP[2]);

    assign carry_flag = (~ALU_OP[1]) & (~ALU_OP[2]) & llevar;

    assign z0 = ~resultado[0] & ~resultado[1] & ~resultado[2] & ~resultado[3];
    assign z1 = ~resultado[4] & ~resultado[5] & ~resultado[6] & ~resultado[7];
    assign cero = z0 & z1;

    assign negativo = resultado[7];

    assign Banderas_ALU[0] = rebosar;       // Bit 0: Overflow
    assign Banderas_ALU[1] = carry_flag;    // Bit 1: Carry
    assign Banderas_ALU[2] = cero;          // Bit 2: Zero
    assign Banderas_ALU[3] = negativo;      // Bit 3: Negativo

endmodule
