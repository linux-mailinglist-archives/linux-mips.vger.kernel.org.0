Return-Path: <linux-mips+bounces-8310-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CCBA6CB7F
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 17:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BAB73B8543
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 16:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB0D22FF58;
	Sat, 22 Mar 2025 16:40:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8031A270;
	Sat, 22 Mar 2025 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742661605; cv=none; b=IBYWlg33wEw/g0JFvUkVF+MiGGtlH31lD+LzU65b6cFsIm0QMJIXdl0TG2jwXXi5UBGx6AuvpQs03YrWMw5bCg3XJmLPtJpK4M8NN4plCK4HiHKThYp1o09XGahf9krBD/kPRcKPyoKMceAS5AwlNt/tUo7gPRyAFPx3yZmxhJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742661605; c=relaxed/simple;
	bh=bZSZjnJs1kJuAf7i5tgYtBRkpBoSQzwIaf+4QemgXvw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JRFY77cny8JrBW0rU1dGkm3eKbjIz2Jn7WkjWpQJbdTQoYq5KyQmLCygd+gQddU2k4IN1N5mDBAmyUJv2A9h6Julf1V/HtKZfcHhP/EyWuEbQ87KBZnbku4dKQBrhtzwLDIqD9diKvurmmvFIKOlyrGdzD/pjZkbdx6CWT+Db8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6A2BE92009C; Sat, 22 Mar 2025 17:40:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5DEDF92009B;
	Sat, 22 Mar 2025 16:40:01 +0000 (GMT)
Date: Sat, 22 Mar 2025 16:40:01 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
    zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com, 
    Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
    Felix Yan <felixonmars@archlinux.org>, Mingcong Bai <jeffbai@aosc.io>
Subject: Re: [RFC PATCH] MIPS: KGDB: Remove the useless "nop"
In-Reply-To: <4621EB3971C7BB9D+20250322045034.297491-1-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2503221613250.35806@angie.orcam.me.uk>
References: <4621EB3971C7BB9D+20250322045034.297491-1-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Mar 2025, WangYuli wrote:

> The nop instruction surrounding "breakinst:\tbreak\n\t" appears to
> serve no real purpose.

 "If it ain't broke, don't fix it" -- what problem are you trying to 
solve here?  Saving 8 bytes of kernel text space?

> Its introduction can be traced back to commit 51c6022fdb ("[PATCH]
> MIPS update") within the Linux history tree [1]. This commit was
> substantial, comprising 41010 lines, and provides no justification
> for the insertion of this nop instruction.

 The actual origin is:

commit e7c2a72e2680827d6a733931273a93461c0d8d1b
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Tue Nov 14 08:00:00 1995 +0000

    Import of Linux/MIPS 1.3.0

in the LMO tree and this is less than a year from the inception of the 
port while Ralf still bulk-imported MIPS changes on top of Linus's tree 
rather than maintaining them locally.  This was still a couple of years 
before my days and we won't ever know more I'm afraid.

> Based on the MIPS architecture specification, delay slots are only
> present after jump instructions or MIPS1 load instructions.
> Consequently, the nop here is not intended to satisfy a delay slot
> requirement.

 There are more cases of delay slots in various earlier revisions of the 
MIPS architecture.  But inline assembly uses the default reorder mode of 
assembly, which means no delay slot will ever span inside from preceding 
compiled code, and back in 1995 GCC did not itself schedule delay slots 
anyway, all compiled code used the reorder mode.

> Thus, this instruction is suspicious and should probably be removed.

 Based on my experience these padding NOPs are likely there to ensure a 
clean state in the debug stub which may assign special meaning to other 
instructions present around the breakpoint instruction and they've been 
there for 30 years now, so I think they're best left alone unless you 
can name an actual problem they cause you.

 FAOD it's a NAK then.  Let's better fix actual bugs instead.

  Maciej

