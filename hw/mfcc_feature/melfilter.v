module MelFilter(
    input [N-1:0] real, // 实部输入
    input [N-1:0] image, // 虚部输入
    //这三个信号是用来指定 Mel 滤波器中每个段的起始点、峰值点和结束点的位置。
    //它们用于控制 Mel 滤波器在频谱上的工作范围，以便对输入信号进行滤波处理。
    //通常情况下，这些点是根据特定的频率范围和滤波器设计来确定的。
    input [31:0] StartPoint,
    input [31:0] PeakPoint,
    input [31:0] StopPoint,
    output [31:0] result
);

parameter WIDTH = 16; // 实部和虚部的宽度
parameter M = 16; // FFT 点数

reg [2*WIDTH-1:0] Sum;
reg [31:0] i;
reg [2*WIDTH-1:0] abs_squared;

always @(*) begin
    Sum = 0;
    for (i = StartPoint + 1; i < PeakPoint; i = i + 1) begin
        abs_squared = real[i]*real[i] + image[i]*image[i];
        Sum = Sum + abs_squared * ((i - StartPoint) / (PeakPoint - StartPoint));
    end
    for (i = PeakPoint; i < StopPoint; i = i + 1) begin
        abs_squared = real[i]*real[i] + image[i]*image[i];
        Sum = Sum + abs_squared * ((StopPoint - i) / (StopPoint - PeakPoint));
    end
    if (Sum <= 0)
        result = 0;
    else
        result = $log(Sum);
end

endmodule
