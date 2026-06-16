Return-Path: <linux-mips+bounces-15110-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sb+cI9gtMWqEdQUAu9opvQ
	(envelope-from <linux-mips+bounces-15110-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 13:04:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C144F68E9E8
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 13:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15110-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15110-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA5D03004C90
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 11:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8709429825;
	Tue, 16 Jun 2026 11:04:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7362F8EB1
	for <linux-mips@vger.kernel.org>; Tue, 16 Jun 2026 11:04:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607853; cv=none; b=Z4RX+qy868FjXqFo6+DqA2j66L7C1PvH3DWdnQjhH+yfOzmne30f2DdZR0RUKLCdQUANSP/gj/6FRd6lbmLBhaRBfS9L2yEubxVy3DTJ4ENzoU+h1WCUwhnJDJOQa0LuLEuo+nZh5UnUi4QREpNe5+qYgP79Xr/bNc5sZGeb52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607853; c=relaxed/simple;
	bh=XlPIUwQWeqadeAZDmEp0GLBep1xi7s+pwmjoBlJkbXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfR+QYWhewZnCi25mUCvmD/RItwgdhm7NMXVFI22YpiEbacxQb9QtFdhR/Bdsl/fCl1kCYKLoc6ZBznYpG1XKuD1F8ATD1ryLCljVf72+Q8a3nYTY4WfvF35fw5PgzeONf53AUu52nSOKiQNzYVRqzP3v2QLfPMiHTy+tOKU1sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZRaN-0007FY-00; Tue, 16 Jun 2026 13:04:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 08FFAC012A; Tue, 16 Jun 2026 13:01:36 +0200 (CEST)
Date: Tue, 16 Jun 2026 13:01:36 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: remove comment referring to removed
 CONFIG_MIPS_CMP
Message-ID: <ajEtEMekGrzaJeeG@alpha.franken.de>
References: <20260610220124.97261-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610220124.97261-1-enelsonmoore@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[franken.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15110-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[alpha.franken.de:mid,alpha.franken.de:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C144F68E9E8

On Wed, Jun 10, 2026 at 03:01:22PM -0700, Ethan Nelson-Moore wrote:
> CMP support was removed in commit 7fb6f7b0af67 ("MIPS: Remove
> deprecated CONFIG_MIPS_CMP"), but a comment referring to it remained in
> arch/mips/mm/c-r4k.c. Remove it.
> 
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/mips/mm/c-r4k.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index 10413b6f6662..d8aadd3dc057 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -1757,11 +1757,6 @@ void r4k_cache_init(void)
>  	build_clear_page();
>  	build_copy_page();
>  
> -	/*
> -	 * We want to run CMP kernels on core with and without coherent
> -	 * caches. Therefore, do not use CONFIG_MIPS_CMP to decide whether
> -	 * or not to flush caches.
> -	 */
>  	local_r4k___flush_cache_all(NULL);
>  
>  	coherency_setup();
> -- 
> 2.43.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

