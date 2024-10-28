Return-Path: <linux-mips+bounces-6507-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749789B3548
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 16:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5ED01C21D75
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 15:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88001DE4FE;
	Mon, 28 Oct 2024 15:48:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39A31DED6F;
	Mon, 28 Oct 2024 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130507; cv=none; b=D1D8unJm9XGDEmsSQ+2hYi54kwMVnvkrIXZ/57aOCzi+zM0EQJnqiRFi+KO/lVwteB9ron5T2lcM8PlFduFQorhHFyGqNiKEYdsnHdDPaK1/0S3aGZbuLYDXkEFjbeBXnuwepmE0T/UiWBGMnUH8i+B8r8MFNRDnmGomXjlk1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130507; c=relaxed/simple;
	bh=ZRrch4ootEJ4ULxIvELRcvNDg+SmNed42LOYCz5Vd28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au3lHBZ4sdLCvIQMlRdZy+xKz3zqHCiX0yd7zWIl2bzvQE861I6ICacTwK/j2Seo2pFJCAOr1r+QCmNW/LkGStURDC7Kqz5cbx8+Q8E4gI49nmws94b3We0oZGF3vnzPkFioSVkfAkncR/Dsoyi3aDUDEzqg05iQtALt/r7H6nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1t5RyE-0005Ir-00; Mon, 28 Oct 2024 16:47:54 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0B333C0161; Mon, 28 Oct 2024 16:47:30 +0100 (CET)
Date: Mon, 28 Oct 2024 16:47:30 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v7 05/12] clocksource: mips-gic-timer: Always use cluster
 0 counter as clocksource
Message-ID: <Zx+yEvWTUKZqOEPh@alpha.franken.de>
References: <20241019071037.145314-1-arikalo@gmail.com>
 <20241019071037.145314-6-arikalo@gmail.com>
 <3c98775b-b61b-478f-838e-59f8e1cf8aed@linaro.org>
 <Zx+qrRVdv5EGXbCF@alpha.franken.de>
 <afda1ccc-d9fc-4025-b114-bd2ddf5f7ec1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afda1ccc-d9fc-4025-b114-bd2ddf5f7ec1@linaro.org>

On Mon, Oct 28, 2024 at 04:22:55PM +0100, Daniel Lezcano wrote:
> On 28/10/2024 16:15, Thomas Bogendoerfer wrote:
> > On Mon, Oct 28, 2024 at 03:54:48PM +0100, Daniel Lezcano wrote:
> > > On 19/10/2024 09:10, Aleksandar Rikalo wrote:
> > > > From: Paul Burton <paulburton@kernel.org>
> > > > 
> > > > In a multi-cluster MIPS system, there are multiple GICs - one in each
> > > > cluster - each of which has its independent counter. The counters in
> > > > each GIC are not synchronized in any way, so they can drift relative
> > > > to one another through the lifetime of the system. This is problematic
> > > > for a clock source which ought to be global.
> > > > 
> > > > Avoid problems by always accessing cluster 0's counter, using
> > > > cross-cluster register access. This adds overhead so it is applied only
> > > > on multi-cluster systems.
> > > > 
> > > > Signed-off-by: Paul Burton <paulburton@kernel.org>
> > > > Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> > > > Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> > > > Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> > > > Tested-by: Serge Semin <fancer.lancer@gmail.com>
> > > > ---
> > > 
> > > May I take this patch through the clocksource tree ?
> > 
> > sure, should be the best option.
> 
> Ok, thanks
> 
> Can you add your tag ?

it's only touching drivers/clocksource, but if you want

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

