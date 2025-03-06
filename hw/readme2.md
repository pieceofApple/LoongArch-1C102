//------------------------------------------------------------------------------
// VGA  单独测试
//------------------------------------------------------------------------------
/*
parameter    BLACK      =   16'h0000  ;    //   黑色    
parameter    NAVY       =   16'h000F  ;   //    深蓝色  
parameter    DGREEN     =   16'h03E0  ;     //  深绿色  
parameter    DCYAN      =   16'h03EF  ;    //   深青色  
parameter    MAROON     =   16'h7800  ;    //   深红色      
parameter    PURPLE     =   16'h780F  ;    //   紫色  
parameter    OLIVE      =   16'h7BE0  ;    //   橄榄绿      
parameter    LGRAY      =   16'hC618  ;     //  灰白色
parameter    DGRAY      =   16'h7BEF  ;     //  深灰色      
parameter    BLUE       =   16'h001F  ;     //  蓝色    
parameter    GREEN      =   16'h07E0  ;     //  绿色          
parameter    CYAN       =   16'h07FF  ;     //  青色  
parameter    RED        =   16'hF800  ;     //  红色       
parameter    MAGENTA    =   16'hF81F  ;     //  品红    
parameter    YELLOW     =   16'hFFE0  ;     //  黄色        
parameter    WHITE      =   16'hFFFF  ;     //  白色  


wire    [15:0]  rd_vga_data         ;  //sdram_ctrl模块读数据
	assign rd_vga_data = YELLOW ;
    vga_ctrl    vga_ctrl_inst
    (
        .vga_clk        (clk_25m    ),  //输入工作时钟,频率25MHz
        .sys_rst_n      (RSTN      ),  //输入复位信号,低电平有效
        .pix_data       (rd_vga_data    ),  //待显示数据输入

        .pix_data_req   (rd_en      ),  //数据请求信号
        .hsync          (vga_out_hsync     ),  //输出行同步信号
        .vsync          (vga_out_vsync     ),  //输出场同步信号
        .rgb            (vga_out_rgb    )   //输出像素信息
    );
*/

