Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B3827FB00
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 10:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbgJAIG0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Oct 2020 04:06:26 -0400
Received: from mga01.intel.com ([192.55.52.88]:14393 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbgJAIGZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Oct 2020 04:06:25 -0400
IronPort-SDR: FcXR+XZSZGDSKau7tUTsnWBBZTCsgfulSBqgQQG60uDtVKpqRgdvzxj69snLreZnwcPEiquKAk
 Xp/RUiQA3WpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="180818755"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="180818755"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 01:06:24 -0700
IronPort-SDR: 6H8+i0K3P4/xvUect3IabH1RRHiUCE5ESqWYukRiKT03IqhcbxI/lr/uja/B9lJFQtAFamjxa4
 coq/jysOt8PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="351019127"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2020 01:06:20 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org
Cc:     linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
        boris.brezillon@collabora.com, christophe.kerello@st.com,
        piotrs@cadence.com, robert.jarzmik@free.fr,
        brendanhiggins@google.com, devicetree@vger.kernel.org,
        tglx@linutronix.de, hauke.mehrtens@intel.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, arnd@arndb.de,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com,
        "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v15 0/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date:   Thu,  1 Oct 2020 16:06:16 +0800
Message-Id: <20201001080618.50994-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
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

Thanks Miquel, Boris, Andy, Arnd and Rob for the review comments and suggestions.
---
v15:
  - Address Miquel review comments update
  - add common helper function for status check for
    ebu_nand_waitrdy()
v14:
  - Address Andy's review comments
  - align the headers and revome Duplicates
  - replcace numerical const values by HZ_PER_MHZ and USEC_PER_SEC
    defined macros
  - add dev_err_probe() api instead of legacy err check
  - add get_unaligned_le32() api instead of manual endiness
  - remove redudent check
  - split the lines logically in between and add require spaces
v13:
  - Address Miquel Raynal review comments
  - update the return type with variable 'ret'
  - handle err check statement properly
  - change the naming convention aligned with recently changed the naming
    around the data interface
    data structure and function names
  - replace by div 8 instead of <<4 in ecc calculation better code readability
  - handle check_only properly like existing drivers
v12-resend:
  - No Change
v12:
  - address Miquel Raynal review comments update
  - add/modify the comments for better understanding
  - handle the check_only variable
  - update the ecc function based on the existing drivers
  - add newline
  - verify that mtd->name is set after nand_set_flash_node()
  - add the check WARN_ON(ret);
v11-resend:
  - Rebase to v5.8-rc1
v11:
  - No Change
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
v15:
  - No change
v14:
  - No change
v13:
  - No change
v12-Resend:
  - No Change
v12:
  - No change
v11-resend:
  - No change
v11:
  - Fixed the compatible issue with example
10:
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

 .../devicetree/bindings/mtd/intel,lgm-nand.yaml    |  99 +++
 drivers/mtd/nand/raw/Kconfig                       |   8 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/intel-nand-controller.c       | 737 +++++++++++++++++++++
 4 files changed, 845 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/intel-nand-controller.c

-- 
2.11.0

