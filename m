Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F15D957E4B8
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jul 2022 18:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235877AbiGVQtD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jul 2022 12:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiGVQtA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Jul 2022 12:49:00 -0400
Received: from out28-51.mail.aliyun.com (out28-51.mail.aliyun.com [115.124.28.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D98593C2D;
        Fri, 22 Jul 2022 09:48:57 -0700 (PDT)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0318391-0.00029028-0.967871;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047207;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.Ob0cnP9_1658508531;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Ob0cnP9_1658508531)
          by smtp.aliyun-inc.com;
          Sat, 23 Jul 2022 00:48:52 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com,
        tmn505@gmail.com, paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
        reimu@sudomaker.com
Subject: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
Date:   Sat, 23 Jul 2022 00:48:30 +0800
Message-Id: <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add SFC support for the X1000 SoC, the X1600 SoC, and the X2000 SoC
from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 drivers/spi/Kconfig           |   9 +
 drivers/spi/Makefile          |   1 +
 drivers/spi/spi-ingenic-sfc.c | 662 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 672 insertions(+)
 create mode 100644 drivers/spi/spi-ingenic-sfc.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 3b1044e..1077bd3 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -437,6 +437,15 @@ config SPI_INGENIC
 	  To compile this driver as a module, choose M here: the module
 	  will be called spi-ingenic.
 
+config SPI_INGENIC_SFC
+	tristate "Ingenic SoCs SPI Flash Controller"
+	depends on MACH_INGENIC || COMPILE_TEST
+	help
+	  This enables support for the Ingenic SoCs SPI flash controller.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called ingenic-sfc.
+
 config SPI_INTEL
 	tristate
 
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 0f44eb6..f3e42c0 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_SPI_HISI_SFC_V3XX)		+= spi-hisi-sfc-v3xx.o
 obj-$(CONFIG_SPI_IMG_SPFI)		+= spi-img-spfi.o
 obj-$(CONFIG_SPI_IMX)			+= spi-imx.o
 obj-$(CONFIG_SPI_INGENIC)		+= spi-ingenic.o
+obj-$(CONFIG_SPI_INGENIC_SFC)	+= spi-ingenic-sfc.o
 obj-$(CONFIG_SPI_INTEL)			+= spi-intel.o
 obj-$(CONFIG_SPI_INTEL_PCI)		+= spi-intel-pci.o
 obj-$(CONFIG_SPI_INTEL_PLATFORM)	+= spi-intel-platform.o
