Return-Path: <linux-mips+bounces-8820-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3994A9E5DF
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 03:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 299E61694DC
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 01:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807E935972;
	Mon, 28 Apr 2025 01:43:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B38BEAF1;
	Mon, 28 Apr 2025 01:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745804633; cv=none; b=jVsI2fFmZPidWNUGIxdNAXURBI6dpm8C/mhIcLGnJVa61k0giqo/9GQ+80iK5EfN9ycVEaX5/gTRFW6TI4T/y8vwtfzW7efMA4kHKBlg0nwg0EAvebBe0uuCnHq7t3xG8zBI+RRsbgnPqsnRtNjoBw07nqDx/2Oyp+xmhiqbxEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745804633; c=relaxed/simple;
	bh=OtlmkEkbNGzcTzcluHrptih4SZgW0i/zchiqxekC/Js=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UXxkfZ3jEUcerEDk7WUPx2J4dUg+wtL7ecl26CI6DsNZq+EHmT9jn4cpZGKZilOlJJ0q8LWWzR0T0jCOfXVhtQtUTpRRLvMCo1hewdCHoVyW7Qsx7fM/M83GB+X4MQMAlPVQoHJF26zzPHS9DRWMeaabmRcHJ6v1I3tMXXhA6Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 259B292009C; Mon, 28 Apr 2025 03:43:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1820192009B;
	Mon, 28 Apr 2025 02:43:50 +0100 (BST)
Date: Mon, 28 Apr 2025 02:43:50 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Huacai Chen <chenhuacai@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Thorsten Blum <thorsten.blum@linux.dev>, Oleg Nesterov <oleg@redhat.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: Fix MAX_REG_OFFSET
In-Reply-To: <CAAhV-H5A_xFMXOXPJFz6FyD_FixDW2msGM1fRe-FdDSq=anS8w@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2504280235440.31828@angie.orcam.me.uk>
References: <20250427113423.67040-2-thorsten.blum@linux.dev> <CAAhV-H6kxy9NaWXqq1QLfobVvVz9-VMybHC6M+0V-sE3MY9SRA@mail.gmail.com> <aA4oag9MAXT3y0t8@alpha.franken.de> <CAAhV-H5A_xFMXOXPJFz6FyD_FixDW2msGM1fRe-FdDSq=anS8w@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 27 Apr 2025, Huacai Chen wrote:

> > > There is no 80 columns limit now, so no new line needed here.
> >
> > but not forbidden to care about it. I still prefer this limit.
> Of course you are free to choose. But in my opinion "force to long
> lines" and "force to short lines" are both bad, code readability is
> the first thing to be considered.

 Correct, and I start getting lost when lines are wrapped by overrunning 
the width of my screen.  NB in the old days some terminals would actually 
truncate lines instead; at least it does not happen anymore, or at least 
you can tell your terminal not to do it via a suitable stty(1) invocation.

  Maciej

