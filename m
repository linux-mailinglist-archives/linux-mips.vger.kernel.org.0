Return-Path: <linux-mips+bounces-7876-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8FA3C867
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 20:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78A98188F35E
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 19:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FE322A812;
	Wed, 19 Feb 2025 19:20:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD99B22A80D;
	Wed, 19 Feb 2025 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992836; cv=none; b=C2/fCVZTr2xE2rUWlMB6b+OnboEbUOzrWA7058MB2DUxJPlQWidD1mtWCh4hN37Iac+UTwYxu3KlscrJwuBtSCXRqHvTqDC1PrBIzW9y8ZUg2ukhR82x8sM9OP4nDyLGO5jgKXTGHLpW9+z+XM+peeme2/5/cV8f+9I0ZLML1qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992836; c=relaxed/simple;
	bh=hViMkE54WDakzOg5aMgszg7sb9nDih019gXDvJa+JCI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cSl6WYouRp08N9E4L0wis4Iba+EugYkgzcRVaV+tdSS1nxTqOIPUjQRlUO99q1Lp+s9bIsjOyi3jZg1t7ccGJwNWT6ti/L8fYm+6/nLc+2w12NJyDCa2GzCopc/bIAwTfXoBO/8Oia/zh/2t/yfG9FMruGDDZhfWU6g3rz0f/D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 51FBA92009C; Wed, 19 Feb 2025 20:20:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 43A3092009B;
	Wed, 19 Feb 2025 19:20:33 +0000 (GMT)
Date: Wed, 19 Feb 2025 19:20:33 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Dmitry V. Levin" <ldv@strace.io>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>, 
    Alexey Gladkov <legion@kernel.org>, 
    Eugene Syromyatnikov <evgsyr@gmail.com>, strace-devel@lists.strace.io, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] syscall.h: introduce syscall_set_nr()
In-Reply-To: <20250219182451.GA14216@strace.io>
Message-ID: <alpine.DEB.2.21.2502191917420.65342@angie.orcam.me.uk>
References: <20250217091034.GD18175@strace.io> <alpine.DEB.2.21.2502191658530.65342@angie.orcam.me.uk> <20250219182451.GA14216@strace.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Feb 2025, Dmitry V. Levin wrote:

> >  That label is called `trace_a_syscall' in arch/mips/kernel/scall64-o32.S 
> > instead.  To bring some order and avoid an inaccuracy here should the odd 
> > one be matched to the other three?
> 
> Apparently, there are two instances of syscall_trace_entry(), one
> n32_syscall_trace_entry(), one trace_a_syscall(), and each of them
> is calling syscall_trace_enter(), not to be confused with
> syscall_trace_entry():

 Oh dear!

> I'd change the wording of my comment rather than try to disentangle this.
> After all, the most important here is that the new syscall number is
> loaded from regs[2] right after the syscall_trace_enter() invocation.

 Right.

> Would you be OK with the following wording:
> 	/*
> 	 * New syscall number has to be assigned to regs[2] because it is
> 	 * loaded from there unconditionally after syscall_trace_enter()
> 	 * invocation.

 May I suggest "[...] after return from syscall_trace_enter() invocation." 
instead?  Minor reformatting might be required for better visual alignment 
though.

  Maciej