diff --git a/drivers/spi/spi-ingenic-sfc.c b/drivers/spi/spi-ingenic-sfc.c
new file mode 100644
index 00000000..a565546
--- /dev/null
+++ b/drivers/spi/spi-ingenic-sfc.c
@@ -0,0 +1,662 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Ingenic SoCs SPI Flash Controller Driver
+ * Copyright (c) 2022 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+
+/* SFC register offsets */
+#define SFC_REG_GLB						0x0000
+#define SFC_REG_DEV_CONF				0x0004
+#define SFC_REG_DEV_STA_EXP				0x0008
+#define SFC_REG_DEV_STA_RT				0x000c
+#define SFC_REG_DEV_STA_MSK				0x0010
+#define SFC_REG_TRAN_CONF(n)			(0x0014 + n * 4)
+#define SFC_REG_TRAN_CFG0(n)			(0x0014 + n * 4)
+#define SFC_REG_TRAN_LEN				0x002c
+#define SFC_REG_DEV_ADDR(n)				(0x0030 + n * 4)
+#define SFC_REG_DEV_ADDR_PLUS(n)		(0x0048 + n * 4)
+#define SFC_REG_MEM_ADDR				0x0060
+#define SFC_REG_TRIG					0x0064
+#define SFC_REG_SR						0x0068
+#define SFC_REG_SCR						0x006c
+#define SFC_REG_INTC					0x0070
+#define SFC_REG_FSM						0x0074
+#define SFC_REG_CGE						0x0078
+#define SFC_REG_TRAN_CFG1(n)			(0x009c + n * 4)
+#define SFC_REG_DR						0x1000
+
+/* bits within the GLB register */
+#define GLB_TRAN_DIR_MASK				GENMASK(13, 13)
+#define GLB_TRAN_DIR_WRITE				0x1
+#define GLB_TRAN_DIR_READ				0x0
+#define GLB_THRESHOLD_MASK				GENMASK(12, 7)
+#define GLB_OP_MODE_MASK				GENMASK(6, 6)
+#define GLB_OP_MODE_DMA					0x1
+#define GLB_OP_MODE_SLAVE				0x0
+#define GLB_PHASE_NUM_MASK				GENMASK(5, 3)
+#define GLB_WP_EN						BIT(2)
+#define GLB_BURST_MD_MASK				GENMASK(1, 0)
+#define GLB_BURST_MD_INCR32				0x3
+#define GLB_BURST_MD_INCR16				0x2
+#define GLB_BURST_MD_INCR8				0x1
+#define GLB_BURST_MD_INCR4				0x0
+
+/* bits within the DEV_CONF register */
+#define DEV_CONF_SMP_DELAY_MASK			GENMASK(20, 16)
+#define DEV_CONF_SMP_DELAY_180DEG		0x4
+#define DEV_CONF_SMP_DELAY_HALF_CYCLE	0x1
+#define DEV_CONF_CMD_TYPE_MASK			GENMASK(15, 15)
+#define DEV_CONF_CMD_TYPE_16BIT			0x1
+#define DEV_CONF_CMD_TYPE_8BIT			0x0
+#define DEV_CONF_STA_TYPE_MASK			GENMASK(14, 13)
+#define DEV_CONF_THOLD_MASK				GENMASK(12, 11)
+#define DEV_CONF_TSETUP_MASK			GENMASK(10, 9)
+#define DEV_CONF_TSH_MASK				GENMASK(8, 5)
+#define DEV_CONF_CPHA					BIT(4)
+#define DEV_CONF_CPOL					BIT(3)
+#define DEV_CONF_CE_DL					BIT(2)
+#define DEV_CONF_HOLD_DL				BIT(1)
+#define DEV_CONF_WP_DL					BIT(0)
+
+/* bits within the TRAN_CONF(n) register */
+#define TRAN_CONF_TRAN_MODE_MASK		GENMASK(31, 29)
+#define TRAN_CONF_ADDR_WIDTH_MASK		GENMASK(28, 26)
+#define TRAN_CONF_POLL_EN				BIT(25)
+#define TRAN_CONF_CMD_EN				BIT(24)
+#define TRAN_CONF_PHASE_FORMAT_MASK		GENMASK(23, 23)
+#define TRAN_CONF_DMY_BITS_MASK			GENMASK(22, 17)
+#define TRAN_CONF_DATA_EN				BIT(16)
+#define TRAN_CONF_CMD_MASK				GENMASK(15, 0)
+
+/* bits within the TRIG register */
+#define TRIG_FLUSH						BIT(2)
+#define TRIG_STOP						BIT(1)
+#define TRIG_START						BIT(0)
+
+/* bits within the SR register */
+#define SR_FIFO_NUM_MASK				GENMASK(22, 16)
+#define SR_END							BIT(4)
+#define SR_TRAN_REQ						BIT(3)
+#define SR_RECE_REQ						BIT(2)
+#define SR_OVER							BIT(1)
+#define SR_UNDER						BIT(0)
+
+/* bits within the SCR register */
+#define SCR_CLR_END						BIT(4)
+#define SCR_CLR_TREQ					BIT(3)
+#define SCR_CLR_RREQ					BIT(2)
+#define SCR_CLR_OVER					BIT(1)
+#define SCR_CLR_UNDER					BIT(0)
+
+/* bits within the INTC register */
+#define INTC_MASK_END					BIT(4)
+#define INTC_MASK_TREQ					BIT(3)
+#define INTC_MASK_RREQ					BIT(2)
+#define INTC_MASK_OVER					BIT(1)
+#define INTC_MASK_UNDER					BIT(0)
+
+/* bits within the TRAN_CFG1(n) register */
+#define TRAN_CFG1_TRAN_MODE_MASK		GENMASK(7, 4)
+
+#define TRAN_MODE_STANDARD				0
+#define TRAN_MODE_DUAL_DATA				1
+#define TRAN_MODE_DUAL_IO				2
+#define TRAN_MODE_DUAL_FULL				3
+#define TRAN_MODE_QUAD_DATA				5
+#define TRAN_MODE_QUAD_IO				6
+#define TRAN_MODE_QUAD_FULL				7
+#define TRAN_MODE_OCTAL_DATA			9
+#define TRAN_MODE_OCTAL_IO				10
+#define TRAN_MODE_OCTAL_FULL			11
+
+#define INGENIC_SFC_FIFO_SIZE			(64 * 4)
+
+#define INGENIC_SFC_TRANSFER_TIMEOUT	1000
+
+enum ingenic_sfc_version {
+	ID_X1000,
+	ID_X1600,
+	ID_X2000,
+};
+
+struct ingenic_soc_info {
+	enum ingenic_sfc_version version;
+
+	unsigned int max_bus_width;
+
+	const u32 tran_mode_mask;
+};
+
+struct ingenic_sfc {
+	const struct ingenic_soc_info *soc_info;
+
+	void __iomem *base;
+	struct device *dev;
+	struct clk *clk;
+	int irq;
+
+	struct completion completion;
+};
+
+static irqreturn_t ingenic_sfc_irq_handler(int irq, void *data)
+{
+	struct ingenic_sfc *sfc = data;
+
+	writel(0x1f, sfc->base + SFC_REG_INTC);
+
+	complete(&sfc->completion);
+
+	return IRQ_HANDLED;
+}
+
+static int ingenic_sfc_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+{
+	uintptr_t addr = (uintptr_t)op->data.buf.in;
+
+	if (op->data.nbytes > INGENIC_SFC_FIFO_SIZE && !IS_ALIGNED(addr, 4))
+		op->data.nbytes = INGENIC_SFC_FIFO_SIZE;
+
+	return 0;
+}
+
+static bool ingenic_sfc_supports_op(struct spi_mem *mem, const struct spi_mem_op *op)
+{
+	struct spi_device *spi = mem->spi;
+	struct ingenic_sfc *sfc = spi_controller_get_devdata(spi->master);
+	uintptr_t addr = (uintptr_t)op->data.buf.in;
+
+	/* The controller only supports Standard SPI mode, Duall mode, Quad mode and Octal mode. */
+	if (op->cmd.buswidth > sfc->soc_info->max_bus_width ||
+		op->addr.buswidth > sfc->soc_info->max_bus_width ||
+		op->dummy.buswidth > sfc->soc_info->max_bus_width ||
+		op->data.buswidth > sfc->soc_info->max_bus_width)
+		return false;
+
+	/* Max 32 dummy clock cycles supported */
+	if (op->dummy.nbytes && op->dummy.nbytes * 8 / op->dummy.buswidth > 32)
+		return false;
+
+	/* Max rx data length, check controller limits and alignment */
+	if (op->data.dir == SPI_MEM_DATA_IN &&
+		op->data.nbytes > INGENIC_SFC_FIFO_SIZE && !IS_ALIGNED(addr, 4))
+		return false;
+
+	/* Max 6 bytes address width supported */
+	if (op->addr.nbytes > 6)
+		return false;
+
+	return spi_mem_default_supports_op(mem, op);
+}
+
+static void ingenic_sfc_set_transfer_mode(struct ingenic_sfc *sfc, const struct spi_mem_op *op)
+{
+	int val;
+
+	val = readl(sfc->base + (sfc->soc_info->version >= ID_X1600 ?
+			SFC_REG_TRAN_CFG1(0) : SFC_REG_TRAN_CONF(0)));
+	val &= ~sfc->soc_info->tran_mode_mask;
+	if (op->cmd.buswidth == 8)
+		val |= (TRAN_MODE_OCTAL_FULL << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	else if (op->cmd.buswidth == 4)
+		val |= (TRAN_MODE_QUAD_FULL << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	else if (op->cmd.buswidth == 2)
+		val |= (TRAN_MODE_DUAL_FULL << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	else if (op->addr.buswidth == 8)
+		val |= (TRAN_MODE_OCTAL_IO << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	else if (op->addr.buswidth == 4)
+		val |= (TRAN_MODE_QUAD_IO << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	else if (op->addr.buswidth == 2)
+		val |= (TRAN_MODE_DUAL_IO << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	else if (op->data.buswidth == 8)
+		val |= (TRAN_MODE_OCTAL_DATA << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	else if (op->data.buswidth == 4)
+		val |= (TRAN_MODE_QUAD_DATA << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	else if (op->data.buswidth == 2)
+		val |= (TRAN_MODE_DUAL_DATA << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	else
+		val |= (TRAN_MODE_STANDARD << (ffs(sfc->soc_info->tran_mode_mask) - 1)) &
+				sfc->soc_info->tran_mode_mask;
+	writel(val, sfc->base + (sfc->soc_info->version >= ID_X1600 ?
+			SFC_REG_TRAN_CFG1(0) : SFC_REG_TRAN_CONF(0)));
+}
+
+/*
+ * We only need PIO mode to handle the SPI_MEM_NO_DATA transfers,
+ * and the unaligned accesses in SPI_MEM_DATA_IN transfers.
+ */
+static void ingenic_sfc_read_rxfifo(struct ingenic_sfc *sfc, u8 *to, unsigned int len)
+{
+	void __iomem *from;
+
+	from = sfc->base + SFC_REG_DR;
+
+	for (; len >= 4; len -= 4, to += 4) {
+		u32 val = __raw_readl(from);
+		memcpy(to, &val, 4);
+	}
+
+	if (len) {
+		u32 val = __raw_readl(from);
+		memcpy(to, &val, len);
+	}
+}
+
+static int ingenic_sfc_exec_op_pio(struct ingenic_sfc *sfc, const struct spi_mem_op *op)
+{
+	int ret, val;
+
+	val = readl(sfc->base + SFC_REG_GLB);
+	u32p_replace_bits(&val, GLB_TRAN_DIR_READ, GLB_TRAN_DIR_MASK);
+	u32p_replace_bits(&val, GLB_OP_MODE_SLAVE, GLB_OP_MODE_MASK);
+	writel(val, sfc->base + SFC_REG_GLB);
+
+	val = TRAN_CONF_CMD_EN | op->cmd.opcode;
+
+	if (op->addr.nbytes > 0) {
+		val |= FIELD_PREP(TRAN_CONF_ADDR_WIDTH_MASK, op->addr.nbytes);
+
+		writel(op->addr.val & 0xffffffff, sfc->base + SFC_REG_DEV_ADDR(0));
+		writel(op->addr.val >> 32, sfc->base + SFC_REG_DEV_ADDR_PLUS(0));
+	}
+
+	if (op->dummy.nbytes > 0)
+		val |= FIELD_PREP(TRAN_CONF_DMY_BITS_MASK,
+				op->dummy.nbytes * 8 / op->dummy.buswidth);
+
+	if (op->data.nbytes > 0)
+		val |= TRAN_CONF_DATA_EN;
+
+	writel(val, sfc->base + SFC_REG_TRAN_CONF(0));
+	writel(op->data.nbytes, sfc->base + SFC_REG_TRAN_LEN);
+
+	ingenic_sfc_set_transfer_mode(sfc, op);
+
+	writel(0x1f, sfc->base + SFC_REG_SCR);
+	writel(~(INTC_MASK_END | INTC_MASK_RREQ), sfc->base + SFC_REG_INTC);
+
+	writel(0, sfc->base + SFC_REG_MEM_ADDR);
+
+	writel(TRIG_FLUSH, sfc->base + SFC_REG_TRIG);
+	writel(TRIG_START, sfc->base + SFC_REG_TRIG);
+
+	ret = wait_for_completion_timeout(&sfc->completion,
+			msecs_to_jiffies(INGENIC_SFC_TRANSFER_TIMEOUT));
+	if (!ret) {
+		writel(0x1f, sfc->base + SFC_REG_INTC);
+		writel(0x1f, sfc->base + SFC_REG_SCR);
+		dev_err(sfc->dev, "line:%d Timeout for ACK from SFC device\n", __LINE__);
+		return -ETIMEDOUT;
+	}
+
+	ingenic_sfc_read_rxfifo(sfc, op->data.buf.in, op->data.nbytes);
+	readl_poll_timeout(sfc->base + SFC_REG_SR, val, val & SR_END, 10, 0);
+
+	writel(INTC_MASK_END | INTC_MASK_RREQ, sfc->base + SFC_REG_SCR);
+	writel(TRIG_STOP, sfc->base + SFC_REG_TRIG);
+
+	return 0;
+}
+
+static int ingenic_sfc_exec_op_dma(struct ingenic_sfc *sfc, const struct spi_mem_op *op)
+{
+	dma_addr_t addr;
+	int ret, val;
+
+	val = readl(sfc->base + SFC_REG_GLB);
+	u32p_replace_bits(&val, op->data.dir == SPI_MEM_DATA_IN ?
+			GLB_TRAN_DIR_READ : GLB_TRAN_DIR_WRITE, GLB_TRAN_DIR_MASK);
+	u32p_replace_bits(&val, GLB_OP_MODE_DMA, GLB_OP_MODE_MASK);
+	writel(val, sfc->base + SFC_REG_GLB);
+
+	val = TRAN_CONF_CMD_EN | op->cmd.opcode;
+
+	if (op->addr.nbytes > 0) {
+		val |= FIELD_PREP(TRAN_CONF_ADDR_WIDTH_MASK, op->addr.nbytes);
+		writel(op->addr.val & 0xffffffff, sfc->base + SFC_REG_DEV_ADDR(0));
+		writel(op->addr.val >> 32, sfc->base + SFC_REG_DEV_ADDR_PLUS(0));
+	}
+
+	if (op->dummy.nbytes > 0)
+		val |= FIELD_PREP(TRAN_CONF_DMY_BITS_MASK,
+				op->dummy.nbytes * 8 / op->dummy.buswidth);
+
+	if (op->data.nbytes > 0)
+		val |= TRAN_CONF_DATA_EN;
+
+	writel(val, sfc->base + SFC_REG_TRAN_CONF(0));
+	writel(op->data.nbytes, sfc->base + SFC_REG_TRAN_LEN);
+
+	ingenic_sfc_set_transfer_mode(sfc, op);
+
+	writel(0x1f, sfc->base + SFC_REG_SCR);
+	writel(~INTC_MASK_END, sfc->base + SFC_REG_INTC);
+
+	switch (op->data.dir) {
+	case SPI_MEM_DATA_IN:
+		addr = dma_map_single(sfc->dev, op->data.buf.in, op->data.nbytes, DMA_FROM_DEVICE);
+		if (dma_mapping_error(sfc->dev, addr)) {
+			dev_err(sfc->dev, "RX DMA　memory not mapped\n");
+			return -ENOMEM;
+		}
+
+		writel(addr, sfc->base + SFC_REG_MEM_ADDR);
+		break;
+
+	case SPI_MEM_DATA_OUT:
+		addr = dma_map_single(sfc->dev, (void *)op->data.buf.out,
+				op->data.nbytes, DMA_TO_DEVICE);
+		if (dma_mapping_error(sfc->dev, addr)) {
+			dev_err(sfc->dev, "TX DMA　memory not mapped\n");
+			return -ENOMEM;
+		}
+
+		writel(addr, sfc->base + SFC_REG_MEM_ADDR);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(TRIG_START, sfc->base + SFC_REG_TRIG);
+
+	ret = wait_for_completion_timeout(&sfc->completion,
+			msecs_to_jiffies(INGENIC_SFC_TRANSFER_TIMEOUT));
+	if (!ret) {
+		writel(0x1f, sfc->base + SFC_REG_INTC);
+		writel(0x1f, sfc->base + SFC_REG_SCR);
+		dev_err(sfc->dev, "line:%d Timeout for ACK from SFC device\n", __LINE__);
+		return -ETIMEDOUT;
+	}
+
+	dma_unmap_single(sfc->dev, addr, op->data.nbytes,
+			op->data.dir == SPI_MEM_DATA_IN ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+
+	writel(INTC_MASK_END, sfc->base + SFC_REG_SCR);
+	writel(TRIG_STOP, sfc->base + SFC_REG_TRIG);
+
+	return 0;
+}
+
+static int ingenic_sfc_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
+{
+	struct spi_device *spi = mem->spi;
+	struct ingenic_sfc *sfc = spi_controller_get_devdata(spi->master);
+	uintptr_t addr = (uintptr_t)op->data.buf.in;
+
+	init_completion(&sfc->completion);
+
+	switch (op->data.dir) {
+	case SPI_MEM_DATA_IN:
+		if (sfc->soc_info->version >= ID_X1600 || IS_ALIGNED(addr, 4))
+			break;
+
+		fallthrough;
+
+	case SPI_MEM_NO_DATA:
+		return ingenic_sfc_exec_op_pio(sfc, op);
+
+	default:
+		break;
+	}
+
+	return ingenic_sfc_exec_op_dma(sfc, op);
+}
+
+static int ingenic_sfc_poll_status(struct spi_mem *mem, const struct spi_mem_op *op,
+			u16 mask, u16 match, unsigned long initial_delay_us,
+			unsigned long polling_delay_us, unsigned long timeout_ms)
+{
+	struct spi_device *spi = mem->spi;
+	struct ingenic_sfc *sfc = spi_controller_get_devdata(spi->master);
+	int ret, val;
+
+	init_completion(&sfc->completion);
+
+	val = readl(sfc->base + SFC_REG_GLB);
+	u32p_replace_bits(&val, GLB_TRAN_DIR_READ, GLB_TRAN_DIR_MASK);
+	u32p_replace_bits(&val, GLB_OP_MODE_SLAVE, GLB_OP_MODE_MASK);
+	writel(val, sfc->base + SFC_REG_GLB);
+
+	writel(match, sfc->base + SFC_REG_DEV_STA_EXP);
+	writel(mask, sfc->base + SFC_REG_DEV_STA_MSK);
+
+	val = TRAN_CONF_POLL_EN | TRAN_CONF_CMD_EN | op->cmd.opcode;
+
+	if (op->addr.nbytes > 0) {
+		val |= FIELD_PREP(TRAN_CONF_ADDR_WIDTH_MASK, op->addr.nbytes);
+
+		writel(op->addr.val & 0xffffffff, sfc->base + SFC_REG_DEV_ADDR(0));
+		writel(op->addr.val >> 32, sfc->base + SFC_REG_DEV_ADDR_PLUS(0));
+	}
+
+	if (op->dummy.nbytes > 0)
+		val |= FIELD_PREP(TRAN_CONF_DMY_BITS_MASK,
+				op->dummy.nbytes * 8 / op->dummy.buswidth);
+
+	if (op->data.nbytes > 0)
+		val |= TRAN_CONF_DATA_EN;
+
+	writel(val, sfc->base + SFC_REG_TRAN_CONF(0));
+	writel(op->data.nbytes, sfc->base + SFC_REG_TRAN_LEN);
+
+	ingenic_sfc_set_transfer_mode(sfc, op);
+
+	writel(0x1f, sfc->base + SFC_REG_SCR);
+	writel(~INTC_MASK_END, sfc->base + SFC_REG_INTC);
+
+	writel(0, sfc->base + SFC_REG_MEM_ADDR);
+
+	writel(TRIG_START, sfc->base + SFC_REG_TRIG);
+
+	ret = wait_for_completion_timeout(&sfc->completion,
+			msecs_to_jiffies(INGENIC_SFC_TRANSFER_TIMEOUT));
+	if (!ret) {
+		writel(0x1f, sfc->base + SFC_REG_INTC);
+		writel(0x1f, sfc->base + SFC_REG_SCR);
+		dev_err(sfc->dev, "line:%d Timeout for ACK from SFC device\n", __LINE__);
+		return -ETIMEDOUT;
+	}
+
+	writel(SCR_CLR_END, sfc->base + SFC_REG_SCR);
+	writel(TRIG_STOP, sfc->base + SFC_REG_TRIG);
+
+	return 0;
+}
+
+static const struct spi_controller_mem_ops ingenic_sfc_mem_ops = {
+	.adjust_op_size = ingenic_sfc_adjust_op_size,
+	.supports_op = ingenic_sfc_supports_op,
+	.exec_op = ingenic_sfc_exec_op,
+	.poll_status = ingenic_sfc_poll_status,
+};
+
+static int ingenic_sfc_setup(struct spi_device *spi)
+{
+	struct ingenic_sfc *sfc = spi_controller_get_devdata(spi->master);
+	unsigned long rate;
+	int ret, val;
+
+	if (!spi->max_speed_hz)
+		return -EINVAL;
+
+	ret = clk_set_rate(sfc->clk, spi->max_speed_hz * 2);
+	if (ret)
+		return -EINVAL;
+
+	writel(TRIG_STOP, sfc->base + SFC_REG_TRIG);
+	writel(0, sfc->base + SFC_REG_DEV_CONF);
+	writel(0, sfc->base + SFC_REG_CGE);
+
+	val = readl(sfc->base + SFC_REG_GLB);
+	u32p_replace_bits(&val, 64 - 1, GLB_THRESHOLD_MASK);
+	writel(val, sfc->base + SFC_REG_GLB);
+
+	val = readl(sfc->base + SFC_REG_DEV_CONF);
+
+	/* cpha bit:0 , cpol bit:0 */
+	val &= ~(DEV_CONF_CPHA | DEV_CONF_CPOL);
+	val |= spi->mode & SPI_CPHA ? DEV_CONF_CPHA : 0;
+	val |= spi->mode & SPI_CPOL ? DEV_CONF_CPOL : 0;
+
+	/* ce_dl bit:1, hold bit:1, wp bit:1 */
+	val |= (DEV_CONF_CE_DL | DEV_CONF_HOLD_DL | DEV_CONF_WP_DL);
+
+	writel(val, sfc->base + SFC_REG_DEV_CONF);
+
+	val = readl(sfc->base + SFC_REG_GLB);
+	u32p_replace_bits(&val, GLB_OP_MODE_SLAVE, GLB_OP_MODE_MASK);
+	writel(val, sfc->base + SFC_REG_GLB);
+
+	rate = clk_get_rate(sfc->clk);
+	val = readl(sfc->base + SFC_REG_DEV_CONF);
+	if (sfc->soc_info->version >= ID_X1600 && rate >= 200000000)
+		u32p_replace_bits(&val, DEV_CONF_SMP_DELAY_180DEG, DEV_CONF_SMP_DELAY_MASK);
+	else if (sfc->soc_info->version == ID_X1000 && rate >= 100000000)
+		u32p_replace_bits(&val, DEV_CONF_SMP_DELAY_HALF_CYCLE, DEV_CONF_SMP_DELAY_MASK);
+	writel(val, sfc->base + SFC_REG_DEV_CONF);
+
+	return 0;
+}
+
+static int ingenic_sfc_probe(struct platform_device *pdev)
+{
+	struct ingenic_sfc *sfc;
+	struct spi_controller *ctlr;
+	int ret;
+
+	ctlr = spi_alloc_master(&pdev->dev, sizeof(*sfc));
+	if (!ctlr)
+		return -ENOMEM;
+
+	sfc = spi_controller_get_devdata(ctlr);
+
+	sfc->soc_info = of_device_get_match_data(&pdev->dev);
+	if (!sfc->soc_info) {
+		dev_err(&pdev->dev, "No of match data provided\n");
+		ret = -ENODEV;
+		goto err_put_master;
+	}
+
+	sfc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sfc->base)) {
+		ret = PTR_ERR(sfc->base);
+		goto err_put_master;
+	}
+
+	sfc->clk = devm_clk_get(&pdev->dev, "sfc");
+	if (IS_ERR(sfc->clk)) {
+		ret = IS_ERR(sfc->clk);
+		goto err_put_master;
+	}
+
+	ret = clk_prepare_enable(sfc->clk);
+	if (ret)
+		goto err_put_master;
+
+	sfc->irq = platform_get_irq(pdev, 0);
+	if (sfc->irq < 0) {
+		ret = sfc->irq;
+		goto err_put_master;
+	}
+
+	sfc->dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, sfc);
+
+	ret = devm_request_irq(&pdev->dev, sfc->irq, ingenic_sfc_irq_handler, 0,
+			dev_name(&pdev->dev), sfc);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request irq%d, ret = %d\n", sfc->irq, ret);
+		goto err_put_master;
+	}
+
+	ctlr->bus_num = -1;
+	ctlr->num_chipselect = 1;
+	ctlr->mem_ops = &ingenic_sfc_mem_ops;
+	ctlr->dev.of_node = pdev->dev.of_node;
+	ctlr->setup = ingenic_sfc_setup;
+	ctlr->mode_bits = SPI_CPHA | SPI_CPOL |
+			SPI_RX_DUAL | SPI_RX_QUAD | SPI_TX_DUAL | SPI_TX_QUAD;
+	if (sfc->soc_info->version >= ID_X2000)
+		ctlr->mode_bits |= SPI_RX_OCTAL | SPI_TX_OCTAL;
+
+	ret = devm_spi_register_controller(&pdev->dev, ctlr);
+	if (ret)
+		goto err_put_master;
+
+	return 0;
+
+err_put_master:
+	spi_master_put(ctlr);
+
+	return ret;
+}
+
+static const struct ingenic_soc_info x1000_soc_info = {
+	.version = ID_X1000,
+
+	.max_bus_width = 4,
+
+	.tran_mode_mask = TRAN_CONF_TRAN_MODE_MASK,
+};
+
+static const struct ingenic_soc_info x1600_soc_info = {
+	.version = ID_X1600,
+
+	.max_bus_width = 4,
+
+	.tran_mode_mask = TRAN_CONF_TRAN_MODE_MASK,
+};
+
+static const struct ingenic_soc_info x2000_soc_info = {
+	.version = ID_X2000,
+
+	.max_bus_width = 8,
+
+	.tran_mode_mask = TRAN_CFG1_TRAN_MODE_MASK,
+};
+
+static const struct of_device_id ingenic_sfc_of_matches[] = {
+	{ .compatible = "ingenic,x1000-sfc", .data = &x1000_soc_info },
+	{ .compatible = "ingenic,x1600-sfc", .data = &x1600_soc_info },
+	{ .compatible = "ingenic,x2000-sfc", .data = &x2000_soc_info },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ingenic_sfc_of_matches);
+
+static struct platform_driver ingenic_sfc_driver = {
+	.driver = {
+		.name = "ingenic-sfc",
+		.of_match_table = ingenic_sfc_of_matches,
+	},
+	.probe = ingenic_sfc_probe,
+};
+module_platform_driver(ingenic_sfc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>");
+MODULE_DESCRIPTION("Ingenic SoCs SPI Flash Controller Driver");
-- 
2.7.4

