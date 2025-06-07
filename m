Return-Path: <linux-mips+bounces-9163-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2118EAD0B01
	for <lists+linux-mips@lfdr.de>; Sat,  7 Jun 2025 04:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD3AE171241
	for <lists+linux-mips@lfdr.de>; Sat,  7 Jun 2025 02:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7094FB67A;
	Sat,  7 Jun 2025 02:48:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22E463CB;
	Sat,  7 Jun 2025 02:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749264506; cv=none; b=fpvmUPRNa3m7HhOiTtsJpjskpJSENaPo9pdNh8DgPxihURzCb2pnjjycnyYKBbP/BUuYL3+JDLYyBsGJGLuIphr/NQ9mv2pV8uXzWc8Qywvj1g/tVgQNr5j8xJEfj1bKkLkHOXW+a9EpI+pbiAsBr6HMXbWK+/P6DAyk5MXgEUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749264506; c=relaxed/simple;
	bh=5v2dkgWYp9eNCiqJPNSgLXmWy6mo8gBPdC50BFN3uPc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H1awLrYqumPLqtF5G3TZ5KiOGbZuan7ebvJ+S3Y8qzW1Gh/1cQrxukCoeU0QrP4UVzg3U+VbRzQ4AWND0Y/BZxbXpz22PcgxpCAuUYrTgZtNIyHLwQmYfG33PFSJiro2AArb8TbXjW+LaTGsD7nBvjxTOLJbTYZIgjmQXH0RAB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6783E92009E; Sat,  7 Jun 2025 04:48:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5B9D892009C;
	Sat,  7 Jun 2025 03:48:15 +0100 (BST)
Date: Sat, 7 Jun 2025 03:48:15 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: tlb-r4k: Uniquify TLB entries on init
In-Reply-To: <20250605-tlb-fix-v1-1-4af496f17b2f@flygoat.com>
Message-ID: <alpine.DEB.2.21.2506070300430.1790@angie.orcam.me.uk>
References: <20250605-tlb-fix-v1-1-4af496f17b2f@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Jiaxun Yang wrote:

> +static unsigned long r4k_safe_entryhi(void)
> +{
> +	int entry = current_cpu_data.tlbsize;
> +	int old_index;
> +
> +	old_index = read_c0_index();
> +	while (entry >= 0) {
[...]
> +		entry++;
> +	}

 Hmm, how is it supposed to work: you start from say 48 and then iterate 
until 0x80000000 before giving up?  Also a signed overflow condition is UB 
pre-C23, so the compiler may well optimise the loop control away.

 How did you verify this code?

  Maciej

