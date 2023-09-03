module d_cache(
    input clk,
    input rst,
    input [31:0] addr,
    input write_en,
    input [31:0] data_in,
    output [31:0] data_out
);
    reg [31:0] mem [511:0];
    
    // write
    integer j;
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            for(j =0; j<512;j=j+1) mem[j] <= 32'd0;             
        end
        else if(we) begin
        // if(we) begin
            mem[d_addr] <= data_in;
        end
    end

    always @(*) begin
        data_out = mem[d_addr];
    end

endmodule