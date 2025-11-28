Return-Path: <linux-mips+bounces-12363-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E590C90E95
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 06:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A396C351BE3
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 05:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AE1285056;
	Fri, 28 Nov 2025 05:57:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E47F27F18B;
	Fri, 28 Nov 2025 05:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764309466; cv=none; b=ZZ13TR5BX9p0sH/nrHGA4/epEtPCbW13MaPLgiHYvd7BI1E3MWxvUD3hgKn+w2ZEjcelq/IAvjrqp9YYfCQCKAOM27FYUsj+9y355kj6v7MCYjcwMNbHMCOoM0PkCW5hOpYe5y3LXXeqXdESiTDSRbQvqKJwEJZqMx7/iMsn3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764309466; c=relaxed/simple;
	bh=bXC2Xou5X31Sw+vOtdnaWTTiv/A68bSNcR40lOk73k0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UMcZ9V3f8vJhrkMSr+rrZ+Kh7lqsVWS/U0wnC53HwyHUoBLZN9cji+ZDqtCz9zl58CDTrIo0MG76GFVf35zC0F5wUHZ6joPA8VT0CJnykAeVIN6UjnOm9ElOaDosOS11CVvEbacmjUhiITpGXSyUKkwtbzWbGVMmJfRdAfrHOko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F3CD492009C; Fri, 28 Nov 2025 06:57:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E505892009B;
	Fri, 28 Nov 2025 05:57:41 +0000 (GMT)
Date: Fri, 28 Nov 2025 05:57:41 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: mm: kmalloc tlb_vpn array to avoid stack
 overflow
In-Reply-To: <alpine.DEB.2.21.2511270406020.36486@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2511280554370.36486@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511270406020.36486@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Nov 2025, Maciej W. Rozycki wrote:

> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Owing to Config4.MMUSizeExt and VTLB/FTLB MMU features later MIPSr2+ 
> cores can have more than 64 TLB entries.  Therefore allocate an array 
> for uniquification instead of placing too small an array on the stack.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 9f048fa48740 ("MIPS: mm: Prevent a TLB shutdown on initial uniquification")
> Cc: stable@vger.kernel.org
> ---

 Please scrap this version.  I've sent v4 with tags updates as I didn't 
realise stable backports haven't been pushed yet.  So this will best be 
sorted with a cherry-pick tag meaning no regression in the stable trees 
except for the single place between the two consecutive commits.

  Maciej

