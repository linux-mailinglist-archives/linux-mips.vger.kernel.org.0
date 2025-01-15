Return-Path: <linux-mips+bounces-7458-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 318DAA12202
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 12:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0F921611BF
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 11:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2851B1E9916;
	Wed, 15 Jan 2025 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5DI7Kyg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63E21E7C02;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938992; cv=none; b=q4D5LzwrB/gimPuca/DXl+eREQUzz2g1Hy3gvgjYu7MZJRC3Gq5fS7CKzTJsolWae8zQ+ZS3v5y1IMdtFgjUYhDfSn/bLS+gIMKzzHGv5LkvYPZYIQPox1c9Vq7Pqyfjy3X071EIA6dtBoH9hekkAcy9os7Rx/KVpE/wo8HpZEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938992; c=relaxed/simple;
	bh=BJtTY9JnsG8XS0xEhwN+BFMBINlrqoeOCwJGABcUR7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTeyD/q89r9I1xE+qL69o6d9jMtJ4M45ljdjumCslefCEnYVi2E7naryLvJXRAvE3F9YTpoUdDY+GKAzcpVQZT4sOTOIWDE8/Z2wk9C2EpA4mqnowDPX7ZvVUpS+9ZeZXCbEmw7OoQT8s9SwK1UHCw6ubZTU6QwcNm4ZXEMLsw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5DI7Kyg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B42F1C4CEE9;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736938991;
	bh=BJtTY9JnsG8XS0xEhwN+BFMBINlrqoeOCwJGABcUR7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E5DI7Kygkps8aULf8rCnBfwbp5a8JuNfbTZ69o8C2ayaNS3aokVBfzMVQgYxC/TiP
	 azoE9lmKsO04/X603KXDWirTrSG4simUu5H0bqiOrNYQX3loU5T1uP8jfPyeWcXt3F
	 WDHmHzbDpJraPFCVww20t7YN0krx1LX14Kg6Y7Zpsb84vXT1Dtgyyl/IdOoWc+NxRS
	 hZl/PXNruzCEHXdgoj+Wx0+yr0Xg3aMt8nP2Kgj+laBpKvInxuliL3h3T1RDK6x0bd
	 gOPF9gYR7WSEr0Usx7lMvsC8bvmtjwScDDiH+yH4Tmk+wekxHmm5lN8j9827WU9+DZ
	 GLmuzPg3DPXJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8631C02185;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 15 Jan 2025 19:03:09 +0800
