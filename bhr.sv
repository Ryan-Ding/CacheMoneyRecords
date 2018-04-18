module bhr #(parameter width = 4)
(
    input clk,
    input load,
    input taken,
    output logic [width-1:0] bhrout
);
logic [width-1:0] data;

/* Initialize array */

initial
begin
    data = 1'b0;
end

always_ff @(posedge clk)
begin
    if (load)
    begin
        data = {data[width-2:0],taken};
    end
end

assign bhrout = data;

endmodule : bhr