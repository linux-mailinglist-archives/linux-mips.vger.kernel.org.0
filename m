Return-Path: <linux-mips+bounces-7393-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31FA0A386
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 13:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A93F01886FDF
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 12:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1C519007D;
	Sat, 11 Jan 2025 12:18:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DD124B256;
	Sat, 11 Jan 2025 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736597919; cv=none; b=gTd3+PXq93IzWqRQXlg8rE58eglW/dpy1c8RFAgUoE9CS0EmHc4H3Pw3VPmx7EaIXxMpKzKKbG3tHqFnpfAND0qu9MO0KOacubTeZ12estm1h7219CRH8Mvy8Ru85mKmAmlhXdYs7/+6WIjFoEle1WSZRU7sZWV+Ag6pWSslcFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736597919; c=relaxed/simple;
	bh=UmWPSvVHGudK79ybSla34ZPn49vrlIQZLmbrAPk2ynI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxnJyjyUXdMHw74kwkDB+KQ5nC8t8Feq++xS18LreXiQ3Acf4eOol9bfO/809Sg4ePC1IPqprA6417K5aofCLUjBJvU7QbnsCasNBN90NTLkiYf3nGrEboeVp7N8aVOV5L1mVltOp8OxqMgveCZHz+Pm3AehSLDofRGQNop8eQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tWaRL-0006NQ-00; Sat, 11 Jan 2025 13:18:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 14000C06A4; Sat, 11 Jan 2025 13:02:02 +0100 (CET)
Date: Sat, 11 Jan 2025 13:02:02 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Huang Pei <huangpei@loongson.cn>,
	Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: traps: Use str_enabled_disabled() in
 parity_protection_init()
Message-ID: <Z4Jdum7jgDg7EzDa@alpha.franken.de>
References: <20250109215524.195008-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109215524.195008-2-thorsten.blum@linux.dev>

On Thu, Jan 09, 2025 at 10:55:23PM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> Use pr_info() instead of printk(KERN_INFO) to silence multiple
> checkpatch warnings.
> 
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/kernel/traps.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

