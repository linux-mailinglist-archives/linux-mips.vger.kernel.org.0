Return-Path: <linux-mips+bounces-3851-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E8B912E91
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 22:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF4A6B272AD
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 20:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEE017B50D;
	Fri, 21 Jun 2024 20:32:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5C6146017;
	Fri, 21 Jun 2024 20:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719001949; cv=none; b=tkR4Sy919mlfV9dDsw8BBMtQtGAHVMKpBxDuPjvvndHcaWF256KgawbF1uIs+VLWIRr3RZGNAaVLN805Vp7pjPs/YPeO7q7ipPtnfKqk4GgIyTAg6cuVPDDvLhySXyfnw4yEbNnMRNyMvdyWvmYkdI8I9qbieLn4KPKHNjy6mJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719001949; c=relaxed/simple;
	bh=gE2ViUah1IOM2sFBbFJHidv3pjaO7zrqCmYujLwwOeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESmNV8oIOLVwt9jqDr3xRwOFBeoxiKPe2wbZ/Mn3F+ZRB5/B7i9fCMl7rrPIsZIxWyRYAsMCJ0WSVLpyVLcRm5TqberqoRyuVMtMx/sVVwoeCvLMCVMuN6NxuDvFNiu6oE1IbTb4g06R2v6Vzxjl5nuQ4UpmB1G34sBia78eLWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKkva-0000N7-00; Fri, 21 Jun 2024 22:32:10 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6A9EFC0120; Fri, 21 Jun 2024 22:31:21 +0200 (CEST)
Date: Fri, 21 Jun 2024 22:31:21 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] MIPS: Introduce config options for LLSC
 availability
Message-ID: <ZnXjGRoKoRUeWpI+@alpha.franken.de>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
 <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>
 <alpine.DEB.2.21.2406210041140.43454@angie.orcam.me.uk>
 <2c26a07f-fa68-48f1-8f3b-3b5e4f77130b@app.fastmail.com>
 <alpine.DEB.2.21.2406211446500.43454@angie.orcam.me.uk>
 <83cf475c-86a3-4acb-bc82-d94c66c53779@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83cf475c-86a3-4acb-bc82-d94c66c53779@app.fastmail.com>

On Fri, Jun 21, 2024 at 04:21:49PM +0100, Jiaxun Yang wrote:
> Does anyone reckon the reason behind opt-out LLSC for IP28? As far as I understand
> there is no restriction on using LLSC after workaround being applied. If it's purely
> performance reason, I think I'll need to move kernel_uses_llsc logic to Kconfig as well.

commit 46dd40aa376c8158b6aa17510079caf5c3af6237
Author: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date:   Wed Oct 7 12:17:04 2020 +0200

    MIPS: SGI-IP28: disable use of ll/sc in kernel
    
    SGI-IP28 systems only use broken R10k rev 2.5 CPUs, which could lock
    up, if ll/sc sequences are issued in certain order. Since those systems
    are all non-SMP, we can disable ll/sc usage in kernel.
    
    Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>


Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

