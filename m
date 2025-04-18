Return-Path: <linux-mips+bounces-8658-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4020A93968
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 17:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 199F88E3AC0
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 15:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E24214204;
	Fri, 18 Apr 2025 15:14:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63CD213E79;
	Fri, 18 Apr 2025 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989262; cv=none; b=IFWzznod9ySX/1IwzWN0pODDxhJItgZ1CvWOVHmp6HoXMy6vdEPEaRuqiEH5cFCOo2Lnw3Kr5Q3H1ta3xR5Z2QSGT7XhIFLoAWgkECk92PqW0XpxYZ0/6ThLv4S9XiOdz46k22EEkUFIRHRHiDnqbx4EElDfqN1NYGjO7G8cN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989262; c=relaxed/simple;
	bh=Gmw8WOxvteG9MBmpBQtIsvJ+QkWTDsabCK4qUrDdgeQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AW/BjLXnhypiwR7qCCu7y9pNWqy72aOmoWL4ssdC2jNbolOIoMo/D3GGtVC1MfkqRzqHxl0Tf3CJTvnQnHlUuida8SgQONJ0ThOV9ePvn11rf66JPDqYwSz4DA36Q7YTnzsH1nFsMm9rt5J+yOIAGGsG1cLK3mH49f1BBHDIP80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B809992009C; Fri, 18 Apr 2025 17:14:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B05D392009B;
	Fri, 18 Apr 2025 16:14:16 +0100 (BST)
Date: Fri, 18 Apr 2025 16:14:16 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length struct
 member
In-Reply-To: <B71034AC-B0FC-4C5F-8562-661D6AD11056@linux.dev>
Message-ID: <alpine.DEB.2.21.2504181608420.18253@angie.orcam.me.uk>
References: <20250417174712.69292-2-thorsten.blum@linux.dev> <aAIF_kEFlOOVNDaE@alpha.franken.de> <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev> <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk> <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
 <alpine.DEB.2.21.2504181337350.18253@angie.orcam.me.uk> <B71034AC-B0FC-4C5F-8562-661D6AD11056@linux.dev>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Apr 2025, Thorsten Blum wrote:

> >> Does regs_get_register() even work for CPU_CAVIUM_OCTEON when accessing
> >> the last two registers because they're both ULL, not UL? (independent of
> >> my patch)
> > 
> > Or rather two arrays of registers.  With 32-bit configurations their 
> > contents have to be retrieved by pieces.  I don't know if it's handled by 
> > the caller(s) though as I'm not familiar with this interface.
> 
> Ah, CPU_CAVIUM_OCTEON seems to be 64-bit only, so there's no difference
> between UL and ULL. Then both my patch and your suggestion:

 So it seems odd to use `long long int' here, but I can't be bothered to 
check history.  There could be a valid reason or it could be just sloppy 
coding.

> I still prefer my approach without '__last[0]' because it also silences
> the following false-positive Coccinelle warning, which is how I stumbled
> upon this in the first place:
> 
>   ./ptrace.h:51:15-21: WARNING use flexible-array member instead

 So make `__last' a flexible array instead?  With a separate patch.

> Would it make sense to also change the register arrays 'mpl' and 'mtp'
> from ULL to UL? ULL seems unnecessarily confusing to me.

 Maybe, but I'm not familiar enough with the Cavium Octeon platform to 
decide offhand and I won't dive into it, sorry.

  Maciej

