Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78C3618E1C1
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2020 15:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbgCUOOm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Mar 2020 10:14:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:56194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726823AbgCUOOm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 21 Mar 2020 10:14:42 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77C5E20658;
        Sat, 21 Mar 2020 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584800081;
        bh=BkafZo5ywLgZLTC3Js/WXCIoJuWRu5WaImZuPyUfdoE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Cz1IsoUnhrqVIT/1pySZTxYw0qA3gXQQrCtot7/Pyy8OENEBLxg+RmrD54NQuPM09
         5t1M7MDdNPhUiiLmXbxJxvAxAtxrXU5i+FIobbWx4j6EsDTmxYrG5O+CV8flUdoYZl
         2UhQlh8R2x4iRVWOKfxfkhCZXRXNzE62EA7qPR5o=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jFetb-00EVd4-NJ; Sat, 21 Mar 2020 14:14:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 21 Mar 2020 14:14:39 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/11] irqchip: Add driver for Loongson-3
 HyperTransport PIC controller
In-Reply-To: <20200318062102.8145-5-jiaxun.yang@flygoat.com>
References: <20200318062102.8145-1-jiaxun.yang@flygoat.com>
 <20200318062102.8145-5-jiaxun.yang@flygoat.com>
Message-ID: <f4c009a117a3978e9e98195abcc98c07@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, chenhc@lemote.com, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org, allison@lohutok.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-03-18 06:20, Jiaxun Yang wrote:
> This controller appeared on Loongson-3 family of chips to receive 
> interrupts
> from PCH PIC.
> It is a I8259 with optimized interrupt polling flow. We can poll
> interrupt number
> from HT vector directly but still have to follow standard I8259
> routines to mask,
> unmask and EOI.
> 
> Co-developed-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> ---
> v4-v5:
> 	Enhancements according to maz's suggestions:
> 		- Add static for private struct
> 		- Drop pointless rename
> 		- Fix DT parse bug
> 		- Clarifications in comments and commit message
> ---
>  arch/mips/include/asm/i8259.h        |   1 +
>  drivers/irqchip/Kconfig              |  10 ++
>  drivers/irqchip/Makefile             |   1 +
>  drivers/irqchip/irq-loongson-htpic.c | 149 +++++++++++++++++++++++++++
>  4 files changed, 161 insertions(+)
>  create mode 100644 drivers/irqchip/irq-loongson-htpic.c

[...]

> +int __init htpic_of_init(struct device_node *node, struct device_node 
> *parent)
> +{
> +	unsigned int parent_irq[4];
> +	int i, err;
> +	int num_parents = 0;
> +
> +	if (htpic) {
> +		pr_err("loongson-htpic: Only one HTPIC is allowed in the system\n");
> +		return -ENODEV;
> +	}
> +
> +	htpic = kzalloc(sizeof(*htpic), GFP_KERNEL);
> +	if (!htpic) {
> +		err = -ENOMEM;
> +		goto out_free;
> +	}
> +
> +	htpic->base = of_iomap(node, 0);
> +	if (!htpic->base) {
> +		err = -ENODEV;
> +		goto out_free;
> +	}
> +
> +	htpic->domain = __init_i8259_irqs(node);
> +	if (!htpic->domain) {
> +		pr_err("loongson-htpic: Failed to initialize i8259 IRQs\n");
> +		err = -ENOMEM;
> +		goto out_iounmap;
> +	}
> +
> +	/* Interrupt may come from any of the 4 interrupt line */
> +	for (i = 0; i < HTPIC_MAX_PARENT_IRQ; i++) {
> +		parent_irq[i] = irq_of_parse_and_map(node, i);
> +		if (parent_irq[i] < 0)

irq_of_parse_and_map() returns 0 when there is no interrupt to be
mapped. You should probably test for that too.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
