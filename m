Return-Path: <linux-mips+bounces-12766-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF132CF90C6
	for <lists+linux-mips@lfdr.de>; Tue, 06 Jan 2026 16:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 794C6300EB93
	for <lists+linux-mips@lfdr.de>; Tue,  6 Jan 2026 15:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA850345743;
	Tue,  6 Jan 2026 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QEdpsuNl"
X-Original-To: linux-mips@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EBF345736;
	Tue,  6 Jan 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767713146; cv=none; b=gY66oIZrhjjxubpHjMeq6NmJnb/n1ULyKym4S8i+UOvnyfIW7PZwoZpebu6KuMHdzONH/u+XmBasxCAF3R/TO3h0l7lJ+MabEWb2S3rTL1XyAGe01oPzo38lisEHDP2AXCcLhrjGG7Rrw77S7R5H+uB28lntrw5qGxfjDrPESdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767713146; c=relaxed/simple;
	bh=HBLuxWKUEHfFxf+vUeJbfyHrMk0f1yUVEBAgproCtj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2ehkJi+pKNz+lRBHQdi0MuljN8uEPDHSL+M9sYgvnqvXKWs+PyrlFJcTXYuJiWWfyDS3o57jR9Y2xCd/A6xjolMlHaYOEXOvPAHl2ROzRBpRTOZf082GeIqoLlptY/wTkLv5ZeDKI7YBGhFO3PMA2l2VIaOYDm9ORH0vDTUNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QEdpsuNl; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WfYfd1PzaMaipLKoSbmZze99juo76um6Ea96kj/deqg=; b=QEdpsuNl7ia0un9wF36SttoObu
	nxQEI5WIklTjmDfhrXDmpkPWlxy8UkL6Iqr3LpMakwafmglnFlnXsR5VXVC58V/ZHYkv6AMaKolqx
	/cVr5UJwW1UKZEMlstf6VqpxSWes3tMyHVBIc7W0cJpBdY7idKsO/hNVuRMW8C2V6W76GEHI2hfis
	9LOA40VS74ERDGDEfcydRZnoxE/Xdw8aWQhtCvTN5o2OjkX/+pXncxFEUdmVzLQxJFtvjWUBMr1AT
	do7k2fi00jp3bllKENz1pIemqqzAvW+cZB4IfzbmjRFj6rGMZHixTPqAj4H63R0U2vBEtx8//4DEg
	K94AiDUw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8wE-00000009xZY-3ZDj;
	Tue, 06 Jan 2026 15:25:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5D63E30056B; Tue, 06 Jan 2026 16:25:38 +0100 (CET)
Date: Tue, 6 Jan 2026 16:25:38 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Keke Ming <ming.jvle@gmail.com>, mhiramat@kernel.org,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	tsbogend@alpha.franken.de, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/5] uprobes: transition from kmap_atomic to
 kmap_local_page
Message-ID: <20260106152538.GA3707891@noisy.programming.kicks-ass.net>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
 <aVj146EunyaOQzxO@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVj146EunyaOQzxO@redhat.com>

On Sat, Jan 03, 2026 at 11:56:35AM +0100, Oleg Nesterov wrote:
> On 01/03, Keke Ming wrote:
> >
> > Keke Ming (5):
> >   riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   uprobes: use kmap_local_page() for temporary page mappings
> >
> >  arch/arm/probes/uprobes/core.c     |  4 ++--
> >  arch/arm64/kernel/probes/uprobes.c |  4 ++--
> >  arch/mips/kernel/uprobes.c         |  4 ++--
> >  arch/riscv/kernel/probes/uprobes.c |  4 ++--
> >  kernel/events/uprobes.c            | 12 ++++++------
> >  5 files changed, 14 insertions(+), 14 deletions(-)
> 
> Thanks,
> 
> Acked-by: Oleg Nesterov <oleg@redhat.com>

Let me go stick them in tip/perf/core

