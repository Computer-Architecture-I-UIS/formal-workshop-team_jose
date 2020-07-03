
module wrapper(
  input        clk,
  input        reset,
  input  [7:0] io_periodCounter,
  input        io_en,
  input  [7:0] io_dutyCicle,
  output       io_out,
  output [7:0] io_contador
);

  reg init  = 1;
  reg Rinit = 1;

  always @(posedge clk) begin
    init <= 0;
    Rinit <= init;

    if (Rinit)begin
       assume(reset);
    end
       
    assume (io_dutyCicle>0); 
    assume (io_periodCounter > 0);
    assume (io_dutyCicle<io_periodCounter);      
    
    
    if (!reset ) begin
    	if (reset) begin
    	assert (io_contador == 0);
    	end
    	
    	if (!io_en)begin
    	assert (io_out == 0);
    	end
    	
        if(io_contador <= io_dutyCicle && io_contador>0)begin
        assume (io_en);
    	assert (io_out == 1);
    	end
    	
    	if (io_contador>io_dutyCicle && io_contador<= io_periodCounter)begin
    	assume (io_en);
    	assert (io_out == 0);
    	end
    	
    	if(io_contador>8'h1)begin
    	assume(io_en);
    	assert (io_contador==$past(io_contador)+1'b1);
    	end
    	
    	
    	
    end
/*END DEL ALWAYS*/
  end 


  PWM PWM(
    .clock(clk),
    .reset(reset),
    .io_periodCounter(io_periodCounter),
    .io_en(io_en),
    .io_dutyCicle(io_dutyCicle),
    .io_out(io_out),
    .io_contador(io_contador)
  );

endmodule
