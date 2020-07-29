Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC32A231923
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 07:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgG2Fes (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 01:34:48 -0400
Received: from relay4.mymailcheap.com ([137.74.80.154]:46676 "EHLO
        relay4.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgG2Fer (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 01:34:47 -0400
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 054893F162;
        Wed, 29 Jul 2020 07:34:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id C70A32A905;
        Wed, 29 Jul 2020 07:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596000883;
        bh=pP5wEsnC+JWtjjqIzTVCGa3BS/ZrHA3jsru+wXBd1PM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TjrBGyzRKuGa9U++/yTX1avcpv8lI0KdXsQu3zWB3wHdPBy2ZIhzCmNXvduIoXz2r
         /LE4a8nNzPJSZVsXPwgUg/jRxEwyKYDYA67WRzNetuoQjZKTX42Fce+mtfhVvJ4nQD
         XlUWVGXi3HSn7bzqnnR/B5qgu8Wqkn6xAukAcWxc=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qS8vbhFGkTH0; Wed, 29 Jul 2020 07:34:42 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 29 Jul 2020 07:34:42 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 9337440847;
        Wed, 29 Jul 2020 05:34:41 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="NJepf6Zu";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li161-247.members.linode.com [173.230.151.247])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id E84BB40847;
        Wed, 29 Jul 2020 05:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596000799;
        bh=pP5wEsnC+JWtjjqIzTVCGa3BS/ZrHA3jsru+wXBd1PM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NJepf6ZuMDdtcotqU7e8PVlClotvOkR1wBIGMCT7XMdmrJhhC9rwvlSMIVQOiIREP
         zWpagHeW+n90GpYUJg4AGiVn/+Y7mjgehDXoL9j9+JScVmmYnFE0AkEgwgbhgKbsl0
         6LtU9JX/KyJk1Oj9kBza/+6tzA8XCbHC68ed6UkQ=
Subject: Re: [PATCH 5/5] irqchip: loongson-pch-pic: Fix the misused irq flow
 handler
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
 <1596000130-8689-5-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <4b1c4634-341d-352c-95ac-9a26f9e2fbcf@flygoat.com>
Date:   Wed, 29 Jul 2020 13:33:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <1596000130-8689-5-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9337440847
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[9];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,lemote.com,gmail.com];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/7/29 13:22, Huacai Chen Ð´µÀ:
> Loongson PCH PIC is a standard level triggered PIC, and it need to clear
> interrupt during unmask.

I had tested the driver with LS7A internal devices and it works.
But there are some reports that the driver is missing interrupts from
external PCIe slots.

Your patch solved that. Although according to the manual it should be a
fasteoi intc.......

Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>   drivers/irqchip/irq-loongson-pch-pic.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
> index 2a05b93..61d06df 100644
> --- a/drivers/irqchip/irq-loongson-pch-pic.c
> +++ b/drivers/irqchip/irq-loongson-pch-pic.c
> @@ -64,15 +64,6 @@ static void pch_pic_bitclr(struct pch_pic *priv, int offset, int bit)
>   	raw_spin_unlock(&priv->pic_lock);
>   }
>   
> -static void pch_pic_eoi_irq(struct irq_data *d)
> -{
> -	u32 idx = PIC_REG_IDX(d->hwirq);
> -	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> -
> -	writel(BIT(PIC_REG_BIT(d->hwirq)),
> -			priv->base + PCH_PIC_CLR + idx * 4);
> -}
> -
>   static void pch_pic_mask_irq(struct irq_data *d)
>   {
>   	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
> @@ -85,6 +76,9 @@ static void pch_pic_unmask_irq(struct irq_data *d)
>   {
>   	struct pch_pic *priv = irq_data_get_irq_chip_data(d);
>   
> +	writel(BIT(PIC_REG_BIT(d->hwirq)),
> +			priv->base + PCH_PIC_CLR + PIC_REG_IDX(d->hwirq) * 4);
> +
>   	irq_chip_unmask_parent(d);
>   	pch_pic_bitclr(priv, PCH_PIC_MASK, d->hwirq);
>   }
> @@ -124,7 +118,6 @@ static struct irq_chip pch_pic_irq_chip = {
>   	.irq_mask		= pch_pic_mask_irq,
>   	.irq_unmask		= pch_pic_unmask_irq,
>   	.irq_ack		= irq_chip_ack_parent,
> -	.irq_eoi		= pch_pic_eoi_irq,
>   	.irq_set_affinity	= irq_chip_set_affinity_parent,
>   	.irq_set_type		= pch_pic_set_type,
>   };
> @@ -150,7 +143,7 @@ static int pch_pic_alloc(struct irq_domain *domain, unsigned int virq,
>   
>   	irq_domain_set_info(domain, virq, hwirq,
>   			    &pch_pic_irq_chip, priv,
> -			    handle_fasteoi_ack_irq, NULL, NULL);
> +			    handle_level_irq, NULL, NULL);
>   	irq_set_probe(virq);
>   
>   	return 0;
