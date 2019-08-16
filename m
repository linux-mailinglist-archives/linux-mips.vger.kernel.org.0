Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5325990187
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 14:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfHPM2x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 08:28:53 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:42139 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbfHPM2w (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Aug 2019 08:28:52 -0400
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hybLX-0000mB-9V; Fri, 16 Aug 2019 14:28:43 +0200
Date:   Fri, 16 Aug 2019 14:28:42 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     YueHaibing <yuehaibing@huawei.com>
cc:     jason@lakedaemon.net, maz@kernel.org, paul@crapouillou.net,
        malat@debian.org, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] irqchip/irq-ingenic-tcu: Fix COMPILE_TEST building
In-Reply-To: <20190813015602.30576-1-yuehaibing@huawei.com>
Message-ID: <alpine.DEB.2.21.1908161428001.8238@nanos.tec.linutronix.de>
References: <20190813015602.30576-1-yuehaibing@huawei.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 13 Aug 2019, YueHaibing wrote:

> While do COMPILE_TEST building, if GENERIC_IRQ_CHIP is
> not selected, it fails:
> 
> drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_intc_cascade':
> irq-ingenic-tcu.c:(.text+0x13f): undefined reference to `irq_get_domain_generic_chip'
> drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_irq_init':
> irq-ingenic-tcu.c:(.init.text+0x97): undefined reference to `irq_generic_chip_ops'
> irq-ingenic-tcu.c:(.init.text+0xdd): undefined reference to `__irq_alloc_domain_generic_chips'
> irq-ingenic-tcu.c:(.init.text+0x10b): undefined reference to `irq_get_domain_generic_chip'
> 
> select GENERIC_IRQ_CHIP to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 9536eba03ec7 ("irqchip: Add irq-ingenic-tcu driver")

git show 9536eba03ec7

fatal: ambiguous argument '9536eba03ec7': unknown revision or path not in
       the working tree.

Thanks,

	tglx
