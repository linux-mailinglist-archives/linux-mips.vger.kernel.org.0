Return-Path: <linux-mips+bounces-14764-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDqsMuK0FWpxYAcAu9opvQ
	(envelope-from <linux-mips+bounces-14764-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:57:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2FD5D8262
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71EB9306FC10
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 14:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB14401490;
	Tue, 26 May 2026 14:51:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D45B3FFAC5;
	Tue, 26 May 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807071; cv=none; b=WACaeMBVhd3CiydwP0eTrGmS8AERgro4/XYcLtmxt2x4pEr4uVEV8nUnRI8yVL9OsQak/gEwmA7JzkVTTjqXe7sRrGzA/NSihzp6X8LHZ1QWGQLYud/4Xhrma83w2jMOeZYMVFaoJ9aqgieGh3BNY+pj7ezlMmhajM9nxxJkJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807071; c=relaxed/simple;
	bh=kfOBwoOFH/b4dqg7LchyHycekFb8qRXlmijlHls2d8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMk9Hsbwkpl+a6b/8fElB+Erid4Wn1ilzp045GKWUqrq0XDXiCaDhG8SsRY6F32FBBiON8HGYPV8LijLIZiPj8ZjMvvNtc9s8joIdOiWkYiq0YYlTtUyDkR5FSY/HBCRA3oHQXmh7J5zDms6LJQ3++2eVhrBUHuo9o8lmD4HZ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-000159-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 23033C0A25; Tue, 26 May 2026 16:49:40 +0200 (CEST)
Date: Tue, 26 May 2026 16:49:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 10/10] MIPS: DEC: Ensure RTC platform device
 deregistration upon failure
Message-ID: <ahWzBJR8bdsefXD-@alpha.franken.de>
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
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.993];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-14764-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2F2FD5D8262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Greg,

since this only applies with the DZ/ZS changes, could you take this patch
via the serial tree ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

