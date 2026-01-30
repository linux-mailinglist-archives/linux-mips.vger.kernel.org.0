Return-Path: <linux-mips+bounces-13056-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPexBAvDfGmgOgIAu9opvQ
	(envelope-from <linux-mips+bounces-13056-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 15:41:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89003BBAB0
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 15:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B12FE3057E42
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 14:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EBE372B24;
	Fri, 30 Jan 2026 14:38:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948A0329E40;
	Fri, 30 Jan 2026 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783905; cv=none; b=Sp+fnFLzGlAACs4horA3lwN6bjd+0BbnhcHuGGZbwjUpseMJCEL7uL5Bb649mW76hZmW9EBVAMQ8/SgHelTGm1K5Ksz2BG4WRRbjeFYW0MYsVDi8PRa6AnBYCR+DdOWWIP8/MhOgmXp89ovQ1V0tqOXMiWyFtOWXjQ0lLW0mVq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783905; c=relaxed/simple;
	bh=JwWdTtXP6aYnY46cQ244PNUDxwPqzAMtK4NQiX4+FVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIuWLFlnvqvTggP/P41qqTpHYwBBeCEB45H/fsfUg/19yNprMkAHhqbpI3mdwwIs/5bUryWqaDLxrYkhivgeL1cISebyfViCv0sTyCegS+yJb1h9lgJNtICeljuhD1MXs8gF1OQDZnHZB7GJcV+0r30VpL+4BHxrIzPp40Nwzlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vlpdb-0007Ev-00; Fri, 30 Jan 2026 15:38:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C4CE7C0748; Fri, 30 Jan 2026 15:37:58 +0100 (CET)
Date: Fri, 30 Jan 2026 15:37:58 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Brian Masney <bmasney@redhat.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 00/16] MIPS: move pic32.h header file from asm to
 platform_data
Message-ID: <aXzCRgyHjG-NfiRw@alpha.franken.de>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13056-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alpha.franken.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 89003BBAB0
X-Rspamd-Action: no action

On Mon, Jan 12, 2026 at 05:47:54PM -0500, Brian Masney wrote:
> There are currently some pic32 MIPS drivers that are in tree, and are
> only configured to be compiled on the MIPS pic32 platform. There's a
> risk of breaking some of these drivers when migrating drivers away from
> legacy APIs. It happened to me with a pic32 clk driver.
> 
> Let's go ahead and move the pic32.h from the asm to the platform_data
> include directory in the tree. This will make it easier, and cleaner to
> enable COMPILE_TEST for some of these pic32 drivers. To do this requires
> updating some includes, which I do at the beginning of this series.
> 
> This series was compile tested on a centos-stream-10 arm64 host in two
> different configurations:
> 
> - native arm64 build with COMPILE_TEST (via make allmodconfig)
> - MIPS cross compile on arm64 with:
>       ARCH=mips CROSS_COMPILE=mips64-linux-gnu- make pic32mzda_defconfig
> 
> Note that there is a separate MIPS compile error in linux-next, and I
> reported it at https://lore.kernel.org/all/aWVs2gVB418WiMVa@redhat.com/
> 
> I included a patch at the end that shows enabling COMPILE_TEST for a
> pic32 clk driver.
> 
> Merge Strategy
> ==============
> - Patches 1-15 can go through the MIPS tree.
> - Patch 16 I can repost to Claudiu after patches 1-15 are in Linus's
>   tree after the next merge window. There is a separate patch set that
>   fixes a compiler error I unintentionally introduced via the clk tree.
>   https://lore.kernel.org/linux-clk/CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com/T/
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Changes in v2:
> - Fix native MIPS build by updating include files
> - Link to v1: https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com
> 
> ---
> Brian Masney (16):
>       MIPS: pic32: include linux/io.h header on several files
>       MIPS: pic32: include linux/types.h on pic32.h
>       MIPS: pic32: drop unused include linux/io.h from pic32.h
>       MIPS: copy pic32.h header file from asm/mach-pic32/ to include/platform-data/
>       MAINTAINERS: add include/linux/platform_data/pic32.h to MIPS entry
>       MIPS: update include to use pic32.h from platform_data
>       clk: microchip: core: update include to use pic32.h from platform_data
>       irqchip/irq-pic32-evic: update include to use pic32.h from platform_data
>       mmc: sdhci-pic32: update include to use pic32.h from platform_data
>       pinctrl: pic32: update include to use pic32.h from platform_data
>       rtc: pic32: update include to use pic32.h from platform_data
>       serial: pic32_uart: update include to use pic32.h from platform_data
>       watchdog: pic32-dmt: update include to use pic32.h from platform_data
>       watchdog: pic32-wdt: update include to use pic32.h from platform_data
>       MIPS: drop unused pic32.h header
>       clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> 
>  MAINTAINERS                                             |  1 +
>  arch/mips/pic32/common/reset.c                          |  3 ++-
>  arch/mips/pic32/pic32mzda/config.c                      |  3 +--
>  arch/mips/pic32/pic32mzda/early_clk.c                   |  3 ++-
>  arch/mips/pic32/pic32mzda/early_console.c               |  3 ++-
>  drivers/clk/microchip/Kconfig                           |  2 +-
>  drivers/clk/microchip/clk-core.c                        |  6 +++++-
>  drivers/irqchip/irq-pic32-evic.c                        |  2 +-
>  drivers/mmc/host/sdhci-pic32.c                          |  2 +-
>  drivers/pinctrl/pinctrl-pic32.c                         |  3 +--
>  drivers/rtc/rtc-pic32.c                                 |  3 +--
>  drivers/tty/serial/pic32_uart.c                         |  3 +--
>  drivers/watchdog/pic32-dmt.c                            |  3 +--
>  drivers/watchdog/pic32-wdt.c                            |  3 +--
>  .../mach-pic32 => include/linux/platform_data}/pic32.h  | 17 ++++++++++-------
>  15 files changed, 31 insertions(+), 26 deletions(-)
> ---
> base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> change-id: 20260109-mips-pic32-header-move-6ac9965aa70a

series applied to mips-next
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

