
`include "svt_macros.svh"
package fwperiph_dma_tb_pkg;
    import svt_pkg::*;
    import fwvip_wb_pkg::*;

    class fwperiph_dma_env extends svt_component;
        function new(string name, svt_component parent);
            super.new(name, parent);
        endfunction

    endclass

    class fwperiph_dma_test_base extends svt_test;
        fwperiph_dma_env    m_env;
        

        function new(string name);
            super.new(name);
        endfunction

        function void build();
            m_env = new("env", this);
        endfunction


    endclass

endpackage

