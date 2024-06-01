Return-Path: <linux-mips+bounces-3455-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F9D8D727F
	for <lists+linux-mips@lfdr.de>; Sun,  2 Jun 2024 00:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A8C71F217B6
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jun 2024 22:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD6B1F5E6;
	Sat,  1 Jun 2024 22:30:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6279317BD9;
	Sat,  1 Jun 2024 22:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717281007; cv=none; b=SfdCarPAeQQTIzDyDLXQKbx1MsjyCWcFEmwf0NNDkZvsUIyQsv64LCWFYmZ/Tnhtr9tcniOvBzquMucpmVhcFhCennl7z9QcZCKPsZrSc8z+oBBdhvXWNU3FsrefRVcYUThgSAUCIc+0+H8Baf6v+ZfKVVXmZLSgLvLOStLOJKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717281007; c=relaxed/simple;
	bh=9Ne4pEYh6gWnzfHt/JZFz7tb84Sf0DRVindsHil8Trk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G2SkkWCT17EhKEwT5Xf+x3FSB3D1bbnsAC9H0BhEX5RqJE3pF/MViv/kL2Lzn4QmRA0jbrufhoptqwIzBIUTHyrlMM6uDqt1HnbysQ9pRNamqm0Zmvey8OAmGPaut9fFdbyaQ91T8uawEp7WkRJlRZvZReeRY1hHwcT1UG4vgqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 48CA792009C; Sun,  2 Jun 2024 00:30:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 3B54B92009B;
	Sat,  1 Jun 2024 23:30:03 +0100 (BST)
Date: Sat, 1 Jun 2024 23:30:03 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Serge Semin <fancer.lancer@gmail.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if
 64BIT
In-Reply-To: <20240511-mips-clks-v1-3-ddb4a10ee9f9@flygoat.com>
Message-ID: <alpine.DEB.2.21.2406012326580.23854@angie.orcam.me.uk>
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com> <20240511-mips-clks-v1-3-ddb4a10ee9f9@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 11 May 2024, Jiaxun Yang wrote:

> csrc-r4k suffers from SMP synchronization overhead.
[...]
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index f1aa1bf11166..fa8ca0287568 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1083,6 +1083,7 @@ config CSRC_IOASIC
>  
>  config CSRC_R4K
>  	select CLOCKSOURCE_WATCHDOG if CPU_FREQ
> +	select HAVE_UNSTABLE_SCHED_CLOCK if 64BIT

 Shouldn't it be:

	select HAVE_UNSTABLE_SCHED_CLOCK if 64BIT && SMP

then?

  Maciej

