Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC412F77C8
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 12:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbhAOLi2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 06:38:28 -0500
Received: from mout.gmx.net ([212.227.17.21]:41827 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbhAOLi2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 06:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610710575;
        bh=eLiByC0IB0I4t5hr6NzccvdkQEfXiw1/D65/IvIaHbQ=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=j6L9V+W52/idr+vnrlu2IzcWoPlSJPFlA1BJgD2WxU6tDIhaDGGmVATmPwdHVmKVk
         UobgZrZDy5Jp7JACKEmKJgPA174bHP81HvEDQQIv1g6qi5Yq641eCTCtUj9MIWjrBZ
         hD719Ugvsn5Il49M6O/SUlsa4M4nkKqRIRUTYoLQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1Mbir8-1ldXxx24y6-00dGoi; Fri, 15
 Jan 2021 12:36:15 +0100
Date:   Fri, 15 Jan 2021 13:35:00 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, Takashi Iwai <tiwai@suse.de>,
        perex@perex.cz
Subject: [PATCH 2/3 v7] sound: Add n64 driver
Message-Id: <20210115133500.c5affc0131313e1165acb2a1@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jGSx8WMqNwe6NCIIDXiaMlbJUFrsm3D5a41pIIy09riqPaBJcIU
 JsJx5fRe5kteFAu1UFJbgZCQ3gAOFMabl5/o+v5TK92GvvAVyosPOHlNYOsS8OM165LIaxC
 9Wsenju29GPnUgUriAIsKxSb2mCT31COjuSOMdAXEu78EunCqKHczEdQhD1+DL1TpCu/FgZ
 7WzVfi0hsT40CmdDq0S0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GTcLADRFUXg=:Ksc5PQPgBYcHriQawRhtL9
 A6SBiA0zoifUGfVLw02L7Nt3lGveRPKPmij910+R6CDRDGaILH+k/OBJLcsUpd6ztQmM2ObH3
 EWNfV2eP/hTrcFc3LxUdHajdh89583hzGGMv0pSMEwNifGRb5kh1p2oqAhIkN+0LFZaWrV8Hq
 DbsI7AYHRXKC5a0QcQneLwvSmPYkIuuQWaF7JtG6WQLo6Gwyiv0O2EpkNYy7SWMAq24qZxibt
 4PW1OkAgGneA//KFFwSUpTIPUzojTflQfJQg2EAfu7DiCashA+k9GEg7AVywqbsvrNeg4QSFN
 4VDvXZN3UQgpj83bDm7w2qaZXNCMzjllhAGgb7XYP1Sf8Vn5yErPTq1dER0a9e+T4iay4zhkY
 LvWwY/UBO1aODYLmsLw+rzKNLDJszGX6aoQvLyl5UOFWTY63fo0mHdE92bC10uHq9iwqikmB+
 5sp2xIYZ87hD7Fhb9Rao4R8sJoQ3O2Fi50WGC5klijoCneqH9S5rap2+cv781QXy02kbrdvkv
 ZAPD3EOoipiZfzy77EQmXXqwzTSsAQqVAXshJeLptSkmUQAUxVgvgEGGeuahAd0TNNZ7UoLGM
 y5PPDNnVwRaD6Zx8iqLu5F/QT5w+nyvUEpDyCd+CgXtPRUzJneFNcUWkrOVcj1boVoq5B7Ynt
 lKAKtsUYfnM59JeAP36npiTblDKB3cakbr309FSsqG7he6CQrXyaIYB1TA0XAKTb00ZtFziXv
 bZguaGYwu0zKpt64Mk/6GePCMWF8Id6gnsPv2bThquFCwpEFgQmXtYRbE/mBdf9gMlm+nUUCT
 /5ItJb2sjMvo6mvi/Fqgs2CfadQP2KXWpOzCdY4W4m+XBdyGag6R2IThy1XBDBoCgF6IqtfbY
 co7kHFvJvhLcvqsR8DBA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This adds support for the Nintendo 64 console's sound.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--

v7:
use devm_*

 sound/mips/Kconfig   |   7 +
 sound/mips/Makefile  |   1 +
 sound/mips/snd-n64.c | 372 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 380 insertions(+)
 create mode 100644 sound/mips/snd-n64.c

diff --git a/sound/mips/Kconfig b/sound/mips/Kconfig
index b497b80..c484b1e 100644
=2D-- a/sound/mips/Kconfig
+++ b/sound/mips/Kconfig
@@ -24,5 +24,12 @@ config SND_SGI_HAL2
 	help
 	  Sound support for the SGI Indy and Indigo2 Workstation.

+config SND_N64
+	bool "N64 Audio"
+	depends on MACH_NINTENDO64 && SND=3Dy
+	select SND_PCM
+	help
+	  Sound support for the N64.
+
 endif	# SND_MIPS

diff --git a/sound/mips/Makefile b/sound/mips/Makefile
index ccc364e..7c86268 100644
=2D-- a/sound/mips/Makefile
+++ b/sound/mips/Makefile
@@ -9,3 +9,4 @@ snd-sgi-hal2-objs :=3D hal2.o
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_SGI_O2) +=3D snd-sgi-o2.o
 obj-$(CONFIG_SND_SGI_HAL2) +=3D snd-sgi-hal2.o
