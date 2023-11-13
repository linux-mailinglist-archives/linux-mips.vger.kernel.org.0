Return-Path: <linux-mips+bounces-35-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10C7EA2E7
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 19:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B85671C2084E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 18:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195E122309;
	Mon, 13 Nov 2023 18:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WJ9gwhFX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gRidJBkx"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E623740;
	Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F860D7A;
	Mon, 13 Nov 2023 10:33:50 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05EC521907;
	Mon, 13 Nov 2023 18:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699900429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=soOdXumH4FhZ5xbNPSig1EhiYi8oZDjhhokKVPOIjuY=;
	b=WJ9gwhFXUC2xF6wicIZeEwVQJBbmCCr2QdQLjy4NQAwStC0t3Y7j0TL5/m0Cx8UbmdbkUL
	WRTqZJ7rNTWHeE3sUZ4b0rS7Jw1iY3gFDLqcRL7U4KWEkC4hUwVxDWxalU/rtR8itTCnnE
	V3gzw6duiXCYL7DMj/lxag3qFdZuxwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699900429;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=soOdXumH4FhZ5xbNPSig1EhiYi8oZDjhhokKVPOIjuY=;
	b=gRidJBkx2PJCgMU/gz/xh4MrNm5AhTY0nwVZmJ/s04la8ep5btOSizyCuklQm8/ndixQDg
	R4e3kwS0yNuvbABg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C266713398;
	Mon, 13 Nov 2023 18:33:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6ua+LQxsUmX2KAAAMHmgww
	(envelope-from <jdelvare@suse.de>); Mon, 13 Nov 2023 18:33:48 +0000
Date: Mon, 13 Nov 2023 19:33:47 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Simon Horman <horms@kernel.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: |PATCH] stmmac: dwmac-loongson: Add architecture dependency
Message-ID: <20231113193347.67dd7f75@endymion.delvare>
In-Reply-To: <20231113180107.GA52493@kernel.org>
References: <20231113154522.0bca3521@endymion.delvare>
	<20231113180107.GA52493@kernel.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Simon,

On Mon, 13 Nov 2023 18:01:07 +0000, Simon Horman wrote:
> On Mon, Nov 13, 2023 at 03:45:22PM +0100, Jean Delvare wrote:
> > Only present the DWMAC_LOONGSON option on architectures where it can
> > actually be used.
> > 
> > This follows the same logic as the DWMAC_INTEL option.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Keguang Zhang <keguang.zhang@gmail.com>
> > ---
> > I'm not familiar with the hardware, so please let me know if the
> > dependency needs to be adjusted somehow.
> > 
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > --- linux-6.6.orig/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ linux-6.6/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -269,7 +269,7 @@ config DWMAC_INTEL
> >  config DWMAC_LOONGSON
> >  	tristate "Loongson PCI DWMAC support"
> >  	default MACH_LOONGSON64
> > -	depends on STMMAC_ETH && PCI
> > +	depends on MACH_LOONGSON64 && STMMAC_ETH && PCI  
> 
> Could we consider also allowing the build to occur if COMPILE_TEST is set?
> This would maintain the current level of build test coverage.
> 
> Something line this (completely untested!):
> 
> 	depends on (MACH_LOONGSON64 || COMPILE_TEST) && STMMAC_ETH && PCI

Sure, that would be totally fine with me.

-- 
Jean Delvare
SUSE L3 Support

