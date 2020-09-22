Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB362745FB
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 18:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgIVQC3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 12:02:29 -0400
Received: from elvis.franken.de ([193.175.24.41]:51657 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726634AbgIVQC3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Sep 2020 12:02:29 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKkkN-0002LK-00; Tue, 22 Sep 2020 18:02:27 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7EE69C1008; Tue, 22 Sep 2020 18:02:18 +0200 (CEST)
Date:   Tue, 22 Sep 2020 18:02:18 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Increase range of CONFIG_FORCE_MAX_ZONEORDER
Message-ID: <20200922160218.GA10358@alpha.franken.de>
References: <20200917133528.83091-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917133528.83091-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 17, 2020 at 03:35:28PM +0200, Paul Cercueil wrote:
> There is nothing that prevents us from using lower maximum values.
> It's something that we actually want, when using bigger page sizes on
> devices with low RAM.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 632fe8fe68c4..dca2bbdbfc24 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2251,7 +2251,7 @@ config FORCE_MAX_ZONEORDER
>  	default "13" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_32KB
>  	range 12 64 if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_16KB
>  	default "12" if MIPS_HUGE_TLB_SUPPORT && PAGE_SIZE_16KB
> -	range 11 64
> +	range 0 64

Do we need the range at all ? Most other archs don't use a range...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
