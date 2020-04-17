Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59731AD86A
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 10:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729629AbgDQIXG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 04:23:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:62216 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729176AbgDQIXG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Apr 2020 04:23:06 -0400
IronPort-SDR: 01Sya9bg7UYTJdBvm3kTd579S1Osp92pfljBNcu5u0adGqAvZckUrweCkLa5xRamTcxNTRFyXn
 eFKExCsNU3XQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 01:23:06 -0700
IronPort-SDR: oAqIaDm9qhb5Su1LLPerg1oTUd1hRwUw4hTwKgqEiHDu5jiY8UXJQaQgXa/Na8ikJlBlv0rtsc
 RCIl/egDXZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="428156049"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga005.jf.intel.com with ESMTP; 17 Apr 2020 01:23:01 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        arnd@arndb.de, brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, piotrs@cadence.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com,
        "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v2 0/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date:   Fri, 17 Apr 2020 16:21:45 +0800
Message-Id: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
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

Thank you very much Boris, Martin and Andy for the suggestions and inputs.
---
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
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/intel_lgm_nand.c              | 740 +++++++++++++++++++++
 4 files changed, 809 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/intel_lgm_nand.c

-- 
2.11.0

