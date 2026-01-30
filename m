Return-Path: <linux-mips+bounces-13054-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Pi1K9vCfGmgOgIAu9opvQ
	(envelope-from <linux-mips+bounces-13054-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 15:40:27 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 698D4BBA8A
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 15:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E25073049EC8
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 14:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58DB34E75E;
	Fri, 30 Jan 2026 14:38:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAA732D0D8;
	Fri, 30 Jan 2026 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783903; cv=none; b=bHj7NTGa5ZfH2H56iZqZBAsycBKIVajDpYnyTk1hMfuiFjkZvZPhYa9l2p4sKcbd8mxXKikgFRAIcBFdNlq5AkZx8rUyfFcelyNt0CvOjy8YeTHwSdxDgZ+I4GjDxNeBhp5eRZTcYc53OdhkgNRR00Gt1ffW6LLyn6TvO3Q6w5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783903; c=relaxed/simple;
	bh=2tMmb1Coa4kTr6gZQ72agTZZJTOnqg7sJtNF1SmIMmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyqbdYWqdw/TU5avfCormmwCqZkXJ2ceCAq3BzhWIw5RlaxZTpSy9heor6xnE7JRqd3qw4rkuYUpSecNdBD2X8zWGLxirrcg1bmqkBmUVGFrYf6bCkLF+NV+/6BUpFDvtRb0/NABnuX0FhEe46KbRcrPwRHmNXr8Sfftgp2Z28U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vlpdb-0007Er-00; Fri, 30 Jan 2026 15:38:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EADF8C061A; Fri, 30 Jan 2026 15:34:29 +0100 (CET)
Date: Fri, 30 Jan 2026 15:34:29 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: LOONGSON32: drop a dangling Kconfig symbol
Message-ID: <aXzBdfjPC0patZd9@alpha.franken.de>
References: <20251228190443.2479978-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228190443.2479978-1-rdunlap@infradead.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[franken.de];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-13054-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alpha.franken.de:mid,franken.de:email,infradead.org:email]
X-Rspamd-Queue-Id: 698D4BBA8A
X-Rspamd-Action: no action

On Sun, Dec 28, 2025 at 11:04:43AM -0800, Randy Dunlap wrote:
> CPU_GAS_LOAD_STORE_LR is not used anywhere in the kernel sources,
> so drop it.
> 
> Fixes: 85c4354076ca ("MIPS: loongson32: Switch to generic core")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> 
>  arch/mips/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- linux-next-20251219.orig/arch/mips/Kconfig
> +++ linux-next-20251219/arch/mips/Kconfig
> @@ -1408,7 +1408,6 @@ config CPU_LOONGSON32
>  	select CPU_MIPS32
>  	select CPU_MIPSR2
>  	select CPU_HAS_PREFETCH
> -	select CPU_HAS_LOAD_STORE_LR
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select CPU_SUPPORTS_HIGHMEM
>  	select CPU_SUPPORTS_CPUFREQ

applied to mips-next with the typo fixed
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

