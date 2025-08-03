Return-Path: <linux-mips+bounces-9984-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 941ECB196E1
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 01:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B27EB17330B
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 23:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855532153EA;
	Sun,  3 Aug 2025 23:59:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DB32E36E7
	for <linux-mips@vger.kernel.org>; Sun,  3 Aug 2025 23:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754265577; cv=none; b=fYcDRpYZMibqS9JAEin70pp9Xz7zhS9hZNWzLXtdDSbjFdI9zKFpPifStvuWwK+W5XdBRtVxLk/JZEbcUDnET6Xbkli6bF2O+zi8eHtv7Ep9EEjmQvHrt5RRDJZamSzOq5as637vib3vDNJjMZ8NqC9j5Dxdq5VYvjpmUvneYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754265577; c=relaxed/simple;
	bh=lOKLnSuSFFgjOF+OFt4kc9iF3l7t0PUBrmBkrM2BAlc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s8ICbQ+w5QOY2GF/3qb0+zHIrAJbsmOeDzstC9QHMj95w4z77o10YUmEwmhmfBk8i+nZ6bfFKZ+iAmX7V/nTmT//AVDIO/ny8NBpwIUVHH4/gbdBCvPrYjOwiDsqcgQLN9tzbfJf4UofB3g5RBuZSkYIkhH7rYrvVvqtG3Sv/Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C8EC892009C; Mon,  4 Aug 2025 01:59:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BA0FA92009B;
	Mon,  4 Aug 2025 00:59:26 +0100 (BST)
Date: Mon, 4 Aug 2025 00:59:26 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Huth <thuth@redhat.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v2] mips: Replace __ASSEMBLY__ with __ASSEMBLER__ in the
 mips headers
In-Reply-To: <20250611090544.90032-1-thuth@redhat.com>
Message-ID: <alpine.DEB.2.21.2508040010580.5060@angie.orcam.me.uk>
References: <20250611090544.90032-1-thuth@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Jun 2025, Thomas Huth wrote:

> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembler code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.

 It could be worth noting that our arrangement for the __ASSEMBLY__ macro 
obviously predates GCC's predefinition (which was only added back in 2000 
with GCC commit f8f769ea4e69, 9 years into the existence of Linux, which 
ultimately landed as GCC 3.0 release) and the whole existence of Clang.  
So the choice was perfectly fine back when it was originally made.

> This is bad since macros starting with two underscores are names
> that are reserved by the C language.

 I think it's correct usage given that we're the C language environment 
here, just as any C library is.  Such names are not to be used by user 
programs and we're not one.

> It can also be very confusing
> for the developers when switching between userspace and kernelspace
> coding, or when dealing with uapi headers that rather should use
> __ASSEMBLER__  instead. So let's now standardize on the __ASSEMBLER__
> macro that is provided by the compilers.

 I think it's the right choice in 2025 (and would have been a few years 
earlier, for a liberal definition of "few", when we switched away from 
supporting GCC 2.95.x), so:

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

for the code updates, but I think the description could have been more 
focused on how the old choice has become no longer the best one as the 
compiler evolved.

 Would you mind factoring in the observations made here?

  Maciej

