Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE68A1E663D
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 17:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404209AbgE1Pfs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 11:35:48 -0400
Received: from mga17.intel.com ([192.55.52.151]:22947 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404218AbgE1Pfq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 11:35:46 -0400
IronPort-SDR: 7ymR2pejEJ8ByTZkFSGWIn4h6PRDeW5Tjny7KzVRgTyN52OoTPlQs6q1hIOPBhUx0GC7uf2k+D
 lQN5Sfb1xaJw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 08:35:45 -0700
IronPort-SDR: sXPKXO3wkFWOkAdnZpr2krg/D4fragJU6/8L7l08jgIB91MEo2NHukoe7+nNVs7TVUpMddNMAX
 9TAiJEXxGAaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; 
   d="scan'208";a="345941386"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga001.jf.intel.com with ESMTP; 28 May 2020 08:35:41 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com
Cc:     richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com,
        "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v9 0/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC 
Date:   Thu, 28 May 2020 23:34:17 +0800
Message-Id: <20200528153419.46775-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch adds the new IP of Nand Flash Controller(NFC) support
on Intel's Lightning Mountain(LGM) SoC.

DMA is used for burst data transfer operation, also DMA HW supports
aligned 32bit memory address and aligned data access by default.
DMA burst of 8 supported. Data register used to support the read/write
operation from/to device.

NAND controller also supports in-built HW ECC engine.

NAND controller driver implements ->exec_op() to replace legacy hooks,
these specific call-back method to execute NAND operations.

Thanks Boris, Andy, Arnd and Rob for the review comments and suggestions.
---
v10:
  - No Change
v9:
  - No change 
v8:
  - fix the kbuild bot warnings
  - correct the typo's
v7:
  - indentation issue is fixed
  - add error check for retrieve the resource from dt
v6:
  - update EBU_ADDR_SELx register base value build it from DT
  - Add tabs in in Kconfig
v5:
  - replace by 'HSNAND_CLE_OFFS | HSNAND_CS_OFFS' to NAND_WRITE_CMD and NAND_WRITE_ADDR
  - remove the unused macros
  - update EBU_ADDR_MASK(x) macro
  - update the EBU_ADDR_SELx register values to be written
v4:
  - add ebu_nand_cs structure for multiple-CS support
  - mask/offset encoding for 0x51 value
  - update macro HSNAND_CTL_ENABLE_ECC
  - drop the op argument and un-used macros.
  - updated the datatype and macros
  - add function disable nand module
  - remove ebu_host->dma_rx = NULL;
  - rename MMIO address range variables to ebu and hsnand
  - implement ->setup_data_interface()
  - update label err_cleanup_nand and err_cleanup_dma
  - add return value check in the nand_remove function
  - add/remove tabs and spaces as per coding standard
  - encoded CS ids by reg property
v3:
  - Add depends on MACRO in Kconfig
  - file name update in Makefile
  - file name update to intel-nand-controller
  - modification of MACRO divided like EBU, HSNAND and NAND
  - add NAND_ALE_OFFS, NAND_CLE_OFFS and NAND_CS_OFFS
  - rename lgm_ to ebu_ and _va suffix is removed in the whole file
  - rename structure and varaibles as per review comments.
  - remove lgm_read_byte(), lgm_dev_ready() and cmd_ctrl() un-used function
  - update in exec_op() as per review comments
  - rename function lgm_dma_exit() by lgm_dma_cleanup()
  - hardcoded magic value  for base and offset replaced by MACRO defined
  - mtd_device_unregister() + nand_cleanup() instead of nand_release()
v2:
  - implement the ->exec_op() to replaces the legacy hook-up.
  - update the commit message
  - add MIPS maintainers and xway_nand driver author in CC

v1:
 - initial version

dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC
---
v10:
  - fix bot errors
v9:
  - Rob's review comments address
  - dual licensed
  - compatible change
  - add reg-names
  - drop clock-names and clock-cells
  - correct typo's
v8:
  No change
v7:
  - Rob's review comments addressed
  - dt-schema build issue fixed with upgraded dt-schema
v6:
  - Rob's review comments addressed in YAML file
  - add addr_sel0 and addr_sel1 reg-names in YAML example
v5:
  - add the example in YAML file
v4:
  - No change
v3:
  - No change
v2:
  YAML compatible string update to intel, lgm-nand-controller
v1:
  - initial version

Ramuthevar Vadivel Murugan (2):
  dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC
  mtd: rawnand: Add NAND controller support on Intel LGM SoC

 .../devicetree/bindings/mtd/intel,lgm-nand.yaml    |  93 +++
 drivers/mtd/nand/raw/Kconfig                       |   8 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/intel-nand-controller.c       | 747 +++++++++++++++++++++
 4 files changed, 849 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/intel-nand-controller.c

-- 
2.11.0
