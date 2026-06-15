Return-Path: <linux-mips+bounces-15079-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xL5II3vXL2ohHwUAu9opvQ
	(envelope-from <linux-mips+bounces-15079-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:44:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84A6856A5
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:44:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15079-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15079-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C75373004D8D
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 10:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEBC33BBD0;
	Mon, 15 Jun 2026 10:43:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F2833BBA2;
	Mon, 15 Jun 2026 10:43:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520238; cv=none; b=BtpcSnJxhqYbvKAChKGXU3E2iMKGBwpgwgmAdh6mx7LRf/7uXupXJIZXmA3dxNRfxl7iP1Jy7bpOhV7TN73HBt0vfuBwHa03tgfoaPF0IOu/0TIw00+DPvUDIHGdaUaxbrdl8omXjWdcTujpQz44LWGV0Q6EvRA3q2Bus5FIhCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520238; c=relaxed/simple;
	bh=og9kT3MhgU+ySTX3EJC8pVUZ3MbMvTJo6EbrPV+vAGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfA8YNdKs+HJrcJIxuCCK6ARGTFYcq5VVHNabRoZlyZ/37FhGAW0BhMqGEmKmQPQmpAPjb766gY9TcKnBisNOCjJFAdQGDlSH3QimvjD5aAG+g5lTlpsg1gpL6N7DAqkT8jSZV61dgltWyTQzVYYrRtB1vB137EGGvzmnFckMGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000JR-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0A18BC0562; Mon, 15 Jun 2026 12:27:38 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:27:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: lib: Remove '.hidden' for local symbols
Message-ID: <ai_Tmi-nlNNebn4o@alpha.franken.de>
References: <20260608-mips-fix-binutils-visibility-warning-v1-1-3c809cfb5a9d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-mips-fix-binutils-visibility-warning-v1-1-3c809cfb5a9d@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15079-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,alpha.franken.de:mid,alpha.franken.de:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C84A6856A5

On Mon, Jun 08, 2026 at 08:36:25PM -0700, Nathan Chancellor wrote:
> After a recent change in binutils that warns when local symbols have
> non-default visibility [1], there are a couple instances when building
> arch/mips:
> 
>   Assembler messages:
>   {standard input}: Warning: local symbol `__memset' has non-default visibility
>   Assembler messages:
>   {standard input}: Warning: local symbol `__memcpy' has non-default visibility
> 
> Remove the '.hidden' directives for these symbols to clear up the
> warnings, as they are pointless with a local symbol, which is by
> definition hidden. This results in no changes to these symbols in nm's
> output when assembled with various copies of binutils.
> 
> Closes: https://lore.kernel.org/20260509122517.GA1108596@ax162/
> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c4150acbda1b3ce0602f79cbb7700b39e577be7e [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/mips/lib/memcpy.S | 2 --
>  arch/mips/lib/memset.S | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
> index a4b4e805ff13..84f85aba6f4b 100644
> --- a/arch/mips/lib/memcpy.S
> +++ b/arch/mips/lib/memcpy.S
> @@ -274,7 +274,6 @@
>  	/* initialize __memcpy if this the first time we execute this macro */
>  	.ifnotdef __memcpy
>  	.set __memcpy, 1
> -	.hidden __memcpy /* make sure it does not leak */
>  	.endif
>  
>  	/*
> @@ -538,7 +537,6 @@
>  	.if __memcpy == 1
>  	END(memcpy)
>  	.set __memcpy, 0
> -	.hidden __memcpy
>  	.endif
>  
>  .Ll_exc_copy\@:
> diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
> index 79405c32cc85..ab087406da66 100644
> --- a/arch/mips/lib/memset.S
> +++ b/arch/mips/lib/memset.S
> @@ -89,7 +89,6 @@
>  	/* Initialize __memset if this is the first time we call this macro */
>  	.ifnotdef __memset
>  	.set __memset, 1
> -	.hidden __memset /* Make sure it does not leak */
>  	.endif
>  
>  	sltiu		t0, a2, STORSIZE	/* very small region? */
> @@ -231,7 +230,6 @@
>  	.if __memset == 1
>  	END(memset)
>  	.set __memset, 0
> -	.hidden __memset
>  	.endif
>  
>  #ifdef CONFIG_CPU_NO_LOAD_STORE_LR
> 
> ---
> base-commit: 6d96cc123ce33cd74e799c5434440393ed022bb7
> change-id: 20260608-mips-fix-binutils-visibility-warning-71e531e65f78

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

