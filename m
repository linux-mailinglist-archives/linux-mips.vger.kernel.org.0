Return-Path: <linux-mips+bounces-5522-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078397447A
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 23:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1DCE281C60
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 21:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678141A7AEC;
	Tue, 10 Sep 2024 21:03:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EDE183CA0;
	Tue, 10 Sep 2024 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726002193; cv=none; b=EFUzU4fjMX0EY4jmNQG4iprn3B318llee1WXSqmZalF8FIdEESw3dN+fuEyb86Mw9kWKnaq+htMKb+56A4SbXFXlXgEfO4u0d3HIriMPVzM7Sk/V9Gv/zYmsKuO7TfxolAWABecfsE3oRblORQiECCy/JtX4b8ouXxbeIR9aGWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726002193; c=relaxed/simple;
	bh=q+ATKfEuddEGViVtadKoluz/lWeSsY7qtEIgDENQ+ps=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qWwJOaOpRsRCCp1TMgkM+jmKqP6IEpRlzkyXt/dr8aiv+X0QY8nZZklTlM0fCbSOJBVwaV8kQFTMkc6T6DeaEXy9xzMbZtBoQ689h0X58Zxk/5lDQG/DqRjRSA2N0bgurBv6lp3yPukIOAuijE58x//zkQYJv/YAmwFUKhAtlRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5E5C192009C; Tue, 10 Sep 2024 23:03:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5727D92009B;
	Tue, 10 Sep 2024 22:03:08 +0100 (BST)
Date: Tue, 10 Sep 2024 22:03:08 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: kprobes: Massage previous delay slot
 detection
In-Reply-To: <b4833f82-9e7e-4667-994b-c444ef935a9f@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2409102140440.60835@angie.orcam.me.uk>
References: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com> <20240908-mips-chore-v1-2-9239c783f233@flygoat.com> <alpine.DEB.2.21.2409092259110.60835@angie.orcam.me.uk> <b4833f82-9e7e-4667-994b-c444ef935a9f@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Jiaxun Yang wrote:

> >> +		if (insn_has_delayslot(prev_insn)) {
> >> +			pr_notice("Kprobes for branch delayslot are not supported\n");
> >
> >  This now overruns 80 columns making code *less* readable.
> 
> I don't really agree, we are not in VGA display era any more, see Linus's
> arguments on removal of 80 columns [1] and why long line are more readable [2].

 Human perception hasn't changed though and just that you can squeeze a 
vast number of characters in a line it doesn't mean you can parse them 
comfortably with eyes.  Printed books have a common line length limit too, 
established with centuries of experience.  Some projects such as GDB 
prefer a lower soft limit of 74 characters even (with 80 being the hard 
one), exactly for this reason[1].

 NB even back in 1990s there was an option to use 132-character lines with 
SVGA hardware in text mode, but hardly anybody used that because, well, it 
didn't make text any more readable.  Rather one became lost right away.

 Last but not least Documentation/process/coding-style.rst still mandates
80-column formatting.

References:

[1] <https://sourceware.org/ml/gdb-patches/2014-01/msg00216.html>

  Maciej

