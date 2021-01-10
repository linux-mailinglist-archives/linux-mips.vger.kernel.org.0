Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09322F095F
	for <lists+linux-mips@lfdr.de>; Sun, 10 Jan 2021 20:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbhAJTrB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 Jan 2021 14:47:01 -0500
Received: from mout.gmx.net ([212.227.15.15]:59695 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbhAJTrA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 10 Jan 2021 14:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610307892;
        bh=5MVt1G/TTZVFsE5eMAY6jMF7Df2QbNikAMGwi/vBlZo=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=dU7nwTCQFCTes9oh1MDLmbGvHgeGGM0/50FMi8Cvlw1MzqbjBJQDaNuq6un0BaD1z
         A3Yny7wlT4T7nqMdzBzNar62bjotnBcogAdGEH9xBK2McrzNiahAw0QE4D7NUr4so+
         L+FUsg/x/Z92+eGY+RjeSY5X1x1VBodPKt5c0tj0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.165.132]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MG9gE-1kkOtD3Cbk-00GYhI; Sun, 10
 Jan 2021 20:44:51 +0100
Date:   Sun, 10 Jan 2021 21:46:30 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, Takashi Iwai <tiwai@suse.de>,
        perex@perex.cz
Subject: [PATCH 5/6 v3] sound: Add n64 driver
Message-Id: <20210110214630.723a1c7f365b5730ed1f8051@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gvJVNpVV4tZATgHeVUml+fcu4DL7W+OtPP4FwmGUzeFDazxGEhU
 w+fonyeQGLMZgn73Vegc3olOnyLz9GjFbefXhLMNY8Rmytho98VZ/VW2uXaZlBc+xl/+m3A
 dIoYbPAsR06bgYSW2DTKhY+BIjOmfMAzeBBJl2UJGW5GFY6fxMd/sjAUbs8CvX0NqVGnZhy
 VBrbGa9zOYts8OArt29HQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C5wVgWW5A3s=:Hja339nbMvJN2vuDs76T3u
 ohU45eGgNaMYTdlAvlZ+rHV+66BH59p36JfG9FmNfk68QMdsTdUuyK82nhVSFlQUqi6T8u63m
 CbZPufGcHCDzCCKQQ783NzBtTzQ7gjxCpFQNlZwEU0H4dsC5YtgkmRqXKa3UATPV71UTTZHPQ
 GYEXgnJOtLiPo+htL8RbvnWP0FUU+fPfx1rKQbOfsEp4eSaLYFTvg50qGcEinX7LKRzjcfP20
 S6kpLazaaKEPoQWDAnjPnm2IXqtzIW7ljrQL8xrKNfjP7/3vbVaEo90IbG1TAomCsty8FQcpu
 mmdGjg/ur07NEiiEB2DDtBTTUfpyhRRxmriHTVR6eDLfbJyw8P4j/CxKXxyBv8hBQnHaK2o8b
 6/BjbQ/+ufVuyrQrj6YiD9Zy36yZTT8njkC6RBFAtUeVd63VmQU+Yu+MvuMhCRIlWm2bWgT+p
 m3lmPzEHNGqMLPE/9FNY5U+gue2Z+v4bHdlxGmt1tBbX1vDtyH8YnjAxe48S1rLmWmwQ81KCS
 mcqzHwEfKgU8tNhbi+tbwVozUIVZKrYUpr48pivNh9X1ujc/aHU4wTxdg6/Y9LefkzJobUtem
 uMLXs32UcWSTqqltYHxmo+f7NYIfhpVPL5ZhUFTM/UWQvir0QSv153xlFnIrDqwr8JfvIMnY0
 K/fvSWEU9wXiDC8wusMyghcaNFeru7t8I1XixgMIMgm5FvmOcX1EKL8FdvssoBCSypOtOg+ZT
 Bwhg2FZJmOVmereock5+gwpLTjgqLWPsGT9xaAWHR5RmHebVrcUrqF7Z2u4DQQmxe+woZSJ8O
 6we9V2D41vms7gcR8EGCtRjXlnZL9HWWeF6C8/Bpg+nZ4dkDYEEmDeV1ryJh6NfzBYi7ln3cd
 vICWgrq8PXfe4h+BuMbA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This adds support for the Nintendo 64 console's sound.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--

