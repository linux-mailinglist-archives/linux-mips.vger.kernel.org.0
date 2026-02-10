Return-Path: <linux-mips+bounces-13156-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMjFON5Ti2kMUAAAu9opvQ
	(envelope-from <linux-mips+bounces-13156-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 16:50:54 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89E11CBAC
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 16:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AEEC300CFD4
	for <lists+linux-mips@lfdr.de>; Tue, 10 Feb 2026 15:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D642133E373;
	Tue, 10 Feb 2026 15:50:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E3B1DF970;
	Tue, 10 Feb 2026 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738650; cv=none; b=DiFigO+72GyCdq3zpeIOudQB+fkLHcDIHoe2tU9oorxsS6u2cyE1CoihdoOskD1+7cDBK0pCQIhVV0KfRCcJlyxMAERTNAUV56v8uIxWNxZ54l+6u8hma426p5bbFIirE8tKBct/plmVfmW3MRQWCQLXBK02jyeD/BgAo8sPel4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738650; c=relaxed/simple;
	bh=7JUi+OMO7WaXxsmWScbHoICpLOvTDMMszEg+PGE+fh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=af/5fJF/z9o13s6BDHiWFi/O/9WjpTZtPpFvNXwYJsQ/w4j7itDgqlNXwVdXB3Sl+ihlZIWaP4RzejpKS3BU6vnjynBKxhmC5UZbYCAF1DT9jkUZ78OzBejQHqUbuSQSktbttfCvNBR+udpjgbg/xHc+TNwXG+zRc6VvNduL4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vpq0Z-0000iT-00; Tue, 10 Feb 2026 16:50:35 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 07982C0084; Tue, 10 Feb 2026 16:50:20 +0100 (CET)
Date: Tue, 10 Feb 2026 16:50:20 +0100
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
	linux-watchdog@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH v2 00/16] MIPS: move pic32.h header file from asm to
 platform_data
Message-ID: <aYtTvEmuaaOxmdAR@alpha.franken.de>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <aYsnsecPa8bWMbaA@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYsnsecPa8bWMbaA@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13156-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alpha.franken.de:mid]
X-Rspamd-Queue-Id: 5A89E11CBAC
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 07:42:25AM -0500, Brian Masney wrote:
> Hi Thomas,
> 
> On Mon, Jan 12, 2026 at 05:47:54PM -0500, Brian Masney wrote:
> > There are currently some pic32 MIPS drivers that are in tree, and are
> > only configured to be compiled on the MIPS pic32 platform. There's a
> > risk of breaking some of these drivers when migrating drivers away from
> > legacy APIs. It happened to me with a pic32 clk driver.
> > 
> > Let's go ahead and move the pic32.h from the asm to the platform_data
> > include directory in the tree. This will make it easier, and cleaner to
> > enable COMPILE_TEST for some of these pic32 drivers. To do this requires
> > updating some includes, which I do at the beginning of this series.
> > 
> > This series was compile tested on a centos-stream-10 arm64 host in two
> > different configurations:
> > 
> > - native arm64 build with COMPILE_TEST (via make allmodconfig)
> > - MIPS cross compile on arm64 with:
> >       ARCH=mips CROSS_COMPILE=mips64-linux-gnu- make pic32mzda_defconfig
> > 
> > Note that there is a separate MIPS compile error in linux-next, and I
> > reported it at https://lore.kernel.org/all/aWVs2gVB418WiMVa@redhat.com/
> > 
> > I included a patch at the end that shows enabling COMPILE_TEST for a
> > pic32 clk driver.
> > 
> > Merge Strategy
> > ==============
> > - Patches 1-15 can go through the MIPS tree.
> > - Patch 16 I can repost to Claudiu after patches 1-15 are in Linus's
> >   tree after the next merge window. There is a separate patch set that
> >   fixes a compiler error I unintentionally introduced via the clk tree.
> >   https://lore.kernel.org/linux-clk/CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com/T/
> 
> Sorry about the duplicate message. I just wanted to reply to the series
> with MIPS in the header so this message isn't lost.
> 
> Can you back out these two patches from your tree in linux-next, and not
> send these to Linus?
> 
> clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=026d70dcfe5de1543bb8edb8e50d22dc16863e6b
> 
> clk: microchip: fix typo in reference to a config option
> https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a6ab150deb4b740334721d18e02ad400a9d888f5

I've reverted both patches in mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

