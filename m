Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A448E1605C7
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 20:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgBPTVS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 14:21:18 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:27187 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgBPTVK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 14:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581880865;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=+WXKJfjQk4+uCAFCxbcqyDka7uNwOTJLqOppo9UdKOA=;
        b=Ile70HFns8RbRVh+gFHWgl3gZJNrclFf867CiPvGZdlj+q7voVGP/cIs3cEAlRPI5a
        xguKZb9siW46CdoVaVU2prz0DoLMOJfNLlZCn5NB4r7TH7Om8atpoll77gqmP4EHRxIx
        LW0ka/2s2IfTWYxC8ocm7n2t7xwoAZeW/X3yGtTiQN4IuDnESUo8gAQq9p84LDoSMaoH
        L90xxAyMdbjeU7ejqoa5OIqa3KqeFa/ABAOq1Bel/y79zWfWhyUDrRkUDmCZjgF6dql4
        KDBNVMhEmNravPT1mDBh0qfI/qaZx4BDdKssIvG2X9WBSNk6Zo/7TdBZFkZW0oFY/4TS
        UW3w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GJKsJlZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 20:20:54 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [RFC v3 2/9] rework to use regmap
Date:   Sun, 16 Feb 2020 20:20:44 +0100
Message-Id: <0ec45ea82ef933a141215d0dd747c1c5dc09a980.1581880851.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581880851.git.hns@goldelico.com>
References: <cover.1581880851.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

should/will be squashed into the previous commit ("nvmem: add driver for JZ4780 efuse")
but is kept separately for this RFC to make the modifications more transparent.
---
 drivers/nvmem/jz4780-efuse.c | 179 ++++++++++++++++-------------------
 1 file changed, 84 insertions(+), 95 deletions(-)

diff --git a/drivers/nvmem/jz4780-efuse.c b/drivers/nvmem/jz4780-efuse.c
index ac03e1900ef9..79dc42431bfe 100644
--- a/drivers/nvmem/jz4780-efuse.c
+++ b/drivers/nvmem/jz4780-efuse.c
@@ -30,38 +30,35 @@
 #include <linux/regmap.h>
 #include <linux/timer.h>
 
