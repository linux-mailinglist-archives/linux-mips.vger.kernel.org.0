Return-Path: <linux-mips+bounces-8798-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6FFA9E128
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EF1C1A829B1
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E010245006;
	Sun, 27 Apr 2025 08:48:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34622367CE;
	Sun, 27 Apr 2025 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743714; cv=none; b=Pv+E4fsakENSDuGwj3QFmL0Pn24IcCm+k+PBIdg0honeUz0dxRHuZ2BCDY7vcbZkJvgg/6/y6+IUGIVGGwVR8bMe2bcufm4fghwv792g3ziVqHanStnTFVy2Vx4tfaj4ubSxKJ34qcrcxuV2o7qBmHJ0ZxwfDmzDtDqLNXzOBr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743714; c=relaxed/simple;
	bh=gOu7wvGasAAJsNqfTmva3ihx1xGo8COx25Vwcxlk800=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzoZyr6CbicZxG5xJcaFZHwaODRlBmqFt6zy435PnmoZxgtHPvk7DMN8Le4Kv8YAxWnXScpUQDehfC4iVc4+Q0TFsZ5giVtu6CbWtSojdc5kfeEtVnAiUdJmlNPRsbK44PC1tzucOg92sG6aGF/zoVft6Ie6A3STE/DY8YqRNio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8wsd-0007Ke-00; Sun, 27 Apr 2025 09:56:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 96D69C0895; Sun, 27 Apr 2025 09:12:49 +0200 (CEST)
Date: Sun, 27 Apr 2025 09:12:49 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length
 struct member
Message-ID: <aA3Y8UDmeqJPnA3C@alpha.franken.de>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de>
 <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
 <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
 <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
 <alpine.DEB.2.21.2504181337350.18253@angie.orcam.me.uk>
 <B71034AC-B0FC-4C5F-8562-661D6AD11056@linux.dev>
 <alpine.DEB.2.21.2504181608420.18253@angie.orcam.me.uk>
 <9F6CA7CB-B36A-4F79-B78C-7ED63E39260D@linux.dev>
 <A08BC566-5F6D-4FA5-B315-34D2FCA55A6E@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A08BC566-5F6D-4FA5-B315-34D2FCA55A6E@linux.dev>

On Fri, Apr 18, 2025 at 10:21:22PM +0200, Thorsten Blum wrote:
> On 18. Apr 2025, at 22:18, Thorsten Blum wrote:
> > On 18. Apr 2025, at 17:14, Maciej W. Rozycki wrote:
> >> On Fri, 18 Apr 2025, Thorsten Blum wrote:
> >>>>> Does regs_get_register() even work for CPU_CAVIUM_OCTEON when accessing
> >>>>> the last two registers because they're both ULL, not UL? (independent of
> >>>>> my patch)
> >>>> 
> >>>> Or rather two arrays of registers.  With 32-bit configurations their 
> >>>> contents have to be retrieved by pieces.  I don't know if it's handled by 
> >>>> the caller(s) though as I'm not familiar with this interface.
> >>> 
> >>> Ah, CPU_CAVIUM_OCTEON seems to be 64-bit only, so there's no difference
> >>> between UL and ULL. Then both my patch and your suggestion:
> >> 
> >> So it seems odd to use `long long int' here, but I can't be bothered to 
> >> check history.  There could be a valid reason or it could be just sloppy 
> >> coding.
> >> 
> >>> I still prefer my approach without '__last[0]' because it also silences
> >>> the following false-positive Coccinelle warning, which is how I stumbled
> >>> upon this in the first place:
> >>> 
> >>> ./ptrace.h:51:15-21: WARNING use flexible-array member instead
> >> 
> >> So make `__last' a flexible array instead?  With a separate patch.
> > 
> > No, '__last[0]' is a fake flexible array and the Coccinelle warning is
> > wrong. We should either ignore the warning or silence it by removing the
> > marker, but turning it into a real flexible array doesn't make sense.
> > I'd prefer to just remove it from the struct.
> > 
> > Stefan or Oleg, do you have any preference?
> 
> Sorry, I meant Thomas, not Stefan.

I don't like the #ifdefery, so please keep __last

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

