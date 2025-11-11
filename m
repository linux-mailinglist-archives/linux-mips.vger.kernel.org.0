Return-Path: <linux-mips+bounces-12175-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D800C4BAC7
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 07:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CE531890992
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 06:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252E52D3A9E;
	Tue, 11 Nov 2025 06:27:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32DB2D0C7B;
	Tue, 11 Nov 2025 06:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762842420; cv=none; b=QpoSVlGltPCW7rjbYIpDiEjkntJcCxEYrNS1r9HuYzfq7ZQGMWM56dKnKwr/syMzgA6xag8sZaUCFdz16Ne0BpfSzJ0DBy83JsjaslTMtEzOgB4//0Y5ceCeZJb7D8BHPT868vgM30fpG7atU22ehf+WIyl/ObI2bhNejt2PSm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762842420; c=relaxed/simple;
	bh=XRUagSvNgZxCQO/oy0th9IBAIikARg0qk25G/hM+vnk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D82u4lBln7/UpA6D8thSYSpwEw685TvvOruUqfvjzFRY7ks4F73dSy2vvDIGTCfTO1xKoBkOzavqpQN4LWRCt1mTwZkmiJWUhRb22/2JC/5qxod8cDSZz+2lk4CADq2QPOIVYm3kQ4d09x8c02ovNJGWXenp4Tfjdz6iXOukSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 01C6992009C; Tue, 11 Nov 2025 07:26:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id F266392009B;
	Tue, 11 Nov 2025 06:26:55 +0000 (GMT)
Date: Tue, 11 Nov 2025 06:26:55 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Only uniquify on CPU cores where it's needed
In-Reply-To: <alpine.DEB.2.21.2511102053470.25436@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2511110622010.25436@angie.orcam.me.uk>
References: <20251110194754.47626-1-tsbogend@alpha.franken.de> <alpine.DEB.2.21.2511102053470.25436@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Nov 2025, Maciej W. Rozycki wrote:

>  Perhaps we should take the simplest approach: read all the TLB entries 
> with TLBR, sort them by their VPN value and deduplicate to be able to 
> search for a match quickly, assign and write temporary VPN values outside 
> our unique range avoiding a clash with any of the values obtained, and 
> then finally call local_tlb_flush_all().

 And now implemented; no deduplication needed after all.  Cf. 
<https://lore.kernel.org/linux-mips/alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk/>.

  Maciej

