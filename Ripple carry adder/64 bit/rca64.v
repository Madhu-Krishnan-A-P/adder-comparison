module fulladder(
    input wire x,
    input wire y,
    input wire z,
    output wire sum,
    output wire carry
);
    assign sum = x ^ y ^ z; 
    assign carry = (x & y) | ((x ^ y) & z);
endmodule

module RCA(
    input wire clk,
    input wire reset,
    input wire [63:0] A_in,  // 64-bit input
    input wire [63:0] B_in,  // 64-bit input
    input wire Cin_in,
    output reg [63:0] SUM_out,  // 64-bit output
    output reg Cout_out
);

    // Internal registers and wires
    reg [63:0] A;
    reg [63:0] B;
    reg Cin;
    wire [63:0] SUM_internal;  // 64-bit wire for sum
    wire [63:0] carry;         // 64-bit wire for carry

    // Full adder instances
    wire carry_in_0 = Cin;
    fulladder adder0 (.x(A[0]), .y(B[0]), .z(carry_in_0), .sum(SUM_internal[0]), .carry(carry[0]));
    fulladder adder1 (.x(A[1]), .y(B[1]), .z(carry[0]), .sum(SUM_internal[1]), .carry(carry[1]));
    fulladder adder2 (.x(A[2]), .y(B[2]), .z(carry[1]), .sum(SUM_internal[2]), .carry(carry[2]));
    fulladder adder3 (.x(A[3]), .y(B[3]), .z(carry[2]), .sum(SUM_internal[3]), .carry(carry[3]));
    fulladder adder4 (.x(A[4]), .y(B[4]), .z(carry[3]), .sum(SUM_internal[4]), .carry(carry[4]));
    fulladder adder5 (.x(A[5]), .y(B[5]), .z(carry[4]), .sum(SUM_internal[5]), .carry(carry[5]));
    fulladder adder6 (.x(A[6]), .y(B[6]), .z(carry[5]), .sum(SUM_internal[6]), .carry(carry[6]));
    fulladder adder7 (.x(A[7]), .y(B[7]), .z(carry[6]), .sum(SUM_internal[7]), .carry(carry[7]));
    fulladder adder8 (.x(A[8]), .y(B[8]), .z(carry[7]), .sum(SUM_internal[8]), .carry(carry[8]));
    fulladder adder9 (.x(A[9]), .y(B[9]), .z(carry[8]), .sum(SUM_internal[9]), .carry(carry[9]));
    fulladder adder10 (.x(A[10]), .y(B[10]), .z(carry[9]), .sum(SUM_internal[10]), .carry(carry[10]));
    fulladder adder11 (.x(A[11]), .y(B[11]), .z(carry[10]), .sum(SUM_internal[11]), .carry(carry[11]));
    fulladder adder12 (.x(A[12]), .y(B[12]), .z(carry[11]), .sum(SUM_internal[12]), .carry(carry[12]));
    fulladder adder13 (.x(A[13]), .y(B[13]), .z(carry[12]), .sum(SUM_internal[13]), .carry(carry[13]));
    fulladder adder14 (.x(A[14]), .y(B[14]), .z(carry[13]), .sum(SUM_internal[14]), .carry(carry[14]));
    fulladder adder15 (.x(A[15]), .y(B[15]), .z(carry[14]), .sum(SUM_internal[15]), .carry(carry[15]));
    fulladder adder16 (.x(A[16]), .y(B[16]), .z(carry[15]), .sum(SUM_internal[16]), .carry(carry[16]));
    fulladder adder17 (.x(A[17]), .y(B[17]), .z(carry[16]), .sum(SUM_internal[17]), .carry(carry[17]));
    fulladder adder18 (.x(A[18]), .y(B[18]), .z(carry[17]), .sum(SUM_internal[18]), .carry(carry[18]));
    fulladder adder19 (.x(A[19]), .y(B[19]), .z(carry[18]), .sum(SUM_internal[19]), .carry(carry[19]));
    fulladder adder20 (.x(A[20]), .y(B[20]), .z(carry[19]), .sum(SUM_internal[20]), .carry(carry[20]));
    fulladder adder21 (.x(A[21]), .y(B[21]), .z(carry[20]), .sum(SUM_internal[21]), .carry(carry[21]));
    fulladder adder22 (.x(A[22]), .y(B[22]), .z(carry[21]), .sum(SUM_internal[22]), .carry(carry[22]));
    fulladder adder23 (.x(A[23]), .y(B[23]), .z(carry[22]), .sum(SUM_internal[23]), .carry(carry[23]));
    fulladder adder24 (.x(A[24]), .y(B[24]), .z(carry[23]), .sum(SUM_internal[24]), .carry(carry[24]));
    fulladder adder25 (.x(A[25]), .y(B[25]), .z(carry[24]), .sum(SUM_internal[25]), .carry(carry[25]));
    fulladder adder26 (.x(A[26]), .y(B[26]), .z(carry[25]), .sum(SUM_internal[26]), .carry(carry[26]));
    fulladder adder27 (.x(A[27]), .y(B[27]), .z(carry[26]), .sum(SUM_internal[27]), .carry(carry[27]));
    fulladder adder28 (.x(A[28]), .y(B[28]), .z(carry[27]), .sum(SUM_internal[28]), .carry(carry[28]));
    fulladder adder29 (.x(A[29]), .y(B[29]), .z(carry[28]), .sum(SUM_internal[29]), .carry(carry[29]));
    fulladder adder30 (.x(A[30]), .y(B[30]), .z(carry[29]), .sum(SUM_internal[30]), .carry(carry[30]));
    fulladder adder31 (.x(A[31]), .y(B[31]), .z(carry[30]), .sum(SUM_internal[31]), .carry(carry[31]));
    fulladder adder32 (.x(A[32]), .y(B[32]), .z(carry[31]), .sum(SUM_internal[32]), .carry(carry[32]));
    fulladder adder33 (.x(A[33]), .y(B[33]), .z(carry[32]), .sum(SUM_internal[33]), .carry(carry[33]));
    fulladder adder34 (.x(A[34]), .y(B[34]), .z(carry[33]), .sum(SUM_internal[34]), .carry(carry[34]));
    fulladder adder35 (.x(A[35]), .y(B[35]), .z(carry[34]), .sum(SUM_internal[35]), .carry(carry[35]));
    fulladder adder36 (.x(A[36]), .y(B[36]), .z(carry[35]), .sum(SUM_internal[36]), .carry(carry[36]));
    fulladder adder37 (.x(A[37]), .y(B[37]), .z(carry[36]), .sum(SUM_internal[37]), .carry(carry[37]));
    fulladder adder38 (.x(A[38]), .y(B[38]), .z(carry[37]), .sum(SUM_internal[38]), .carry(carry[38]));
    fulladder adder39 (.x(A[39]), .y(B[39]), .z(carry[38]), .sum(SUM_internal[39]), .carry(carry[39]));
    fulladder adder40 (.x(A[40]), .y(B[40]), .z(carry[39]), .sum(SUM_internal[40]), .carry(carry[40]));
    fulladder adder41 (.x(A[41]), .y(B[41]), .z(carry[40]), .sum(SUM_internal[41]), .carry(carry[41]));
    fulladder adder42 (.x(A[42]), .y(B[42]), .z(carry[41]), .sum(SUM_internal[42]), .carry(carry[42]));
    fulladder adder43 (.x(A[43]), .y(B[43]), .z(carry[42]), .sum(SUM_internal[43]), .carry(carry[43]));
    fulladder adder44 (.x(A[44]), .y(B[44]), .z(carry[43]), .sum(SUM_internal[44]), .carry(carry[44]));
    fulladder adder45 (.x(A[45]), .y(B[45]), .z(carry[44]), .sum(SUM_internal[45]), .carry(carry[45]));
    fulladder adder46 (.x(A[46]), .y(B[46]), .z(carry[45]), .sum(SUM_internal[46]), .carry(carry[46]));
    fulladder adder47 (.x(A[47]), .y(B[47]), .z(carry[46]), .sum(SUM_internal[47]), .carry(carry[47]));
    fulladder adder48 (.x(A[48]), .y(B[48]), .z(carry[47]), .sum(SUM_internal[48]), .carry(carry[48]));
    fulladder adder49 (.x(A[49]), .y(B[49]), .z(carry[48]), .sum(SUM_internal[49]), .carry(carry[49]));
    fulladder adder50 (.x(A[50]), .y(B[50]), .z(carry[49]), .sum(SUM_internal[50]), .carry(carry[50]));
    fulladder adder51 (.x(A[51]), .y(B[51]), .z(carry[50]), .sum(SUM_internal[51]), .carry(carry[51]));
    fulladder adder52 (.x(A[52]), .y(B[52]), .z(carry[51]), .sum(SUM_internal[52]), .carry(carry[52]));
    fulladder adder53 (.x(A[53]), .y(B[53]), .z(carry[52]), .sum(SUM_internal[53]), .carry(carry[53]));
    fulladder adder54 (.x(A[54]), .y(B[54]), .z(carry[53]), .sum(SUM_internal[54]), .carry(carry[54]));
    fulladder adder55 (.x(A[55]), .y(B[55]), .z(carry[54]), .sum(SUM_internal[55]), .carry(carry[55]));
    fulladder adder56 (.x(A[56]), .y(B[56]), .z(carry[55]), .sum(SUM_internal[56]), .carry(carry[56]));
    fulladder adder57 (.x(A[57]), .y(B[57]), .z(carry[56]), .sum(SUM_internal[57]), .carry(carry[57]));
    fulladder adder58 (.x(A[58]), .y(B[58]), .z(carry[57]), .sum(SUM_internal[58]), .carry(carry[58]));
    fulladder adder59 (.x(A[59]), .y(B[59]), .z(carry[58]), .sum(SUM_internal[59]), .carry(carry[59]));
    fulladder adder60 (.x(A[60]), .y(B[60]), .z(carry[59]), .sum(SUM_internal[60]), .carry(carry[60]));
    fulladder adder61 (.x(A[61]), .y(B[61]), .z(carry[60]), .sum(SUM_internal[61]), .carry(carry[61]));
    fulladder adder62 (.x(A[62]), .y(B[62]), .z(carry[61]), .sum(SUM_internal[62]), .carry(carry[62]));
    fulladder adder63 (.x(A[63]), .y(B[63]), .z(carry[62]), .sum(SUM_internal[63]), .carry(carry[63]));

    // Register inputs and outputs
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A <= 64'b0;
            B <= 64'b0;
            Cin <= 1'b0;
            SUM_out <= 64'b0;
            Cout_out <= 1'b0;
        end else begin
            A <= A_in;
            B <= B_in;
            Cin <= Cin_in;
            SUM_out <= SUM_internal;
            Cout_out <= carry[63];
        end
    end

endmodule