v3:
use platform resources
2021
renamed struct to n64audio
irq param type to bool
fix blank lines in n64audio_isr
check substream is running
spin_lock_irq in _prepare
integer constraint
clear substream ptr in close
init spinlock earlier
set runtime->delay
periods_min=3D2
constraints, native dma buf

Should address everything except the pos/nextpos point. I can't get it to =
work
the way Takashi advises, it always goes chipmunk.

 sound/mips/Kconfig   |   7 +
 sound/mips/Makefile  |   1 +
 sound/mips/snd-n64.c | 362 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 370 insertions(+)
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
index 0000000..ed7b73f
=2D-- /dev/null
+++ b/sound/mips/snd-n64.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *   Sound driver for Nintendo 64.
+ *
+ *   Copyright 2021 Lauri Kasanen
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
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
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
+static void n64audio_push(struct n64audio *priv, const bool irq)
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
+	n64audio_write_reg(priv, AI_ADDR_REG, runtime->dma_addr + priv->chan.nex=
tpos);
+	n64audio_write_reg(priv, AI_LEN_REG, count);
+
+	priv->chan.nextpos +=3D count;
+	priv->chan.nextpos %=3D priv->chan.bufsize;
+	if (irq)
+		priv->chan.pos =3D priv->chan.nextpos;
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
+
+	// Check it's ours
+	if (!(intrs & MI_INTR_AI))
+		return IRQ_NONE;
+
+	n64audio_write_reg(priv, AI_STATUS_REG, 1);
+
+	if (priv->chan.substream && snd_pcm_running(priv->chan.substream)) {
+		n64audio_push(priv, 1);
+		snd_pcm_period_elapsed(priv->chan.substream);
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
+	.periods_min =3D      2,
+	.periods_max =3D      128,
+};
+
+static unsigned is_pow(const unsigned in)
+{
+	if (in < 2) return 0;
+	return !(in & (in - 1));
+}
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
+	if (is_pow(c->min)) {
+		c->min +=3D 2;
+		changed =3D 1;
+	}
+	if (is_pow(c->max)) {
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
+		n64audio_push(substream->pcm->private_data, 0);
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
+	unsigned long len;
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
+	spin_lock_init(&priv->chan.lock);
+
+	priv->card =3D card;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (request_irq(res->start, n64audio_isr,
+				IRQF_SHARED, "N64 Audio", priv)) {
+		err =3D -EBUSY;
+		goto fail_alloc;
+	}
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	len =3D res->end - res->start + 1;
+	priv->mi_reg_base =3D ioremap(res->start, len);
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	len =3D res->end - res->start + 1;
+	priv->ai_reg_base =3D ioremap(res->start, len);
+
+	err =3D snd_pcm_new(card, "N64 Audio", 0, 1, 0, &pcm);
+	if (err < 0)
+		goto fail_ioremaps;
+
+	pcm->private_data =3D priv;
+	strcpy(pcm->name, "N64 Audio");
+
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &n64audio_pcm_ops);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, card->dev, 32768=
, 32768);
+
+	strcpy(card->driver, "N64 Audio");
+	strcpy(card->shortname, "N64 Audio");
+	strcpy(card->longname, "N64 Audio");
+
+	err =3D snd_card_register(card);
+	if (err < 0)
+		goto fail_ioremaps;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+
+fail_ioremaps:
+	iounmap(priv->ai_reg_base);
+	iounmap(priv->mi_reg_base);
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
+	return platform_driver_probe(&n64audio_driver, n64audio_probe);
+}
+
+module_init(n64audio_init);
=2D-
2.6.2

