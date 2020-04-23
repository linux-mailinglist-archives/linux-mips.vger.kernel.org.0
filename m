Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9C61B60AE
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 18:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729652AbgDWQWV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 12:22:21 -0400
Received: from mga01.intel.com ([192.55.52.88]:61951 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729651AbgDWQWU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 12:22:20 -0400
IronPort-SDR: XyX40uj1IFwwzo5ckSrg7GHNMBrVPOuKMTkqFMl2HwtEWCeKd1OafEVT3BapKAmYnfV6GXphrz
 ttGSgUL8+uUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 09:22:18 -0700
IronPort-SDR: tpqoINopVNWAsafwH/SXsa5bkv3I8dwLWyQri4vpqH1UaudJWfhP7ZD+EBLjaxYI528wy9c34E
 /SULWFoofh9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="430380222"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga005.jf.intel.com with ESMTP; 23 Apr 2020 09:22:14 -0700
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
Subject: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date:   Fri, 24 Apr 2020 00:21:13 +0800
Message-Id: <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
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
 drivers/mtd/nand/raw/Kconfig                 |   8 +
 drivers/mtd/nand/raw/Makefile                |   1 +
 drivers/mtd/nand/raw/intel-nand-controller.c | 705 +++++++++++++++++++++++++++
 3 files changed, 714 insertions(+)
 create mode 100644 drivers/mtd/nand/raw/intel-nand-controller.c

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index a80a46bb5b8b..a026bec28f39 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -457,6 +457,14 @@ config MTD_NAND_CADENCE
 	  Enable the driver for NAND flash on platforms using a Cadence NAND
 	  controller.
 
+config MTD_NAND_INTEL_LGM
+	tristate "Support for NAND controller on Intel LGM SoC"
+	depends on OF || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  Enables support for NAND Flash chips on Intel's LGM SoC.
+          NAND flash interfaced through the External Bus Unit.
+
 comment "Misc"
 
 config MTD_SM_COMMON
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 2d136b158fb7..bfc8fe4d2cb0 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_NAND_TEGRA)		+= tegra_nand.o
 obj-$(CONFIG_MTD_NAND_STM32_FMC2)	+= stm32_fmc2_nand.o
 obj-$(CONFIG_MTD_NAND_MESON)		+= meson_nand.o
 obj-$(CONFIG_MTD_NAND_CADENCE)		+= cadence-nand-controller.o
