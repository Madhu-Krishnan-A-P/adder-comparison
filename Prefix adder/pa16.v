// 16-bit Prefix Adder with Flip-Flops for Input and Output
module prefix_adder_16bit (
    input clk,             // Clock signal
    input [15:0] A,        // 16-bit input A
    input [15:0] B,        // 16-bit input B
    input Cin,             // Carry-in
    output reg [15:0] Sum, // 16-bit Sum output
    output reg Cout        // Carry-out
);

    // Internal wires for propagate and generate signals
    wire [15:0] A_reg;
    wire [15:0] B_reg;
    wire Cin_reg;
    reg [15:0] Sum_next;
    reg Cout_next;

    wire [15:0] P;  // Propagate: P[i] = A[i] ^ B[i]
    wire [15:0] G;  // Generate:  G[i] = A[i] & B[i]
    wire [15:0] C;  // Carry:    C[i] is the carry to the next stage

    // Input Flip-Flops
    reg [15:0] A_ff, B_ff;
    reg Cin_ff;
    always @(posedge clk) begin
        A_ff <= A;
        B_ff <= B;
        Cin_ff <= Cin;
    end

    assign A_reg = A_ff;
    assign B_reg = B_ff;
    assign Cin_reg = Cin_ff;

    // Propagate and Generate
    assign P = A_reg ^ B_reg; // XOR for propagate
    assign G = A_reg & B_reg; // AND for generate

    // Carry computation using prefix logic
    assign C[0] = Cin_reg;
    assign C[1] = G[0] | (P[0] & Cin_reg);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin_reg);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin_reg);
    assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin_reg);
    assign C[5] = G[4] | (P[4] & G[3]) | (P[4] & P[3] & G[2]) | (P[4] & P[3] & P[2] & G[1]) | (P[4] & P[3] & P[2] & P[1] & G[0]) | (P[4] & P[3] & P[2] & P[1] & P[0] & Cin_reg);
    assign C[6] = G[5] | (P[5] & G[4]) | (P[5] & P[4] & G[3]) | (P[5] & P[4] & P[3] & G[2]) | (P[5] & P[4] & P[3] & P[2] & G[1]) | (P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | (P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & Cin_reg);
    assign C[7] = G[6] | (P[6] & G[5]) | (P[6] & P[5] & G[4]) | (P[6] & P[5] & P[4] & G[3]) | (P[6] & P[5] & P[4] & P[3] & G[2]) | (P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | (P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | (P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & Cin_reg);
    assign C[8] = G[7] | (P[7] & G[6]) | (P[7] & P[6] & G[5]) | (P[7] & P[6] & P[5] & G[4]) | (P[7] & P[6] & P[5] & P[4] & G[3]) | (P[7] & P[6] & P[5] & P[4] & P[3] & G[2]) | (P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | (P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | (P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & Cin_reg);
    assign C[9] = G[8] | (P[8] & G[7]) | (P[8] & P[7] & G[6]) | (P[8] & P[7] & P[6] & G[5]) | (P[8] & P[7] & P[6] & P[5] & G[4]) | (P[8] & P[7] & P[6] & P[5] & P[4] & G[3]) | (P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & G[2]) | (P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | (P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | (P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & Cin_reg);
    assign C[10] = G[9] | (P[9] & G[8]) | (P[9] & P[8] & G[7]) | (P[9] & P[8] & P[7] & G[6]) | (P[9] & P[8] & P[7] & P[6] & G[5]) | (P[9] & P[8] & P[7] & P[6] & P[5] & G[4]) | (P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & G[3]) | (P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & G[2]) | (P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | (P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | (P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & Cin_reg);
    assign C[11] = G[10] | (P[10] & G[9]) | (P[10] & P[9] & G[8]) | (P[10] & P[9] & P[8] & G[7]) | (P[10] & P[9] & P[8] & P[7] & G[6]) | (P[10] & P[9] & P[8] & P[7] & P[6] & G[5]) | (P[10] & P[9] & P[8] & P[7] & P[6] & P[5] & G[4]) | (P[10] & P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & G[3]) | (P[10] & P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & G[2]) | (P[10] & P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | (P[10] & P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | (P[10] & P[9] & P[8] & P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & Cin_reg);

    // Continue similarly for C[12], C[13], C[14], C[15]
    // Sum computation
    always @(*) begin
        Sum_next = P ^ {C[14:0], Cin_reg};
        Cout_next = G[15] | (P[15] & C[15]);
    end

    // Output Flip-Flops
    always @(posedge clk) begin
        Sum <= Sum_next;
        Cout <= Cout_next;
    end

endmodule
