Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC4542ED87
	for <lists+linux-mips@lfdr.de>; Fri, 15 Oct 2021 11:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237282AbhJOJ1C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Oct 2021 05:27:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:45688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236767AbhJOJ1C (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Oct 2021 05:27:02 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61FC661027;
        Fri, 15 Oct 2021 09:24:56 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mbJSQ-00GvYk-53; Fri, 15 Oct 2021 10:24:54 +0100
MIME-Version: 1.0
Date:   Fri, 15 Oct 2021 10:24:54 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     zhaoxiao <long870912@gmail.com>
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com, tglx@linutronix.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: Re: [PATCH] irqchip/loongson-htvec:- Handle return value of ioremap.
In-Reply-To: <20211015072523.30615-1-long870912@gmail.com>
References: <20211015072523.30615-1-long870912@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <d64d419980ce3ecd0efb72aa86604d28@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: long870912@gmail.com, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, tglx@linutronix.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, zhaoxiao@uniontech.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-10-15 08:25, zhaoxiao wrote:
> From: zhaoxiao <zhaoxiao@uniontech.com>
> 
> Here, If ioremap will fail. It will return NULL.Kernel can run into
> a NULL-pointer dereference. This error check will avoid NULL pointer
> dereference.
> 
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
> ---
>  drivers/irqchip/irq-loongson-htvec.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-loongson-htvec.c
> b/drivers/irqchip/irq-loongson-htvec.c
> index 1cc0bceb4472..a36c20f44ec4 100644
> --- a/drivers/irqchip/irq-loongson-htvec.c
> +++ b/drivers/irqchip/irq-loongson-htvec.c
> @@ -267,6 +267,8 @@ struct fwnode_handle *htvec_acpi_init(struct
> fwnode_handle *parent,
> 
>  	priv->num_parents = HTVEC_MAX_PARENT_IRQ;
>  	priv->base = ioremap(acpi_htvec->address, acpi_htvec->size);
> +	if (!priv->base)
> +		goto free_priv;
> 
>  	/* Interrupt may come from any of the 8 interrupt lines */
>  	for (i = 0; i < priv->num_parents; i++)
> @@ -307,6 +309,7 @@ struct fwnode_handle *htvec_acpi_init(struct
> fwnode_handle *parent,
>  iounmap_base:
>  	iounmap(priv->base);
>  	priv->domain_handle = NULL;
> +free_priv:
>  	kfree(priv);
> 
>  	return NULL;

What is the difference between this and the patch you sent 3 days ago?

         M.
-- 
Jazz is not dead. It just smells funny...