+obj-$(CONFIG_MTD_NAND_INTEL_LGM)	+= intel-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_onfi.o
diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
new file mode 100644
index 000000000000..7f4efdb9e976
--- /dev/null
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -0,0 +1,705 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2020 Intel Corporation. */
+
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand.h>
+#include <linux/resource.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/platform_device.h>
+
+#define EBU_CLC			0x000
+#define EBU_CLC_RST		0x00000000u
+
+#define	EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
+#define	EBU_ADDR_MASK		(5 << 4)
+#define	EBU_ADDR_SEL_REGEN	0x1
+
+#define EBU_BUSCON(n)		(0x60 + (n) * 4)
+#define EBU_BUSCON_CMULT_V4	0x1
+#define EBU_BUSCON_RECOVC(n)	((n) << 2)
+#define EBU_BUSCON_HOLDC(n)	((n) << 4)
+#define EBU_BUSCON_WAITRDC(n)	((n) << 6)
+#define EBU_BUSCON_WAITWRC(n)	((n) << 8)
+#define EBU_BUSCON_BCGEN_CS	0x0
+#define EBU_BUSCON_SETUP_EN	BIT(22)
+#define EBU_BUSCON_ALEC		0xC000
+
+#define EBU_CON			0x0B0
+#define EBU_CON_NANDM_EN	BIT(0)
+#define EBU_CON_NANDM_DIS	0x0
+#define EBU_CON_CSMUX_E_EN	BIT(1)
+#define EBU_CON_ALE_P_LOW	BIT(2)
+#define EBU_CON_CLE_P_LOW	BIT(3)
+#define EBU_CON_CS_P_LOW	BIT(4)
+#define EBU_CON_SE_P_LOW	BIT(5)
+#define EBU_CON_WP_P_LOW	BIT(6)
+#define EBU_CON_PRE_P_LOW	BIT(7)
+#define EBU_CON_IN_CS_S(n)	((n) << 8)
+#define EBU_CON_OUT_CS_S(n)	((n) << 10)
+#define EBU_CON_LAT_EN_CS_P	((0x3D) << 18)
+
+#define EBU_WAIT		0x0B4
+#define EBU_WAIT_RDBY		BIT(0)
+#define EBU_WAIT_WR_C		BIT(3)
+
+#define	EBU_MEM_BASE_CS_0	0x17400
+#define	EBU_MEM_BASE_CS_1	0x17C00
+#define	EBU_MEM_OFFSET		0x051
+
+#define HSNAND_CTL1		0x110
+#define HSNAND_CTL1_ADDR_SHIFT	24
+
+#define HSNAND_CTL2		0x114
+#define HSNAND_CTL2_ADDR_SHIFT	8
+#define HSNAND_CTL2_CYC_N_V5	(0x2 << 16)
+
+#define HSNAND_INT_MSK_CTL	0x124
+#define HSNAND_INT_MSK_CTL_WR_C	BIT(4)
+
+#define HSNAND_INT_STA		0x128
+#define HSNAND_INT_STA_WR_C	BIT(4)
+
+#define HSNAND_CTL		0x130
+#define HSNAND_CTL_MODE_ECC	0x1
+#define HSNAND_CTL_GO		BIT(2)
+#define HSNAND_CTL_CE_SEL_CS(n)	BIT(3 + (n))
+#define HSNAND_CTL_RW_READ	0x0
+#define HSNAND_CTL_RW_WRITE	BIT(10)
+#define HSNAND_CTL_ECC_OFF_V8TH	BIT(11)
+#define HSNAND_CTL_CKFF_EN	0x0
+#define HSNAND_CTL_MSG_EN	BIT(17)
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
+#define NAND_ALE_OFFS		BIT(2)
+#define NAND_CLE_OFFS		BIT(3)
+#define NAND_CS_OFFS		BIT(4)
+
+#define NAND_WRITE_CMD		(NAND_CS_OFFS | NAND_CLE_OFFS)
+#define NAND_WRITE_ADDR		(NAND_CS_OFFS | NAND_ALE_OFFS)
+#define NAND_WRITE_DATA		EBU_CON_CS_P_LOW
+#define NAND_READ_DATA		EBU_CON_CS_P_LOW
+
+#define NAND_ECC_OFFSET		0x008
+
+struct ebu_nand_controller {
+	struct nand_controller	controller;
+	struct nand_chip	chip;
+	void __iomem		*ebu_addr;
+	void __iomem		*nand_addr;
+	void __iomem		*chip_addr;
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
+static inline struct ebu_nand_controller *nand_to_ebu(struct nand_chip *chip)
+{
+	return container_of(chip, struct ebu_nand_controller, chip);
+}
+
+static u8 ebu_nand_readb(struct nand_chip *chip, unsigned int op)
+{
+	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
+	void __iomem *nand_wait = ebu_host->ebu_addr + EBU_WAIT;
+	u32 stat;
+	int ret;
+	u8 val;
+
+	val = readb(ebu_host->chip_addr + op);
+
+	ret = readl_poll_timeout(nand_wait, stat, stat & EBU_WAIT_WR_C,
+				 20, 1000);
+	if (ret)
+		dev_warn(ebu_host->dev,
+			 "ebu nand write timeout. nand_wait(0x%p)=0x%x\n",
+			 nand_wait, readl(nand_wait));
+
+	return val;
+}
+
+static void ebu_nand_writeb(struct nand_chip *chip, int op, u8 value)
+{
+	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
+	void __iomem *nand_wait = ebu_host->ebu_addr + EBU_WAIT;
+	u32 stat;
+	int ret;
+
+	writeb(value, ebu_host->chip_addr + op);
+
+	ret = readl_poll_timeout(nand_wait, stat, stat & EBU_WAIT_WR_C,
+				 20, 1000);
+	if (ret)
+		dev_warn(ebu_host->dev,
+			 "ebu nand write timeout. nand_wait(0x%p)=0x%x\n",
+			 nand_wait, readl(nand_wait));
+}
+
+static void ebu_read_buf(struct nand_chip *chip, u_char *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = ebu_nand_readb(chip, NAND_READ_DATA);
+}
+
+static void ebu_write_buf(struct nand_chip *chip, const u_char *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		ebu_nand_writeb(chip, NAND_WRITE_DATA, buf[i]);
+}
+
+static void ebu_unselect_chip(struct nand_chip *chip)
+{
+	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
+	void __iomem *nand_con = ebu_host->ebu_addr + EBU_CON;
+	int val;
+
+	val = readl(nand_con);
+	writel(val & ~EBU_CON_NANDM_EN, nand_con);
+}
+
+static void ebu_select_chip(struct nand_chip *chip)
+{
+	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
+	void __iomem *nand_con = ebu_host->ebu_addr + EBU_CON;
+	u32 cs = ebu_host->cs;
+
+	writel(EBU_CON_NANDM_EN | EBU_CON_CSMUX_E_EN | EBU_CON_CS_P_LOW |
+	       EBU_CON_SE_P_LOW | EBU_CON_WP_P_LOW | EBU_CON_PRE_P_LOW |
+	       EBU_CON_IN_CS_S(cs) | EBU_CON_OUT_CS_S(cs) |
+	       EBU_CON_LAT_EN_CS_P, nand_con);
+}
+
+static int ebu_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = NAND_ECC_OFFSET;
+	oobregion->length = chip->ecc.total;
+
+	return 0;
+}
+
+static int ebu_nand_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = chip->ecc.total + NAND_ECC_OFFSET;
+	oobregion->length = mtd->oobsize - oobregion->offset;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops ebu_nand_ooblayout_ops = {
+	.ecc = ebu_nand_ooblayout_ecc,
+	.free = ebu_nand_ooblayout_free,
+};
+
+static void ebu_dma_rx_callback(void *cookie)
+{
+	struct ebu_nand_controller *ebu_host = cookie;
+
+	dmaengine_terminate_async(ebu_host->dma_rx);
+
+	complete(&ebu_host->dma_access_complete);
+}
+
+static void ebu_dma_tx_callback(void *cookie)
+{
+	struct ebu_nand_controller *ebu_host = cookie;
+
+	dmaengine_terminate_async(ebu_host->dma_tx);
+
+	complete(&ebu_host->dma_access_complete);
+}
+
+static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
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
+		chan = ebu_host->dma_rx;
+		dma_completion = &ebu_host->dma_access_complete;
+		callback = ebu_dma_rx_callback;
+	} else {
+		chan = ebu_host->dma_tx;
+		dma_completion = &ebu_host->dma_access_complete;
+		callback = ebu_dma_tx_callback;
+	}
+
+	buf_dma = dma_map_single(chan->device->dev, (void *)buf, len, dir);
+	if (dma_mapping_error(chan->device->dev, buf_dma)) {
+		dev_err(ebu_host->dev, "Failed to map DMA buffer\n");
+		ret = -EIO;
+		goto err_unmap;
+	}
+
+	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
+	if (!tx)
+		return -ENXIO;
+
+	tx->callback = callback;
+	tx->callback_param = ebu_host;
+	cookie = tx->tx_submit(tx);
+
+	ret = dma_submit_error(cookie);
+	if (ret) {
+		dev_err(ebu_host->dev, "dma_submit_error %d\n", cookie);
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
+		dev_err(ebu_host->dev, "I/O Error in DMA RX (status %d)\n",
+			dmaengine_tx_status(chan, cookie, NULL));
+		dmaengine_terminate_sync(chan);
+		ret = -ETIMEDOUT;
+		goto err_unmap;
+	}
+
+	return 0;
+
+err_unmap:
+	dma_unmap_single(ebu_host->dev, buf_dma, len, dir);
+
+	return ret;
+}
+
+static void ebu_nand_trigger(struct ebu_nand_controller *ebu_host,
+			     int page, u32 cmd)
+{
+	unsigned int val;
+
+	val = cmd | (page & 0xFF) << HSNAND_CTL1_ADDR_SHIFT;
+	writel(val, ebu_host->nand_addr + HSNAND_CTL1);
+	val = (page & 0xFFFF00) >> 8 | HSNAND_CTL2_CYC_N_V5;
+	writel(val, ebu_host->nand_addr + HSNAND_CTL2);
+
+	writel(ebu_host->nd_para0, ebu_host->nand_addr + NAND_PARA0);
+
+	/* clear first, will update later */
+	writel(0xFFFFFFFF, ebu_host->nand_addr + NAND_CMSG_0);
+	writel(0xFFFFFFFF, ebu_host->nand_addr + NAND_CMSG_1);
+
+	writel(HSNAND_INT_MSK_CTL_WR_C,
+	       ebu_host->nand_addr + HSNAND_INT_MSK_CTL);
+
+	val = cmd == NAND_CMD_READ0 ? HSNAND_CTL_RW_READ : HSNAND_CTL_RW_WRITE;
+
+	writel(HSNAND_CTL_MSG_EN | HSNAND_CTL_CKFF_EN |
+	       HSNAND_CTL_ECC_OFF_V8TH | HSNAND_CTL_CE_SEL_CS(ebu_host->cs) |
+	       HSNAND_CTL_MODE_ECC | HSNAND_CTL_GO | val,
+	       ebu_host->nand_addr + HSNAND_CTL);
+}
+
+static int ebu_nand_read_page_hwecc(struct nand_chip *chip, u8 *buf,
+				    int oob_required, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
+	int ret, x;
+
+	ebu_nand_trigger(ebu_host, page, NAND_CMD_READ0);
+
+	ret = ebu_dma_start(ebu_host, DMA_DEV_TO_MEM, buf, mtd->writesize);
+	if (ret)
+		return ret;
+
+	if (oob_required)
+		chip->ecc.read_oob(chip, page);
+
+	x = readl(ebu_host->nand_addr + HSNAND_CTL);
+	x &= ~HSNAND_CTL_GO;
+	writel(x, ebu_host->nand_addr + HSNAND_CTL);
+
+	return 0;
+}
+
+static int ebu_nand_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
+				     int oob_required, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
+	void __iomem *int_sta = ebu_host->nand_addr + HSNAND_INT_STA;
+	int ret, val, x;
+	__be32 reg;
+
+	ebu_nand_trigger(ebu_host, page, NAND_CMD_SEQIN);
+
+	ret = ebu_dma_start(ebu_host, DMA_MEM_TO_DEV, buf, mtd->writesize);
+	if (ret)
+		return ret;
+
+	if (oob_required) {
+		const u8 *pdata;
+
+		pdata = chip->oob_poi;
+		reg = cpu_to_be32(*pdata++);
+		writel(reg, ebu_host->nand_addr + NAND_CMSG_0);
+
+		reg = cpu_to_be32(*pdata);
+		writel(reg, ebu_host->nand_addr + NAND_CMSG_1);
+	}
+
+	ret = readl_poll_timeout_atomic(int_sta, val,
+					!(val & HSNAND_INT_STA_WR_C), 10, 1000);
+	if (ret)
+		return -EIO;
+
+	x = readl(ebu_host->nand_addr + HSNAND_CTL);
+	x &= ~HSNAND_CTL_GO;
+	writel(x, ebu_host->nand_addr + HSNAND_CTL);
+
+	return 0;
+}
+
+static const u8 ecc_strength[] = { 1, 1, 4, 8, 24, 32, 40, 60, };
+
+static int ebu_nand_attach_chip(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct ebu_nand_controller *ebu_host = nand_get_controller_data(chip);
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
+	ebu_host->nd_para0 = pagesize | pg_per_blk | NAND_PARA0_BYP_EN_NP |
+			     NAND_PARA0_BYP_DEC_NP | NAND_PARA0_ADEP_EN |
+			     NAND_PARA0_TYPE_ONFI | (val << 29);
+
+	mtd_set_ooblayout(mtd, &ebu_nand_ooblayout_ops);
+	chip->ecc.read_page = ebu_nand_read_page_hwecc;
+	chip->ecc.write_page = ebu_nand_write_page_hwecc;
+
+	return 0;
+}
+
+static int ebu_nand_exec_op(struct nand_chip *chip,
+			    const struct nand_operation *op, bool check_only)
+{
+	struct ebu_nand_controller *ctrl = nand_to_ebu(chip);
+	const struct nand_op_instr *instr = NULL;
+	unsigned int op_id;
+	int i, time_out, ret = 0;
+	u32 stat;
+
+	ebu_select_chip(chip);
+
+	for (op_id = 0; op_id < op->ninstrs; op_id++) {
+		instr = &op->instrs[op_id];
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			ebu_nand_writeb(chip, NAND_CLE_OFFS,
+					instr->ctx.cmd.opcode);
+			break;
+
+		case NAND_OP_ADDR_INSTR:
+			for (i = 0; i < instr->ctx.addr.naddrs; i++)
+				ebu_nand_writeb(chip, NAND_ALE_OFFS,
+						instr->ctx.addr.addrs[i]);
+			break;
+
+		case NAND_OP_DATA_IN_INSTR:
+			ebu_read_buf(chip, instr->ctx.data.buf.in,
+				     instr->ctx.data.len);
+			break;
+
+		case NAND_OP_DATA_OUT_INSTR:
+			ebu_write_buf(chip, instr->ctx.data.buf.out,
+				      instr->ctx.data.len);
+			break;
+
+		case NAND_OP_WAITRDY_INSTR:
+			time_out = instr->ctx.waitrdy.timeout_ms * 1000;
+			ret = readl_poll_timeout(ctrl->ebu_addr + EBU_WAIT,
+						 stat, stat & EBU_WAIT_RDBY,
+						 20, time_out);
+			break;
+		}
+	}
+
+	ebu_unselect_chip(chip);
+
+	return ret;
+}
+
+static const struct nand_controller_ops ebu_nand_controller_ops = {
+	.attach_chip = ebu_nand_attach_chip,
+	.exec_op = ebu_nand_exec_op,
+};
+
+static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
+{
+	if (ebu_host->dma_rx) {
+		dma_release_channel(ebu_host->dma_rx);
+		ebu_host->dma_rx = NULL;
+	}
+
+	if (ebu_host->dma_tx) {
+		dma_release_channel(ebu_host->dma_tx);
+		ebu_host->dma_tx = NULL;
+	}
+}
+
+static int ebu_nand_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ebu_nand_controller *ebu_host;
+	struct nand_chip *nand;
+	phys_addr_t nandaddr_pa;
+	struct mtd_info *mtd;
+	struct resource *res;
+	int ret;
+	u32 cs;
+
+	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	if (!ebu_host)
+		return -ENOMEM;
+
+	ebu_host->dev = dev;
+	nand_controller_init(&ebu_host->controller);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
+	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ebu_host->ebu_addr))
+		return PTR_ERR(ebu_host->ebu_addr);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
+	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ebu_host->nand_addr))
+		return PTR_ERR(ebu_host->nand_addr);
+
+	ret = device_property_read_u32(dev, "nand,cs", &cs);
+	if (ret) {
+		dev_err(dev, "failed to get chip select: %d\n", ret);
+		return ret;
+	}
+
+	ebu_host->cs = cs;
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cs0");
+	ebu_host->chip_addr = devm_ioremap_resource(&pdev->dev, res);
+	nandaddr_pa = res->start;
+	if (IS_ERR(ebu_host->chip_addr))
+		return PTR_ERR(ebu_host->chip_addr);
+
+	ebu_host->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(ebu_host->clk)) {
+		ret = PTR_ERR(ebu_host->clk);
+		dev_err(dev, "failed to get clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ebu_host->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
+	ebu_host->clk_rate = clk_get_rate(ebu_host->clk);
+
+	ebu_host->dma_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(ebu_host->dma_tx)) {
+		ret = PTR_ERR(ebu_host->dma_tx);
+		dev_err(dev, "DMA tx channel request fail!.\n");
+		goto exit_dma;
+	}
+
+	ebu_host->dma_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(ebu_host->dma_rx)) {
+		ret = PTR_ERR(ebu_host->dma_rx);
+		dev_err(dev, "DMA tx channel request fail!.\n");
+		goto exit_dma;
+	}
+
+	writel(lower_32_bits(nandaddr_pa) | EBU_ADDR_SEL_REGEN | EBU_ADDR_MASK,
+	       ebu_host->ebu_addr + EBU_ADDR_SEL(cs));
+
+	writel(EBU_BUSCON_CMULT_V4 | EBU_BUSCON_RECOVC(1) |
+	       EBU_BUSCON_HOLDC(1) | EBU_BUSCON_WAITRDC(2) |
+	       EBU_BUSCON_WAITWRC(2) | EBU_BUSCON_BCGEN_CS | EBU_BUSCON_ALEC |
+	       EBU_BUSCON_SETUP_EN, ebu_host->ebu_addr + EBU_BUSCON(cs));
+
+	/*
+	 * NAND physical address selection is based on the chip select
+	 * and written to ADDR_SEL register to get Memory Region Base address.
+	 * FPI Bus addresses are compared to this base address in conjunction
+	 * with the mask control. Driver need to program this field!
+	 * Address: 0x17400 if chip select is CS_0
+	 * Address: 0x17C00 if chip select is CS_1
+	 */
+	writel(EBU_MEM_BASE_CS_0 + EBU_MEM_OFFSET,
+	       ebu_host->ebu_addr + EBU_ADDR_SEL(0));
+	writel(EBU_MEM_BASE_CS_1 + EBU_MEM_OFFSET,
+	       ebu_host->ebu_addr + EBU_ADDR_SEL(cs));
+	nand_set_flash_node(&ebu_host->chip, dev->of_node);
+	mtd = nand_to_mtd(&ebu_host->chip);
+	mtd->dev.parent = dev;
+	ebu_host->dev = dev;
+
+	platform_set_drvdata(pdev, ebu_host);
+	nand_set_controller_data(&ebu_host->chip, ebu_host);
+
+	nand = &ebu_host->chip;
+	nand->controller = &ebu_host->controller;
+	nand->controller->ops = &ebu_nand_controller_ops;
+
+	/* Scan to find existence of the device */
+	ret = nand_scan(&ebu_host->chip, 1);
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
+	nand_cleanup(&ebu_host->chip);
+exit_dma:
+	ebu_dma_cleanup(ebu_host);
+	clk_disable_unprepare(ebu_host->clk);
+
+	return ret;
+}
+
+static int ebu_nand_remove(struct platform_device *pdev)
+{
+	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
+
+	mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
+	nand_cleanup(&ebu_host->chip);
+	clk_disable_unprepare(ebu_host->clk);
+	ebu_dma_cleanup(ebu_host);
+
+	return 0;
+}
+
+static const struct of_device_id ebu_nand_match[] = {
+	{ .compatible = "intel,nand-controller", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ebu_nand_match);
+
+static struct platform_driver ebu_nand_driver = {
+	.probe = ebu_nand_probe,
+	.remove = ebu_nand_remove,
+	.driver = {
+		.name = "intel-nand-controller",
+		.of_match_table = ebu_nand_match,
+	},
+
+};
+module_platform_driver(ebu_nand_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Vadivel Murugan R <vadivel.muruganx.ramuthevar@intel.com>");
+MODULE_DESCRIPTION("Intel's LGM External Bus NAND Controller driver");
-- 
2.11.0

