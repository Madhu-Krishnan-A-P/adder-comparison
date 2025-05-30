// 8-bit Prefix Adder with Flip-Flops for Input and Output
module prefix_adder_8bit (
    input clk,         // Clock signal
    input [7:0] A,     // 8-bit input A
    input [7:0] B,     // 8-bit input B
    input Cin,         // Carry-in
    output reg [7:0] Sum, // 8-bit Sum output
    output reg Cout    // Carry-out
);

    // Internal wires for propagate and generate signals
    wire [7:0] A_reg;
    wire [7:0] B_reg;
    wire Cin_reg;
    reg [7:0] Sum_next;
    reg Cout_next;

    wire [7:0] P;  // Propagate: P[i] = A[i] ^ B[i]
    wire [7:0] G;  // Generate:  G[i] = A[i] & B[i]
    wire [7:0] C;  // Carry:    C[i] is the carry to the next stage

    // Input Flip-Flops
    reg [7:0] A_ff, B_ff;
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

    // Sum computation
    always @(*) begin
        Sum_next = P ^ {C[6:0], Cin_reg};
        Cout_next = G[7] | (P[7] & C[7]);
    end

    // Output Flip-Flops
    always @(posedge clk) begin
        Sum <= Sum_next;
        Cout <= Cout_next;
    end

endmodule