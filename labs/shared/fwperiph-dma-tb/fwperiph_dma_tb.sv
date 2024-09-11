
`include "svt_macros.svh"
`include "wishbone_macros.svh"
`include "fwvip_wb_macros.svh"
module fwperiph_dma_tb;
    import fwperiph_dma_tb_pkg::*;
    import fwvip_wb_pkg::*;

    reg clk = 0;
    reg rst = 1;
    initial begin
        forever begin
            #10ns;
            clk <= ~clk;
        end
    end

    initial begin
        #100ns;
        rst <= 0;
    end

    initial begin
        $display("Hello");
        $dumpfile("trace.vcd");
        $dumpvars(0);
        #100us;
        $finish;
    end

    `WB_WIRES_ARR(init2ic_, 32, 32, 3);
    `WB_WIRES_ARR(ic2targ_, 32, 32, 2);

    fwvip_wb_initiator wb_initiator(
        .clock(clk),
        .reset(rst),
        `WB_CONNECT_ARR( , init2ic_, 0, 32, 32)
    );
    // initial begin
    //     typedef virtual fwvip_wb_initiator #(32,32) vif_t;
    //     automatic fwvip_wb_initiator_api_p #(vif_t, 32, 32) api;
    //     api = new(wb_initiator, wb_initiator.path());
    //     fwvip_wb_initiator_rgy.register(api);
    // end
    `fwvip_wb_register_initiator(wb_initiator, 32, 32);

    wb_interconnect_NxN #(
        .N_INITIATORS(3), // testbench BFM + 2 DMA
        .N_TARGETS(2), // DMA + memory
        .T_ADR_MASK({
            32'hF000_0000,
            32'hF000_0000
        }),
        .T_ADR({
            32'h0000_0000,
            32'h1000_0000
        })
    ) u_ic (
        .clock(clk),
        .reset(rst),
        `WB_CONNECT( , init2ic_),
        `WB_CONNECT(t, ic2targ_)
    );

    localparam ch_count = 4;

	wire[ch_count-1:0]		dma_req_i = {ch_count{1'b0}};
	wire[ch_count-1:0]	    dma_ack_o;
	wire[ch_count-1:0]		dma_nd_i = {ch_count{1'b0}};
	wire[ch_count-1:0]		dma_rest_i = {ch_count{1'b0}};

	wire 					inta_o; 
	wire 					intb_o;

    fwperiph_dma_wb #(
        .ch_count(ch_count)
    ) u_dma (
        .clock(clk),
        .reset(rst),
        `WB_CONNECT_ARR(rt_, ic2targ_, 0, 32, 32),
        `WB_CONNECT_ARR(i0_, init2ic_, 1, 32, 32),
        `WB_CONNECT_ARR(i1_, init2ic_, 2, 32, 32),
        .dma_req_i(dma_req_i),
        .dma_ack_o(dma_ack_o),
        .dma_nd_i(dma_nd_i),
        .dma_rest_i(dma_rest_i),
        .inta_o(inta_o),
        .intb_o(intb_o)
    );

    `WB_WIRES(mem_, 32, 32);
    `WB_ASSIGN_ARR2WIRES(mem_, ic2targ_, 1, 32, 32);

    assign mem_err = 1'b0;

    reg[31:0]                   mem[(64*1024)-1:0];

    reg[1:0] state;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 2'b00;
        end else begin
            case (state)
                2'b00: begin
                    if (mem_cyc && mem_sel) begin
                        state <= 1'b1;
                    end
                end
            endcase
        end
    end

endmodule
