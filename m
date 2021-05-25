Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0843902B5
	for <lists+linux-mips@lfdr.de>; Tue, 25 May 2021 15:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbhEYNsP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 May 2021 09:48:15 -0400
Received: from elvis.franken.de ([193.175.24.41]:48744 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233339AbhEYNsO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 May 2021 09:48:14 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1llXO3-00079x-02; Tue, 25 May 2021 15:46:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EEE8DC1109; Tue, 25 May 2021 15:39:40 +0200 (CEST)
Date:   Tue, 25 May 2021 15:39:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@iguana.be>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: export rt_sysc_membase for rt2880_wdt.c
Message-ID: <20210525133940.GC11166@alpha.franken.de>
References: <20210517005417.18338-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517005417.18338-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 16, 2021 at 05:54:17PM -0700, Randy Dunlap wrote:
> rt2880_wdt.c uses (well, attempts to use) rt_sysc_membase. However,
> when this watchdog driver is built as a loadable module, there is a
> build error since the rt_sysc_membase symbol is not exported.
> Export it to quell the build error.
> 
> ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
> 
> Fixes: 473cf939ff34 ("watchdog: add ralink watchdog driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Wim Van Sebroeck <wim@iguana.be>
> Cc: John Crispin <john@phrozen.org>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> ---
> or make the Kconfig symbol RALINK_WDT bool instead of tristate?
> 
>  arch/mips/ralink/of.c |    2 ++
>  1 file changed, 2 insertions(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
