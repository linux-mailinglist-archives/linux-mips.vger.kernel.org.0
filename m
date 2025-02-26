Return-Path: <linux-mips+bounces-7994-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E95A46B39
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 20:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D68D816E7EB
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 19:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDB4241688;
	Wed, 26 Feb 2025 19:37:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B4F23906A;
	Wed, 26 Feb 2025 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740598650; cv=none; b=npz/36rIwP5pSI5AOFgT6tvumr3Em3uHRPeWl0Uepb6unSoLdbzfNLBN4lReDZjfyWyCotZt4WMkckXlsQhrVjBZSXz4blTkvzmQlzbFsXZAY3jYYOFTXGsWQmmAX1i7zf5hk1wP9Mrd7iw+DSHtBmICUbryyezySK+7JdNi4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740598650; c=relaxed/simple;
	bh=nNKiHnZN5yfytqAictGgp6qmTpEUP2oD++h/KrUNk2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFFWqOuMWGk77VbLR0e2N8GSu7RYX+tct/BvjlTYJofx/xR7SY7VPgkCpd+fPNxWmVf7ypiYsHV3ZkkYbMDZWBRzLaR55WBXJhbRK8PNXo5mQzB4FxTdRknSwNCpzyunvHJodzuo3pgIWMxjJTcp7+p7Tr2zg2pbSplWk4Yhtno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tnNDZ-0001cQ-00; Wed, 26 Feb 2025 20:37:17 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A857BC0135; Wed, 26 Feb 2025 19:10:23 +0100 (CET)
Date: Wed, 26 Feb 2025 19:10:23 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Xi Ruoyao <xry111@xry111.site>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Ignore relocs against __ex_table for relocatable
 kernel
Message-ID: <Z79ZD3EL1Q8UjaFH@alpha.franken.de>
References: <20250226132841.381063-1-xry111@xry111.site>
 <20250226104340.3f0b961b@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226104340.3f0b961b@gandalf.local.home>

On Wed, Feb 26, 2025 at 10:43:40AM -0500, Steven Rostedt wrote:
> On Wed, 26 Feb 2025 21:28:41 +0800
> Xi Ruoyao <xry111@xry111.site> wrote:
> 
> > Since commit 6f2c2f93a190 ("scripts/sorttable: Remove unneeded
> > Elf_Rel"), sorttable no longer clears relocs against __ex_table,
> > claiming "it was never used."  But in fact MIPS relocatable kernel had
> > been implicitly depending on this behavior, so after this commit the
> > MIPS relocatable kernel has started to spit oops like:
> 
>  Oops!
> 
> > 
> > 	CPU 1 Unable to handle kernel paging request at virtual address 000000fffbbdbff8, epc == ffffffff818f9a6c, ra == ffffffff813ad7d0
> > 	... ...
> > 	Call Trace:
> > 	[<ffffffff818f9a6c>] __raw_copy_from_user+0x48/0x2fc
> > 	[<ffffffff813ad7d0>] cp_statx+0x1a0/0x1e0
> > 	[<ffffffff813ae528>] do_statx_fd+0xa8/0x118
> > 	[<ffffffff813ae670>] sys_statx+0xd8/0xf8
> > 	[<ffffffff81156cc8>] syscall_common+0x34/0x58
> > 
> > So ignore those relocs on our own to fix the issue.
> > 
> > Fixes: 6f2c2f93a190 ("scripts/sorttable: Remove unneeded Elf_Rel")
> > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> 
> Thanks! Yeah, this is better than having an implicit dependency to the
> sorttable code.
> 
> I take it that this will go through the mips tree?

yes, I'll take it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

