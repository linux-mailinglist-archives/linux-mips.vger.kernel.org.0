Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44CB260559
	for <lists+linux-mips@lfdr.de>; Mon,  7 Sep 2020 22:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgIGUDp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Sep 2020 16:03:45 -0400
Received: from elvis.franken.de ([193.175.24.41]:58700 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726458AbgIGUDp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Sep 2020 16:03:45 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kFNMc-00073E-00; Mon, 07 Sep 2020 22:03:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6044CC0F58; Mon,  7 Sep 2020 21:53:37 +0200 (CEST)
Date:   Mon, 7 Sep 2020 21:53:37 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 10/15] MIPS: generic: Increase NR_IRQS to 256
Message-ID: <20200907195337.GA17854@alpha.franken.de>
References: <20200906192935.107086-1-paul@crapouillou.net>
 <20200906192935.107086-11-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200906192935.107086-11-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 06, 2020 at 09:29:30PM +0200, Paul Cercueil wrote:
> 128 IRQs is not enough to support Ingenic SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2-v3: No change
> 
>  arch/mips/include/asm/mach-generic/irq.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/mach-generic/irq.h b/arch/mips/include/asm/mach-generic/irq.h
> index 72ac2c202c55..079889ced4f3 100644
> --- a/arch/mips/include/asm/mach-generic/irq.h
> +++ b/arch/mips/include/asm/mach-generic/irq.h
> @@ -9,7 +9,7 @@
>  #define __ASM_MACH_GENERIC_IRQ_H
>  
>  #ifndef NR_IRQS
> -#define NR_IRQS 128
> +#define NR_IRQS 256
>  #endif

this will increase NR_IRQS for all platforms, which don't override
NR_IRQS in their mach-XXX directory. Size of the data segment increases
by 18464 bytes for a 32bit kernel and 33792 for a 64bit kernel. I would
take this change as this allows to remove a few more mach-*/irq.h files.
And if a platform needs save every byte it finds, we can add a irq.h file
for that. An even nicer way would be to make NR_IRQS selectable via Kconfig.
Something like "select NR_IRQS 51" would be quite handy for that...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