+obj-$(CONFIG_SND_N64) +=3D snd-n64.o
diff --git a/sound/mips/snd-n64.c b/sound/mips/snd-n64.c
new file mode 100644
index 0000000..ca6b4b9
=2D-- /dev/null
+++ b/sound/mips/snd-n64.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *   Sound driver for Nintendo 64.
+ *
+ *   Copyright 2021 Lauri Kasanen
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/log2.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#include <sound/control.h>
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+
+MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
+MODULE_DESCRIPTION("N64 Audio");
+MODULE_LICENSE("GPL");
+
+#define AI_NTSC_DACRATE 48681812
+#define AI_STATUS_BUSY  (1 << 30)
+#define AI_STATUS_FULL  (1 << 31)
+
+#define AI_ADDR_REG 0
+#define AI_LEN_REG 1
+#define AI_CONTROL_REG 2
+#define AI_STATUS_REG 3
+#define AI_RATE_REG 4
+#define AI_BITCLOCK_REG 5
+
+#define MI_INTR_REG 2
+#define MI_MASK_REG 3
+
+#define MI_INTR_AI 0x04
+
+#define MI_MASK_CLR_AI 0x0010
+#define MI_MASK_SET_AI 0x0020
+
+
+struct n64audio {
+	u32 __iomem *ai_reg_base;
+	u32 __iomem *mi_reg_base;
+
+	void *ring_base;
+	dma_addr_t ring_base_dma;
+
+	struct snd_card *card;
+
+	struct {
+		struct snd_pcm_substream *substream;
+		int pos, nextpos;
+		u32 writesize;
+		u32 bufsize;
+		spinlock_t lock;
+	} chan;
+};
+
+static void n64audio_write_reg(struct n64audio *priv, const u8 reg, const=
 u32 value)
