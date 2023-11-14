Return-Path: <linux-mips+bounces-53-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53837EB704
	for <lists+linux-mips@lfdr.de>; Tue, 14 Nov 2023 20:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E2F4B20A37
	for <lists+linux-mips@lfdr.de>; Tue, 14 Nov 2023 19:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5F926AD6;
	Tue, 14 Nov 2023 19:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mN277XcJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9EE26AD1;
	Tue, 14 Nov 2023 19:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CA8C433C8;
	Tue, 14 Nov 2023 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699991368;
	bh=DN5Wr4F+DfVrA4YTg0lZGYNXWUnvcZpMIpwoKCNGtts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mN277XcJWDD1mwWqIHkGVR//AvS7j7t4dqv3Zxe5qYEelse/EinS0YeIOALLgM9tV
	 q+Zu9kRktOB8xEx3KSjeUooI2mw0Lp3vr4CW9/6iVdZhRfF48un8qRKr0EKuUxnu0k
	 U84BBuzJViYS2BbbFeP3zGwcgtlTXtD5JdwVi3NyxenGkfvO/Velay3M6W+KkqZc7b
	 r3nJwQOe+mBSe9XfG97evkR2WurhlKH2YCYmWU07JBW0FqIVHs3KFvtJfCSMfrri7j
	 HlQC3IW2nPYeYsp7TaUJ57U0DWpe/lkn7AkRgyXQKvl0bzEHVpr8HGSED6FoH7s4Oe
	 qkWg7k0Vn2c/w==
Date: Tue, 14 Nov 2023 19:49:24 +0000
From: Simon Horman <horms@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: |PATCH] stmmac: dwmac-loongson: Add architecture dependency
Message-ID: <20231114194924.GH74656@kernel.org>
References: <20231113154522.0bca3521@endymion.delvare>
 <20231113180107.GA52493@kernel.org>
 <20231113193347.67dd7f75@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113193347.67dd7f75@endymion.delvare>

On Mon, Nov 13, 2023 at 07:33:47PM +0100, Jean Delvare wrote:
> Hi Simon,
> 
> On Mon, 13 Nov 2023 18:01:07 +0000, Simon Horman wrote:
> > On Mon, Nov 13, 2023 at 03:45:22PM +0100, Jean Delvare wrote:
> > > Only present the DWMAC_LOONGSON option on architectures where it can
> > > actually be used.
> > > 
> > > This follows the same logic as the DWMAC_INTEL option.
> > > 
> > > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > > Cc: Keguang Zhang <keguang.zhang@gmail.com>
> > > ---
> > > I'm not familiar with the hardware, so please let me know if the
> > > dependency needs to be adjusted somehow.
> > > 
> > >  drivers/net/ethernet/stmicro/stmmac/Kconfig |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > --- linux-6.6.orig/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > +++ linux-6.6/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > @@ -269,7 +269,7 @@ config DWMAC_INTEL
> > >  config DWMAC_LOONGSON
> > >  	tristate "Loongson PCI DWMAC support"
> > >  	default MACH_LOONGSON64
> > > -	depends on STMMAC_ETH && PCI
> > > +	depends on MACH_LOONGSON64 && STMMAC_ETH && PCI  
> > 
> > Could we consider also allowing the build to occur if COMPILE_TEST is set?
> > This would maintain the current level of build test coverage.
> > 
> > Something line this (completely untested!):
> > 
> > 	depends on (MACH_LOONGSON64 || COMPILE_TEST) && STMMAC_ETH && PCI
> 
> Sure, that would be totally fine with me.

Thanks,

I think that if no one objects within the next day or so then posting a v2
would be a good next step.

