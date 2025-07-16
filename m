Return-Path: <linux-mips+bounces-9841-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04273B07CBA
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 20:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55C0E174DD1
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 18:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBFE2BD038;
	Wed, 16 Jul 2025 18:21:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1163829E0F2;
	Wed, 16 Jul 2025 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690113; cv=none; b=ptB6aLMk09zqp8LwOTGLMbg8SOyw1FkpYCc9qeisv5j1zdgsdljDTMax8s0dg5GPLiqOtZXNtsgaqH8hRx1SQbFXKX44iKex/Ii1EUB5vivx/z9zULO+QVRH2nTysNoe9hWdMfkESODCz26CKTSM+Eq+cBBP/5y4mc6kORK97Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690113; c=relaxed/simple;
	bh=Pu+bzorDPjOZ+A8Rzw4I29bbTRHuIWu0zxXuR2zx1Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dS2Yscw5YL3m6x8O7Dutpe6qlMmTnyij3AHvcDwDZGZZSKOjEhx1NLKAEGqIsTG8xc7IPfXfoHE/7yznnfm+rrIQ9OQdqcw8RCA1rpWLbmLF8nE0nTlPICruRu8eWhh9oppolMPKpZ2nWGMUXZLn+SvCKGJ7gPWiLszVnIu856w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uc6ZW-0006DL-00; Wed, 16 Jul 2025 20:09:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B244AC0176; Wed, 16 Jul 2025 20:04:35 +0200 (CEST)
Date: Wed, 16 Jul 2025 20:04:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2] MIPS: mm: tlb-r4k: Uniquify TLB entries on init
Message-ID: <aHfpszi6l_YRSOjY@alpha.franken.de>
References: <20250607-tlb-fix-v2-1-6751eccd86f1@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-tlb-fix-v2-1-6751eccd86f1@flygoat.com>

On Sat, Jun 07, 2025 at 01:43:56PM +0100, Jiaxun Yang wrote:
> Hardware or bootloader will initialize TLB entries to any value, which
> may collide with kernel's UNIQUE_ENTRYHI value. On MIPS microAptiv/M5150
> family of cores this will trigger machine check exception and cause boot
> failure. On M5150 simulation this could happen 7 times out of 1000 boots.
> 
> Replace local_flush_tlb_all() with r4k_tlb_uniquify() which probes each
> TLB ENTRIHI unique value for collisions before it's written, and in case
> of collision try a different ASID.
> 
> Cc: stable@kernel.org
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Cycle ASID instead of ENTRYHI index in case of collison.
> - Avoid int over flow UB (Maciej)
> - Link to v1: https://lore.kernel.org/r/20250605-tlb-fix-v1-1-4af496f17b2f@flygoat.com
> ---
>  arch/mips/mm/tlb-r4k.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

