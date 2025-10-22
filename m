Return-Path: <linux-mips+bounces-11851-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B694BFBEB2
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 14:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AB1642529F
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 12:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC8F346794;
	Wed, 22 Oct 2025 12:48:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7DD345CA7;
	Wed, 22 Oct 2025 12:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761137316; cv=none; b=Sq5gvc0uZbTIO0H5FYKP2oSutGHpgld0v9jf14WxOQdAgnzlkIJeFSUeK3o6nbfe98RZC5kLJ9J6MPH7HzfyuZe0joignR1cMU6NXXgreLOrilvqwvGh2mcAPPscrFIuHdjck/74IWM12KOFhOPUlxzdDTmDoks3xmXWDqiTEOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761137316; c=relaxed/simple;
	bh=Du6+bACueBTMbAJYpDSAeyHV0DdH/Zh0dyW7RusifTU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EOg21krjoGslYPXjeWsLlu3NBs7RWweSw2UNgWwwrB3hRLCgCxYA0I8rciMVPw5cb/85xg4G2FwfzvUFbY0rroExZlUx3+cGOJFdk8vKitcRnmeSy3GdTyC1GNjoD/JuNIcfuCOX5P8mHR3b9D15RoXdlZCH7tBdZZ4FU8mTO2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CD62692009C; Wed, 22 Oct 2025 14:48:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C8F3692009B;
	Wed, 22 Oct 2025 13:48:06 +0100 (BST)
Date: Wed, 22 Oct 2025 13:48:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jonas Gorski <jonas.gorski@gmail.com>
cc: Bjorn Helgaas <helgaas@kernel.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Malta: Fix PCI southbridge legacy resource
 reservations
In-Reply-To: <CAOiHx=kHzx=Q_j+BM6jse7jwjzrXtiUoXpzLLgXVRzQhb38r+A@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2510221344310.8377@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk> <alpine.DEB.2.21.2510212001250.8377@angie.orcam.me.uk> <CAOiHx=kHzx=Q_j+BM6jse7jwjzrXtiUoXpzLLgXVRzQhb38r+A@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Oct 2025, Jonas Gorski wrote:

> > Index: linux-macro/arch/mips/mti-malta/malta-setup.c
> > ===================================================================
> > --- linux-macro.orig/arch/mips/mti-malta/malta-setup.c
> > +++ linux-macro/arch/mips/mti-malta/malta-setup.c
> > @@ -213,7 +213,7 @@ void __init plat_mem_setup(void)
> >
> >         /* Request I/O space for devices used on the Malta board. */
> 
> This comment doesn't match the code anymore.

 Thank you for your input.  How do you propose to reword the comment then?  
The resources are still claimed, it's only the way that has changed.  Is 
s/Request/Claim/ what you're after?

  Maciej

