Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240FD48B0A8
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jan 2022 16:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239582AbiAKPTH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jan 2022 10:19:07 -0500
Received: from elvis.franken.de ([193.175.24.41]:42577 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231986AbiAKPTH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Jan 2022 10:19:07 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1n7IvR-0004j6-00; Tue, 11 Jan 2022 16:19:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 09033C0E4C; Tue, 11 Jan 2022 16:18:17 +0100 (CET)
Date:   Tue, 11 Jan 2022 16:18:17 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lech Perczak <lech.perczak@gmail.com>
Cc:     linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] MIPS: ath79: drop _machine_restart again
Message-ID: <20220111151817.GA11006@alpha.franken.de>
References: <20220110224844.2329275-1-lech.perczak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110224844.2329275-1-lech.perczak@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 10, 2022 at 11:48:44PM +0100, Lech Perczak wrote:
> Commit 81424d0ad0d4 ("MIPS: ath79: Use the reset controller to restart
> OF machines") removed setup of _machine_restart on OF machines to use
> reset handler in reset controller driver.
> While removing remnants of non-OF machines in commit 3a77e0d75eed
> ("MIPS: ath79: drop machfiles"), this was introduced again, making it
> impossible to use additional restart handlers registered through device
> tree. Drop setting _machine_restart altogether, and ath79_restart
> function, which is no longer used after this.
> 
> Fixes: 3a77e0d75eed ("MIPS: ath79: drop machfiles")
> Cc: John Crispin <john@phrozen.org>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
> ---
> 
> Side note: a lot of code, that was previously encompassed by
> "if (mips_machtype != ATH79_MACH_GENERIC_OF) {...} " seems to be
> unnecessary at the time of dropping the non-OF machine definitions.
> However it was retained for some reason, and I see a lot of references
> to it by the drivers. OTOH, OF part of ath79 platform - basically whole ath79
> target of OpenWrt works well without this code in 19.07 release, using 4.14.y
> tree, on which the bug I'm fixing here is absent as well.
> 
> I tested this change on several devices:
> TP-Link TL-WDR4300, TP-Link Archer C7v2, Meraki MR18 using OF,
> and on ZTE MF286 - using OF as well - which is the very reason I discovered
> this issue, as it requires registration of  gpio-restart handler,
> ineffective due to this issue.
> 
>  arch/mips/ath79/setup.c | 10 ----------
>  1 file changed, 10 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
