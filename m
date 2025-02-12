Return-Path: <linux-mips+bounces-7754-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3DA331A1
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 22:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F5C167AC3
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 21:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6DF202F9F;
	Wed, 12 Feb 2025 21:36:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCF52036E5;
	Wed, 12 Feb 2025 21:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739396173; cv=none; b=Bd2+2V21JwYVeXs529JEbtxm231nJ2ZNLa/82ERMnVNA2RVs+Xen81n1ZEgUkGZGA6YkIiPHLqldV2zvqTR2CS0YPfPjaAZHn9PBWrk1FLZFu0XFDHf0Dd8aXfRsGn2EWsO2u1b7hJ/QIxfQKVcaAU1r8///+MLYqxjkngSDjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739396173; c=relaxed/simple;
	bh=UCmJJDY5Rq62iJEOLH3JSBKuEigi6Gbpj9yurOE3GEk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uaTgij+7+0TMiKQmf+qMPb0vCcnhtC+qtLKEP1XIT1ESDHTfs3nZPwxgIMsBYUpYIm5hRHeZuGMhotb3o09B2au+T5GE0LFBMSUmUaOezlej8ZQIs4TnJ41SMiUD6gx4MnNjr2TzgO6uP+gSxF9VmX8ANAl2avb3hkA62ft9Uos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6E1D192009C; Wed, 12 Feb 2025 22:36:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 671C492009B;
	Wed, 12 Feb 2025 21:36:02 +0000 (GMT)
Date: Wed, 12 Feb 2025 21:36:02 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    masahiroy@kernel.org, jiaxun.yang@flygoat.com, zhanjun@uniontech.com, 
    guanwentao@uniontech.com, Chen Linxuan <chenlinxuan@uniontech.com>
Subject: Re: [PATCH 2/2] MIPS: Explicitly check KBUILD_SYM32=n
In-Reply-To: <030FDC391902ED7E+d1a2171f-9a91-48eb-8520-a02ff7e786b4@uniontech.com>
Message-ID: <alpine.DEB.2.21.2502122111330.65342@angie.orcam.me.uk>
References: <41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com> <D23DC9B8BD1C245D+20250211140740.1812778-2-wangyuli@uniontech.com> <alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk>
 <030FDC391902ED7E+d1a2171f-9a91-48eb-8520-a02ff7e786b4@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Feb 2025, WangYuli wrote:

> There are expression and spelling errors in my commit message and code
> comments, necessitating a patch v2 for corrections, is that right?

 These are semantic errors, yes.

 Also I find:

Fixes: 805b2e1d427a ("kbuild: include Makefile.compiler only when compiler is needed")

invalid here, as your change does not address an issue introduced with 
said commit.  It does fix mine, when it comes to LLVM support, so I think 
instead it has to be:

Fixes: a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `modules_install' regression")

And if you want it backported, then you need to swap the order of the 
changes or discard 1/2 altogether, as that is syntactic noise only and 
clearly not a fix.

 Apologies not to point these issues out in the previous message.

> As for whether to check need-compiler or KBUILD_SYM32 in the code, the effect
> is essentially the same, correct?

 No, code has to express intent and the intent here is not to fiddle with 
the compilation flags when no compiler is going to be used.  And this 
purpose is served by the `need-compiler' setting; anything else is code 
obfuscation and a workaround at best.  And the very need to add a comment 
has made it very obvious already: the best code is self-explanatory and 
the use of `need-compiler' is a common idiom, obviating the need for a 
comment here.

 Have I made myself clear here?

  Maciej

