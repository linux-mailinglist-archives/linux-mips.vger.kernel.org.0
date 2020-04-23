Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8DB1B60A7
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 18:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729512AbgDWQWJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 12:22:09 -0400
Received: from mga18.intel.com ([134.134.136.126]:20646 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729477AbgDWQWI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 12:22:08 -0400
IronPort-SDR: daDRwMEVdYKP8z3z5u2+kbDy209qVdnZqImId1ARU4I02xw7Sj1rjjNRN0Eht3aHcw8IKEiQAo
 L4KH5xWue2Qw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 09:22:07 -0700
IronPort-SDR: pj0Y69wd4xhPZUL8O7agmF9d049aFDa29eVS+FtC4Ct+GxciTXL40ScRSE4MuzZ9LrtneqtnH0
 E1E4L2J/QIng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="274283346"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga002.jf.intel.com with ESMTP; 23 Apr 2020 09:22:03 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        arnd@arndb.de, brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v3 0/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date:   Fri, 24 Apr 2020 00:21:11 +0800
Message-Id: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

This patch adds the new IP of Nand Flash Controller(NFC) support
on Intel's Lightning Mountain(LGM) SoC.

DMA is used for burst data transfer operation, also DMA HW supports
aligned 32bit memory address and aligned data access by default.
DMA burst of 8 supported. Data register used to support the read/write
operation from/to device.

NAND controller also supports in-built HW ECC engine.

NAND controller driver implements ->exec_op() to replace legacy hooks,
these specific call-back method to execute NAND operations.

Thank you very much Boris and Hauke for the reviews and suggestions.
---
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
  - YAML compatible string update to intel, lgm-nand-controller
  - add MIPS maintainers and xway_nand driver author in CC

v1:
 - initial version
 


Ramuthevar Vadivel Murugan (2):
  dt-bindings: mtd: Add YAML for Nand Flash Controller support
  mtd: rawnand: Add NAND controller support on Intel LGM SoC

 .../devicetree/bindings/mtd/intel,lgm-nand.yaml    |  61 ++
 drivers/mtd/nand/raw/Kconfig                       |   8 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/intel-nand-controller.c       | 705 +++++++++++++++++++++
 4 files changed, 775 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/intel-nand-controller.c

-- 
2.11.0

