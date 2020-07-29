Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED700231916
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 07:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgG2F2L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 01:28:11 -0400
Received: from relay3.mymailcheap.com ([217.182.119.155]:43678 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgG2F2L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 01:28:11 -0400
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 8E8173ECDF;
        Wed, 29 Jul 2020 07:28:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 674072A905;
        Wed, 29 Jul 2020 07:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596000488;
        bh=RCHXjbHW2v3nI56l860UVxxb2sk18iKVE4RRTzyRF24=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Z+tavpovrvxx8deji0TsJaavSJ5LpaN4Q8pM4Wy/Sqnm6NUjJ00Vexh/DTWexGgGr
         4WbNPkkxbcTE0rMkp8eCjH0MPEBitfNNCxQbyUiVLsn0shauHjb5IK9P1PNo3/4Nko
         Co4+HOabp5Op7EiRxgXKrqzzmc66n1VMTCsdhZEk=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1ARtCvndUUjA; Wed, 29 Jul 2020 07:28:06 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 29 Jul 2020 07:28:06 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 2BBC5418CF;
        Wed, 29 Jul 2020 05:28:06 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="kRH6Bfml";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li161-247.members.linode.com [173.230.151.247])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 45A4241312;
        Wed, 29 Jul 2020 05:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596000416;
        bh=RCHXjbHW2v3nI56l860UVxxb2sk18iKVE4RRTzyRF24=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kRH6Bfmlx+Mc0zBIp5q0Ouz0Tee3oxPGOm0gKvyNcI4Qd3qElRvWFhYK2u+jljBuE
         AcVErP9PfRxcNxCmMcfE+2wELUmLhCYXtGtZSoteOuLkUgkLig/is5mLcWnNIHjNnp
         VmSrFXvvpudiSpPsVkxq1JH9jb63g4cdJMoxCiAM=
Subject: Re: [PATCH 3/5] irqchip: loongson-liointc: Fix misuse of
 gc->mask_cache
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
 <1596000130-8689-3-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <ccd646fd-9df6-517f-0cee-4672e8a052f8@flygoat.com>
Date:   Wed, 29 Jul 2020 13:26:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <1596000130-8689-3-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2BBC5418CF
X-Spamd-Result: default: False [1.40 / 10.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all:c];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[9];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,lemote.com,gmail.com];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/7/29 13:22, Huacai Chen Ð´µÀ:
> In gc->mask_cache bits, 1 means enabled and 0 means disabled, but in the
> loongson-liointc driver mask_cache is misused by reverting its meaning.
> This patch fix the bug and update the comments as well.

Suprisingly it even works with the wrong usage of mask_cache.
Thanks for catching that!

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>   drivers/irqchip/irq-loongson-liointc.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
> index 63b6147..08165c5 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -60,7 +60,7 @@ static void liointc_chained_handle_irq(struct irq_desc *desc)
>   	if (!pending) {
>   		/* Always blame LPC IRQ if we have that bug */
>   		if (handler->priv->has_lpc_irq_errata &&
> -			(handler->parent_int_map & ~gc->mask_cache &
> +			(handler->parent_int_map & gc->mask_cache &
>   			BIT(LIOINTC_ERRATA_IRQ)))
>   			pending = BIT(LIOINTC_ERRATA_IRQ);
>   		else
> @@ -131,11 +131,11 @@ static void liointc_resume(struct irq_chip_generic *gc)
>   	irq_gc_lock_irqsave(gc, flags);
>   	/* Disable all at first */
>   	writel(0xffffffff, gc->reg_base + LIOINTC_REG_INTC_DISABLE);
> -	/* Revert map cache */
> +	/* Restore map cache */
>   	for (i = 0; i < LIOINTC_CHIP_IRQ; i++)
>   		writeb(priv->map_cache[i], gc->reg_base + i);
> -	/* Revert mask cache */
> -	writel(~gc->mask_cache, gc->reg_base + LIOINTC_REG_INTC_ENABLE);
> +	/* Restore mask cache */
> +	writel(gc->mask_cache, gc->reg_base + LIOINTC_REG_INTC_ENABLE);
>   	irq_gc_unlock_irqrestore(gc, flags);
>   }
>   
> @@ -243,7 +243,7 @@ int __init liointc_of_init(struct device_node *node,
>   	ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
>   	ct->chip.irq_set_type = liointc_set_type;
>   
> -	gc->mask_cache = 0xffffffff;
> +	gc->mask_cache = 0;
>   	priv->gc = gc;
>   
>   	for (i = 0; i < LIOINTC_NUM_PARENT; i++) {
