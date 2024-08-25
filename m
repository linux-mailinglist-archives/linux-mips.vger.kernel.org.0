Return-Path: <linux-mips+bounces-5079-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA56195E501
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 21:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E58C31C20B74
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 19:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD634D5BD;
	Sun, 25 Aug 2024 19:59:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533482D60C;
	Sun, 25 Aug 2024 19:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724615972; cv=none; b=MIe/mZrf9wnecrPo5x8fA0eatLzfUkdwE4CZgfXxeGiGHLHFv/c2lm+x0Y2vseVA6KS5pYb3stlAlqXEXUhIVXw6hAKWwxUJwMBqLNaD/8wniSHjLFpkpeTy7TyNVeqk7A4FkQ/LNR4fLPu0xVXTODC7k26N30vvNvE9Dq09c4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724615972; c=relaxed/simple;
	bh=7UvtJGXz1Z0iqRfP2rYSC2gk7UTy3rzJ637c4MAwhgw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iPaujO4H6cb8DImJSxBPjvYp90MYndhS1nuUWna5gMewb50wgr4Sbu9UvPplHOMbLdVeH3dsWWqG96QJP5PTUi7LT1vC6G63H54jBT8Yj0iaErFB6TnFUZj22Ghobv3SpmcEQqkq1SwqA6gVxznX6h6IFk+g8gQLCdBpXPIDIAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F300692009C; Sun, 25 Aug 2024 21:59:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E4D4B92009B;
	Sun, 25 Aug 2024 20:59:26 +0100 (BST)
Date: Sun, 25 Aug 2024 20:59:26 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org, 
    "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
In-Reply-To: <87jzg4y57g.fsf@miraculix.mork.no>
Message-ID: <alpine.DEB.2.21.2408252029130.30766@angie.orcam.me.uk>
References: <20240824144133.1464835-1-bjorn@mork.no> <7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com> <87o75gy85b.fsf@miraculix.mork.no> <alpine.DEB.2.21.2408251612500.30766@angie.orcam.me.uk> <87jzg4y57g.fsf@miraculix.mork.no>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 25 Aug 2024, Bjørn Mork wrote:

> >  U-Boot isn't the only firmware used with MIPS systems, and in fact it's 
> > quite a recent addition; e.g. DEC REX and SGI ARCS firmware goes back at 
> > least to 1990 and we continue supporting these systems.  There's also CFE, 
> > PMON, YAMON, etc.
> 
> I know.  That's what I'm trying to make us support :-)
> 
> We can't blindly assume that all those firmwares implement the exact
> same command line and environment protocol as U-Boot.  Yamon obviously
> uses something similar enough.  But what about the others?

 I can see `fw_init_cmdline' is only used for a handful of newer platforms 
and other ones handle it differently (e.g. arch/mips/dec/prom/cmdline.c).  
Even those that do use the function have a choice to override the default 
handler by setting CONFIG_HAVE_PLAT_FW_INIT_CMDLINE.  Perhaps it's what 
you need to do for your platform too.

 Also lots of MIPS platforms have used `prom_getenv' since long before 
`fw_getenv' and arch/mips/fw/lib/cmdline.c have been added and I have no 
idea why a competing interface was let in back in 2013 with disregard to 
the existing infrastructure.  There is `cfe_getenv' for CFE platforms too. 

 It's clear to me that this mess has to be cleaned up.  Not all kinds of 
firmware permit the setting of arbitrary environment variables (or ones 
that survive a reboot) though.

  Maciej

