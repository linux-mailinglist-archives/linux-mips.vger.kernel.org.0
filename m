Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6636A3551ED
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 13:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245462AbhDFLVw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 07:21:52 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:50885 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242052AbhDFLVv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 07:21:51 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FF4q85Bqdz9tyP3;
        Tue,  6 Apr 2021 13:21:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id ovHssQ0hJG_S; Tue,  6 Apr 2021 13:21:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FF4q83pBqz9tyP2;
        Tue,  6 Apr 2021 13:21:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id CE3E18B79D;
        Tue,  6 Apr 2021 13:21:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id kW7nKdTIea_k; Tue,  6 Apr 2021 13:21:41 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D72F98B79B;
        Tue,  6 Apr 2021 13:21:40 +0200 (CEST)
Subject: Re: [PATCH 1/9] irqdomain: Reimplement irq_linear_revmap() with
 irq_find_mapping()
To:     Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>
References: <20210406093557.1073423-1-maz@kernel.org>
 <20210406093557.1073423-2-maz@kernel.org>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <15be426f-4429-ebeb-1b4a-8342bce391e5@csgroup.eu>
Date:   Tue, 6 Apr 2021 13:21:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406093557.1073423-2-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 06/04/2021 à 11:35, Marc Zyngier a écrit :
> irq_linear_revmap() is supposed to be a fast path for domain
> lookups, but it only exposes low-level details of the irqdomain
> implementation, details which are better kept private.

Can you elaborate with more details ?

> 
> The *overhead* between the two is only a function call and
> a couple of tests, so it is likely that noone can show any
> meaningful difference compared to the cost of taking an
> interrupt.

Do you have any measurement ?

Can you make the "likely" a certitude ?

> 
> Reimplement irq_linear_revmap() with irq_find_mapping()
> in order to preserve source code compatibility, and
> rename the internal field for a measure.

This is in complete contradiction with commit https://github.com/torvalds/linux/commit/d3dcb436

At that time, irq_linear_revmap() was less complex than what irq_find_mapping() is today, and 
nevertheless it was considered worth restoring in as a fast path. What has changed since then ?

Can you also explain the reason for the renaming of "linear_revmap" into "revmap" ? What is that 
"measure" ?

> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   include/linux/irqdomain.h | 22 +++++++++-------------
>   kernel/irq/irqdomain.c    |  6 +++---
>   2 files changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 33cacc8af26d..b9600f24878a 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -154,9 +154,9 @@ struct irq_domain_chip_generic;
>    * Revmap data, used internally by irq_domain
>    * @revmap_direct_max_irq: The largest hwirq that can be set for controllers that
>    *                         support direct mapping
> - * @revmap_size: Size of the linear map table @linear_revmap[]
> + * @revmap_size: Size of the linear map table @revmap[]
>    * @revmap_tree: Radix map tree for hwirqs that don't fit in the linear map
> - * @linear_revmap: Linear table of hwirq->virq reverse mappings
> + * @revmap: Linear table of hwirq->virq reverse mappings
>    */
>   struct irq_domain {
>   	struct list_head link;
> @@ -180,7 +180,7 @@ struct irq_domain {
>   	unsigned int revmap_size;
>   	struct radix_tree_root revmap_tree;
>   	struct mutex revmap_tree_mutex;
> -	unsigned int linear_revmap[];
> +	unsigned int revmap[];
>   };
>   
>   /* Irq domain flags */
> @@ -396,24 +396,20 @@ static inline unsigned int irq_create_mapping(struct irq_domain *host,
>   	return irq_create_mapping_affinity(host, hwirq, NULL);
>   }
>   
> -
>   /**
> - * irq_linear_revmap() - Find a linux irq from a hw irq number.
> + * irq_find_mapping() - Find a linux irq from a hw irq number.
>    * @domain: domain owning this hardware interrupt
>    * @hwirq: hardware irq number in that domain space
> - *
> - * This is a fast path alternative to irq_find_mapping() that can be
> - * called directly by irq controller code to save a handful of
> - * instructions. It is always safe to call, but won't find irqs mapped
> - * using the radix tree.
>    */
> +extern unsigned int irq_find_mapping(struct irq_domain *host,
> +				     irq_hw_number_t hwirq);
> +
>   static inline unsigned int irq_linear_revmap(struct irq_domain *domain,
>   					     irq_hw_number_t hwirq)
>   {
> -	return hwirq < domain->revmap_size ? domain->linear_revmap[hwirq] : 0;
> +	return irq_find_mapping(domain, hwirq);
>   }
> -extern unsigned int irq_find_mapping(struct irq_domain *host,
> -				     irq_hw_number_t hwirq);
> +
>   extern unsigned int irq_create_direct_mapping(struct irq_domain *host);
>   extern int irq_create_strict_mappings(struct irq_domain *domain,
>   				      unsigned int irq_base,
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index d10ab1d689d5..dfa716305ea9 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -486,7 +486,7 @@ static void irq_domain_clear_mapping(struct irq_domain *domain,
>   				     irq_hw_number_t hwirq)
>   {
>   	if (hwirq < domain->revmap_size) {
> -		domain->linear_revmap[hwirq] = 0;
> +		domain->revmap[hwirq] = 0;
>   	} else {
>   		mutex_lock(&domain->revmap_tree_mutex);
>   		radix_tree_delete(&domain->revmap_tree, hwirq);
> @@ -499,7 +499,7 @@ static void irq_domain_set_mapping(struct irq_domain *domain,
>   				   struct irq_data *irq_data)
>   {
>   	if (hwirq < domain->revmap_size) {
> -		domain->linear_revmap[hwirq] = irq_data->irq;
> +		domain->revmap[hwirq] = irq_data->irq;
>   	} else {
>   		mutex_lock(&domain->revmap_tree_mutex);
>   		radix_tree_insert(&domain->revmap_tree, hwirq, irq_data);
> @@ -920,7 +920,7 @@ unsigned int irq_find_mapping(struct irq_domain *domain,
>   
>   	/* Check if the hwirq is in the linear revmap. */
>   	if (hwirq < domain->revmap_size)
> -		return domain->linear_revmap[hwirq];
> +		return domain->revmap[hwirq];
>   
>   	rcu_read_lock();
>   	data = radix_tree_lookup(&domain->revmap_tree, hwirq);
> 
