Return-Path: <linux-mips+bounces-6838-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5B9E0C07
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 20:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C2E0B24626
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 17:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6539E1DA62E;
	Mon,  2 Dec 2024 17:58:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA5843ABC;
	Mon,  2 Dec 2024 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733162284; cv=none; b=bgmdVmSSRYmOwIe3HQs5TKFkawhTDC7j+GD6i2kvPx+A4ZbzpL6h3WaZSr+1tANc5p5FZCNwg9M83obKPou/ayXG1b6hGYa9N3YM9iA4eBtuFfzRjRJ4VjhTBV3TFwIZws8N2ds42pCuc9WiL4UUwUiti9kHRqaKiI4CRC8RrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733162284; c=relaxed/simple;
	bh=lhTAUOa3hZsE1h55BUQBxdkUre1qsTijbW/rS40uaR4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gmNGzTKy1hhDvGy7oX+oqZ1RoH7xI5UWlxZEHsU50ISpuXglvKvSyTLQN1t4t4uFGRhAyp7wTsVjTyvKnMihZDa8QJsabH+NcJXzXMFkMIGR93VObD62cl7saXx+FDp/WpfI7Bm7hRnijatGSs1SzOJJdQXF+v/LrDBRSNT1BqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 26AE292009C; Mon,  2 Dec 2024 18:58:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 182AD92009B;
	Mon,  2 Dec 2024 17:58:00 +0000 (GMT)
Date: Mon, 2 Dec 2024 17:58:00 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Rong Xu <xur@google.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Masahiro Yamada <masahiroy@kernel.org>, 
    Klara Modin <klarasmodin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicolas Schier <nicolas@fjasle.eu>, 
    Chris Packham <chris.packham@alliedtelesis.co.nz>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] [MIPS] Place __kernel_entry at the beginning of text
 section
In-Reply-To: <20241126173409.3728585-1-xur@google.com>
Message-ID: <alpine.DEB.2.21.2412021751110.30050@angie.orcam.me.uk>
References: <20241126173409.3728585-1-xur@google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Nov 2024, Rong Xu wrote:

> diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> index e90695b2b60e..c7528d96dd1a 100644
> --- a/arch/mips/kernel/head.S
> +++ b/arch/mips/kernel/head.S
> @@ -59,6 +59,7 @@
>  #endif
>  	.endm
>  
> +	__HEAD
>  #ifndef CONFIG_NO_EXCEPT_FILL
>  	/*
>  	 * Reserved space for exception handlers.

 A new line would be preferable afterwards so as to visually separate the 
directive from the conditional part that follows.  It looks messy as it 
stands (and we have prior art further down the file with __REF).  Please 
send a fix.

  Maciej

