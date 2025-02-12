Return-Path: <linux-mips+bounces-7743-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C333DA31F4E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 07:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE963A548A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 06:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64C41FF1A9;
	Wed, 12 Feb 2025 06:44:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D54C1FCF4F;
	Wed, 12 Feb 2025 06:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739342674; cv=none; b=cPOgB77VGVEQBi08px/07fZJfutgnXL7s9StkOmLKz5GqJsWY5lvq5FCMJEOJoWVGJ+vUPLqX94YCKIQgHH9WsYoecpmtv0S/U74pMWZhMmHohDylnnslTyBTg72ES0Sd8n9MT2fa93ntfdF53AkybwEcc8JJACh6K7ZCETk4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739342674; c=relaxed/simple;
	bh=+Jfg4OzS1vKOMOlhVXTVHrU4Gw5UHqFa4g5yO+1hLi4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h3qmoGm/FYwAaqMf6JSlt6aRneVTtv2OJz29hlaN3flumgKTE4dJm459yMW39JgUpRIdpKnVF3X47cIhoPNr3hZQLHGyGhscVYccadFeceifl8kPEfUFm3mbjeN/qUhyxF987U4hJpCeQi3Lkq/U/IC0hYIw22XhqhOz1qsFBTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 85C9392009C; Wed, 12 Feb 2025 07:44:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7FCB492009B;
	Wed, 12 Feb 2025 06:44:30 +0000 (GMT)
Date: Wed, 12 Feb 2025 06:44:30 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    masahiroy@kernel.org, jiaxun.yang@flygoat.com, zhanjun@uniontech.com, 
    guanwentao@uniontech.com, Chen Linxuan <chenlinxuan@uniontech.com>
Subject: Re: [PATCH 2/2] MIPS: Explicitly check KBUILD_SYM32=n
In-Reply-To: <D23DC9B8BD1C245D+20250211140740.1812778-2-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk>
References: <41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com> <D23DC9B8BD1C245D+20250211140740.1812778-2-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Feb 2025, WangYuli wrote:

> During make module_install, the need_compiler variable becomes 0,
> so Makefile.compiler isn't included.
> 
> This results in call cc-option-yn returning nothing.
> 
> Add a check for KBUILD_SYM32=n to avoid the
> "CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32" error
> when KBUILD_SYM32 is unset (meaning it's not 'y' or 'n').

 Jeez, just wrap it into `ifdef need-compiler' as I told you previously.  

 This stuff isn't used with `make modules_install', none of the compiler 
flags matter as the compiler isn't ever called, which is obvious from 
Makefile.compiler not being included in the first place.  I only did not 
do it with commit a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS 
`modules_install' regression"), because I was unaware about this LLVM's 
limitation and GCC version requirements at the time implied the presence 
of this feature at all times.

 See also commit 4fe4a6374c4d ("MIPS: Only fiddle with CHECKFLAGS if 
`need-compiler'") for a similar change from the same series[1].

 Also need-compiler is nil rather than 0 in the relevant case.

 Please also double-check your change description before posting, at least 
when it comes to referring to codebase artifacts:

s/module_install/modules_install/
s/need_compiler/need-compiler/

This is stuff people may be grepping for.

References:

[1] "MIPS: Fix build issues from the introduction of `need-compiler'", 
    <https://lore.kernel.org/r/alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk/>

  Maciej

