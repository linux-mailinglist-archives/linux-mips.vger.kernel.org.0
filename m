Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2E4735E2D
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjFSUK1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjFSUK0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:10:26 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 19 Jun 2023 13:10:21 PDT
Received: from h3.cmg1.smtp.forpsi.com (h3.cmg1.smtp.forpsi.com [185.129.138.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB898E6E
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:10:21 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLBbq50RuPm6CBLBdqL6kC; Mon, 19 Jun 2023 22:09:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205358; bh=CpLVGA/xUrCUq5nRW5hLiKrSYTsZSoXLsaLOF2oTla0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=zEmL5dGmneKh3Z/eISJcXKNb82Nc3Yc0dJigodbZ4e1UNd2U47KVbi+1P0CJLgLf+
         MAOY9pf5zGFe5zjMbsbiw+K5bJDbsxs88Ib5XvPx6b1NgYo7UbJH8V2rAkp6Gfhj0y
         KEkpRAEkqfjxZ0FSt9+S5s6GCAd+rwNL6qesaZ1JFPnGM/JkWeJbLcCCm8DhvGRQS/
         j+FIVTnbkxM7IJMJ3djTa5thFGoTKb2E9Podu5MtzxRT+ALDMgR689MZJqBll8cO75
         /1ycqXbqJBJCS/kXs2vnXdOVCTrr4Nyj9+0GwRhcpNIHwway1UpU+hAiRC7lhjJ5J1
         CFmIww0i2gAeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205358; bh=CpLVGA/xUrCUq5nRW5hLiKrSYTsZSoXLsaLOF2oTla0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=zEmL5dGmneKh3Z/eISJcXKNb82Nc3Yc0dJigodbZ4e1UNd2U47KVbi+1P0CJLgLf+
         MAOY9pf5zGFe5zjMbsbiw+K5bJDbsxs88Ib5XvPx6b1NgYo7UbJH8V2rAkp6Gfhj0y
         KEkpRAEkqfjxZ0FSt9+S5s6GCAd+rwNL6qesaZ1JFPnGM/JkWeJbLcCCm8DhvGRQS/
         j+FIVTnbkxM7IJMJ3djTa5thFGoTKb2E9Podu5MtzxRT+ALDMgR689MZJqBll8cO75
         /1ycqXbqJBJCS/kXs2vnXdOVCTrr4Nyj9+0GwRhcpNIHwway1UpU+hAiRC7lhjJ5J1
         CFmIww0i2gAeg==
Date:   Mon, 19 Jun 2023 22:09:15 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Message-ID: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfOn5qklmf53BIzAisUu3vjMV5Vf2pDY0msDKCkn/TSXo7OzzTGHDuG+7vp2G8Ziz1x8Hle4xLqD0iG1PDyVJyGVMv9Xd0Sz4pRvnPiJOPhP0QRMT3ezb
 0ND2LQaKvJfiItWR0MRGS03C6oj94b0acz9FrGe8CNr1FTRKfJXFUmUcwiXE7LNB5vEs1WLJZLORG7O6SmAbdTuVxvjTqtrdWiaqjwjHIzdDma+3vu6d3c9e
 XrPRCusD4u/Qr8Bl0Tu+xQ==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

primary motivation was to fix issue Id 29206 as described in
OCTEON III CN70XX/CN71XX Known Issues, version: 1.9.
Said document is marked as Marvell Proprietary and Confidential,
therefore I'm not sure if I can cite from it.

This probably does not matter too much as the root of the information
listed there is a workaround being implemented in OCTEON SDK 3.1.2
patch 7 and later in
u-boot/drivers/usb/host/xhci-octeon.c:dwc3_uphy_pll_reset()

My coleague ported that patch to linux-4.9 and it is appended to
this cover letter for a reference.

The glue code currently lives in arch/mips/cavium-octeon/octeon-usb.c
and loops for each "cavium,octeon-7130-usb-uctl" compatible.
However there is no bond with dwc3 core code, so if anything goes
wrong in glue code, the loop breaks, leaving dwc3 in reset.

Later on when dwc3 core tries to read any device register, bus error
is emited, leading to kernel panic.

Therefore glue code is cleaned-up first, then moved to drivers/usb/dwc3
and modified to match current state of art.

Now it is easier to properly implement said errata. Does it belong
to core code as a quirk? Comments and suggestions welcome.

Ladislav Michl (11):
  MIPS: OCTEON: octeon-usb: add all register offsets
  MIPS: OCTEON: octeon-usb: use bitfields for control register
  MIPS: OCTEON: octeon-usb: use bitfields for host config register
  MIPS: OCTEON: octeon-usb: use bitfields for shim register
  MIPS: OCTEON: octeon-usb: move gpio config to separate function
  MIPS: OCTEON: octeon-usb: introduce dwc3_octeon_{read,write}q
  MIPS: OCTEON: octeon-usb: cleanup divider calculation
  usb: dwc3: Move Octeon glue code from arch/mips
  usb: dwc3: dwc3-octeon: Convert to glue driver
  usb: dwc3: dwc3-octeon: Move node parsing into driver probe
  usb: dwc3: Add SPDX header and copyright

 arch/mips/cavium-octeon/Makefile          |   1 -
 arch/mips/cavium-octeon/octeon-platform.c |   1 -
 arch/mips/cavium-octeon/octeon-usb.c      | 548 ----------------------
 drivers/usb/dwc3/Kconfig                  |   9 +
 drivers/usb/dwc3/Makefile                 |   1 +
 drivers/usb/dwc3/dwc3-octeon.c            | 545 +++++++++++++++++++++
 drivers/usb/dwc3/dwc3-of-simple.c         |   1 -
 7 files changed, 555 insertions(+), 551 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/octeon-usb.c
 create mode 100644 drivers/usb/dwc3/dwc3-octeon.c

---
 arch/mips/cavium-octeon/octeon-usb.c | 592 +++++++++++++++++++++++++++
 1 file changed, 592 insertions(+)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 514af27e23ff..544c2db6c6c3 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -14,7 +14,9 @@
 #include <linux/delay.h>
 #include <linux/of_platform.h>
 #include <linux/io.h>
+#include <linux/jiffies.h>
 
+#include <asm/octeon/cvmx-usbdrdx-defs.h>
 #include <asm/octeon/octeon.h>
 
 /* USB Control Register */
@@ -225,6 +227,371 @@ static DEFINE_MUTEX(dwc3_octeon_clocks_mutex);
 static uint8_t clk_div[OCTEON_H_CLKDIV_SEL] = {1, 2, 4, 6, 8, 16, 24, 32};
 
 
+/**
+ * Reset PLL source on driver probe.
+ * Patch taken from: u-boot/drivers/usb/host/xhci-octeon.c:octeon3_usb_clocks_start
+ */
+
+/** Internal indirect UPHY register that controls the power to the UPHY PLL. */
+#define DWC3_INT_IND_UPHY_PLL_PU			0x2012
+/** Internal indirect UPHY PLL register */
+#define DWC3_INT_IND_UPHY_PLL_RESET			0x201C
+/**
+ * Internal indirect register that reports if the phy PLL has lock.  This will
+ * be 1 if lock, 0 if no lock.
+ */
+#define DWC3_INT_IND_PLL_LOCK_REG			0x200b
+
+/** Write enable bit */
+#define DWC3_INT_IND_UPHY_PLL_RESET_WE			(1 << 4)
+/** VCO reset bit */
+#define DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST		(1 << 0)
+/** Write enable bit for DWC3_INT_IND_PLL_POWER_CTL */
+#define DWC3_INT_IND_UPHY_PLL_PU_WE			0x20
+/** Power enable bit for DWC3_INT_IND_PLL_POWER_CTL */
+#define DWC3_INT_IND_UPHY_PLL_PU_POWER_EN		0x02
+
+
+/**
+ * Indirectly read internal DWC3 UPHY registers
+ *
+ * @param	node	CPU node number
+ * @param	index	Port index
+ * @param	addr	Address of register to read
+ *
+ * @return	16-bit register value
+ */
+uint32_t dwc3_uphy_indirect_read(struct device *dev, int node, int index, uint32_t addr)
+{
+	union cvmx_usbdrdx_uctl_portx_cr_dbg_cfg dbg_cfg;
+	union cvmx_usbdrdx_uctl_portx_cr_dbg_status status;
+	unsigned long start;
+	uint16_t data = 0xffff;
+
+
+	/* 1 */
+	dbg_cfg.u64 = 0;
+	dbg_cfg.s.data_in = addr;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 2 */
+	dbg_cfg.s.cap_addr = 1;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 3 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+				CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 1 && jiffies< (start + HZ));
+	if (status.s.ack != 1) {
+		dev_warn(dev, "%s(%d, %d, 0x%x): status ack = 1 timeout\n", __func__,
+			 node, index, addr);
+		return data;
+	}
+
+	/* 4 */
+	dbg_cfg.u64 = 0;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 5 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+				CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 0 && jiffies< (start + HZ));
+	if (status.s.ack) {
+		dev_warn(dev, "%s(%d, %d, 0x%x): status ack = 0 timeout\n", __func__,
+			 node, index, addr);
+		return data;
+	}
+
+	/* 6 */
+	dbg_cfg.s.read = 1;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 7 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+				CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 1 && jiffies< (start + HZ));
+	if (status.s.ack != 1) {
+		dev_warn(dev, "%s(%d, %d, 0x%x): Status ack = 0 get data timeout\n",
+			 __func__, node, index, addr);
+		return 0xffff;
+	}
+	/* 8 */
+	data = status.s.data_out;
+	/* 9 */
+	dbg_cfg.u64 = 0;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 10 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+				CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 0 && jiffies< (start + HZ));
+	if (status.s.ack != 0) {
+		dev_warn(dev, "%s(%d, %d, 0x%x): Final ack timeout\n", __func__,
+			 node, index, addr);
+		return 0xffff;
+	}
+
+	return data;
+}
+
+/**
+ * Indirectly write internal DWC3 UPHY registers
+ *
+ * @param	node	CPU node number
+ * @param	index	Port index
+ * @param	addr	Address of register to read
+ *
+ * @return	0 for success
+ */
+static uint32_t dwc3_uphy_indirect_write(struct device *dev, int node, int index,
+					   uint32_t addr, uint16_t value)
+{
+	union cvmx_usbdrdx_uctl_portx_cr_dbg_cfg dbg_cfg;
+	union cvmx_usbdrdx_uctl_portx_cr_dbg_status status;
+	unsigned long start;
+
+	/* 1 */
+	dbg_cfg.u64 = 0;
+	dbg_cfg.s.data_in = addr;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 2 */
+	dbg_cfg.s.cap_addr = 1;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 3 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+						CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 1 && jiffies< (start + HZ));
+	if (status.s.ack != 1) {
+		dev_warn(dev, "%s(%d, %d, 0x%x, 0x%x): setting address timed out\n",
+			 __func__, node, index, addr, value);
+		return -1;
+	}
+	/* 4 */
+	dbg_cfg.u64 = 0;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 5 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+						CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 0 && jiffies< (start + HZ));
+	if (status.s.ack != 0) {
+		dev_dbg(dev, "%s(%d, %d, 0x%x, 0x%x): Timeout waiting for ack = 0\n",
+			__func__, node, index, addr, value);
+		return -1;
+	}
+
+	/* 6 */
+	dbg_cfg.u64 = 0;
+	dbg_cfg.s.data_in = value;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 7 */
+	dbg_cfg.s.cap_data = 1;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 8 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+				CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 1 && jiffies< (start + HZ));
+	if (status.s.ack != 1) {
+		dev_dbg(dev, "%s(%d, %d, 0x%x, 0x%x): Timeout setting data, waiting for ack = 1\n",
+			__func__, node, index, addr, value);
+		return -1;
+	}
+	/* 9 */
+	dbg_cfg.u64 = 0;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 10 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+				CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 0 && jiffies< (start + HZ));
+	if (status.s.ack != 0) {
+		dev_dbg(dev, "%s(%d, %d, 0x%x, 0x%x): Timeout waiting for ack = 0\n",
+			__func__, node, index, addr, value);
+		return -1;
+	}
+	/* 11 */
+	dbg_cfg.u64 = 0;
+	dbg_cfg.s.write = 1;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 12 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+				CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 1 && jiffies< (start + HZ));
+	if (status.s.ack != 1) {
+		dev_warn(dev, "%s(%d, %d, 0x%x, 0x%x): Timeout waiting for write ack = 1\n",
+			 __func__, node, index, addr, value);
+		return -1;
+	}
+	/* 13 */
+	dbg_cfg.u64 = 0;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_PORTX_CR_DBG_CFG(0, index),
+			    dbg_cfg.u64);
+	/* 14 */
+	start = jiffies;
+	do {
+		status.u64 = cvmx_read_csr_node(node,
+				CVMX_USBDRDX_UCTL_PORTX_CR_DBG_STATUS(0, index));
+	} while (status.s.ack != 0 && jiffies< (start + HZ));
+	if (status.s.ack != 0) {
+		dev_warn(dev, "%s(%d, %d, 0x%x, 0x%x): Timeout waiting for write ack = 0\n",
+			 __func__, node, index, addr, value);
+		return -1;
+	}
+
+	return 0;
+}
+
+/**
+ * Performs a full reset of the UPHY PLL.  Note that this is normally done
+ * internally by a state machine when the UPHY is brought out of reset but this
+ * version gives far more time for things to settle before continuing.
+ *
+ * @param node	CPU node
+ * @param index	XHCI controller index
+ *
+ * @return 0 for success, 1 if UPHY PLL does not have lock.
+ */
+static int dwc3_uphy_pll_reset(struct device *dev, int node, int index)
+{
+	const uint16_t pwr_reg = DWC3_INT_IND_UPHY_PLL_PU;
+	const uint16_t ctrl_reg = DWC3_INT_IND_UPHY_PLL_RESET;
+	const uint16_t lock_reg = DWC3_INT_IND_PLL_LOCK_REG;
+	uint16_t ctrl_val, pwr_val;
+
+	dev_dbg(dev, "%s(%d, %d)\n", __func__, node, index);
+
+	/* 1. Turn on write enable so we can assert reset to the PLL VCO */
+	ctrl_val = dwc3_uphy_indirect_read(dev, node, index, ctrl_reg);
+	ctrl_val |= DWC3_INT_IND_UPHY_PLL_RESET_WE;
+	dwc3_uphy_indirect_write(dev, node, index, ctrl_reg, ctrl_val);
+	mdelay(1);
+
+	/* 2. Turn on write enable for PLL power control */
+	pwr_val = dwc3_uphy_indirect_read(dev, node, index, pwr_reg);
+	pwr_val |= DWC3_INT_IND_UPHY_PLL_PU_WE;
+	dwc3_uphy_indirect_write(dev, node, index, pwr_reg, pwr_val);
+	mdelay(1);
+
+	/* 3. Assert VCO reset */
+	ctrl_val |= DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
+	dwc3_uphy_indirect_write(dev, node, index, ctrl_reg, ctrl_val);
+
+	mdelay(1);
+
+	/* 4. Power down the PLL */
+	pwr_val &= ~DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
+	dwc3_uphy_indirect_write(dev, node, index, pwr_reg, pwr_val);
+	mdelay(1);
+
+	/* 5. Power on the PLL while VCO is held in reset */
+	pwr_val |= DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
+	dwc3_uphy_indirect_write(dev, node, index, pwr_reg, pwr_val);
+
+	/* Wait for things to stabilize before taking VCO out of reset */
+	mdelay(1);
+
+	/* 6. Take the VCO out of reset */
+	ctrl_val &= ~DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
+	dwc3_uphy_indirect_write(dev, node, index, ctrl_reg, ctrl_val);
+	mdelay(1);
+
+	/* 7. Put the VCO back in reset */
+	ctrl_val |= ~DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
+	dwc3_uphy_indirect_write(dev, node, index, ctrl_reg, ctrl_val);
+	mdelay(1);
+
+	/* 8. Power down the PLL */
+	pwr_val &= ~DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
+	dwc3_uphy_indirect_write(dev, node, index, pwr_reg, pwr_val);
+	mdelay(1);
+
+	/* 9. Power on the PLL while VCO is held in reset */
+	pwr_val |= DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
+	dwc3_uphy_indirect_write(dev, node, index, pwr_reg, pwr_val);
+	mdelay(1);
+
+	/* 10. Take the VCO out of reset */
+	ctrl_val &= ~DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
+	dwc3_uphy_indirect_write(dev, node, index, ctrl_reg, ctrl_val);
+	mdelay(1);
+
+	/* 11. Turn off write enables */
+	pwr_val &= ~DWC3_INT_IND_UPHY_PLL_PU_WE;
+	dwc3_uphy_indirect_write(dev, node, index, pwr_reg, pwr_val);
+
+	ctrl_val &= DWC3_INT_IND_UPHY_PLL_RESET_WE;
+	dwc3_uphy_indirect_write(dev, node, index, ctrl_reg, ctrl_val);
+
+	mdelay(1);
+
+	/* Return if we have lock or not */
+	return !(dwc3_uphy_indirect_read(dev, node, index, lock_reg) & 1);
+}
+
+/**
+ * Converts a CPU NODE and CSR address to a new address
+ *
+ * @param node	CPU node number
+ * @param addr	CSR address
+ *
+ * @return New CSR address for the specified CPU node
+ */
+static uint64_t node_to_addr(int node, uint64_t addr)
+{
+	return (addr & ~CVMX_NODE_IO_MASK) |
+		((uint64_t)node & CVMX_NODE_MASK) << CVMX_NODE_IO_SHIFT;
+}
+
+/**
+ * Writes to a USBDRDX_UAHC register, taking care of any endian conversions.
+ *
+ * @param addr	Address of register to write to
+ * @param val	Value to write to register
+ */
+static void write_uahc_reg(int node, uint64_t addr, uint32_t val)
+{
+	uint64_t addr64 = node_to_addr(node, addr);
+	cvmx_write64_uint32(addr64, cpu_to_le32(val));
+}
+
+/**
+ * Reads from a USBDRDX_UAHC register.  All UAHC registers are in little-endian
+ * format.
+ *
+ * @param addr	Address of register to read
+ * @return value of register
+ */
+static uint32_t read_uahc_reg(int node, uint64_t addr)
+{
+	uint64_t addr64 = node_to_addr(node, addr);
+	return le32_to_cpu(cvmx_read64_uint32(addr64));
+}
+
+#endif
+
 static int dwc3_octeon_config_power(struct device *dev, u64 base)
 {
 #define UCTL_HOST_CFG	0xe0
@@ -481,6 +848,7 @@ static void __init dwc3_octeon_set_endian_mode(u64 base)
 #define CVMX_USBDRDX_UCTL_CTL(index)				\
 		(CVMX_ADD_IO_SEG(0x0001180068000000ull) +	\
 		((index & 1) * 0x1000000ull))
+
 static void __init dwc3_octeon_phy_reset(u64 base)
 {
 	union cvm_usbdrd_uctl_ctl uctl_ctl;
@@ -491,6 +859,224 @@ static void __init dwc3_octeon_phy_reset(u64 base)
 	cvmx_write_csr(CVMX_USBDRDX_UCTL_CTL(index), uctl_ctl.u64);
 }
 
+static int __init dwc3_octeon_device_pll_lock(struct device *dev, u64 base)
+{
+	union cvmx_usbdrdx_uctl_ctl uctl_ctl;
+	union cvmx_usbdrdx_uahc_gusb2phycfgx phycfg;
+	union cvmx_usbdrdx_uahc_gusb3pipectlx pipectl;
+	union cvmx_usbdrdx_uahc_gctl gctl;
+	union cvmx_usbdrdx_uahc_gsts gsts;
+	union cvmx_usbdrdx_uahc_portscx portsc;
+
+	uint64_t phycfg_addr;
+	uint64_t pipectl_addr;
+	uint64_t gctl_addr;
+	uint64_t gsts_addr;
+
+	int index, ret;
+	int node = 0;
+
+	switch(base) {
+	case 0x8001180068000000ull:
+		index = 0;
+		break;
+	case 0x8001180069000000ull:
+		index = 1;
+		break;
+	default:
+		dev_err(dev, "Invalid base address 0x%llx for node %d.", base, node);
+		return -1;
+	}
+
+	/* From previous steps */
+	/* Step 13, wait 10uS for the PHY to complete its reset */
+	udelay(10);
+
+	/* 14. Deassert UPHY reset */
+	uctl_ctl.u64 = cvmx_read_csr_node(node,
+					  CVMX_USBDRDX_UCTL_CTL(index));
+	uctl_ctl.s.uphy_rst = 0;
+	cvmx_write_csr_node(node, CVMX_USBDRDX_UCTL_CTL(index),
+			    uctl_ctl.u64);
+	/* Setp 15, wait for at least 45us for UPHY to output stable
+	 * PHYCLOCK
+	 */
+	udelay(50);
+
+	/* Step 16: Initialize any other strap signals necessary and
+	 * make sure they propagate by reading back the last register
+	 * written.
+	 *
+	 * a. UCTL:
+	 *	uctl_port0_cfg_*[*_tune]
+	 *	uctl_port0_cfg_*[pcs_*]
+	 *	uctl_port0_cfg_*[lane0_tx_term_offset]
+	 *	uctl_port0_cfg_*[tx_vboost_lvl]
+	 *	uctl_port0_cfg_*[los_bias]
+	 *	uctl_host_cfg
+	 *	uctl_shim_cfg
+	 */
+	/* b. UAHC: only the following UAHC registers are accessible
+	 *	    during CoreSoftReset.
+	 * - USBDRDX_UAHC_GCTL
+	 * - USBDRDX_UAHC_GUCTL
+	 * - USBDRDX_UAHC_GSTS
+	 * - USBDRDX_UAHC_GUID
+	 * - USBDRDX_UAHC_GUSB2PHYCFG
+	 * - USBDRDX_UAHC_GUSB3PIPECTL
+	 */
+
+	/* 17. Release soft reset the UPHY and UAHC logic via the UAHC
+	 *     controls.
+	 */
+
+	phycfg_addr = CVMX_USBDRDX_UAHC_GUSB2PHYCFGX(0, index);
+	pipectl_addr = node_to_addr(node,
+				CVMX_USBDRDX_UAHC_GUSB3PIPECTLX(0, index));
+	gctl_addr = CVMX_USBDRDX_UAHC_GCTL(index);
+	gsts_addr = CVMX_USBDRDX_UAHC_GSTS(index);
+
+	phycfg.u32 = read_uahc_reg(node, phycfg_addr);
+	phycfg.s.physoftrst = 1;
+	/* Disable low power mode due to mcbuggin 29646 */
+	phycfg.s.enblslpm = 0;
+	write_uahc_reg(node, phycfg_addr, phycfg.u32);
+
+	pipectl.u32 = read_uahc_reg(node, pipectl_addr);
+	pipectl.s.physoftrst = 1;
+	/* Disable low power mode due to mcbuggin 29646 */
+	pipectl.s.suspend_en = 0;
+	write_uahc_reg(node, pipectl_addr, pipectl.u32);
+
+	udelay(100);
+
+	gctl.u32 = read_uahc_reg(node, gctl_addr);
+	gctl.s.coresoftreset = 1;
+	write_uahc_reg(node, gctl_addr, gctl.u32);
+
+#ifdef DEBUG
+	if (!dwc3_uphy_indirect_read(dev, node, index,
+				     DWC3_INT_IND_PLL_LOCK_REG))
+		dev_warn(dev, "Detected no lock on USB 2 PHY PLL\n");
+#endif
+
+	dev_warn(dev, "DWC3: usb pll locked %u.",
+		 dwc3_uphy_indirect_read(dev, node, index, DWC3_INT_IND_PLL_LOCK_REG));
+	/* 19. Reset the USB PHY PLL.  This phy is reset during the
+	 *     UPHY reset process but the internal state machine seems
+	 *     to be too fast and sometimes the PLL Does not come up.
+	 *     The software reset sequence has much longer delays
+	 *     which allows things to settle properly before proceeding.
+	 */
+
+	dev_warn(dev, "%s: Resetting USB PHY PLL\n", __func__);
+	ret = dwc3_uphy_pll_reset(dev, node, index);
+	if (ret) {
+		dev_warn(dev, "%s: UPHY PLL on node: %d, interface: %d not locked after reset.\n",
+			 __func__, node, index);
+	}
+	mdelay(1);
+
+	/* 18. Configure the remaining UAHC_G* registers including any
+	 *     that were not configured in step 16.-b
+	 */
+#ifdef DEBUG
+	if (!dwc3_uphy_indirect_read(dev, node, index,
+				     DWC3_INT_IND_PLL_LOCK_REG))
+		dev_warn(dev, "Detected no lock on USB 2 PHY PLL\n");
+#endif
+
+	/* 19. Reset the USB PHY PLL.  This phy is reset during the
+	 *     UPHY reset process but the internal state machine seems
+	 *     to be too fast and sometimes the PLL Does not come up.
+	 *     The software reset sequence has much longer delays
+	 *     which allows things to settle properly before proceeding.
+	 */
+
+	dev_info(dev, "%s: Resetting USB PHY PLL\n", __func__);
+	ret = dwc3_uphy_pll_reset(dev, node, index);
+	if (ret) {
+		dev_warn(dev, "%s: UPHY PLL on node: %d, interface: %d not locked after reset.\n",
+			 __func__, node, index);
+		return -1;
+	}
+
+	dev_warn(dev, "DWC3: usb pll locked %u after reset.",
+		 dwc3_uphy_indirect_read(dev, node, index, DWC3_INT_IND_PLL_LOCK_REG));
+
+	pipectl.u32 = read_uahc_reg(node, pipectl_addr);
+	dev_info(dev, "%s: GUSB3PIPECTL: 0x%x\n", __func__, pipectl.u32);
+
+	pipectl.s.physoftrst = 0;
+	/* Disable low power mode due to mcbuggin 29646 */
+	pipectl.s.suspend_en = 0;
+	write_uahc_reg(node, pipectl_addr, pipectl.u32);
+	udelay(100);
+	phycfg.u32 = read_uahc_reg(node, phycfg_addr);
+	phycfg.s.physoftrst = 0;
+	/* Disable low power mode due to mcbuggin 29646 */
+	phycfg.s.enblslpm = 0;
+	write_uahc_reg(node, phycfg_addr, phycfg.u32);
+
+	gctl.u32 = read_uahc_reg(node, gctl_addr);
+	gctl.s.coresoftreset = 0;
+	write_uahc_reg(node, gctl_addr, gctl.u32);
+	udelay(100);
+
+	/* Clear any previous bits set */
+	gsts.u32 = read_uahc_reg(node, gsts_addr);
+	write_uahc_reg(node, gsts_addr, gsts.u32);
+
+	/* We test that there hasn't been a PLL issue during
+	 * initialization. If we detect this then we retry.
+	 *
+	 * On octeon, the wce bit basically shouldn't do anything.  If
+	 * a PLL failed to come up then we will see a CSR timeout.
+	 */
+	portsc.u32 = read_uahc_reg(node, CVMX_USBDRDX_UAHC_PORTSCX(0, index));
+	portsc.s.wce = 1;
+	write_uahc_reg(node, CVMX_USBDRDX_UAHC_PORTSCX(0, index), portsc.u32);
+	gsts.u32 = read_uahc_reg(node, gsts_addr);
+	write_uahc_reg(node, gsts_addr, gsts.u32);
+	if (gsts.s.csrtimeout) {
+		dev_err(dev, "%s: Detected CSR tmout 0, can't continue...\n", __func__);
+		return -1;
+	}
+	udelay(100);
+	portsc.u32 = read_uahc_reg(node, CVMX_USBDRDX_UAHC_PORTSCX(1, index));
+	portsc.s.wce = 1;
+	write_uahc_reg(node, CVMX_USBDRDX_UAHC_PORTSCX(1, index), portsc.u32);
+	gsts.u32 = read_uahc_reg(node, gsts_addr);
+	write_uahc_reg(node, gsts_addr, gsts.u32);
+	if (gsts.s.csrtimeout) {
+		dev_err(dev, "%s: Detected CSR tmout 1, can't continue...\n", __func__);
+		return -1;
+	}
+
+	udelay(100);
+	portsc.u32 = read_uahc_reg(node, CVMX_USBDRDX_UAHC_PORTSCX(0, index));
+	portsc.s.wce = 0;
+	write_uahc_reg(node, CVMX_USBDRDX_UAHC_PORTSCX(0, index), portsc.u32);
+	gsts.u32 = read_uahc_reg(node, gsts_addr);
+	write_uahc_reg(node, gsts_addr, gsts.u32);
+	if (gsts.s.csrtimeout) {
+		dev_err(dev, "%s: Detected CSR tmout 2, can't continue...\n", __func__);
+		return -1;
+	}
+	udelay(100);
+	portsc.u32 = read_uahc_reg(node, CVMX_USBDRDX_UAHC_PORTSCX(0, index));
+	portsc.s.wce = 0;
+	write_uahc_reg(node, CVMX_USBDRDX_UAHC_PORTSCX(0, index), portsc.u32);
+	gsts.u32 = read_uahc_reg(node, gsts_addr);
+	write_uahc_reg(node, gsts_addr, gsts.u32);
+	if (gsts.s.csrtimeout) {
+		dev_err(dev, "%s: Detected CSR tmout 4, can't continue...\n", __func__);
+		return -1;
+	}
+
+	return 0;
+}
+
 static int __init dwc3_octeon_device_init(void)
 {
 	const char compat_node_name[] = "cavium,octeon-7130-usb-uctl";
@@ -531,6 +1117,12 @@ static int __init dwc3_octeon_device_init(void)
 				dev_info(&pdev->dev, "clocks initialized.\n");
 			dwc3_octeon_set_endian_mode((u64)base);
 			dwc3_octeon_phy_reset((u64)base);
+			if (dwc3_octeon_device_pll_lock(&pdev->dev, (u64)base) != 0) {
+				dev_err(&pdev->dev, "Failed to initialize clocks.");
+				mutex_unlock(&dwc3_octeon_clocks_mutex);
+				put_device(&pdev->dev);
+				return -EINVAL;
+			}
 			mutex_unlock(&dwc3_octeon_clocks_mutex);
 			devm_iounmap(&pdev->dev, base);
 			devm_release_mem_region(&pdev->dev, res->start,
-- 
2.39.2

