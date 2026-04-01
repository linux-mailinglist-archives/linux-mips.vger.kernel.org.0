Return-Path: <linux-mips+bounces-14008-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH/3F3OBzWmaeQYAu9opvQ
	(envelope-from <linux-mips+bounces-14008-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 22:34:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B56623803C3
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 22:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A44330421D6
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2026 20:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F84E3603E8;
	Wed,  1 Apr 2026 20:30:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C62A2E9EB5;
	Wed,  1 Apr 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075457; cv=none; b=WnQYHrHprMVgef+dUgcgp4rSY0NdAAGVJqMBDpYPgABkaEVfpOUHcPM7kAdwBboejaxiIqQehSj/CMZXpsUeW4LWOKS0rKfYccYmgJsNdjerIOdVpXsdojjCw0A6UW5vt2QYRPFPgW/IwCGOFWddfo3kSF8vS8Y/f90lvNDmoOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075457; c=relaxed/simple;
	bh=BA8mLCtOUTHR9GqLN4jpWLP5fOE9T597gH67G1tJ3m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3mLErHKyZJFvKZBr5Z4abVr8qCkz9GVe8h5yHmGJxBQrAmwrIz3d338fzQpJ6CLj9hSJ22G5EIYsMZgr8feFlS7ZsEOFW0GVpgX7Mt4NLhpxDxXsynogPv+W3gcfoS0QOMziTg7PxjxbeJXPFH+bAJGqaTjdYB4U1tc6kceQbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w82D7-0008H5-00; Wed, 01 Apr 2026 22:30:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E2BABC0256; Wed,  1 Apr 2026 22:27:43 +0200 (CEST)
Date: Wed, 1 Apr 2026 22:27:43 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mips: mm: Allocate tlb_vpn array atomically
Message-ID: <ac1_v3KMngpw-FDB@alpha.franken.de>
References: <20260310104024.3554197-1-stefan.wiehler@nokia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310104024.3554197-1-stefan.wiehler@nokia.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14008-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alpha.franken.de:mid]
X-Rspamd-Queue-Id: B56623803C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 11:40:24AM +0100, Stefan Wiehler wrote:
> Found by DEBUG_ATOMIC_SLEEP:
> 
>   BUG: sleeping function called from invalid context at /include/linux/sched/mm.h:306
>   in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
>   preempt_count: 1, expected: 0
>   RCU nest depth: 0, expected: 0
>   no locks held by swapper/1/0.
>   irq event stamp: 0
>   hardirqs last  enabled at (0): [<0000000000000000>] 0x0
>   hardirqs last disabled at (0): [<ffffffff801477fc>] copy_process+0x75c/0x1b68
>   softirqs last  enabled at (0): [<ffffffff801477fc>] copy_process+0x75c/0x1b68
>   softirqs last disabled at (0): [<0000000000000000>] 0x0
>   CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.119-d79e757675ec-fct #1
>   Stack : 800000000290bad8 0000000000000000 0000000000000008 800000000290bae8
>           800000000290bae8 800000000290bc78 0000000000000000 0000000000000000
>           ffffffff80c80000 0000000000000001 ffffffff80d8dee8 ffffffff810d09c0
>           784bb2a7ec10647d 0000000000000010 ffffffff80a6fd60 8000000001d8a9c0
>           0000000000000000 0000000000000000 ffffffff80d90000 0000000000000000
>           ffffffff80c9e0e8 0000000007ffffff 0000000000000cc0 0000000000000400
>           ffffffffffffffff 0000000000000001 0000000000000002 ffffffffc0149ed8
>           fffffffffffffffe 8000000002908000 800000000290bae0 ffffffff80a81b74
>           ffffffff80129fb0 0000000000000000 0000000000000000 0000000000000000
>           0000000000000000 0000000000000000 ffffffff80129fd0 0000000000000000
>           ...
>   Call Trace:
>   [<ffffffff80129fd0>] show_stack+0x60/0x158
>   [<ffffffff80a7f894>] dump_stack_lvl+0x88/0xbc
>   [<ffffffff8018d3c8>] __might_resched+0x268/0x288
>   [<ffffffff803648b0>] __kmem_cache_alloc_node+0x2e0/0x330
>   [<ffffffff80302788>] __kmalloc+0x58/0xd0
>   [<ffffffff80a81b74>] r4k_tlb_uniquify+0x7c/0x428
>   [<ffffffff80143e8c>] tlb_init+0x7c/0x110
>   [<ffffffff8012bdb4>] per_cpu_trap_init+0x16c/0x1d0
>   [<ffffffff80133258>] start_secondary+0x28/0x128
> 
> Fixes: 231ac951faba ("MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow")
> Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/mips/mm/tlb-r4k.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

