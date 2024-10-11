
module memory_rw_tb;
    import svt_pkg::*;
    import memory_rw_pkg::*;

    fwperiph_dma_tb     core();

    initial begin
        $display("Hello!");
        svt_runtest();
    end

endmodule
