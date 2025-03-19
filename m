Return-Path: <linux-mips+bounces-8229-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49865A689C6
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 11:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A4E7188C940
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 10:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786A0253F20;
	Wed, 19 Mar 2025 10:38:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104B620E31B;
	Wed, 19 Mar 2025 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742380705; cv=none; b=BVM3LbWR3qbnbBu5SURkSoK33lZOOPhUfUSZm+n5/Si/7YPb0tjR5Xns8tn5+WabDT47ckuanF7blHLCZJCBNIgmJXRFMML+Zz1NsdtuhswxaZj+X/UcUEvNIBMapmZRQSvdIYayJg7ToWzzE4mCwghtUv2u/V9bHnHc+oV73qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742380705; c=relaxed/simple;
	bh=TELPUHTcNteq2ZSAO++pwhwK+VXofLQZHkSNuVTJm+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkXaXNdntIasMUvPOPAJlUCIkDCLiYH0ZkWJ2Lydn/Dt/WZksA+pPFVb0T4qhWGh9vP8ZrJpVyv2wz1PTnQFlWOv9+QiQNPugLrF3NkXzd3KWuQRHqP5lVElke6IFB8RNYXP73ATLjFiy3mCVKkHpoBrUOfLzlsxaR2Phkkrl0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tuqoW-0003rj-00; Wed, 19 Mar 2025 11:38:20 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DE247C0135; Wed, 19 Mar 2025 11:38:09 +0100 (CET)
Date: Wed, 19 Mar 2025 11:38:09 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: fix PCI_IOBASE definition
Message-ID: <Z9qekYr_pYwI7dpf@alpha.franken.de>
References: <20250318214406.874733-1-arnd@kernel.org>
 <CAMhs-H_3WTMvd0kitT6Bp3a5ijjwhwEYhWbFTQ2uUQpmis12cQ@mail.gmail.com>
 <9066761b-e222-4855-b97f-17c36b1440e1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9066761b-e222-4855-b97f-17c36b1440e1@app.fastmail.com>

On Wed, Mar 19, 2025 at 11:07:46AM +0100, Arnd Bergmann wrote:
> On Wed, Mar 19, 2025, at 10:43, Sergio Paracuellos wrote:
> > Hi Arnd,
> >
> > On Tue, Mar 18, 2025 at 10:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > It looks like nothing got broken regarding PCI enumeration on boot
> > trace. I don't have real PCI cards with IO resources to test, but FWIW
> > the enumeration is the same as from my stable 6.12 kernel boot.
> >
> 
> Thanks a lot for testing!

are you taking it together with your other io,h cleanups ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

