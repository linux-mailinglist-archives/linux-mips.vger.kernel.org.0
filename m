Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 522CF9098C
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 22:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfHPUl7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 16:41:59 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:43170 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727545AbfHPUl7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Aug 2019 16:41:59 -0400
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hyj2k-0000GR-1V; Fri, 16 Aug 2019 22:41:50 +0200
Date:   Fri, 16 Aug 2019 22:41:49 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Paul Burton <paul.burton@mips.com>
cc:     YueHaibing <yuehaibing@huawei.com>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "malat@debian.org" <malat@debian.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] irqchip/irq-ingenic-tcu: Fix COMPILE_TEST building
In-Reply-To: <20190816201857.46hqlsezqkxdabd7@pburton-laptop>
Message-ID: <alpine.DEB.2.21.1908162241271.1923@nanos.tec.linutronix.de>
References: <20190813015602.30576-1-yuehaibing@huawei.com> <alpine.DEB.2.21.1908161428001.8238@nanos.tec.linutronix.de> <20190816201857.46hqlsezqkxdabd7@pburton-laptop>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 16 Aug 2019, Paul Burton wrote:
> On Fri, Aug 16, 2019 at 02:28:42PM +0200, Thomas Gleixner wrote:
> > On Tue, 13 Aug 2019, YueHaibing wrote:
> > 
> > > While do COMPILE_TEST building, if GENERIC_IRQ_CHIP is
> > > not selected, it fails:
> > > 
> > > drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_intc_cascade':
> > > irq-ingenic-tcu.c:(.text+0x13f): undefined reference to `irq_get_domain_generic_chip'
> > > drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_irq_init':
> > > irq-ingenic-tcu.c:(.init.text+0x97): undefined reference to `irq_generic_chip_ops'
> > > irq-ingenic-tcu.c:(.init.text+0xdd): undefined reference to `__irq_alloc_domain_generic_chips'
> > > irq-ingenic-tcu.c:(.init.text+0x10b): undefined reference to `irq_get_domain_generic_chip'
> > > 
> > > select GENERIC_IRQ_CHIP to fix this.
> > > 
> > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > Fixes: 9536eba03ec7 ("irqchip: Add irq-ingenic-tcu driver")
> > 
> > git show 9536eba03ec7
> > 
> > fatal: ambiguous argument '9536eba03ec7': unknown revision or path not in
> >        the working tree.
> 
> The referenced patch is in mips-next - can I get your Ack to apply this
> there too?

Sure. Acked-by-me :)
