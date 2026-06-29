Return-Path: <linux-mips+bounces-15319-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n8q6BgGwQmro/gkAu9opvQ
	(envelope-from <linux-mips+bounces-15319-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:48:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199B6DDDF1
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:48:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15319-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15319-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35CC43033EDC
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 17:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9784F33EAEC;
	Mon, 29 Jun 2026 17:40:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4E53DC87A;
	Mon, 29 Jun 2026 17:39:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754802; cv=none; b=XW6usXvGXIXrlIOyGFI/xiw/IfNw6ovNMYJFTnePi/v1Wbr7qgVO2Q3krqK4ALVjblc93LRWGeroLw+Zzz2eO54YwB+uGffZoLA46BrdVbae4gsCp4oSwfJ4Bc9aYZl2p0GBL/ATu9RDSMJdkAg2DD76EGV6ZNWvjkoy7eXQKzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754802; c=relaxed/simple;
	bh=t/aGxPjf/yxck7dxs7ciEjw4oVBgeDJj1ki9pJvPjRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esdqKgHMw9FXF1xPA7FLUhYvP9XWpK0Gqedq3quPWV6q0sGilSTSlfMVGzAC5LNRJTT3i8y0p6HYRXWSlyYQvb5vT2NSh0NAVeyF0dENtE1w8FhHXU2c7cEJWOrGRqHH7PoeGYk2T0boc1d4eZN9niI/haK2czNBY29RdE9Hpfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1weFd2-0005iR-00; Mon, 29 Jun 2026 19:18:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0B423C00E8; Mon, 29 Jun 2026 19:12:02 +0200 (CEST)
Date: Mon, 29 Jun 2026 19:12:02 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 10/10] MIPS: DEC: Ensure RTC platform device
 deregistration upon failure
Message-ID: <akKnYgr_oc67Tttp@alpha.franken.de>
References: <alpine.DEB.2.21.2605062240290.46195@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605062333190.46195@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2605062333190.46195@angie.orcam.me.uk>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15319-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:macro@orcam.me.uk,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linux-mips@vger.kernel.org,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alpha.franken.de:mid,alpha.franken.de:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,orcam.me.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1199B6DDDF1

On Wed, May 06, 2026 at 11:43:00PM +0100, Maciej W. Rozycki wrote:
> Switch RTC platform device registration from platform_device_register() 
> to platform_add_devices() so as to make sure any failure will result in 
> automatic device unregistration.
> 
> Fixes: fae67ad43114 ("arch/mips/dec: switch DECstation systems to rtc-cmos")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
> Change from v2,
> <https://lore.kernel.org/r/alpine.DEB.2.21.2605012105320.11074@angie.orcam.me.uk/>:
> 
> - Fix a minor style issue in the commit description.
> 
> No change from v1 (8/8),
> <https://lore.kernel.org/r/alpine.DEB.2.21.2604110042130.29980@angie.orcam.me.uk/>.
> ---
>  arch/mips/dec/platform.c |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> linux-mips-dec-platform-rtc-unregister.diff
> Index: linux-macro/arch/mips/dec/platform.c
> ===================================================================
> --- linux-macro.orig/arch/mips/dec/platform.c
> +++ linux-macro/arch/mips/dec/platform.c
> @@ -38,6 +38,10 @@ static struct platform_device dec_rtc_de
>  	.num_resources = ARRAY_SIZE(dec_rtc_resources),
>  };
>  
> +static struct platform_device *dec_rtc_devices[] __initdata = {
> +	&dec_rtc_device,
> +};
> +
>  static struct resource dec_dz_resources[] = {
>  	{ .name = "dz", .flags = IORESOURCE_MEM, },
>  	{ .name = "dz", .flags = IORESOURCE_IRQ, },
> @@ -137,7 +141,7 @@ static int __init dec_add_devices(void)
>  	}
>  	num_zs = i;
>  
> -	ret1 = platform_device_register(&dec_rtc_device);
> +	ret1 = platform_add_devices(dec_rtc_devices, 1);
>  	ret2 = IS_ENABLED(CONFIG_32BIT) ?
>  	       platform_add_devices(dec_dz_devices, num_dz) : 0;
>  	ret3 = platform_add_devices(dec_zs_devices, num_zs);

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