Subject: [PATCH 3/4] ASoC: loongson: Add Loongson-1 AC97 Driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-loongson1-ac97-v1-3-2087b04dcd7f@gmail.com>
References: <20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com>
In-Reply-To: <20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736938989; l=14774;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=azI2UImPDeyhQ6MkYDXaWf3L3FlYCqil+2Hf+UE3P+o=;
 b=FO2krDiiZZ+1LYtJ3wVo/uH+ncXeXOC1SSk/H11HNF4u2eEbTdNTF2sttmKtevZyzkIf6ecd1
 qgTZ3s5S8yUAkVrMbWdldPGLEwepK4uXaDBlqbgnRfcxGsKLPKwBV4P
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add AC97 driver for Loongson-1 SoCs.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 MAINTAINERS                         |   1 +
 sound/soc/loongson/Kconfig          |  10 +
 sound/soc/loongson/Makefile         |   2 +
 sound/soc/loongson/loongson1_ac97.c | 394 ++++++++++++++++++++++++++++++++++++
 4 files changed, 407 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7cdf87397c00..2d68e24c571b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15883,6 +15883,7 @@ F:	arch/mips/include/asm/mach-loongson32/
 F:	arch/mips/loongson32/
 F:	drivers/*/*loongson1*
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+F:	sound/soc/loongson/loongson1_ac97.c
 
 MIPS/LOONGSON2EF ARCHITECTURE
 M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
diff --git a/sound/soc/loongson/Kconfig b/sound/soc/loongson/Kconfig
index 2d8291c1443c..1a3c28816e7a 100644
--- a/sound/soc/loongson/Kconfig
+++ b/sound/soc/loongson/Kconfig
@@ -37,3 +37,13 @@ config SND_SOC_LOONGSON_I2S_PLATFORM
 	  The controller work as a platform device, we can found it in
 	  Loongson-2K1000 SoCs.
 endmenu
+
+config SND_LOONGSON1_AC97
+	tristate "Loongson1 AC97 Support"
+	depends on LOONGSON1_APB_DMA
+	select SND_SOC_AC97_CODEC
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select REGMAP_MMIO
+	help
+	  Say Y or M if you want to add support for codecs attached to
+	  the Loongson1 AC97 controller.
diff --git a/sound/soc/loongson/Makefile b/sound/soc/loongson/Makefile
index c0cb1acb36e3..4c6d3130bcee 100644
--- a/sound/soc/loongson/Makefile
+++ b/sound/soc/loongson/Makefile
@@ -8,6 +8,8 @@ obj-$(CONFIG_SND_SOC_LOONGSON_I2S_PLATFORM) += snd-soc-loongson-i2s-plat.o snd-s
 
 snd-soc-loongson-i2s-y := loongson_i2s.o
 
+obj-$(CONFIG_SND_LOONGSON1_AC97) += loongson1_ac97.o
+
 #Machine Support
 snd-soc-loongson-card-y := loongson_card.o
 obj-$(CONFIG_SND_SOC_LOONGSON_CARD) += snd-soc-loongson-card.o
diff --git a/sound/soc/loongson/loongson1_ac97.c b/sound/soc/loongson/loongson1_ac97.c
new file mode 100644
index 000000000000..3bfaf28384d1
--- /dev/null
+++ b/sound/soc/loongson/loongson1_ac97.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AC97 Controller Driver for Loongson-1 SoC
+ *
+ * Copyright (C) 2025 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+/* Loongson-1 AC97 Controller Registers */
+#define AC97_CSR		0x0
+#define AC97_OCC0		0x4
+#define AC97_ICC		0x10
+#define AC97_CRAC		0x18
+#define AC97_INTRAW		0x54
+#define AC97_INTM		0x58
+#define AC97_INT_CW_CLR		0x68
+#define AC97_INT_CR_CLR		0x6c
+
+/* Control Status Register Bits (CSR) */
+#define CSR_RESUME		BIT(1)
+#define CSR_RST_FORCE		BIT(0)
+
+/* MIC Channel Configuration Bits */
+#define M_DMA_EN		BIT(22)
+#define M_FIFO_THRES		GENMASK(21, 20)
+#define M_FIFO_THRES_FULL	FIELD_PREP(M_FIFO_THRES, 3)
+#define M_FIFO_THRES_HALF	FIELD_PREP(M_FIFO_THRES, 1)
+#define M_FIFO_THRES_QUARTER	FIELD_PREP(M_FIFO_THRES, 0)
+#define M_SW			GENMASK(19, 18)
+#define M_SW_16_BITS		FIELD_PREP(M_SW, 2)
+#define M_SW_8_BITS		FIELD_PREP(M_SW, 0)
+#define M_VSR			BIT(17)
+#define M_CH_EN			BIT(16)
+/* Right Channel Configuration Bits */
+#define R_DMA_EN		BIT(14)
+#define R_FIFO_THRES		GENMASK(13, 12)
+#define R_FIFO_THRES_EMPTY	FIELD_PREP(R_FIFO_THRES, 3)
+#define R_FIFO_THRES_HALF	FIELD_PREP(R_FIFO_THRES, 1)
+#define R_FIFO_THRES_QUARTER	FIELD_PREP(R_FIFO_THRES, 0)
+#define R_SW			GENMASK(11, 10)
+#define R_SW_16_BITS		FIELD_PREP(R_SW, 2)
+#define R_SW_8_BITS		FIELD_PREP(R_SW, 0)
+#define R_VSR			BIT(9)
+#define R_CH_EN			BIT(8)
+/* Left Channel Configuration Bits */
+#define L_DMA_EN		BIT(6)
+#define L_FIFO_THRES		GENMASK(5, 4)
+#define L_FIFO_THRES_EMPTY	FIELD_PREP(L_FIFO_THRES, 3)
+#define L_FIFO_THRES_HALF	FIELD_PREP(L_FIFO_THRES, 1)
+#define L_FIFO_THRES_QUARTER	FIELD_PREP(L_FIFO_THRES, 0)
+#define L_SW			GENMASK(3, 2)
+#define L_SW_16_BITS		FIELD_PREP(L_SW, 2)
+#define L_SW_8_BITS		FIELD_PREP(L_SW, 0)
+#define L_VSR			BIT(1)
+#define L_CH_EN			BIT(0)
+
+/* Codec Register Access Command Bits (CRAC) */
+#define CODEC_WR		BIT(31)
+#define CODEC_ADR		GENMASK(22, 16)
+#define CODEC_DAT		GENMASK(15, 0)
+
+/* Interrupt Register (INTRAW) */
+#define CW_DONE			BIT(1)
+#define CR_DONE			BIT(0)
+
+#define LS1X_AC97_DMA_TX_EN		BIT(31)
+#define LS1X_AC97_DMA_STEREO		BIT(30)
+#define LS1X_AC97_DMA_TX_BYTES		GENMASK(29, 28)
+#define LS1X_AC97_DMA_TX_4_BYTES	FIELD_PREP(LS1X_AC97_DMA_TX_BYTES, 2)
+#define LS1X_AC97_DMA_TX_2_BYTES	FIELD_PREP(LS1X_AC97_DMA_TX_BYTES, 1)
+#define LS1X_AC97_DMA_TX_1_BYTE		FIELD_PREP(LS1X_AC97_DMA_TX_BYTES, 0)
+#define LS1X_AC97_DMA_DADDR_MASK	GENMASK(27, 0)
+
+#define LS1X_AC97_DMA_FIFO_SIZE		128
+
+#define LS1X_AC97_TIMEOUT		3000
+
+struct ls1x_ac97 {
+	void __iomem *reg_base;
+	struct regmap *regmap;
+	dma_addr_t tx_dma_base;
+	dma_addr_t rx_dma_base;
+	struct snd_dmaengine_dai_dma_data capture_dma_data;
+	struct snd_dmaengine_dai_dma_data playback_dma_data;
+};
+
+static struct ls1x_ac97 *ls1x_ac97;
+
+static const struct regmap_config ls1x_ac97_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static void ls1x_ac97_reset(struct snd_ac97 *ac97)
+{
+	int val;
+
+	regmap_write(ls1x_ac97->regmap, AC97_CSR, CSR_RST_FORCE);
+	regmap_read_poll_timeout(ls1x_ac97->regmap, AC97_CSR, val,
+				 !(val & CSR_RESUME), 0, LS1X_AC97_TIMEOUT);
+}
+
+static void ls1x_ac97_write(struct snd_ac97 *ac97, unsigned short reg, unsigned short val)
+{
+	int tmp, ret;
+
+	tmp = FIELD_PREP(CODEC_ADR, reg) | FIELD_PREP(CODEC_DAT, val);
+	regmap_write(ls1x_ac97->regmap, AC97_CRAC, tmp);
+	ret = regmap_read_poll_timeout(ls1x_ac97->regmap, AC97_INTRAW, tmp,
+				       (tmp & CW_DONE), 0, LS1X_AC97_TIMEOUT);
+	if (ret)
+		pr_err("timeout on AC97 write! %d\n", ret);
+
+	regmap_read(ls1x_ac97->regmap, AC97_INT_CW_CLR, &ret);
+}
+
+static unsigned short ls1x_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
+{
+	int val, ret;
+
+	val = CODEC_WR | FIELD_PREP(CODEC_ADR, reg);
+	regmap_write(ls1x_ac97->regmap, AC97_CRAC, val);
+	ret = regmap_read_poll_timeout(ls1x_ac97->regmap, AC97_INTRAW, val,
+				       (val & CR_DONE), 0, LS1X_AC97_TIMEOUT);
+	if (ret) {
+		pr_err("timeout on AC97 read! %d\n", ret);
+		return ret;
+	}
+
+	regmap_read(ls1x_ac97->regmap, AC97_INT_CR_CLR, &ret);
+	regmap_read(ls1x_ac97->regmap, AC97_CRAC, &ret);
+
+	return (ret & CODEC_DAT);
+}
+
+static void ls1x_ac97_init(struct snd_ac97 *ac97)
+{
+	writel(0, ls1x_ac97->reg_base + AC97_INTRAW);
+	writel(0, ls1x_ac97->reg_base + AC97_INTM);
+
+	/* Config output channels */
+	regmap_update_bits(ls1x_ac97->regmap, AC97_OCC0,
+			   R_DMA_EN | R_FIFO_THRES | R_CH_EN |
+			   L_DMA_EN | L_FIFO_THRES | L_CH_EN,
+			   R_DMA_EN | R_FIFO_THRES_EMPTY | R_CH_EN |
+			   L_DMA_EN | L_FIFO_THRES_EMPTY | L_CH_EN);
+
+	/* Config inputs channel */
+	regmap_update_bits(ls1x_ac97->regmap, AC97_ICC,
+			   M_DMA_EN | M_FIFO_THRES | M_CH_EN |
+			   R_DMA_EN | R_FIFO_THRES | R_CH_EN |
+			   L_DMA_EN | L_FIFO_THRES | L_CH_EN,
+			   M_DMA_EN | M_FIFO_THRES_FULL | M_CH_EN |
+			   R_DMA_EN | R_FIFO_THRES_EMPTY | R_CH_EN |
+			   L_DMA_EN | L_FIFO_THRES_EMPTY | L_CH_EN);
+
+	if (ac97->ext_id & AC97_EI_VRA) {
+		regmap_update_bits(ls1x_ac97->regmap, AC97_OCC0, R_VSR | L_VSR, R_VSR | L_VSR);
+		regmap_update_bits(ls1x_ac97->regmap, AC97_ICC, M_VSR, M_VSR);
+	}
+}
+
+static struct snd_ac97_bus_ops ls1x_ac97_ops = {
+	.reset	= ls1x_ac97_reset,
+	.write	= ls1x_ac97_write,
+	.read	= ls1x_ac97_read,
+	.init	= ls1x_ac97_init,
+};
+
+static int ls1x_ac97_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			       struct snd_soc_dai *cpu_dai)
+{
+	struct ls1x_ac97 *ac97 = dev_get_drvdata(cpu_dai->dev);
+	struct snd_dmaengine_dai_dma_data *dma_data = snd_soc_dai_get_dma_data(cpu_dai, substream);
+
+	switch (params_channels(params)) {
+	case 1:
+		dma_data->addr &= ~LS1X_AC97_DMA_STEREO;
+		break;
+	case 2:
+		dma_data->addr |= LS1X_AC97_DMA_STEREO;
+		break;
+	default:
+		dev_err(cpu_dai->dev, "unsupported channels! %d\n", params_channels(params));
+		return -EINVAL;
+	}
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+	case SNDRV_PCM_FORMAT_U8:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_update_bits(ac97->regmap, AC97_OCC0,
+					   R_SW | L_SW,
+					   R_SW_8_BITS | L_SW_8_BITS);
+		else
+			regmap_update_bits(ac97->regmap, AC97_ICC,
+					   M_SW | R_SW | L_SW,
+					   M_SW_8_BITS | R_SW_8_BITS | L_SW_8_BITS);
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+	case SNDRV_PCM_FORMAT_U16_LE:
+	case SNDRV_PCM_FORMAT_S16_BE:
+	case SNDRV_PCM_FORMAT_U16_BE:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_update_bits(ac97->regmap, AC97_OCC0,
+					   R_SW | L_SW,
+					   R_SW_16_BITS | L_SW_16_BITS);
+		else
+			regmap_update_bits(ac97->regmap, AC97_ICC,
+					   M_SW | R_SW | L_SW,
+					   M_SW_16_BITS | R_SW_16_BITS | L_SW_16_BITS);
+		break;
+	default:
+		dev_err(cpu_dai->dev, "unsupported format! %d\n", params_format(params));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ls1x_ac97_dai_probe(struct snd_soc_dai *cpu_dai)
+{
+	struct ls1x_ac97 *ac97 = dev_get_drvdata(cpu_dai->dev);
+
+	ac97->capture_dma_data.addr = ac97->rx_dma_base & LS1X_AC97_DMA_DADDR_MASK;
+	ac97->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	ac97->capture_dma_data.fifo_size = LS1X_AC97_DMA_FIFO_SIZE;
+
+	ac97->playback_dma_data.addr = ac97->tx_dma_base & LS1X_AC97_DMA_DADDR_MASK;
+	ac97->playback_dma_data.addr |= LS1X_AC97_DMA_TX_4_BYTES;
+	ac97->playback_dma_data.addr |= LS1X_AC97_DMA_TX_EN;
+	ac97->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	ac97->playback_dma_data.fifo_size = LS1X_AC97_DMA_FIFO_SIZE;
+
+	snd_soc_dai_init_dma_data(cpu_dai, &ac97->playback_dma_data, &ac97->capture_dma_data);
+	snd_soc_dai_set_drvdata(cpu_dai, ac97);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops ls1x_ac97_dai_ops = {
+	.probe		= ls1x_ac97_dai_probe,
+	.hw_params	= ls1x_ac97_hw_params,
+};
+
+#define LS1X_AC97_FMTS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_U8 |\
+	SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |\
+	SNDRV_PCM_FMTBIT_U16_LE	| SNDRV_PCM_FMTBIT_U16_BE)
+
+static struct snd_soc_dai_driver ls1x_ac97_dai[] = {
+	{
+		.name = "ls1x-ac97",
+		.playback = {
+			.stream_name = "AC97 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = LS1X_AC97_FMTS,
+		},
+		.capture = {
+			.stream_name = "AC97 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = LS1X_AC97_FMTS,
+		},
+		.ops = &ls1x_ac97_dai_ops,
+	},
+};
+
+static const struct snd_soc_component_driver ls1x_ac97_component = {
+	.name = KBUILD_MODNAME,
+	.legacy_dai_naming = 1,
+};
+
+static int ls1x_ac97_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ls1x_ac97 *ac97;
+	struct resource *res;
+	int ret;
+
+	ac97 = devm_kzalloc(dev, sizeof(struct ls1x_ac97), GFP_KERNEL);
+	if (!ac97)
+		return -ENOMEM;
+	ls1x_ac97 = ac97;
+	platform_set_drvdata(pdev, ac97);
+
+	ac97->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ac97->reg_base))
+		return PTR_ERR(ac97->reg_base);
+
+	ac97->regmap = devm_regmap_init_mmio(dev, ac97->reg_base, &ls1x_ac97_regmap_config);
+	if (IS_ERR(ac97->regmap))
+		return dev_err_probe(dev, PTR_ERR(ac97->regmap), "devm_regmap_init_mmio failed\n");
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audio-tx");
+	ac97->tx_dma_base = dma_map_resource(dev, res->start, resource_size(res),
+					     DMA_TO_DEVICE, 0);
+
+	if (dma_mapping_error(dev, ac97->tx_dma_base))
+		return -ENXIO;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audio-rx");
+	ac97->rx_dma_base = dma_map_resource(dev, res->start, resource_size(res),
+					     DMA_FROM_DEVICE, 0);
+
+	if (dma_mapping_error(dev, ac97->rx_dma_base))
+		return -ENXIO;
+
+	ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
+	if (ret)
+		dev_err_probe(dev, ret, "failed to register PCM\n");
+
+	ret = devm_snd_soc_register_component(dev, &ls1x_ac97_component,
+					      ls1x_ac97_dai, ARRAY_SIZE(ls1x_ac97_dai));
+	if (ret)
+		dev_err_probe(dev, ret, "failed to register DAI\n");
+
+	return snd_soc_set_ac97_ops(&ls1x_ac97_ops);
+}
+
+static void ls1x_ac97_remove(struct platform_device *pdev)
+{
+	ls1x_ac97 = NULL;
+	snd_soc_set_ac97_ops(NULL);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int ls1x_ac97_suspend(struct device *dev)
+{
+	int val;
+
+	regmap_clear_bits(ls1x_ac97->regmap, AC97_OCC0, R_DMA_EN | R_CH_EN | L_DMA_EN | L_CH_EN);
+	regmap_clear_bits(ls1x_ac97->regmap, AC97_ICC,
+			  M_DMA_EN | M_CH_EN | R_DMA_EN | R_CH_EN | L_DMA_EN | L_CH_EN);
+	regmap_set_bits(ls1x_ac97->regmap, AC97_CSR, CSR_RESUME);
+
+	return regmap_read_poll_timeout(ls1x_ac97->regmap, AC97_CSR, val,
+					(val & CSR_RESUME), 0, LS1X_AC97_TIMEOUT);
+}
+
+static int ls1x_ac97_resume(struct device *dev)
+{
+	int val;
+
+	regmap_set_bits(ls1x_ac97->regmap, AC97_OCC0, R_DMA_EN | R_CH_EN | L_DMA_EN | L_CH_EN);
+	regmap_set_bits(ls1x_ac97->regmap, AC97_ICC,
+			M_DMA_EN | M_CH_EN | R_DMA_EN | R_CH_EN | L_DMA_EN | L_CH_EN);
+	regmap_set_bits(ls1x_ac97->regmap, AC97_CSR, CSR_RESUME);
+
+	return regmap_read_poll_timeout(ls1x_ac97->regmap, AC97_CSR, val,
+					!(val & CSR_RESUME), 0, LS1X_AC97_TIMEOUT);
+}
+#endif
+
+static const struct dev_pm_ops ls1x_ac97_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(ls1x_ac97_suspend, ls1x_ac97_resume)
+};
+
+static const struct of_device_id ls1x_ac97_match[] = {
+	{ .compatible = "loongson,ls1b-ac97" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ls1x_ac97_match);
+
+static struct platform_driver ls1x_ac97_driver = {
+	.probe		= ls1x_ac97_probe,
+	.remove		= ls1x_ac97_remove,
+	.driver		= {
+		.name	= KBUILD_MODNAME,
+		.of_match_table = ls1x_ac97_match,
+		.pm = &ls1x_ac97_pm_ops,
+	},
+};
+
+module_platform_driver(ls1x_ac97_driver);
+
+MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
+MODULE_DESCRIPTION("Loongson-1 AC97 Controller Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0



