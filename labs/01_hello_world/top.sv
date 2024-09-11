/*****************************************************************************
 * top.sv
 *
 * Copyright 2024 Matthew Ballance and Contributors
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may 
 * not use this file except in compliance with the License.  
 * You may obtain a copy of the License at:
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  
 * See the License for the specific language governing permissions and 
 * limitations under the License.
 *
 * Created on:
 *     Author: 
 *
 ****************************************************************************/
package api_impl_pkg;
    import zsp_sv::*;
    import pss_top__Entry_pkg::*;

    class api_impl extends backend_api_null implements pss_top__Entry_prv::import_api;
    /*
    virtual task write64(bit[63:0] addr, bit[63:0] data); 
    endtask
    virtual task write32(bit[63:0] addr, bit[31:0] data);
    endtask
    virtual task write16(bit[63:0] addr, bit[15:0] data);
    endtask
    virtual task write8(bit[63:0] addr, bit[7:0] data);
    endtask
    virtual task read64(output bit[63:0] data, input bit[63:0] addr);
    endtask
    virtual task read32(output bit[31:0] data, input bit[63:0] addr);
    endtask
    virtual task read16(output bit[15:0] data, input bit[63:0] addr);
    endtask
    virtual task read8(output bit[7:0] data, input bit[63:0] addr);
    endtask
     */
    endclass
endpackage

module top;
    import pss_top__Entry_pkg::*;
    import api_impl_pkg::*;

    initial begin
        automatic api_impl api = new();
        automatic pss_top__Entry actor = new(api);

        actor.run();

        $finish;
    end

endmodule

