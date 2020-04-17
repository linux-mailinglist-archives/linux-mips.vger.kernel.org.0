Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E151AD873
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 10:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbgDQIXT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 04:23:19 -0400
Received: from mga02.intel.com ([134.134.136.20]:62648 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729176AbgDQIXS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Apr 2020 04:23:18 -0400
IronPort-SDR: LgZCo1TC/OxmO+0ctM4s1p0Dtklh/ceHO7KBB8AGQPra5YLujRBjNn13zqXGh5Vy8U5kUqBHfs
 W/G5/AZs1XVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 01:23:16 -0700
IronPort-SDR: QCo43Up6DLTPOtoVcxQDhhpF+qC7OIZeIxh5RnLBgGri496HqEJ4XzVKR+QWkZW2sRjZBr9IDV
 qbH/QVg0fqog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="254142858"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga003.jf.intel.com with ESMTP; 17 Apr 2020 01:23:12 -0700
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
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date:   Fri, 17 Apr 2020 16:21:47 +0800
Message-Id: <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
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

NAND controller driver implements ->exec_op() to replace legacy hooks,
these specific call-back method to execute NAND operations.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 drivers/mtd/nand/raw/Kconfig          |   7 +
 drivers/mtd/nand/raw/Makefile         |   1 +
 drivers/mtd/nand/raw/intel_lgm_nand.c | 740 ++++++++++++++++++++++++++++++++++
 3 files changed, 748 insertions(+)
 create mode 100644 drivers/mtd/nand/raw/intel_lgm_nand.c

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index a80a46bb5b8b..9efc4bbaf4a3 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -457,6 +457,13 @@ config MTD_NAND_CADENCE
 	  Enable the driver for NAND flash on platforms using a Cadence NAND
 	  controller.
 
+config MTD_NAND_INTEL_LGM
+	tristate "Support for NAND controller on Intel LGM SoC"
+	depends on X86
+	help
+	  Enables support for NAND Flash chips on Intel's LGM SoC.
+          NAND flash interfaced through the External Bus Unit.
+
 comment "Misc"
 
 config MTD_SM_COMMON
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 2d136b158fb7..49a301ae0c9d 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_NAND_TEGRA)		+= tegra_nand.o
 obj-$(CONFIG_MTD_NAND_STM32_FMC2)	+= stm32_fmc2_nand.o
 obj-$(CONFIG_MTD_NAND_MESON)		+= meson_nand.o
 obj-$(CONFIG_MTD_NAND_CADENCE)		+= cadence-nand-controller.o
