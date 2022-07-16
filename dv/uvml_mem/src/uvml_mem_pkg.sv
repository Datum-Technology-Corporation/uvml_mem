// Copyright 2021 OpenHW Group
// Copyright 2021 Datum Technology Corporation
// Copyright 2021 Silicon Labs
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_MEM_PKG_SV__
`define __UVML_MEM_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_mem_macros.svh"


/**
 * Encapsulates all the types needed for Memory base class library.
 */
package uvml_mem_pkg;

   import uvm_pkg::*;

   // Constants / Structs / Enums
   `include "uvml_mem_tdefs.sv"
   `include "uvml_mem_constants.sv"

   // Objects
   `include "uvml_mem_model.sv"

endpackage : uvml_mem_pkg


`endif // __UVML_MEM_PKG_SV__
