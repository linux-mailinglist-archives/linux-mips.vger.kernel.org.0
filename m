Return-Path: <linux-mips+bounces-12172-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E50E3C49637
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 22:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81FB14E7DF4
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 21:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9511314B8B;
	Mon, 10 Nov 2025 21:20:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064362FC865;
	Mon, 10 Nov 2025 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762809645; cv=none; b=e5l9PMs1NuSvE6OdKYEqo2piyg7I9vY2tZ23kiIBoJWlxcsYGZMYaWsdRgPh3r01gug7Im0t7bPfg3SKSXKUTjVz/a8M8us3hxF5E7nJaxpIOkVGsKUY40UsHKFrtnQKNX+nUNuCoIm8BDaM+6zwDcFtnfYNQQs/NV4QgPRpMK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762809645; c=relaxed/simple;
	bh=SIB82DYGsoDdXbGRdYYJPu5MrdH6oNGIZB+RopftBNs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gYx+75R0UcMpG3+Yn5wtJb/nes5uC0az//CHnj4pM4YSPhFuKnrfdXGihf9f7odoFKwHHW09En67IYfP5AkRGVd/0kqc2GR6QRPvCZlr0hAFv3DxCxd3yz1sXRUbVz92t/dFTS46lyWlFWUmXP0SZ6hPXa7jOt6v0OJSwExZgtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7AAE592009C; Mon, 10 Nov 2025 22:20:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 773B592009B;
	Mon, 10 Nov 2025 21:20:30 +0000 (GMT)
Date: Mon, 10 Nov 2025 21:20:30 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Only uniquify on CPU cores where it's needed
In-Reply-To: <20251110194754.47626-1-tsbogend@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2511102053470.25436@angie.orcam.me.uk>
References: <20251110194754.47626-1-tsbogend@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Nov 2025, Thomas Bogendoerfer wrote:

> Commit 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> switches initial TLB flushing to a mode needed for microAptiv/M5150
> cores.  This breaks (at least) R4x00 cores if the tlb probe hits
> multiple matching TLB entries (SGI IP22 prom for examples sets up all
> TLBs to the same virtual address). Use the new TLB flushing only on
> M5150 and local_tlb_flush_all() for everything else.

 This surely isn't enough.  Even the plain old 4Kc core will trigger an 
MCheck under the same condition.  The fix surely has to be more general.  

 Perhaps we should take the simplest approach: read all the TLB entries 
with TLBR, sort them by their VPN value and deduplicate to be able to 
search for a match quickly, assign and write temporary VPN values outside 
our unique range avoiding a clash with any of the values obtained, and 
then finally call local_tlb_flush_all().

 This will require some memory and the computational complexity may exceed 
O(n), but our TLBs are small with their size architecturally limited to 64 
entries, so it's not a big deal in reality and this code will only execute 
once at boot.

  Maciej

