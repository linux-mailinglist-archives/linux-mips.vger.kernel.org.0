Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D5A2F65BF
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 17:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbhANQXP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jan 2021 11:23:15 -0500
Received: from elvis.franken.de ([193.175.24.41]:51438 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726241AbhANQXP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 Jan 2021 11:23:15 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l05OK-0001bI-00; Thu, 14 Jan 2021 17:22:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A7EB2C0312; Thu, 14 Jan 2021 17:17:59 +0100 (CET)
Date:   Thu, 14 Jan 2021 17:17:59 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v6] sound: Add n64 driver
Message-ID: <20210114161759.GA14146@alpha.franken.de>
References: <20210113171322.77105fa8f92826e6b716631a@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113171322.77105fa8f92826e6b716631a@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 13, 2021 at 05:13:22PM +0200, Lauri Kasanen wrote:
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	len = res->end - res->start + 1;
> +	priv->mi_reg_base = ioremap(res->start, len);

now with resources in place, you can use devm_platform_ioremap_resource,
which will make handling error cases simpler.

> +	if (!priv->mi_reg_base) {
> +		err = -EINVAL;
> +		goto fail_dma_alloc;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	len = res->end - res->start + 1;
> +	priv->ai_reg_base = ioremap(res->start, len);
> +	if (!priv->ai_reg_base) {
> +		err = -EINVAL;
> +		goto fail_mi_ioremap;
> +	}
> +
> +	err = snd_pcm_new(card, "N64 Audio", 0, 1, 0, &pcm);
> +	if (err < 0)
> +		goto fail_ioremaps;
> +
> +	pcm->private_data = priv;
> +	strcpy(pcm->name, "N64 Audio");
> +
> +	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &n64audio_pcm_ops);
> +	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, card->dev, 0, 0);
> +
> +	strcpy(card->driver, "N64 Audio");
> +	strcpy(card->shortname, "N64 Audio");
> +	strcpy(card->longname, "N64 Audio");
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +	if (request_irq(res->start, n64audio_isr,

and here you can use devm_request_irq .

> +				IRQF_SHARED, "N64 Audio", priv)) {

is it really shared ? Looking at n64/init.c there is no other device
using this interrupt.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
