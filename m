Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6FF1171501
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 11:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbgB0Kbb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 05:31:31 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:33892 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbgB0Kbb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 05:31:31 -0500
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1j7GRn-0007Oi-T2; Thu, 27 Feb 2020 11:31:15 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 4CE0E10409C; Thu, 27 Feb 2020 11:31:15 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, x86@kernel.org,
        linux-sh@vger.kernel.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org, linux-omap@vger.kernel.org,
        linux-alpha@vger.kernel.org
Cc:     Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 00/18] genirq: Remove setup_irq()
In-Reply-To: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
Date:   Thu, 27 Feb 2020 11:31:15 +0100
Message-ID: <87y2somido.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Afzal,

afzal mohammed <afzal.mohd.ma@gmail.com> writes:

> While trying to understand internals of irq handling, came across a
> thread [1] in which tglx was referring to avoid usage of setup_irq().
> Existing callers of setup_irq() reached mostly via 'init_IRQ()' &
> 'time_init()', while memory allocators are ready by 'mm_init()'.
>
> Hence instances of setup_irq() is replaced by request_irq() &
> setup_irq() (along with remove_irq()) definition deleted in the last
> patch.
>
> Seldom remove_irq() usage has been observed coupled with setup_irq(),
> wherever that has been found, it too has been replaced by free_irq().

thanks a lot for tackling this!

Vs. merging this series, I suggest the following approach:

   - Resubmit the individual changes as single patches or small series
     to the relevant maintainers and subsystem mailing lists. They have
     no dependency on a core change and can be applied where they belong
     to.

   - After 5.6-rc6, verify which parts have made their way into
     linux-next and resubmit the ignored ones as a series to me along
     with the removal of the core parts.

That way we can avoid conflicting changes between subsystems and the tip
irq/core branch as much as possible.

Thanks,

        tglx