-#define JZ_EFUCTRL			(0x0)	/* Control Register */
-#define JZ_EFUCFG			(0x4)	/* Configure Register*/
-#define JZ_EFUSTATE			(0x8)	/* Status Register */
-#define JZ_EFUDATA(n)			(0xC + (n)*4)
-
-#define JZ_EFUSE_START_ADDR		0x200
-
-#define JZ_EFUSE_EFUCTRL_CS		BIT(30)
-#define JZ_EFUSE_EFUCTRL_ADDR_MASK	0x1FF
-#define JZ_EFUSE_EFUCTRL_ADDR_SHIFT	21
-#define JZ_EFUSE_EFUCTRL_LEN_MASK	0x1F
-#define JZ_EFUSE_EFUCTRL_LEN_SHIFT	16
-#define JZ_EFUSE_EFUCTRL_PG_EN		BIT(15)
-#define JZ_EFUSE_EFUCTRL_WR_EN		BIT(1)
-#define JZ_EFUSE_EFUCTRL_RD_EN		BIT(0)
-
-#define JZ_EFUSE_EFUCFG_INT_EN		BIT(31)
-#define JZ_EFUSE_EFUCFG_RD_ADJ_MASK	0xF
-#define JZ_EFUSE_EFUCFG_RD_ADJ_SHIFT	20
-#define JZ_EFUSE_EFUCFG_RD_STR_MASK	0xF
-#define JZ_EFUSE_EFUCFG_RD_STR_SHIFT	16
-#define JZ_EFUSE_EFUCFG_WR_ADJ_MASK	0xF
-#define JZ_EFUSE_EFUCFG_WR_ADJ_SHIFT	12
-#define JZ_EFUSE_EFUCFG_WR_STR_MASK	0xFFF
-#define JZ_EFUSE_EFUCFG_WR_STR_SHIFT	0
-
-#define JZ_EFUSE_EFUSTATE_WR_DONE	BIT(1)
-#define JZ_EFUSE_EFUSTATE_RD_DONE	BIT(0)
+#define JZ_EFUCTRL		(0x0)	/* Control Register */
+#define JZ_EFUCFG		(0x4)	/* Configure Register*/
+#define JZ_EFUSTATE		(0x8)	/* Status Register */
+#define JZ_EFUDATA(n)		(0xC + (n)*4)
+
+#define EFUCTRL_ADDR_MASK	0x3FF
+#define EFUCTRL_ADDR_SHIFT	21
+#define EFUCTRL_LEN_MASK	0x1F
+#define EFUCTRL_LEN_SHIFT	16
+#define EFUCTRL_PG_EN		BIT(15)
+#define EFUCTRL_WR_EN		BIT(1)
+#define EFUCTRL_RD_EN		BIT(0)
+
+#define EFUCFG_INT_EN		BIT(31)
+#define EFUCFG_RD_ADJ_MASK	0xF
+#define EFUCFG_RD_ADJ_SHIFT	20
+#define EFUCFG_RD_STR_MASK	0xF
+#define EFUCFG_RD_STR_SHIFT	16
+#define EFUCFG_WR_ADJ_MASK	0xF
+#define EFUCFG_WR_ADJ_SHIFT	12
+#define EFUCFG_WR_STR_MASK	0xFFF
+#define EFUCFG_WR_STR_SHIFT	0
+
+#define EFUSTATE_WR_DONE	BIT(1)
+#define EFUSTATE_RD_DONE	BIT(0)
 
 struct jz4780_efuse {
 	struct device *dev;
-	void __iomem *iomem;
+	struct regmap *map;
 	struct clk *clk;
 	unsigned int rd_adj;
 	unsigned int rd_strobe;
@@ -71,59 +68,29 @@ struct jz4780_efuse {
 static int jz4780_efuse_read_32bytes(struct jz4780_efuse *efuse, char *buf,
 		unsigned int addr)
 {
-	unsigned int tmp = 0;
-	int i = 0;
-	int timeout = 1000;
-	int size = 32;
-
-	/* 1. Set config register */
-	tmp = readl(efuse->iomem + JZ_EFUCFG);
-	tmp &= ~((JZ_EFUSE_EFUCFG_RD_ADJ_MASK << JZ_EFUSE_EFUCFG_RD_ADJ_SHIFT)
-	| (JZ_EFUSE_EFUCFG_RD_STR_MASK << JZ_EFUSE_EFUCFG_RD_STR_SHIFT));
-	tmp |= (efuse->rd_adj << JZ_EFUSE_EFUCFG_RD_ADJ_SHIFT)
-	| (efuse->rd_strobe << JZ_EFUSE_EFUCFG_RD_STR_SHIFT);
-	writel(tmp, efuse->iomem + JZ_EFUCFG);
-
-	/*
-	 * 2. Set control register to indicate what to read data address,
-	 * read data numbers and read enable.
-	 */
-	tmp = readl(efuse->iomem + JZ_EFUCTRL);
-	tmp &= ~(JZ_EFUSE_EFUCFG_RD_STR_SHIFT
-		| (JZ_EFUSE_EFUCTRL_ADDR_MASK << JZ_EFUSE_EFUCTRL_ADDR_SHIFT)
-		| JZ_EFUSE_EFUCTRL_PG_EN | JZ_EFUSE_EFUCTRL_WR_EN
-		| JZ_EFUSE_EFUCTRL_WR_EN);
-
-	/* Need to select CS bit if address accesses upper 4Kbits memory */
-	if (addr >= (JZ_EFUSE_START_ADDR + 512))
-		tmp |= JZ_EFUSE_EFUCTRL_CS;
-
-	tmp |= (addr << JZ_EFUSE_EFUCTRL_ADDR_SHIFT)
-		| ((size - 1) << JZ_EFUSE_EFUCTRL_LEN_SHIFT)
-		| JZ_EFUSE_EFUCTRL_RD_EN;
-	writel(tmp, efuse->iomem + JZ_EFUCTRL);
-
-	/*
-	 * 3. Wait status register RD_DONE set to 1 or EFUSE interrupted,
-	 * software can read EFUSE data buffer 0 - 8 registers.
-	 */
-	do {
-		tmp = readl(efuse->iomem + JZ_EFUSTATE);
-		usleep_range(1000, 2000);
-		if (timeout--)
-			break;
-	} while (!(tmp & JZ_EFUSE_EFUSTATE_RD_DONE));
-
-	if (timeout <= 0) {
-		dev_err(efuse->dev, "Timed out while reading\n");
-		return -EAGAIN;
+	unsigned int tmp;
+	u32 ctrl;
+	int ret;
+	const int size = 32;
+
+	ctrl = (addr << EFUCTRL_ADDR_SHIFT)
+		| ((size - 1) << EFUCTRL_LEN_SHIFT)
+		| EFUCTRL_RD_EN;
+
+	regmap_update_bits(efuse->map, JZ_EFUCTRL,
+			   (EFUCTRL_ADDR_MASK << EFUCTRL_ADDR_SHIFT) |
+			   (EFUCTRL_LEN_MASK << EFUCTRL_LEN_SHIFT) |
+			   EFUCTRL_PG_EN | EFUCTRL_WR_EN | EFUCTRL_RD_EN, ctrl);
+
+	ret = regmap_read_poll_timeout(efuse->map, JZ_EFUSTATE,
+				       tmp, tmp & EFUSTATE_RD_DONE,
+				       1 * MSEC_PER_SEC, 50 * MSEC_PER_SEC);
+	if (ret < 0) {
+		dev_err(efuse->dev, "Time out while reading efuse data");
+		return ret;
 	}
 
-	for (i = 0; i < (size / 4); i++)
-		*((unsigned int *)(buf + i * 4))
-			 = readl(efuse->iomem + JZ_EFUDATA(i));
-
-	return 0;
+	return regmap_bulk_read(efuse->map, JZ_EFUDATA(0), buf, size / sizeof(u32));
 }
 
 /* main entry point */
@@ -132,12 +99,13 @@ static int jz4780_efuse_read(void *context, unsigned int offset,
 {
 	struct jz4780_efuse *efuse = context;
 	int ret;
+	const int size = 32;
 
 	while (bytes > 0) {
-		unsigned int start = offset & ~(32 - 1);
-		unsigned chunk = min(bytes, (start + 32 - offset));
+		unsigned int start = offset & ~(size - 1);
+		unsigned chunk = min(bytes, (start + size) - offset);
 
-		if (start == offset && chunk == 32) {
+		if (start == offset && chunk == size) {
 			ret = jz4780_efuse_read_32bytes(efuse, val, start);
 			if (ret < 0)
 				return ret;
@@ -159,7 +127,7 @@ static int jz4780_efuse_read(void *context, unsigned int offset,
 	return 0;
 }
 
-static struct nvmem_config jz4780_efuse_nvmem_config = {
+static __initdata struct nvmem_config jz4780_efuse_nvmem_config = {
 	.name = "jz4780-efuse",
 	.read_only = true,
 	.size = 1024,
@@ -169,28 +137,42 @@ static struct nvmem_config jz4780_efuse_nvmem_config = {
 	.reg_read = jz4780_efuse_read,
 };
 
+static const struct regmap_config jz4780_efuse_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = JZ_EFUDATA(7),
+};
+
 static int jz4780_efuse_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
 	struct jz4780_efuse *efuse;
-	struct resource *res;
+	struct nvmem_config cfg;
 	unsigned long clk_rate;
 	struct device *dev = &pdev->dev;
+	void __iomem *regs;
 
-	efuse = devm_kzalloc(&pdev->dev, sizeof(*efuse), GFP_KERNEL);
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
 	if (!efuse)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	efuse->iomem = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (IS_ERR(efuse->iomem))
-		return PTR_ERR(efuse->iomem);
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	efuse->map = devm_regmap_init_mmio(dev, regs,
+					   &jz4780_efuse_regmap_config);
+	if (IS_ERR(efuse->map))
+		return PTR_ERR(efuse->map);
 
-	efuse->clk = devm_clk_get(&pdev->dev, "bus_clk");
+	efuse->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(efuse->clk))
 		return PTR_ERR(efuse->clk);
 
 	clk_rate = clk_get_rate(efuse->clk);
+
+	efuse->dev = dev;
 	/*
 	 * rd_adj and rd_strobe are 4 bit values
 	 * bus clk period * (rd_adj + 1) > 6.5ns
@@ -204,12 +186,18 @@ static int jz4780_efuse_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Cannot set clock configuration\n");
 		return -EINVAL;
 	}
-	efuse->dev = dev;
 
-	jz4780_efuse_nvmem_config.dev = &pdev->dev;
-	jz4780_efuse_nvmem_config.priv = efuse;
+	regmap_update_bits(efuse->map, JZ_EFUCFG,
+			   (EFUCFG_RD_ADJ_MASK << EFUCFG_RD_ADJ_SHIFT) |
+			   (EFUCFG_RD_STR_MASK << EFUCFG_RD_STR_SHIFT),
+			   (efuse->rd_adj << EFUCFG_RD_ADJ_SHIFT) |
+			   (efuse->rd_strobe << EFUCFG_RD_STR_SHIFT));
+
+	cfg = jz4780_efuse_nvmem_config;
+	cfg.dev = &pdev->dev;
+	cfg.priv = efuse;
 
-	nvmem = nvmem_register(&jz4780_efuse_nvmem_config);
+	nvmem = nvmem_register(&cfg);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
@@ -245,5 +233,6 @@ module_platform_driver(jz4780_efuse_driver);
 
 MODULE_AUTHOR("PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>");
 MODULE_AUTHOR("H. Nikolaus Schaller <hns@goldelico.com>");
+MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
 MODULE_DESCRIPTION("Ingenic JZ4780 efuse driver");
 MODULE_LICENSE("GPL v2");
-- 
2.23.0