+{
+	writel(value, priv->ai_reg_base + reg);
+}
+
+static void n64mi_write_reg(struct n64audio *priv, const u8 reg, const u3=
2 value)
+{
+	writel(value, priv->mi_reg_base + reg);
+}
+
+static u32 n64mi_read_reg(struct n64audio *priv, const u8 reg)
+{
+	return readl(priv->mi_reg_base + reg);
+}
+
+static void n64audio_push(struct n64audio *priv)
+{
+	struct snd_pcm_runtime *runtime =3D priv->chan.substream->runtime;
+	unsigned long flags;
+	u32 count;
+
+	spin_lock_irqsave(&priv->chan.lock, flags);
+
+	count =3D priv->chan.writesize;
+
+	memcpy(priv->ring_base + priv->chan.nextpos,
+	       runtime->dma_area + priv->chan.nextpos, count);
+
+	/*
+	 * The hw registers are double-buffered, and the IRQ fires essentially
+	 * one period behind. The core only allows one period's distance, so we
+	 * keep a private DMA buffer to afford two.
+	 */
+	n64audio_write_reg(priv, AI_ADDR_REG, priv->ring_base_dma + priv->chan.n=
extpos);
+	barrier();
+	n64audio_write_reg(priv, AI_LEN_REG, count);
+
+	priv->chan.nextpos +=3D count;
+	priv->chan.nextpos %=3D priv->chan.bufsize;
+
+	runtime->delay =3D runtime->period_size;
+
+	spin_unlock_irqrestore(&priv->chan.lock, flags);
+}
+
+static irqreturn_t n64audio_isr(int irq, void *dev_id)
+{
+	struct n64audio *priv =3D dev_id;
+	const u32 intrs =3D n64mi_read_reg(priv, MI_INTR_REG);
+	unsigned long flags;
+
+	// Check it's ours
+	if (!(intrs & MI_INTR_AI))
+		return IRQ_NONE;
+
+	n64audio_write_reg(priv, AI_STATUS_REG, 1);
+
+	if (priv->chan.substream && snd_pcm_running(priv->chan.substream)) {
+		spin_lock_irqsave(&priv->chan.lock, flags);
+
+		priv->chan.pos =3D priv->chan.nextpos;
+
+		spin_unlock_irqrestore(&priv->chan.lock, flags);
+
+		snd_pcm_period_elapsed(priv->chan.substream);
+		if (priv->chan.substream && snd_pcm_running(priv->chan.substream))
+			n64audio_push(priv);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static const struct snd_pcm_hardware n64audio_pcm_hw =3D {
+	.info =3D (SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_MMAP_VALID |
+		 SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_BLOCK_TRANSFER),
+	.formats =3D          SNDRV_PCM_FMTBIT_S16_BE,
+	.rates =3D            SNDRV_PCM_RATE_8000_48000,
+	.rate_min =3D         8000,
+	.rate_max =3D         48000,
+	.channels_min =3D     2,
+	.channels_max =3D     2,
+	.buffer_bytes_max =3D 32768,
+	.period_bytes_min =3D 1024,
+	.period_bytes_max =3D 32768,
+	.periods_min =3D      3,
+	// 3 periods lets the double-buffering hw read one buffer behind safely
+	.periods_max =3D      128,
+};
+
+static int hw_rule_period_size(struct snd_pcm_hw_params *params,
+			       struct snd_pcm_hw_rule *rule)
+{
+	struct snd_interval *c =3D hw_param_interval(params,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
+	int changed =3D 0;
+
+	/*
+	 * The DMA unit has errata on (start + len) & 0x3fff =3D=3D 0x2000.
+	 * This constraint makes sure that the period size is not a power of two=
,
+	 * which combined with dma_alloc_coherent aligning the buffer to the lar=
gest
+	 * PoT <=3D size guarantees it won't be hit.
+	 */
+
+	if (is_power_of_2(c->min)) {
+		c->min +=3D 2;
+		changed =3D 1;
+	}
+	if (is_power_of_2(c->max)) {
+		c->max -=3D 2;
+		changed =3D 1;
+	}
+	if (snd_interval_checkempty(c)) {
+		c->empty =3D 1;
+		return -EINVAL;
+	}
+
+	return changed;
+}
+
+static int n64audio_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime =3D substream->runtime;
+	int err;
+
+	runtime->hw =3D n64audio_pcm_hw;
+	err =3D snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIOD=
S);
+	if (err < 0)
+		return err;
+
+	err =3D snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD=
_SIZE, 2);
+	if (err < 0)
+		return err;
+
+	err =3D snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+			    hw_rule_period_size, NULL, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int n64audio_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime =3D substream->runtime;
+	struct n64audio *priv =3D substream->pcm->private_data;
+	u32 rate;
+
+	rate =3D ((2 * AI_NTSC_DACRATE / runtime->rate) + 1) / 2 - 1;
+
+	n64audio_write_reg(priv, AI_RATE_REG, rate);
+
+	rate /=3D 66;
+	if (rate > 16)
+		rate =3D 16;
+	n64audio_write_reg(priv, AI_BITCLOCK_REG, rate - 1);
+
+	spin_lock_irq(&priv->chan.lock);
+
+	/* Setup the pseudo-dma transfer pointers.  */
+	priv->chan.pos =3D 0;
+	priv->chan.nextpos =3D 0;
+	priv->chan.substream =3D substream;
+	priv->chan.writesize =3D snd_pcm_lib_period_bytes(substream);
+	priv->chan.bufsize =3D snd_pcm_lib_buffer_bytes(substream);
+
+	spin_unlock_irq(&priv->chan.lock);
+	return 0;
+}
+
+static int n64audio_pcm_trigger(struct snd_pcm_substream *substream,
+				int cmd)
+{
+	struct n64audio *priv =3D substream->pcm->private_data;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		n64audio_push(substream->pcm->private_data);
+		n64audio_write_reg(priv, AI_CONTROL_REG, 1);
+		n64mi_write_reg(priv, MI_MASK_REG, MI_MASK_SET_AI);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		n64audio_write_reg(priv, AI_CONTROL_REG, 0);
+		n64mi_write_reg(priv, MI_MASK_REG, MI_MASK_CLR_AI);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static snd_pcm_uframes_t n64audio_pcm_pointer(struct snd_pcm_substream *s=
ubstream)
+{
+	struct n64audio *priv =3D substream->pcm->private_data;
+
+	return bytes_to_frames(substream->runtime,
+			       priv->chan.pos);
+}
+
+static int n64audio_pcm_close(struct snd_pcm_substream *substream)
+{
+	struct n64audio *priv =3D substream->pcm->private_data;
+
+	priv->chan.substream =3D NULL;
+
+	return 0;
+}
+
+static const struct snd_pcm_ops n64audio_pcm_ops =3D {
+	.open =3D		n64audio_pcm_open,
+	.prepare =3D	n64audio_pcm_prepare,
+	.trigger =3D	n64audio_pcm_trigger,
+	.pointer =3D	n64audio_pcm_pointer,
+	.close =3D	n64audio_pcm_close,
+};
+
+/*
+ * The target device is embedded and RAM-constrained. We save RAM
+ * by initializing in __init code that gets dropped late in boot.
+ * For the same reason there is no module or unloading support.
+ */
+static int __init n64audio_probe(struct platform_device *pdev)
+{
+	struct snd_card *card;
+	struct snd_pcm *pcm;
+	struct n64audio *priv;
+	struct resource *res;
+	int err;
+
+	err =3D snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
+			   SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, sizeof(*priv), &card);
+	if (err < 0)
+		return err;
+
+	priv =3D card->private_data;
+
+	spin_lock_init(&priv->chan.lock);
+
+	priv->card =3D card;
+
+	priv->ring_base =3D dma_alloc_coherent(card->dev, 32 * 1024, &priv->ring=
_base_dma,
+					     GFP_DMA|GFP_KERNEL);
+	if (!priv->ring_base) {
+		err =3D -ENOMEM;
+		goto fail_card;
+	}
+
+	priv->mi_reg_base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (!priv->mi_reg_base) {
+		err =3D -EINVAL;
+		goto fail_dma_alloc;
+	}
+
+	priv->ai_reg_base =3D devm_platform_ioremap_resource(pdev, 1);
+	if (!priv->ai_reg_base) {
+		err =3D -EINVAL;
+		goto fail_dma_alloc;
+	}
+
+	err =3D snd_pcm_new(card, "N64 Audio", 0, 1, 0, &pcm);
+	if (err < 0)
+		goto fail_dma_alloc;
+
+	pcm->private_data =3D priv;
+	strcpy(pcm->name, "N64 Audio");
+
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &n64audio_pcm_ops);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, card->dev, 0=
, 0);
+
+	strcpy(card->driver, "N64 Audio");
+	strcpy(card->shortname, "N64 Audio");
+	strcpy(card->longname, "N64 Audio");
+
+	res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (devm_request_irq(&pdev->dev, res->start, n64audio_isr,
+				IRQF_SHARED, "N64 Audio", priv)) {
+		err =3D -EBUSY;
+		goto fail_dma_alloc;
+	}
+
+	err =3D snd_card_register(card);
+	if (err < 0)
+		goto fail_dma_alloc;
+
+	return 0;
+
+fail_dma_alloc:
+	dma_free_coherent(card->dev, 32 * 1024, priv->ring_base, priv->ring_base=
_dma);
+
+fail_card:
+	snd_card_free(card);
+	return err;
+}
+
+static struct platform_driver n64audio_driver =3D {
+	.driver =3D {
+		.name =3D "n64audio",
+	},
+};
+
+static int __init n64audio_init(void)
+{
+	return platform_driver_probe(&n64audio_driver, n64audio_probe);
+}
+
+module_init(n64audio_init);
=2D-
2.6.2

