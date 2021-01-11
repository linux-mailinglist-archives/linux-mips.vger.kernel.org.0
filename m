Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5760D2F0FC1
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 11:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbhAKKMV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 05:12:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:49708 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728762AbhAKKMV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 Jan 2021 05:12:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8CA68AD19;
        Mon, 11 Jan 2021 10:11:39 +0000 (UTC)
Date:   Mon, 11 Jan 2021 11:11:39 +0100
Message-ID: <s5h8s8zvl44.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
In-Reply-To: <20210111114323.d522f6e30a705d0731b41b93@gmx.com>
References: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
        <s5hsg7byezb.wl-tiwai@suse.de>
        <20210109092303.b9a2a2f678a5d1b19b7f27f3@gmx.com>
        <s5him86wmnr.wl-tiwai@suse.de>
        <20210109194601.f94ca38b2b99ddeb15705993@gmx.com>
        <s5ha6tivutv.wl-tiwai@suse.de>
        <s5h5z45x24r.wl-tiwai@suse.de>
        <20210110091536.b3bc5dce2ef9d6c94d3eb873@gmx.com>
        <s5hwnwlum21.wl-tiwai@suse.de>
        <20210110190332.8a818e931975f02b8f3d3881@gmx.com>
        <s5ho8hwvh91.wl-tiwai@suse.de>
        <20210110194146.58cf1d6d64a7fbc6d5336210@gmx.com>
        <s5hk0sjvqz3.wl-tiwai@suse.de>
        <20210111114323.d522f6e30a705d0731b41b93@gmx.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 11 Jan 2021 10:43:23 +0100,
Lauri Kasanen wrote:
> 
> On Mon, 11 Jan 2021 09:05:04 +0100
> Takashi Iwai <tiwai@suse.de> wrote:
> 
> > On Sun, 10 Jan 2021 18:41:46 +0100,
> > Lauri Kasanen wrote:
> > > It was returning nextpos, but the pointer printk was in bytes. 8192
> > > bytes = 2048 frames.
> >
> > OK, then it must be right.
> >
> > Then I suppose that the update of pos should be changed in a different
> > way; it should always point to the previous nextpos.  That is,
> > something like:
> >
> > static void n64audio_push(struct n64audio_t *priv, uint8_t irq)
> > {
> > 	....
> > 	if (irq)
> > 		priv->chan.pos = priv->chan.nextpos;
> > 	priv->chan.nextpos += count;
> > 	priv->chan.nextpos %= priv->chan.bufsize;
> >
> > If we use nextpos as the position, it'll lead to the double steps at
> > the first IRQ handling without snd_pcm_period_elapsed() call (the
> > first step missed it), and this may confuse PCM core.
> 
> This almost works, speed is correct, but the last part is played twice.

Oh yes, at the last IRQ, the push should be avoided.
I guess that the code order should be changed to the following way:

  1. advance the position for a period size
  2. call snd_pcm_period_elapsed()
  3. check if the stream is still running
  4. copy the next chunk and update nextpos

So, it's something like:

static irqreturn_t n64audio_isr(int irq, void *dev_id)
{
	struct n64audio *priv = dev_id;

	// Check it's ours
	const u32 intrs = n64mi_read_reg(MI_INTR_REG);
	if (!(intrs & MI_INTR_AI))
		return IRQ_NONE;

	n64audio_write_reg(AI_STATUS_REG, 1);

	priv->chan.pos += priv->chan.nextpos;
	snd_pcm_period_elapsed(priv->chan.substream);
	if (priv->chan.substream == SNDRV_PCM_STATE_RUNNING)
		n64audio_push(priv);

	return IRQ_HANDLED;
}

By calling snd_pcm_period_elapsed(), PCM core detects the end of the
stream and it stops with the state change.  Then we can avoid the
unnecessary push after the stop.

The irq argument in n64audio_push() is dropped in the above, as it's
superfluous now.


Takashi
