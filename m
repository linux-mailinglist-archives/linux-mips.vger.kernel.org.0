Return-Path: <linux-mips+bounces-12375-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97413C92C33
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 18:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D1323A4B08
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 17:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5F02D63F2;
	Fri, 28 Nov 2025 16:57:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5095C2D321D;
	Fri, 28 Nov 2025 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764349038; cv=none; b=UGM8sMc9GV4Fl9dVICiUCwM2HVyeiGqQin5C+ZVv7tTpZldvuR31C6rIX5KTT/QFlJFWC9JP/EoWCSs3r7IGDNmAsq85kXHVa0BHk/LxypVJf0ZQVb4jKKVU/9WW/bMzE1mTa0Df82RDmysq9hWEJGOCdg3PnJzTM8CLLuoAqSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764349038; c=relaxed/simple;
	bh=jnZVq9sGrIilsTPvHTBXxJSBuWPu8cZU9jS21xCxuNE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qW+lb/YRnN39dpImwfH3apMRSrLJ6XLYdJsLxfSXPtr5yXJBY0/5I3op7mhtHdj5mC4PMxIQEUrNAZq4RDbUt6bKXGdLOugOfO8uaWaFjpszv6/jtQO/Nhh+aNjXnEa4PZHS57MCIQxNZIMuu0MoaTcL4y8LfM0Ky9uI90M1PHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D4E5492009C; Fri, 28 Nov 2025 17:57:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id CFC6F92009B;
	Fri, 28 Nov 2025 16:57:14 +0000 (GMT)
Date: Fri, 28 Nov 2025 16:57:14 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Klara Modin <klarasmodin@gmail.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: mm: kmalloc tlb_vpn array to avoid stack
 overflow
In-Reply-To: <6sfwzx2nryk22qjfdjocnail3sxdl7srxq6kyzv6fb3eswvkaq@r3fdeunuytrl>
Message-ID: <alpine.DEB.2.21.2511281656510.36486@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511280544050.36486@angie.orcam.me.uk> <6sfwzx2nryk22qjfdjocnail3sxdl7srxq6kyzv6fb3eswvkaq@r3fdeunuytrl>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Nov 2025, Klara Modin wrote:

> > Owing to Config4.MMUSizeExt and VTLB/FTLB MMU features later MIPSr2+ 
> > cores can have more than 64 TLB entries.  Therefore allocate an array 
> > for uniquification instead of placing too small an array on the stack.
> > 
> > Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> > Co-developed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> > Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: stable@vger.kernel.org # v6.17+: 9f048fa48740: MIPS: mm: Prevent a TLB shutdown on initial uniquification
> > Cc: stable@vger.kernel.org # v6.17+
> 
> This fixes a boot failure on my Edgerouter 6P (Cavium Octeon III).

 Thank you for verification.

  Maciej

