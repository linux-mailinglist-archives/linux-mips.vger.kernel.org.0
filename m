Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99222CBAC0
	for <lists+linux-mips@lfdr.de>; Wed,  2 Dec 2020 11:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbgLBKky (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Dec 2020 05:40:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:43109 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729412AbgLBKky (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Dec 2020 05:40:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kkPYR-0001YK-00; Wed, 02 Dec 2020 11:40:11 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 54174C02B7; Wed,  2 Dec 2020 11:39:43 +0100 (CET)
Date:   Wed, 2 Dec 2020 11:39:43 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: KASLR: Fix sync_icache() trapped in loop when
 synci_step is zero
Message-ID: <20201202103943.GA9065@alpha.franken.de>
References: <1606878005-11427-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606878005-11427-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 02, 2020 at 11:00:05AM +0800, Jinyang He wrote:
> Reading synci_step by using rdhwr instruction may return zero if no cache
> need be synchronized. On the one hand, to make sure all load operation and
> store operation finished we do __sync() for every platform. On the other
> hand, some platform need operate synci one time although step is zero.

Should this be someting like: Avoid endless loop, if no synci is needed ?

> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
> index 57bdd276..47aeb33 100644
> --- a/arch/mips/kernel/relocate.c
> +++ b/arch/mips/kernel/relocate.c
> @@ -64,7 +64,7 @@ static void __init sync_icache(void *kbase, unsigned long kernel_length)
>  			: "r" (kbase));
>  
>  		kbase += step;
> -	} while (kbase < kend);
> +	} while (step && kbase < kend);

why not do a

	if (step == 0)
		return;

before entering the loop ? According to MIPS32PRA no synci is needed,
if stepi value is zero.

Thomas.

PS: Does anybody know a reason, why this code doesn't use an old fashioned
dache/icache flushing, which might be slower but would work also on
legecy cores ?

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
