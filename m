Return-Path: <linux-mips+bounces-7741-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266BA3185D
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 23:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2F6A1885414
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 22:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962DF25EF83;
	Tue, 11 Feb 2025 22:03:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872B8267735;
	Tue, 11 Feb 2025 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739311417; cv=none; b=ZOGP4cb1jmWXd7gcnCtrjScE9VaI5VrsKX+ApQyOAUET5+zEHWBvon/KkvYYx4DIBKIgIxyxOOkVxpIdVZ0YJuGTgP3x39isXp3AaKgO0EDtjpDv/fCkM1fO8Gs8FAGPsmUq9+0SfjOKtSDHsLqrX/GXK7O5CuBfTsZsr9zDdwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739311417; c=relaxed/simple;
	bh=nvSoEOFxC8JxeSbrfclDEASv/CNp4BMBplPUaLfaUv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSYN9zeWvzTtRvgSK4AdgaQxdV/BVRWjRASttQhtNu0k9wrLS+yxPIlyBVDLjMfvQyoVFPMaKtgDikmysUgfPiZRxcsKRiXHQkYlwnh2O0kUAd3iqJSZ4bEagEjjSLeIT6eUqGXxy7b/ASqPsxiPz5f8DOxHR1EmZiJP9VZPI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id E551672C8CC;
	Wed, 12 Feb 2025 01:03:33 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id D67F27CCB3A; Wed, 12 Feb 2025 00:03:33 +0200 (IST)
Date: Wed, 12 Feb 2025 00:03:33 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] mips: fix mips_get_syscall_arg() for o32
Message-ID: <20250211220333.GA19256@strace.io>
References: <20250210113442.GB887@strace.io>
 <alpine.DEB.2.21.2502111530080.65342@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2502111530080.65342@angie.orcam.me.uk>

On Tue, Feb 11, 2025 at 06:30:33PM +0000, Maciej W. Rozycki wrote:
> On Mon, 10 Feb 2025, Dmitry V. Levin wrote:
> 
> > The first assertion is fixed for mips o32 by using struct pt_regs.pad0
> > instead of get_user() to obtain syscall arguments.  This approach works
> > due to this piece in arch/mips/kernel/scall32-o32.S:
> 
>  I've had a look now and I can see what's going on here.
> 
>  The thing is we're trying to access another task's context and obviously 
> dereferencing $sp obtained from it is not going to work via get_user(), 
> because that just peeks at the current task's context.  It often does not 
> crash, because the default user stack always gets assigned the same VMA, 
> but it is pure luck which we wouldn't have if the stack was switched (via 
> setcontext(3) or however) or say a non-default process's thread peeked at, 
> and in any case irrelevant data is obtained just as observed with the test 
> case.
> 
>  We ought to be using access_remote_vm() to retrieve the other task's 
> stack contents, but given that the data has been already obtained and 
> saved in `struct pt_regs' it would be an overkill.
> 
>  So I think your change is actually the correct thing to do, but please 
> let's not abuse a struct member called `pad', the name of which indicates 
> its contents are not supposed to be of any use.  I have therefore posted a 
> preparatory cleanup[1].  May you please rebase your patch on top of that 
> and also update the change description so as to reflect the findings?
> 
>  Thomas, can you please apply my cleanup soon and ahead of Dmitry's change 
> so as to make things easy to proceed with?  Or otherwise let me know what 
> works for you best.
> 
>  Also I have a suspicion this stuff ought to be backported, but I guess it 
> can be decided later on.
> 
>  Thank you for your patience.
> 
> [1] "MIPS: Export syscall stack arguments properly for remote use", 
>     <https://lore.kernel.org/linux-mips/alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk/>

Thanks for the analysis, I'm going to rebase my fix and send it
as a follow-up to your cleanup patch.


-- 
ldv

