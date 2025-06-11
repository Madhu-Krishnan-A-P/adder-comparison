module fulladder(
    input x,
    input y,
    input z,
    output reg sum,
    output reg carry
);

always @(x or y or z) begin
    sum = x ^ y ^ z; 
    carry = (x & y) | ((x ^ y) & z);
end

endmodule

module RCA(
    input clk,
    input reset,
    input [31:0] A_in,  // 32-bit input
    input [31:0] B_in,  // 32-bit input
    input Cin_in,
    output reg [31:0] SUM_out,  // 32-bit output
    output reg Cout_out
);

// Registers to store inputs and outputs
reg [31:0] A;  // 32-bit register for A
reg [31:0] B;  // 32-bit register for B
reg Cin;
reg [31:0] SUM;
reg Cout;

// Internal wires for the RCA outputs
wire [31:0] SUM_internal;  // 32-bit wire for sum
wire Cout_internal;

// Wire for carry propagation
wire [30:0] C;  // Carry wires for 31 intermediate carries


// Instantiate the full adder logic for each bit
fulladder adder0 (
    .x(A[0]),
    .y(B[0]),
    .z(Cin),
    .sum(SUM_internal[0]),
    .carry(C[0])
);

fulladder adder1 (
    .x(A[1]),
    .y(B[1]),
    .z(C[0]),
    .sum(SUM_internal[1]),
    .carry(C[1])
);

fulladder adder2 (
    .x(A[2]),
    .y(B[2]),
    .z(C[1]),
    .sum(SUM_internal[2]),
    .carry(C[2])
);

fulladder adder3 (
    .x(A[3]),
    .y(B[3]),
    .z(C[2]),
    .sum(SUM_internal[3]),
    .carry(C[3])
);

fulladder adder4 (
    .x(A[4]),
    .y(B[4]),
    .z(C[3]),
    .sum(SUM_internal[4]),
    .carry(C[4])
);

fulladder adder5 (
    .x(A[5]),
    .y(B[5]),
    .z(C[4]),
    .sum(SUM_internal[5]),
    .carry(C[5])
);

fulladder adder6 (
    .x(A[6]),
    .y(B[6]),
    .z(C[5]),
    .sum(SUM_internal[6]),
    .carry(C[6])
);

fulladder adder7 (
    .x(A[7]),
    .y(B[7]),
    .z(C[6]),
    .sum(SUM_internal[7]),
    .carry(C[7])
);

fulladder adder8 (
    .x(A[8]),
    .y(B[8]),
    .z(C[7]),
    .sum(SUM_internal[8]),
    .carry(C[8])
);

fulladder adder9 (
    .x(A[9]),
    .y(B[9]),
    .z(C[8]),
    .sum(SUM_internal[9]),
    .carry(C[9])
);

fulladder adder10 (
    .x(A[10]),
    .y(B[10]),
    .z(C[9]),
    .sum(SUM_internal[10]),
    .carry(C[10])
);

fulladder adder11 (
    .x(A[11]),
    .y(B[11]),
    .z(C[10]),
    .sum(SUM_internal[11]),
    .carry(C[11])
);

fulladder adder12 (
    .x(A[12]),
    .y(B[12]),
    .z(C[11]),
    .sum(SUM_internal[12]),
    .carry(C[12])
);

fulladder adder13 (
    .x(A[13]),
    .y(B[13]),
    .z(C[12]),
    .sum(SUM_internal[13]),
    .carry(C[13])
);

fulladder adder14 (
    .x(A[14]),
    .y(B[14]),
    .z(C[13]),
    .sum(SUM_internal[14]),
    .carry(C[14])
);

fulladder adder15 (
    .x(A[15]),
    .y(B[15]),
    .z(C[14]),
    .sum(SUM_internal[15]),
    .carry(C[15])
);

fulladder adder16 (
    .x(A[16]),
    .y(B[16]),
    .z(C[15]),
    .sum(SUM_internal[16]),
    .carry(C[16])
);

fulladder adder17 (
    .x(A[17]),
    .y(B[17]),
    .z(C[16]),
    .sum(SUM_internal[17]),
    .carry(C[17])
);

fulladder adder18 (
    .x(A[18]),
    .y(B[18]),
    .z(C[17]),
    .sum(SUM_internal[18]),
    .carry(C[18])
);

fulladder adder19 (
    .x(A[19]),
    .y(B[19]),
    .z(C[18]),
    .sum(SUM_internal[19]),
    .carry(C[19])
);

fulladder adder20 (
    .x(A[20]),
    .y(B[20]),
    .z(C[19]),
    .sum(SUM_internal[20]),
    .carry(C[20])
);

fulladder adder21 (
    .x(A[21]),
    .y(B[21]),
    .z(C[20]),
    .sum(SUM_internal[21]),
    .carry(C[21])
);

fulladder adder22 (
    .x(A[22]),
    .y(B[22]),
    .z(C[21]),
    .sum(SUM_internal[22]),
    .carry(C[22])
);

fulladder adder23 (
    .x(A[23]),
    .y(B[23]),
    .z(C[22]),
    .sum(SUM_internal[23]),
    .carry(C[23])
);

fulladder adder24 (
    .x(A[24]),
    .y(B[24]),
    .z(C[23]),
    .sum(SUM_internal[24]),
    .carry(C[24])
);

fulladder adder25 (
    .x(A[25]),
    .y(B[25]),
    .z(C[24]),
    .sum(SUM_internal[25]),
    .carry(C[25])
);

fulladder adder26 (
    .x(A[26]),
    .y(B[26]),
    .z(C[25]),
    .sum(SUM_internal[26]),
    .carry(C[26])
);

fulladder adder27 (
    .x(A[27]),
    .y(B[27]),
    .z(C[26]),
    .sum(SUM_internal[27]),
    .carry(C[27])
);

fulladder adder28 (
    .x(A[28]),
    .y(B[28]),
    .z(C[27]),
    .sum(SUM_internal[28]),
    .carry(C[28])
);

fulladder adder29 (
    .x(A[29]),
    .y(B[29]),
    .z(C[28]),
    .sum(SUM_internal[29]),
    .carry(C[29])
);

fulladder adder30 (
    .x(A[30]),
    .y(B[30]),
    .z(C[29]),
    .sum(SUM_internal[30]),
    .carry(C[30])
);

fulladder adder31 (
    .x(A[31]),
    .y(B[31]),
    .z(C[30]),
    .sum(SUM_internal[31]),
    .carry(Cout_internal)
);

// Sequential logic to register inputs and outputs
always @(posedge clk or posedge reset) begin
    if (reset) begin
        A <= 0;
        B <= 0;
        Cin <= 0;
        SUM_out <= 0;
        Cout_out <= 0;
    end else begin
        A <= A_in;
        B <= B_in;
        Cin <= Cin_in;
        SUM_out <= SUM_internal;
        Cout_out <= Cout_internal;
    end
end

endmodule
