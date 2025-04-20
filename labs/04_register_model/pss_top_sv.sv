`include "zsp_sv_macros.svh"
package pss_types;
    import zsp_sv::*;
    
    typedef class pss_import_api;
    // TODO: define model-specific executor class
    typedef executor_base executor_base_c;
    typedef executor_base executor_t;
    typedef class executor_pkg__executor_trait_s;
    typedef class executor_pkg__empty_executor_trait_s;
    typedef class executor_pkg__executor_base_c;
    typedef class addr_reg_pkg__addr_space_base_c;
    typedef class addr_reg_pkg__addr_trait_s;
    typedef class addr_reg_pkg__empty_addr_trait_s;
    typedef class addr_handle_t;
    typedef class addr_reg_pkg__addr_region_base_s;
    typedef class addr_reg_pkg__addr_claim_base_s;
    typedef class addr_reg_pkg__reg_group_c;
    typedef class CSR_s;
    typedef class std_pkg__packed_s;
    typedef class CH_CSR_s;
    typedef class addr_reg_pkg__reg_c;
    typedef class addr_reg_pkg__transparent_addr_space_c;
    typedef class addr_reg_pkg__contiguous_addr_space_c;
    typedef class pss_top__Entry;
    typedef class addr_reg_pkg__addr_region_s;
    typedef class dma_regs;
    typedef class dma_channel_regs;
    typedef class pss_top;
    
    class executor_pkg__executor_trait_s extends object;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(executor_pkg__executor_trait_s rhs);
        endfunction
        
        static function executor_pkg__executor_trait_s create_default();
            executor_pkg__executor_trait_s ret = new();
            return ret;
        endfunction
        
        static function executor_pkg__executor_trait_s create_init();
            executor_pkg__executor_trait_s ret = new();
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class executor_pkg__empty_executor_trait_s extends object;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(executor_pkg__empty_executor_trait_s rhs);
        endfunction
        
        static function executor_pkg__empty_executor_trait_s create_default();
            executor_pkg__empty_executor_trait_s ret = new();
            return ret;
        endfunction
        
        static function executor_pkg__empty_executor_trait_s create_init();
            executor_pkg__empty_executor_trait_s ret = new();
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class executor_pkg__executor_base_c extends component;
        
        function new(string name, component_ctor_ctxt ctxt, component parent=null);
            super.new(name, ctxt, parent);
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
        endfunction
        
        
        
        function void do_init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        
        
        virtual function bit check();
            bit ret = 1;
            return ret;
        endfunction
    endclass
    
    class addr_reg_pkg__addr_space_base_c extends component;
        
        function new(string name, component_ctor_ctxt ctxt, component parent=null);
            super.new(name, ctxt, parent);
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
        endfunction
        
        
        
        function void do_init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        
        
        virtual function bit check();
            bit ret = 1;
            return ret;
        endfunction
    endclass
    
    class addr_reg_pkg__addr_trait_s extends object;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_trait_s rhs);
        endfunction
        
        static function addr_reg_pkg__addr_trait_s create_default();
            addr_reg_pkg__addr_trait_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_trait_s create_init();
            addr_reg_pkg__addr_trait_s ret = new();
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class addr_reg_pkg__empty_addr_trait_s extends object;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__empty_addr_trait_s rhs);
        endfunction
        
        static function addr_reg_pkg__empty_addr_trait_s create_default();
            addr_reg_pkg__empty_addr_trait_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__empty_addr_trait_s create_init();
            addr_reg_pkg__empty_addr_trait_s ret = new();
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    
    class addr_reg_pkg__addr_region_base_s extends addr_region_base_s;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_region_base_s rhs);
            size = rhs.size;
        endfunction
        
        static function addr_reg_pkg__addr_region_base_s create_default();
            addr_reg_pkg__addr_region_base_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_region_base_s create_init(
                longint unsigned size);
            addr_reg_pkg__addr_region_base_s ret = new();
            ret.size = size;
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class addr_reg_pkg__addr_claim_base_s extends object;
        rand bit[63:0] size;
        rand bit permanent;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_claim_base_s rhs);
            size = rhs.size;
            permanent = rhs.permanent;
        endfunction
        
        static function addr_reg_pkg__addr_claim_base_s create_default();
            addr_reg_pkg__addr_claim_base_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_claim_base_s create_init(
                longint unsigned size,
                bit permanent);
            addr_reg_pkg__addr_claim_base_s ret = new();
            ret.size = size;
            ret.permanent = permanent;
            return ret;
        endfunction
        constraint c_0x1264cf0 {
