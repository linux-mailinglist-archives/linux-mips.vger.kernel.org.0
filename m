Return-Path: <linux-mips+bounces-15321-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WcWVF1SuQmqM/gkAu9opvQ
	(envelope-from <linux-mips+bounces-15321-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:41:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC626DDD2E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:41:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15321-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15321-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 617823063620
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 17:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A165D383333;
	Mon, 29 Jun 2026 17:40:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368D537C0F8;
	Mon, 29 Jun 2026 17:40:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754808; cv=none; b=qJSgNZ2OiQkiVSXk6P9f49pRqE0MaF1H7X+cTUgMw6KAd7X09/tuVsYOgbpeXekU/B0Doizy2P8pZGu6e+yubD8wl6osoafqsDGZArHa6uVn2iuK4LJbk5uz1wNXN2NvWVUSjCjeoF2YIwHE6sUmux+y5YlMKTs+nlP235CVYlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754808; c=relaxed/simple;
	bh=WEACMKHr1RqOqmD+ZBunUm589wZOGHNEaVW5aGY9C94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rb7UeTAjvpf9d/idwTICQU+UPIlEsXbaFQfntoHAQ/PRByrL0sWWBDibeugS9QbpHnbn0djf1DhgPu7OrYpZWgOoYRtB17zFksbVg8ZW1PsrAEC/teps9CHdSwtNyWtf5ZBJV3ve4urVmd5njMZY+H1FE7lawsB1FZbm8NBaf14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1weFd2-0005iV-00; Mon, 29 Jun 2026 19:18:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1C369C0138; Mon, 29 Jun 2026 19:13:46 +0200 (CEST)
Date: Mon, 29 Jun 2026 19:13:46 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Kyle Hendry <kylehendrydev@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Add check for highmem before removing memory
 block
Message-ID: <akKnyiuiWVZRZjZU@alpha.franken.de>
References: <20260621184702.17302-1-kylehendrydev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621184702.17302-1-kylehendrydev@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15321-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:kylehendrydev@gmail.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,alpha.franken.de:mid,alpha.franken.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEC626DDD2E

On Sun, Jun 21, 2026 at 11:47:02AM -0700, Kyle Hendry wrote:
> If a device has less physical memory than the highmem threshold
> bootmem_init() doesn't set highstart_pfn. This results in highmem_init()
> wrongly disabling the entire memory range if the cpu doesn't support
> highmem. Add a check that highstart_pfn is non zero before removing the
> highmem block.
> 
> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
> ---
>  arch/mips/mm/init.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 1c07ca84ee21..352718e43f69 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -426,10 +426,11 @@ static inline void __init highmem_init(void)
>  	unsigned long tmp;
>  
>  	/*
> -	 * If CPU cannot support HIGHMEM discard the memory above highstart_pfn
> +	 * If CPU cannot support HIGHMEM discard any memory above highstart_pfn
>  	 */
>  	if (cpu_has_dc_aliases) {
> -		memblock_remove(PFN_PHYS(highstart_pfn), -1);
> +		if (highstart_pfn)
> +			memblock_remove(PFN_PHYS(highstart_pfn), -1);
>  		return;
>  	}
>  
> -- 
> 2.43.0

Applied to mips-fixes with

Fixes: f171b55f1441 ("mips: fix HIGHMEM initialization")

added.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

