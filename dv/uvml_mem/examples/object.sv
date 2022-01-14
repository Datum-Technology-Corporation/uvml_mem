// Copyright 2022 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/**
 * This file contains sample code that demonstrates how to add a new UVM Object to the Memory Modeling UVM Library.
 */


`ifndef __UVML_MEM_MY_OBJ_SV__
`define __UVML_MEM_MY_OBJ_SV__


/**
 * My sample object.
 */
class uvml_mem_my_obj_c extends uvm_object;
   
   // Fields
   
   
   `uvm_object_utils_begin(uvml_mem_my_obj_c)
      // UVM Field Macros
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_mem_my_obj");
   
endclass : uvml_mem_my_obj_c


function uvml_mem_my_obj_c::new(string name="uvml_mem_my_obj");
   
   super.new(name);
   
endfunction : new


`endif __UVML_MEM_MY_OBJ_SV__
