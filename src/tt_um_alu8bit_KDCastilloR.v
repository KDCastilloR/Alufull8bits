module tt_um_alu8bit_KDCastilloR (
    input        clk,
    input        rst_n,    // Reset activo en bajo
    input        ena,
    input  [7:0] ui_in,
    output [7:0] uo_out,
    input  [7:0] uio_in,
    output [7:0] uio_out,
    output [7:0] uio_oe 

);

    wire btnC;            // Botón central para reset (U18)
    wire [15:0] sw;       // Switches de entrada (sw[15:0])
    wire [15:0] led;      // LEDs de salida (led[15:0])
    
    // Registros internos
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] salida;
    wire [3:0] flags;
    wire Sa, Sb;

    assign sw = {uio_in, ui_in};    // Switches de entrada (sw[15:0])
    assign btnC = ~rst_n;

    assign Sa = sw[11];         // sw[11] → cargar A
    assign Sb = sw[12];         // sw[12] → cargar B

    always @(posedge clk or posedge btnC) begin    // lectura por flancos
        if (btnC) begin    // reinicio de A y B
            a <= 8'd0;
            b <= 8'd0;
        end else if (ena) begin
            if (Sa) a <= sw[7:0];    // carga valor de A
            if (Sb) b <= sw[7:0];    // carga valor de B
        end
    end

    // Instancia de la ALU
    alu_control ALU(
        .A(a),
        .B(b),
        .ALUcontrol(sw[10:8]),
        .MovLeft(sw[15:13]),
        .MovRight(sw[15:13]),
        .Resultado(salida),
        .ALU_flags(flags)
    );

    // Mostrar en LEDs
    assign led[7:0]   = salida;         // Resultado principal
    assign led[10:8]  = sw[10:8];       // Código de operación
    assign led[15:12] = flags;          // Flags
    assign led[11]    = 1'b0;           // No usado

    assign uo_out = led[7:0];
    assign uio_out = led[15:8];
    assign uio_oe  = 8'b11111111;    // Configura todos los pines uio como salidas

endmodule
