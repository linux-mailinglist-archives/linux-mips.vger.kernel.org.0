Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A43231917
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 07:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgG2F2O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 01:28:14 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:48694 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgG2F2N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 01:28:13 -0400
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id E9DB1206D8
        for <linux-mips@vger.kernel.org>; Wed, 29 Jul 2020 05:28:10 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id A30253ECDA;
        Wed, 29 Jul 2020 07:28:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 7945E2A90C;
        Wed, 29 Jul 2020 07:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596000488;
        bh=/mjyj1nXQ1JYIYOY8ZC2mbGyQtv+lLogDTF5Fdrwkv4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DnJ0P/ZLfwDRGaq1nfvCEv+H7cPBNx6GVL5DWxJx3bavzSUeCvvxgCJN0STJh5pHj
         POZk5uDmYb+ImQQNbKH+nVH6f0i60PQ2mkWaPVp6mvS/M+GOhRdgiiy+rBtZqE0eKt
         Isf/UZ/O55AjJTtDpgsE8QNVLRxJxPQiRess5gpM=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8GrEOB2n6pbr; Wed, 29 Jul 2020 07:28:07 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 29 Jul 2020 07:28:07 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id A9F5640847;
        Wed, 29 Jul 2020 05:28:06 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="WpeuYM1b";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li161-247.members.linode.com [173.230.151.247])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 8E08841312;
        Wed, 29 Jul 2020 05:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596000443;
        bh=/mjyj1nXQ1JYIYOY8ZC2mbGyQtv+lLogDTF5Fdrwkv4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WpeuYM1bh38U+2Wa9oxWhNy9I4d9FT9ygs/3zMowa7JwkeMTQUjc9C3z2dNK1eDo1
         Cnq8T0PkC57ttW9mIishO5S91XU2uGcrN0+HpHZfFbdPmBPnbPEkT32E87RTN5lAUU
         i7rrTFU27NTkUC894byyB8xW5ugvJnC85l1cxXjI=
Subject: Re: [PATCH 4/5] irqchip: loongson-htvec: Support 8 groups of HT
 vectors
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
 <1596000130-8689-4-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <4b7f46ac-2136-be28-1e86-c7e3476b7260@flygoat.com>
Date:   Wed, 29 Jul 2020 13:27:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <1596000130-8689-4-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A9F5640847
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
> The original version can only used by old Loongson-3 which only use 4
> groups of HT vectors. Now Loongson-3A R4 can use 8 groups, so improve
> the driver to support all 8 groups.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>   drivers/irqchip/irq-loongson-htvec.c | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
> index 1ece933..e7722fa 100644
> --- a/drivers/irqchip/irq-loongson-htvec.c
> +++ b/drivers/irqchip/irq-loongson-htvec.c
> @@ -19,15 +19,14 @@
>   
>   /* Registers */
>   #define HTVEC_EN_OFF		0x20
> -#define HTVEC_MAX_PARENT_IRQ	4
> +#define HTVEC_MAX_PARENT_IRQ	8
>   
>   #define VEC_COUNT_PER_REG	32
> -#define VEC_REG_COUNT		4
> -#define VEC_COUNT		(VEC_COUNT_PER_REG * VEC_REG_COUNT)
>   #define VEC_REG_IDX(irq_id)	((irq_id) / VEC_COUNT_PER_REG)
>   #define VEC_REG_BIT(irq_id)	((irq_id) % VEC_COUNT_PER_REG)
>   
>   struct htvec {
> +	int			num_parents;
>   	void __iomem		*base;
>   	struct irq_domain	*htvec_domain;
>   	raw_spinlock_t		htvec_lock;
> @@ -43,7 +42,7 @@ static void htvec_irq_dispatch(struct irq_desc *desc)
>   
>   	chained_irq_enter(chip, desc);
>   
> -	for (i = 0; i < VEC_REG_COUNT; i++) {
> +	for (i = 0; i < priv->num_parents; i++) {
>   		pending = readl(priv->base + 4 * i);
>   		while (pending) {
>   			int bit = __ffs(pending);
> @@ -147,7 +146,7 @@ static void htvec_reset(struct htvec *priv)
>   	u32 idx;
>   
>   	/* Clear IRQ cause registers, mask all interrupts */
> -	for (idx = 0; idx < VEC_REG_COUNT; idx++) {
> +	for (idx = 0; idx < priv->num_parents; idx++) {
>   		writel_relaxed(0x0, priv->base + HTVEC_EN_OFF + 4 * idx);
>   		writel_relaxed(0xFFFFFFFF, priv->base);
>   	}
> @@ -157,7 +156,7 @@ static int htvec_of_init(struct device_node *node,
>   				struct device_node *parent)
>   {
>   	struct htvec *priv;
> -	int err, parent_irq[4], num_parents = 0, i;
> +	int err, parent_irq[8], i;
>   
>   	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -176,19 +175,18 @@ static int htvec_of_init(struct device_node *node,
>   		if (parent_irq[i] <= 0)
>   			break;
>   
> -		num_parents++;
> +		priv->num_parents++;
>   	}
>   
> -	if (!num_parents) {
> +	if (!priv->num_parents) {
>   		pr_err("Failed to get parent irqs\n");
>   		err = -ENODEV;
>   		goto iounmap_base;
>   	}
>   
>   	priv->htvec_domain = irq_domain_create_linear(of_node_to_fwnode(node),
> -						      VEC_COUNT,
> -						      &htvec_domain_ops,
> -						      priv);
> +					(VEC_COUNT_PER_REG * priv->num_parents),
> +					&htvec_domain_ops, priv);
>   	if (!priv->htvec_domain) {
>   		pr_err("Failed to create IRQ domain\n");
>   		err = -ENOMEM;
> @@ -197,7 +195,7 @@ static int htvec_of_init(struct device_node *node,
>   
>   	htvec_reset(priv);
>   
> -	for (i = 0; i < num_parents; i++)
> +	for (i = 0; i < priv->num_parents; i++)
>   		irq_set_chained_handler_and_data(parent_irq[i],
>   						 htvec_irq_dispatch, priv);
>   
