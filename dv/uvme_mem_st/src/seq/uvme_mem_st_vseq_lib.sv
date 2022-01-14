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


`ifndef __UVME_MEM_ST_VSEQ_LIB_SV__
`define __UVME_MEM_ST_VSEQ_LIB_SV__


`include "uvme_mem_st_base_vseq.sv"


/**
 * Object cataloging the Memory Modeling self-test environment's virtual sequences.
 */
class uvme_mem_st_vseq_lib_c extends uvm_sequence_library #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);
   
   `uvm_object_utils          (uvme_mem_st_vseq_lib_c)
   `uvm_sequence_library_utils(uvme_mem_st_vseq_lib_c)
   
   /**
    * Initializes sequence library
    */
   extern function new(string name="uvme_mem_st_vseq_lib");
   
endclass : uvme_mem_st_vseq_lib_c


function uvme_mem_st_vseq_lib_c::new(string name="uvme_mem_st_vseq_lib");
   
   super.new(name);
   init_sequence_library();
   
   // TODO Add sequences to uvme_mem_st_seq_lib_c
   //      Ex: add_sequence(uvme_mem_st_abc_seq_c::get_type());
   
endfunction : new


`endif // __UVME_MEM_ST_VSEQ_LIB_SV__
