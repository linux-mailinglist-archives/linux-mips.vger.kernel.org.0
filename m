Return-Path: <linux-mips+bounces-14094-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GQ9Hl712GlJkAgAu9opvQ
	(envelope-from <linux-mips+bounces-14094-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2026 15:04:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E765D3D7D6B
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2026 15:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A121D30073F2
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2026 13:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33C73033DE;
	Fri, 10 Apr 2026 13:04:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C167B2DB7BA;
	Fri, 10 Apr 2026 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826251; cv=none; b=KFQ7BQvnmEKoMhOQrEOHXQp5B5gAKmqrXLx7NIO7iIyscEwiw+R+L2Wwsf+vueUVRrUFF5771To2aFRP+CKbZ5eTSgvT0ym2YsNqScUnP9Is+VYG5Z0zNs16ZNiUFy5CYy6XKepURc2Lvo/IVzX7cwXXtTB9s/16g5olHqX4Co4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826251; c=relaxed/simple;
	bh=PbnntAAMvuuRgvWjuwg06lvgioPBxUoLQWZafRPpE6A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qlRidxCHWZ/fSZmS7Fc39dBLSkVYJ5LD4pGsqL1UfOmSekVpm7qrOa1dF5Knz4jivbHkxT0qkP+5K2g13KBVcMRd5y6wIJHRlUhwPMO/fVyslIgEko0/e+kSTjFEkWcKW79H2hEx6wXukDKWBqo6a7erccO3HvvKPz1KiEykJWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id A4CFA92009C; Fri, 10 Apr 2026 15:04:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9EA8692009B;
	Fri, 10 Apr 2026 14:04:06 +0100 (BST)
Date: Fri, 10 Apr 2026 14:04:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Stefan Wiehler <stefan.wiehler@nokia.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mips: mm: Call rcutree_report_cpu_starting() even
 earlier
In-Reply-To: <20260409164846.3176046-2-stefan.wiehler@nokia.com>
Message-ID: <alpine.DEB.2.21.2604101353010.29980@angie.orcam.me.uk>
References: <20260409164846.3176046-2-stefan.wiehler@nokia.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14094-lists,linux-mips=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: E765D3D7D6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026, Stefan Wiehler wrote:

> rcutree_report_cpu_starting() must be called on secondary CPUs before
> allocating memory to avoid the following Lockdep-RCU splat when
> CONFIG_PROVE_RCU_LIST=y:
> 
>   WARNING: suspicious RCU usage
>   6.6.119-00d46e15c416-fct #1 Not tainted
>   -----------------------------
>   /kernel/locking/lockdep.c:3762 RCU-list traversed in non-reader section!!

 I have tried to verify your change here, but the warning does not trigger 
with 6.19 as released and CONFIG_SIBYTE_SWARM as the platform (2-way SMP).  

$ grep CONFIG_PROVE_RCU_LIST .config
CONFIG_PROVE_RCU_LIST=y
$ 

Am I missing anything here, anything extra to enable?

> See also commit 55702ec9603e ("mips/smp: Call
> rcutree_report_cpu_starting() earlier").
> 
> Fixes: 231ac951faba ("MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow")

 This does not appear to be a valid commit hash upstream; this is commit 
841ecc979b18 AFAICS.

> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 4868e79f3b30..bdb47c70d4f5 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -359,8 +359,8 @@ asmlinkage void start_secondary(void)
>  	unsigned int cpu = raw_smp_processor_id();
>  
>  	cpu_probe();
> -	per_cpu_trap_init(false);
>  	rcutree_report_cpu_starting(cpu);
> +	per_cpu_trap_init(false);
>  	mips_clockevent_init();
>  	mp_ops->init_secondary();
>  	cpu_report();

 As I noted in my previous message: is there any reason for cpu_probe() to 
precede this call?

  Maciej