+obj-$(CONFIG_MTD_NAND_INTEL_LGM)	+= intel_lgm_nand.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_onfi.o
diff --git a/drivers/mtd/nand/raw/intel_lgm_nand.c b/drivers/mtd/nand/raw/intel_lgm_nand.c
new file mode 100644
index 000000000000..96cd1831f070
--- /dev/null
+++ b/drivers/mtd/nand/raw/intel_lgm_nand.c
@@ -0,0 +1,740 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2019 Intel Corporation. */
+
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/resource.h>
+#include <linux/sched.h>
+#include <linux/types.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/mtd/nand_ecc.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/mtd/partitions.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <mtd/mtd-abi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mtd/nand.h>
+
+#define LGM_CLC			0x000
+#define LGM_CLC_RST		0x00000000u
+
+#define LGM_NAND_ECC_OFFSET	0x008
+
+#define LGM_ADDR_SEL(n)		(0x20 + (n) * 4)
+#define LGM_ADDR_MASK		(5 << 4)
+#define LGM_ADDR_SEL_REGEN	0x1
+
+#define LGM_BUSCON(n)		(0x60 + (n) * 4)
+#define LGM_BUSCON_CMULT_V4	0x1
+#define LGM_BUSCON_RECOVC(n)	((n) << 2)
+#define LGM_BUSCON_HOLDC(n)	((n) << 4)
+#define LGM_BUSCON_WAITRDC(n)	((n) << 6)
+#define LGM_BUSCON_WAITWRC(n)	((n) << 8)
+#define LGM_BUSCON_BCGEN_CS	0x0
+#define LGM_BUSCON_SETUP_EN	BIT(22)
+#define LGM_BUSCON_ALEC		0xC000
+
+#define NAND_CON		0x0B0
+#define NAND_CON_NANDM_EN	BIT(0)
+#define NAND_CON_NANDM_DIS	0x0
+#define NAND_CON_CSMUX_E_EN	BIT(1)
+#define NAND_CON_ALE_P_LOW	BIT(2)
+#define NAND_CON_CLE_P_LOW	BIT(3)
+#define NAND_CON_CS_P_LOW	BIT(4)
+#define NAND_CON_SE_P_LOW	BIT(5)
+#define NAND_CON_WP_P_LOW	BIT(6)
+#define NAND_CON_PRE_P_LOW	BIT(7)
+#define NAND_CON_IN_CS_S(n)	((n) << 8)
+#define NAND_CON_OUT_CS_S(n)	((n) << 10)
+#define NAND_CON_LAT_EN_CS_P	((0x3D) << 18)
+
+#define NAND_WAIT		0x0B4
+#define NAND_WAIT_RDBY		BIT(0)
+#define NAND_WAIT_WR_C		BIT(3)
+
+#define NAND_CTL1		0x110
+#define NAND_CTL1_ADDR_3_SHIFT	24
+
+#define NAND_CTL2		0x114
+#define NAND_CTL2_ADDR_5_SHIFT	8
+#define NAND_CTL2_CYC_N_V5	(0x2 << 16)
+
+#define NAND_INT_MSK_CTL	0x124
+#define NAND_INT_MSK_CTL_WR_C	BIT(4)
+
+#define NAND_INT_STA		0x128
+#define NAND_INT_STA_WR_C	BIT(4)
+
+#define NAND_CTL		0x130
+#define NAND_CTL_MODE_ECC	0x1
+#define NAND_CTL_GO		BIT(2)
+#define NAND_CTL_CE_SEL_CS(n)	BIT(3 + (n))
+#define NAND_CTL_RW_READ	0x0
+#define NAND_CTL_RW_WRITE	BIT(10)
+#define NAND_CTL_ECC_OFF_V8TH	BIT(11)
+#define NAND_CTL_CKFF_EN	0x0
+#define NAND_CTL_MSG_EN		BIT(17)
+
+#define NAND_PARA0		0x13c
+#define NAND_PARA0_PAGE_V8192	0x3
+#define NAND_PARA0_PIB_V256	(0x3 << 4)
+#define NAND_PARA0_BYP_EN_NP	0x0
+#define NAND_PARA0_BYP_DEC_NP	0x0
+#define NAND_PARA0_TYPE_ONFI	BIT(18)
+#define NAND_PARA0_ADEP_EN	BIT(21)
+
+#define NAND_CMSG_0		0x150
+#define NAND_CMSG_1		0x154
+
+#define NAND_WRITE_CMD		(NAND_CON_CS_P_LOW | NAND_CON_CLE_P_LOW)
+#define NAND_WRITE_ADDR		(NAND_CON_CS_P_LOW | NAND_CON_ALE_P_LOW)
+#define NAND_WRITE_DATA		NAND_CON_CS_P_LOW
+#define NAND_READ_DATA		NAND_CON_CS_P_LOW
+
+#define NAND_CHIP_NO_SELECTION	-1
+#define NAND_CHIP_SELECTION	0x0
+
+struct lgm_nand_host {
+	struct nand_controller	controller;
+	struct nand_chip	chip;
+	void __iomem		*lgm_va;
+	void __iomem		*hsnand_va;
+	void __iomem		*nandaddr_va;
+	struct clk		*clk;
+	unsigned long		clk_rate;
+	u32			cs;
+	u32			nd_para0;
+	struct device		*dev;
+	struct dma_chan		*dma_tx;
+	struct dma_chan		*dma_rx;
+	struct completion	dma_access_complete;
+	const char *cs_name;
+};
+
+static u8 lgm_nand_readb(struct nand_chip *chip, int op)
+{
+	struct lgm_nand_host *lgm_host = nand_get_controller_data(chip);
+	void __iomem *nand_wait = lgm_host->lgm_va + NAND_WAIT;
+	u32 stat;
+	int ret;
+	u8 val;
+
+	val = readb(lgm_host->nandaddr_va + op);
+
+	ret = readl_poll_timeout(nand_wait, stat, stat & NAND_WAIT_WR_C,
+				 20, 1000);
+	if (ret)
+		dev_warn(lgm_host->dev,
+			 "lgm nand write timeout. nand_wait(0x%p)=0x%x\n",
+			 nand_wait, readl(nand_wait));
+
+	return val;
+}
+
+static void lgm_nand_writeb(struct nand_chip *chip, int op, u8 value)
+{
+	struct lgm_nand_host *lgm_host = nand_get_controller_data(chip);
+	void __iomem *nand_wait = lgm_host->lgm_va + NAND_WAIT;
+	u32 stat;
+	int ret;
+
+	writeb(value, lgm_host->nandaddr_va + op);
+
+	ret = readl_poll_timeout(nand_wait, stat, stat & NAND_WAIT_WR_C,
+				 20, 1000);
+	if (ret)
+		dev_warn(lgm_host->dev,
+			 "lgm nand write timeout. nand_wait(0x%p)=0x%x\n",
+			 nand_wait, readl(nand_wait));
+}
+
+static unsigned char lgm_read_byte(struct nand_chip *chip)
+{
+	return lgm_nand_readb(chip, NAND_READ_DATA);
+}
+
+static void lgm_read_buf(struct nand_chip *chip, u_char *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = lgm_nand_readb(chip, NAND_WRITE_DATA);
+}
+
+static void lgm_write_buf(struct nand_chip *chip, const u_char *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		lgm_nand_writeb(chip, NAND_WRITE_DATA, buf[i]);
+}
+
+static void lgm_select_chip(struct nand_chip *chip, int select)
+{
+	struct lgm_nand_host *lgm_host = nand_get_controller_data(chip);
+	void __iomem *nand_con = lgm_host->lgm_va + NAND_CON;
+	u32 cs = lgm_host->cs;
+	int val;
+
+	switch (select) {
+	case NAND_CHIP_NO_SELECTION:
+		val = readl(nand_con);
+		writel(val & ~NAND_CON_NANDM_EN, nand_con);
+		break;
+	case NAND_CHIP_SELECTION:
+		writel(NAND_CON_NANDM_EN | NAND_CON_CSMUX_E_EN |
+		       NAND_CON_CS_P_LOW | NAND_CON_SE_P_LOW |
+		       NAND_CON_WP_P_LOW | NAND_CON_PRE_P_LOW |
+		       NAND_CON_IN_CS_S(cs) | NAND_CON_OUT_CS_S(cs) |
+		       NAND_CON_LAT_EN_CS_P, nand_con);
+		break;
+	default:
+		break;
+	}
+}
+
+static int lgm_dev_ready(struct nand_chip *chip)
+{
+	struct lgm_nand_host *lgm_host = nand_get_controller_data(chip);
+
+	return readl(lgm_host->lgm_va + NAND_WAIT) & NAND_WAIT_RDBY;
+}
+
+static void lgm_cmd_ctrl(struct nand_chip *chip, int cmd, unsigned int ctrl)
+{
+	if (cmd == NAND_CMD_NONE)
+		return;
+
+	if (ctrl & NAND_CLE)
+		lgm_nand_writeb(chip, NAND_WRITE_CMD, cmd);
+	else if (ctrl & NAND_ALE)
+		lgm_nand_writeb(chip, NAND_WRITE_ADDR, cmd);
+}
+
+static int lgm_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = LGM_NAND_ECC_OFFSET;
+	oobregion->length = chip->ecc.total;
+
+	return 0;
+}
+
+static int lgm_nand_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = chip->ecc.total + LGM_NAND_ECC_OFFSET;
+	oobregion->length = mtd->oobsize - oobregion->offset;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops lgm_nand_ooblayout_ops = {
+	.ecc = lgm_nand_ooblayout_ecc,
+	.free = lgm_nand_ooblayout_free,
+};
+
+static inline struct lgm_nand_host *nand_to_lgm(struct nand_chip *chip)
+{
+	return container_of(chip, struct lgm_nand_host, chip);
+}
+
+static void lgm_dma_rx_callback(void *cookie)
+{
+	struct lgm_nand_host *lgm_host = cookie;
+
+	dmaengine_terminate_async(lgm_host->dma_rx);
+
+	complete(&lgm_host->dma_access_complete);
+}
+
+static void lgm_dma_tx_callback(void *cookie)
+{
+	struct lgm_nand_host *lgm_host = cookie;
+
+	dmaengine_terminate_async(lgm_host->dma_tx);
+
+	complete(&lgm_host->dma_access_complete);
+}
+
+static int lgm_dma_start(struct lgm_nand_host *lgm_host, u32 dir,
+			 const u8 *buf, u32 len)
+{
+	struct dma_async_tx_descriptor *tx;
+	struct completion *dma_completion;
+	dma_async_tx_callback callback;
+	struct dma_chan *chan;
+	dma_cookie_t cookie;
+	unsigned long flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
+	dma_addr_t buf_dma;
+	int ret;
+	u32 timeout;
+
+	if (dir == DMA_DEV_TO_MEM) {
+		chan = lgm_host->dma_rx;
+		dma_completion = &lgm_host->dma_access_complete;
+		callback = lgm_dma_rx_callback;
+	} else {
+		chan = lgm_host->dma_tx;
+		dma_completion = &lgm_host->dma_access_complete;
+		callback = lgm_dma_tx_callback;
+	}
+
+	buf_dma = dma_map_single(chan->device->dev, (void *)buf, len, dir);
+	if (dma_mapping_error(chan->device->dev, buf_dma)) {
+		dev_err(lgm_host->dev, "Failed to map DMA buffer\n");
+		ret = -EIO;
+		goto err_unmap;
+	}
+
+	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
+	if (!tx)
+		return -ENXIO;
+
+	tx->callback = callback;
+	tx->callback_param = lgm_host;
+	cookie = tx->tx_submit(tx);
+
+	ret = dma_submit_error(cookie);
+	if (ret) {
+		dev_err(lgm_host->dev, "dma_submit_error %d\n", cookie);
+		ret = -EIO;
+		goto err_unmap;
+	}
+
+	init_completion(dma_completion);
+	dma_async_issue_pending(chan);
+
+	/* Wait DMA to finish the data transfer.*/
+	timeout =
+	wait_for_completion_timeout(dma_completion, msecs_to_jiffies(1000));
+	if (!timeout) {
+		dev_err(lgm_host->dev, "I/O Error in DMA RX (status %d)\n",
+			dmaengine_tx_status(chan, cookie, NULL));
+		dmaengine_terminate_sync(chan);
+		ret = -ETIMEDOUT;
+		goto err_unmap;
+	}
+
+	return 0;
+
+err_unmap:
+	dma_unmap_single(lgm_host->dev, buf_dma, len, dir);
+
+	return ret;
+}
+
+static void lgm_nand_trigger(struct lgm_nand_host *lgm_host, int page, u32 cmd)
+{
+	unsigned int val;
+
+	val = cmd | (page & 0xFF) << NAND_CTL1_ADDR_3_SHIFT;
+	writel(val, lgm_host->hsnand_va + NAND_CTL1);
+	val = (page & 0xFFFF00) >> 8 | NAND_CTL2_CYC_N_V5;
+	writel(val, lgm_host->hsnand_va + NAND_CTL2);
+
+	writel(lgm_host->nd_para0, lgm_host->hsnand_va + NAND_PARA0);
+
+	/* clear first, will update later */
+	writel(0xFFFFFFFF, lgm_host->hsnand_va + NAND_CMSG_0);
+	writel(0xFFFFFFFF, lgm_host->hsnand_va + NAND_CMSG_1);
+
+	writel(NAND_INT_MSK_CTL_WR_C, lgm_host->hsnand_va + NAND_INT_MSK_CTL);
+
+	val = cmd == NAND_CMD_READ0 ? NAND_CTL_RW_READ : NAND_CTL_RW_WRITE;
+
+	writel(NAND_CTL_MSG_EN | NAND_CTL_CKFF_EN | NAND_CTL_ECC_OFF_V8TH |
+	       NAND_CTL_CE_SEL_CS(lgm_host->cs) | NAND_CTL_MODE_ECC |
+	       NAND_CTL_GO | val, lgm_host->hsnand_va + NAND_CTL);
+}
+
+static int lgm_nand_read_page_hwecc(struct nand_chip *chip, u8 *buf,
+				    int oob_required, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct lgm_nand_host *lgm_host = nand_get_controller_data(chip);
+	int ret, x;
+
+	lgm_nand_trigger(lgm_host, page, NAND_CMD_READ0);
+
+	ret = lgm_dma_start(lgm_host, DMA_DEV_TO_MEM, buf, mtd->writesize);
+	if (ret)
+		return ret;
+
+	if (oob_required)
+		chip->ecc.read_oob(chip, page);
+
+	x = readl(lgm_host->hsnand_va + NAND_CTL);
+	x &= ~NAND_CTL_GO;
+	writel(x, lgm_host->hsnand_va + NAND_CTL);
+
+	return 0;
+}
+
+static int lgm_nand_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
+				     int oob_required, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct lgm_nand_host *lgm_host = nand_get_controller_data(chip);
+	void __iomem *int_sta = lgm_host->hsnand_va + NAND_INT_STA;
+	int ret, val, x;
+	__be32 reg;
+
+	lgm_nand_trigger(lgm_host, page, NAND_CMD_SEQIN);
+
+	ret = lgm_dma_start(lgm_host, DMA_MEM_TO_DEV, buf, mtd->writesize);
+	if (ret)
+		return ret;
+
+	if (oob_required) {
+		const u8 *pdata;
+
+		pdata = chip->oob_poi;
+		reg = cpu_to_be32(*pdata++);
+		writel(reg, lgm_host->hsnand_va + NAND_CMSG_0);
+
+		reg = cpu_to_be32(*pdata);
+		writel(reg, lgm_host->hsnand_va + NAND_CMSG_1);
+	}
+
+	ret = readl_poll_timeout_atomic(int_sta, val,
+					!(val & NAND_INT_STA_WR_C), 10, 1000);
+	if (ret)
+		return -EIO;
+
+	x = readl(lgm_host->hsnand_va + NAND_CTL);
+	x &= ~NAND_CTL_GO;
+	writel(x, lgm_host->hsnand_va + NAND_CTL);
+
+	return 0;
+}
+
+static const u8 ecc_strength[] = { 1, 1, 4, 8, 24, 32, 40, 60, };
+
+static int lgm_nand_attach_chip(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct lgm_nand_host *lgm_host = nand_get_controller_data(chip);
+	u32 eccsize, eccsteps, eccbytes, ecctotal, pagesize, pg_per_blk;
+	u32 eccstrength = chip->ecc.strength;
+	u32 writesize = mtd->writesize;
+	u32 blocksize = mtd->erasesize;
+	int start, val, i;
+
+	if (chip->ecc.mode != NAND_ECC_HW)
+		return 0;
+
+	/* Check whether eccsize is 0x0 or wrong. assign eccsize = 512 if YES */
+	if (!chip->ecc.size)
+		chip->ecc.size = 512;
+	eccsize = chip->ecc.size;
+
+	switch (eccsize) {
+	case 512:
+		start = 1;
+		if (!eccstrength)
+			eccstrength = 4;
+		break;
+	case 1024:
+		start = 4;
+		if (!eccstrength)
+			eccstrength = 32;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	i = round_up(start + 1, 4);
+	for (val = start; val < i; val++) {
+		if (eccstrength == ecc_strength[val])
+			break;
+	}
+	if (val == i)
+		return -EINVAL;
+
+	if (eccstrength == 8)
+		eccbytes = 14;
+	else
+		eccbytes = DIV_ROUND_UP(eccstrength * fls(8 * eccsize), 8);
+
+	eccsteps = writesize / eccsize;
+	ecctotal = eccsteps * eccbytes;
+	if ((ecctotal + 8) > mtd->oobsize)
+		return -ERANGE;
+
+	chip->ecc.total = ecctotal;
+	pagesize = fls(writesize >> 11);
+	if (pagesize > NAND_PARA0_PAGE_V8192)
+		return -ERANGE;
+
+	pg_per_blk = fls((blocksize / writesize) >> 6) << 4;
+	if (pg_per_blk > NAND_PARA0_PIB_V256)
+		return -ERANGE;
+
+	lgm_host->nd_para0 = pagesize | pg_per_blk | NAND_PARA0_BYP_EN_NP |
+			     NAND_PARA0_BYP_DEC_NP | NAND_PARA0_ADEP_EN |
+			     NAND_PARA0_TYPE_ONFI | (val << 29);
+
+	mtd_set_ooblayout(mtd, &lgm_nand_ooblayout_ops);
+	chip->ecc.read_page = lgm_nand_read_page_hwecc;
+	chip->ecc.write_page = lgm_nand_write_page_hwecc;
+
+	return 0;
+}
+
+static int lgm_nand_exec_op(struct nand_chip *chip,
+			    const struct nand_operation *op, bool check_only)
+{
+	struct lgm_nand_host *host = nand_to_lgm(chip);
+	const struct nand_op_instr *instr = NULL;
+	unsigned int op_id;
+	int i, ret = 0;
+
+	for (op_id = 0; op_id < op->ninstrs; op_id++) {
+		instr = &op->instrs[op_id];
+
+		lgm_select_chip(chip, host->cs);
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			lgm_cmd_ctrl(chip, instr->ctx.cmd.opcode, NAND_CLE);
+		break;
+
+		case NAND_OP_ADDR_INSTR:
+			for (i = 0; i < instr->ctx.addr.naddrs; i++)
+				lgm_cmd_ctrl(chip, instr->ctx.addr.addrs[i],
+					     NAND_ALE);
+			break;
+
+		case NAND_OP_DATA_IN_INSTR:
+			lgm_read_buf(chip, instr->ctx.data.buf.in,
+				     instr->ctx.data.len);
+			break;
+
+		case NAND_OP_DATA_OUT_INSTR:
+			lgm_write_buf(chip, instr->ctx.data.buf.out,
+				      instr->ctx.data.len);
+			break;
+
+		case NAND_OP_WAITRDY_INSTR:
+			ret = lgm_dev_ready(chip);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static const struct nand_controller_ops lgm_nand_controller_ops = {
+	.attach_chip = lgm_nand_attach_chip,
+	.exec_op = lgm_nand_exec_op,
+};
+
+static void lgm_dma_exit(struct lgm_nand_host *lgm_host)
+{
+	if (lgm_host->dma_rx) {
+		dma_release_channel(lgm_host->dma_rx);
+		lgm_host->dma_rx = NULL;
+	}
+
+	if (lgm_host->dma_tx) {
+		dma_release_channel(lgm_host->dma_tx);
+		lgm_host->dma_tx = NULL;
+	}
+}
+
+static int lgm_dma_init(struct device *dev, struct lgm_nand_host *lgm_host)
+{
+	int ret;
+
+	/* Prepare for TX DMA: */
+	lgm_host->dma_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(lgm_host->dma_tx)) {
+		ret = PTR_ERR(lgm_host->dma_tx);
+		dev_err(dev, "can't get the TX DMA channel, error %d!\n", ret);
+		goto err;
+	}
+
+	/* Prepare for RX: */
+	lgm_host->dma_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(lgm_host->dma_rx)) {
+		ret = PTR_ERR(lgm_host->dma_rx);
+		dev_err(dev, "can't get the RX DMA channel, error %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+err:
+	return ret;
+}
+
+static int lgm_nand_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lgm_nand_host *lgm_host;
+	struct nand_chip *nand;
+	phys_addr_t nandaddr_pa;
+	struct mtd_info *mtd;
+	struct resource *res;
+	int ret;
+	u32 cs;
+
+	lgm_host = devm_kzalloc(dev, sizeof(*lgm_host), GFP_KERNEL);
+	if (!lgm_host)
+		return -ENOMEM;
+
+	lgm_host->dev = dev;
+	nand_controller_init(&lgm_host->controller);
+
+	lgm_host->lgm_va =
+	devm_platform_ioremap_resource_byname(pdev, "lgmnand");
+	if (IS_ERR(lgm_host->lgm_va))
+		return PTR_ERR(lgm_host->lgm_va);
+
+	lgm_host->hsnand_va =
+	devm_platform_ioremap_resource_byname(pdev, "hsnand");
+	if (IS_ERR(lgm_host->hsnand_va))
+		return PTR_ERR(lgm_host->hsnand_va);
+
+	ret = device_property_read_u32(dev, "nand,cs", &cs);
+	if (ret) {
+		dev_err(dev, "failed to get chip select: %d\n", ret);
+		return ret;
+	}
+
+	lgm_host->cs = cs;
+
+	lgm_host->cs_name = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", cs);
+	if (IS_ERR(lgm_host->cs_name)) {
+		ret = PTR_ERR(lgm_host->cs_name);
+		dev_err(dev, "failed to get chip select name: %d\n", ret);
+		return ret;
+	}
+
+	res = devm_platform_ioremap_resource_byname(pdev, lgm_host->cs_name);
+	lgm_host->nandaddr_va = res;
+	nandaddr_pa = res->start;
+	if (IS_ERR(lgm_host->nandaddr_va))
+		return PTR_ERR(lgm_host->nandaddr_va);
+
+	lgm_host->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(lgm_host->clk)) {
+		ret = PTR_ERR(lgm_host->clk);
+		dev_err(dev, "failed to get clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(lgm_host->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
+	lgm_host->clk_rate = clk_get_rate(lgm_host->clk);
+
+	ret = lgm_dma_init(dev, lgm_host);
+	if (ret)
+		goto disable_clk;
+
+	writel(lower_32_bits(nandaddr_pa) | LGM_ADDR_SEL_REGEN | LGM_ADDR_MASK,
+	       lgm_host->lgm_va + LGM_ADDR_SEL(cs));
+
+	writel(LGM_BUSCON_CMULT_V4 | LGM_BUSCON_RECOVC(1) |
+	       LGM_BUSCON_HOLDC(1) | LGM_BUSCON_WAITRDC(2) |
+	       LGM_BUSCON_WAITWRC(2) | LGM_BUSCON_BCGEN_CS | LGM_BUSCON_ALEC |
+	       LGM_BUSCON_SETUP_EN, lgm_host->lgm_va + LGM_BUSCON(cs));
+
+	/*
+	 * NAND physical address selection is based on the chip select
+	 * and written to ADDR_SEL register to get Memory Region Base address.
+	 * FPI Bus addresses are compared to this base address in conjunction
+	 * with the mask control. Driver need to program this field!
+	 * Address: 0x17400 if chip select is CS_0
+	 * Address: 0x17C00 if chip select is CS_1
+	 * Refer the Intel LGM SoC datasheet.
+	 */
+	writel(0x17400051, lgm_host->lgm_va + LGM_ADDR_SEL(0));
+	writel(0x17C00051, lgm_host->lgm_va + LGM_ADDR_SEL(cs));
+	nand_set_flash_node(&lgm_host->chip, dev->of_node);
+	mtd = nand_to_mtd(&lgm_host->chip);
+	mtd->dev.parent = dev;
+	lgm_host->dev = dev;
+
+	platform_set_drvdata(pdev, lgm_host);
+	nand_set_controller_data(&lgm_host->chip, lgm_host);
+
+	nand = &lgm_host->chip;
+	nand->controller = &lgm_host->controller;
+	nand->controller->ops = &lgm_nand_controller_ops;
+
+	/* Scan to find existence of the device */
+	ret = nand_scan(&lgm_host->chip, 1);
+	if (ret)
+		goto exit_dma;
+
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret)
+		goto clean_nand;
+
+	return 0;
+
+clean_nand:
+	nand_cleanup(&lgm_host->chip);
+exit_dma:
+	lgm_dma_exit(lgm_host);
+disable_clk:
+	clk_disable_unprepare(lgm_host->clk);
+
+	return ret;
+}
+
+static int lgm_nand_remove(struct platform_device *pdev)
+{
+	struct lgm_nand_host *lgm_host = platform_get_drvdata(pdev);
+
+	nand_release(&lgm_host->chip);
+	clk_disable_unprepare(lgm_host->clk);
+	lgm_dma_exit(lgm_host);
+
+	return 0;
+}
+
+static const struct of_device_id lgm_nand_match[] = {
+	{ .compatible = "intel,lgm-nand", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lgm_nand_match);
+
+static struct platform_driver lgm_nand_driver = {
+	.probe = lgm_nand_probe,
+	.remove = lgm_nand_remove,
+	.driver = {
+		.name = "intel-lgm-nand",
+		.of_match_table = lgm_nand_match,
+	},
+
+};
+module_platform_driver(lgm_nand_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Vadivel Murugan R <vadivel.muruganx.ramuthevar@intel.com>");
+MODULE_DESCRIPTION("Intel's LGM External Bus NAND Controller driver");
-- 
2.11.0

