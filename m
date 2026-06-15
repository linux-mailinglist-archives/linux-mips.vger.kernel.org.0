Return-Path: <linux-mips+bounces-15076-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bBm6L2fXL2oXHwUAu9opvQ
	(envelope-from <linux-mips+bounces-15076-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:43:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03C68568D
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:43:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15076-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15076-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4A793015D11
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 10:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383F533C536;
	Mon, 15 Jun 2026 10:43:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F01533F5B2;
	Mon, 15 Jun 2026 10:43:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520227; cv=none; b=ISTtlf7WF2r58Pt539IKEuuX3t//elWBLp8IXWjbrRaVo7vzXDW/w9o9oT5A1AOyg5+c0CY74Tg2zCy2J/qhvW37HFw3/aH/s4S8ntive0JSwR316lm7DhMdKrNi7toOaF9ROqhVUQYm2WgbkWIEBVHlDvxwcWSOxtEdJ2+7jfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520227; c=relaxed/simple;
	bh=5Cjct7hkI4BKdoY536AkhtUr1habQlfODY6AGVdVDQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2OzeeTRh6P+35X0SvSYmXNW6P8fdkhUxT6fPFj0EfarYimooP20GkIMm8iP2C4zI1wmlCZ+4VTd5JJ+iUJjkPd+4uyKnevJSzK448urNTUmH9BNztKuJxiUnsBdHQ7yZpjef4BzMCULaYvjVOJQnfJQcIdYht2Y38mYaKraKfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000JH-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0D050C0896; Mon, 15 Jun 2026 12:30:40 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:30:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 4/4] MIPS: kernel: proc: Delete unnecessary braces in
 show_cpuinfo()
Message-ID: <ai_UUB7ouRSE1KEw@alpha.franken.de>
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
 <7c7d97b0-37bb-4e7b-9b2e-49a7c10eb6c5@web.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c7d97b0-37bb-4e7b-9b2e-49a7c10eb6c5@web.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15076-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:Markus.Elfring@web.de,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[alpha.franken.de:mid,alpha.franken.de:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B03C68568D

On Thu, Jun 04, 2026 at 07:56:12PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 4 Jun 2026 19:15:15 +0200
> 
> Do not use curly brackets at one source code place
> where a single statement should be sufficient.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/mips/kernel/proc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 42430c7f0acf..2c50b0b53be1 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -151,10 +151,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  		seq_puts(m, " loongson-ext2");
>  	seq_putc(m, '\n');
>  
> -	if (cpu_has_mmips) {
> +	if (cpu_has_mmips)
>  		seq_printf(m, "micromips kernel\t: %s\n",
>  		      str_yes_no(read_c0_config3() & MIPS_CONF3_ISA_OE));
> -	}
>  
>  	seq_puts(m, "Options implemented\t:");
>  	if (cpu_has_tlb)
> -- 
> 2.54.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

