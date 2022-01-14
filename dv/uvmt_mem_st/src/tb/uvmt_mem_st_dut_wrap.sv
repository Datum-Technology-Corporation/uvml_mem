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


`ifndef __UVMT_MEM_ST_DUT_WRAP_SV__
`define __UVMT_MEM_ST_DUT_WRAP_SV__


/**
 * Module wrapper for Memory Modeling RTL DUT.  All ports are SV interfaces.
 */
module uvmt_mem_st_dut_wrap(
   uvma_mem_if  abc_if,
   uvma_mem_if  xyz_if
);
   
   // TODO Instantiate Device Under Test (DUT)
   //      Ex: mem_st_top  dut(
   //             .abc(abc_if.abc),
   //             .xyz(xyz_if.xyz),
   //          );
   
endmodule : uvmt_mem_st_dut_wrap


`endif // __UVMT_MEM_ST_DUT_WRAP_SV__
