Return-Path: <linux-mips+bounces-12651-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC5CEB1BA
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 03:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD585300A6DC
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 02:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB191F8691;
	Wed, 31 Dec 2025 02:43:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D3819F12A;
	Wed, 31 Dec 2025 02:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767149015; cv=none; b=nvlKZrQF/hcghD3RK+xX8CpcGu4FPEqXXcZ5O8daqAgQttsOC+WQusLpWlyIUKMrnK6GjbalQ+siOZOahCvBZvuSeoItiJedrig4znDyH7rxK5ZKjLifAZdSKEUK1VdgHnji/PVObL3NlFfEPFmRHQcLIhRDItVsjik3qOS1yLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767149015; c=relaxed/simple;
	bh=mvF6PYDlRKxiQZyVS/jRjKSuEMtWULP8AM7kukBz+VM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZbLVEOqpT/lNjklNFSsZGaTOfwZS2cMd1pvR3iM1dFjmhXuz4tMDtGVpK5BbHj+U2U3+Q8qwuEg++gh3obQAm3YsdDFJ/qnR7IHDOWJEhCCWYBcLOwKHJMtojRXQUsZm5w2AjEUJ/bVM2hbThDCa3BfTvmByFZ+HS846jsBL1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 68ACE92009C; Wed, 31 Dec 2025 03:33:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 61BEF92009B;
	Wed, 31 Dec 2025 02:33:40 +0000 (GMT)
Date: Wed, 31 Dec 2025 02:33:40 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Implement ARCH_HAS_CC_CAN_LINK
In-Reply-To: <20251222-cc-can-link-mips-v1-1-6d87a8afe442@linutronix.de>
Message-ID: <alpine.DEB.2.21.2512310212490.14570@angie.orcam.me.uk>
References: <20251222-cc-can-link-mips-v1-1-6d87a8afe442@linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 22 Dec 2025, Thomas Weißschuh wrote:

> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index b88b97139fa8..316e3c29c431 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3126,6 +3127,20 @@ config CC_HAS_MNO_BRANCH_LIKELY
>  config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
>  	def_bool y if CC_IS_CLANG
>  
> +config ARCH_CC_CAN_LINK
> +	bool
> +	default $(cc_can_link_user,-m64 -EL) if 64BIT && CPU_LITTLE_ENDIAN
> +	default $(cc_can_link_user,-m64 -EB) if 64BIT && CPU_BIG_ENDIAN
> +	default $(cc_can_link_user,-m32 -EL) if CPU_LITTLE_ENDIAN
> +	default $(cc_can_link_user,-m32 -EB) if CPU_BIG_ENDIAN
> +
> +config ARCH_USERFLAGS
> +	string
> +	default "-m64 -EL" if 64BIT && CPU_LITTLE_ENDIAN
> +	default "-m64 -EB" if 64BIT && CPU_BIG_ENDIAN
> +	default "-m32 -EL" if CPU_LITTLE_ENDIAN
> +	default "-m32 -EB" if CPU_BIG_ENDIAN

 There are no `-m32'/`-m64' options with MIPS GCC; where did you get them 
from and how did you verify your change?  Did you mean `-mabi=...' by any 
chance?  Also does the n32 ABI have to be factored in, since IIUC this 
stuff is about user programs?

  Maciej

