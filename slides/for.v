integer i;
reg [7:0] array [0:7];

initial begin
	for (i = 0; i < 8; i = i + 1) begin
		array[i] = 0;
	end
end