Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF82C2EEEA3
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 09:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbhAHIfL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 03:35:11 -0500
Received: from mout.gmx.net ([212.227.15.15]:55695 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbhAHIfL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Jan 2021 03:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610094814;
        bh=CJxnebsTnPdsALms536PnZQ+25d63nA64grW7ktU9gk=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=h2y3yYEc53ymSqm8ZcZsWTR8l7The8llUycQitBW7ef9LUbqrg1NJzU9I4zXE3Sa6
         hghECauD9gyvu9R3YcwPApEF6QrnJpc1mYfWYrvpxKCTSCtU6PaLUw+EZKXPvd8FSF
         twiGYOaZ87xh2fwDGfxeyB5tOE0AoPAPCFXGFLxo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MsYv3-1k5oyk43n1-00u1xZ; Fri, 08
 Jan 2021 09:33:34 +0100
Date:   Fri, 8 Jan 2021 10:35:13 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ir/VQEHLQL8e4kk4zo8sIb2H2Fcr/zN8086s8cDPYhMcXT9SgcG
 LP/bbnlgXSaYv9y3c5VXgxgwnmY81OVQcth2fGjmdLL1DKKtUx+wrmBaGiGIsbE+2Jr26g3
 Xnqwzl3+tj+kxXkimUjB/BhJycVjdkYcOyAxB5P/TP1yevVKMhnw42OTzUjvjiaM6K8Y6UI
 otvxtLTCed3G4CaqlpQbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pTWOIgYn3Vc=:FDuFmagHMZ5iEIxBsWVzFe
 6tXxZnhO8MiQiUgsHsxUDPeRA8ziitJSoGEpRE7/zMQ6Fc2UwWH/vJXP/MfKL7KgtBy65XzD5
 pdpWzIhzpFmqWpGCN64dVYlO4yclrXHSLPaZz773PSYlwTMcHbmHIeNVFrrmBhZM1SS09wZRR
 fQ/Q434B6YpA8uoO7i0OE0T/olygRDLXbbRUrLnYMV69beRZo0PJAxJKGYzwoHwFRp6Xzx10u
 N6wAp0CmtTKCTUdJOskc7yj8yVXX7PTodUyPpvvtryPjfgpXpV04LobrDlEHjzPdlDDzmp7I+
 GEHY8xy0W6Tsb6EYpUZSXC3+QSFqOsOmJP27a9BJUvn6n3/3FZ5V/ivNpj5DeDXujWYWp3F/7
 0KYZzrQlGCM6pvyYocLxNzmQxrnONU+sS0+PWK9YYs2cRWsRj4/Br4tCs9JA2RHQfDS+wweNb
 x9Vzja6w5b4haGGx7HGM3rKGbQKdBMJosMK4M9IFvJ8uMgfW2fzH87ojsSP21/hvLfJngJHgK
 E1Zb1vsLglZpHXbGnwrWzYlHy3EarRoe8/mq9Ued62wvElBSZxr7UN5u3W9CchdBb7iiGvngy
 J1+Ter6uBAUTmRLcX0OiliHcJROR3oq/+hpjRtcQpbiZSF091x6vkjMMqFAJ49LE0y+fkuJ+Z
 dwZYfZfKKrX34ooR5DcOd23Ta+FBdTCS//GEkYrrR3LwkoJ+U+urwmkVfnX1fJflQ7XmN5wRn
 /wsU5RhimP6N9XAlwH1gKmGdTQFP7GasxXDf6BA2bReDzdyjYe8lNxYfhJyXwLyUI69V7iCzc
 ePOFeIes85JhtCXXcOc5fdUyvNTUPbjdMrFVPS2A71iAoxvnfMNhTblJQzkAcNO03cph3ojjB
 4f33IPbyP8BEbyQ6R5ow==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This adds support for the Nintendo 64 console's sound.

The sound DMA unit has errata on certain alignments, which is why
we can't use alsa's DMA buffer directly.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--

v2:
s/to_uncac/ckseg1/

 sound/mips/Kconfig   |   7 ++
 sound/mips/Makefile  |   1 +
 sound/mips/snd-n64.c | 297 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 305 insertions(+)
 create mode 100644 sound/mips/snd-n64.c

diff --git a/sound/mips/Kconfig b/sound/mips/Kconfig
index b497b80..c8b4db5 100644
=2D-- a/sound/mips/Kconfig
+++ b/sound/mips/Kconfig
@@ -24,5 +24,12 @@ config SND_SGI_HAL2
 	help
 	  Sound support for the SGI Indy and Indigo2 Workstation.

+config SND_N64
+	bool "N64 Audio"
+	depends on MACH_NINTENDO64
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
index 0000000..0317fe2
=2D-- /dev/null
+++ b/sound/mips/snd-n64.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *   Sound driver for Nintendo 64.
+ *
+ *   Copyright 2020 Lauri Kasanen
+ */
+
+#include <linux/init.h>
+#include <linux/spinlock.h>
+#include <linux/interrupt.h>
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+
+#include <sound/core.h>
+#include <sound/control.h>
+#include <sound/pcm.h>
+#include <sound/initval.h>
+
+#include <asm/addrspace.h>
+#include <asm/mach-n64/irq.h>
+
+MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
+MODULE_DESCRIPTION("N64 Audio");
+MODULE_LICENSE("GPL");
+
+#define AI_NTSC_DACRATE 48681812
+#define AI_STATUS_BUSY  (1 << 30)
+#define AI_STATUS_FULL  (1 << 31)
+
+#define REG_BASE ((u32 *) CKSEG1ADDR(0x4500000))
+
+#define AI_ADDR_REG 0
+#define AI_LEN_REG 1
+#define AI_CONTROL_REG 2
+#define AI_STATUS_REG 3
+#define AI_RATE_REG 4
+#define AI_BITCLOCK_REG 5
+
+#define MI_REG_BASE ((u32 *) CKSEG1ADDR(0x4300000))
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
+struct n64audio_t {
+	struct snd_card *card;
+
+	void *ring_base;
+	dma_addr_t ring_base_dma;
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
+static void n64audio_write_reg(const u8 reg, const u32 value)
+{
+	__raw_writel(value, REG_BASE + reg);
+}
+
+static void n64mi_write_reg(const u8 reg, const u32 value)
+{
+	__raw_writel(value, MI_REG_BASE + reg);
+}
+
+static u32 n64mi_read_reg(const u8 reg)
+{
+	return __raw_readl(MI_REG_BASE + reg);
+}
+
+static void n64audio_push(struct n64audio_t *priv, uint8_t irq)
+{
+	struct snd_pcm_runtime *runtime =3D priv->chan.substream->runtime;
+	unsigned long flags;
+	u32 count;
+
+	count =3D priv->chan.writesize;
+	count &=3D ~7;
+
+	spin_lock_irqsave(&priv->chan.lock, flags);
+
+	memcpy(priv->ring_base, runtime->dma_area + priv->chan.nextpos, count);
+
+	n64audio_write_reg(AI_ADDR_REG, priv->ring_base_dma);
+	n64audio_write_reg(AI_LEN_REG, count);
+
+	priv->chan.nextpos +=3D count;
+	priv->chan.nextpos %=3D priv->chan.bufsize;
+	if (irq)
+		priv->chan.pos =3D priv->chan.nextpos;
+
+	spin_unlock_irqrestore(&priv->chan.lock, flags);
+}
+
+static irqreturn_t n64audio_isr(int irq, void *dev_id)
+{
+	struct n64audio_t *priv =3D dev_id;
+
+	// Check it's ours
+	const u32 intrs =3D n64mi_read_reg(MI_INTR_REG);
+	if (!(intrs & MI_INTR_AI))
+		return IRQ_NONE;
+
+	n64audio_write_reg(AI_STATUS_REG, 1);
+
+	n64audio_push(priv, 1);
+	snd_pcm_period_elapsed(priv->chan.substream);
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
+	.periods_min =3D      1,
+	.periods_max =3D      128,
+};
+
+static int n64audio_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime =3D substream->runtime;
+
+	runtime->hw =3D n64audio_pcm_hw;
+	return 0;
+}
+
+static int n64audio_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime =3D substream->runtime;
+	struct n64audio_t *priv =3D substream->pcm->private_data;
+	unsigned long flags;
+	u32 rate;
+
+	rate =3D ((2 * AI_NTSC_DACRATE / runtime->rate) + 1) / 2 - 1;
+
+	n64audio_write_reg(AI_RATE_REG, rate);
+
+	rate /=3D 66;
+	if (rate > 16)
+		rate =3D 16;
+	n64audio_write_reg(AI_BITCLOCK_REG, rate - 1);
+
+	spin_lock_irqsave(&priv->chan.lock, flags);
+
+	/* Setup the pseudo-dma transfer pointers.  */
+	priv->chan.pos =3D 0;
+	priv->chan.nextpos =3D 0;
+	priv->chan.substream =3D substream;
+	priv->chan.writesize =3D snd_pcm_lib_period_bytes(substream);
+	priv->chan.bufsize =3D snd_pcm_lib_buffer_bytes(substream);
+
+	spin_unlock_irqrestore(&priv->chan.lock, flags);
+	return 0;
+}
+
+static int n64audio_pcm_trigger(struct snd_pcm_substream *substream,
+				int cmd)
+{
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		n64audio_push(substream->pcm->private_data, 0);
+		n64audio_write_reg(AI_CONTROL_REG, 1);
+		n64mi_write_reg(MI_MASK_REG, MI_MASK_SET_AI);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		n64audio_write_reg(AI_CONTROL_REG, 0);
+		n64mi_write_reg(MI_MASK_REG, MI_MASK_CLR_AI);
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
+	struct n64audio_t *priv =3D substream->pcm->private_data;
+
+	return bytes_to_frames(substream->runtime,
+			       priv->chan.pos);
+}
+
+static int n64audio_pcm_close(struct snd_pcm_substream *substream)
+{
+	return 0; // Nothing to do, but the kernel crashes if close() doesn't ex=
ist
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
+static int __init n64audio_probe(struct platform_device *pdev)
+{
+	struct snd_card *card;
+	struct snd_pcm *pcm;
+	struct n64audio_t *priv;
+	int err;
+
+	err =3D snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
+			   SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, 0, &card);
+	if (err < 0)
+		return err;
+
+	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (priv =3D=3D NULL) {
+		err =3D -ENOMEM;
+		goto fail_card;
+	}
+
+	priv->card =3D card;
+	priv->ring_base =3D dma_alloc_coherent(card->dev, 32 * 1024,
+					     &priv->ring_base_dma,
+					     GFP_DMA | GFP_KERNEL);
+	if (!priv->ring_base)
+		goto fail_alloc;
+
+	if (request_irq(RCP_IRQ, n64audio_isr,
+				IRQF_SHARED, "N64 Audio", priv)) {
+		err =3D -EBUSY;
+		goto fail_alloc;
+	}
+
+	spin_lock_init(&priv->chan.lock);
+
+	err =3D snd_pcm_new(card, "N64 Audio", 0, 1, 0, &pcm);
+	if (err < 0)
+		goto fail_alloc;
+
+	pcm->private_data =3D priv;
+	strcpy(pcm->name, "N64 Audio");
+
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &n64audio_pcm_ops);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
+
+	strcpy(card->driver, "N64 Audio");
+	strcpy(card->shortname, "N64 Audio");
+	strcpy(card->longname, "N64 Audio");
+
+	err =3D snd_card_register(card);
+	if (err < 0)
+		goto fail_alloc;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+
+fail_alloc:
+	kfree(priv);
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
+	int ret;
+
+	ret =3D platform_driver_probe(&n64audio_driver, n64audio_probe);
+
+	return ret;
+}
+
+fs_initcall(n64audio_init);
=2D-
2.6.2

