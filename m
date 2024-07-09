Return-Path: <linux-mips+bounces-4196-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE492B2B3
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 10:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7DD1F22772
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 08:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F121534E7;
	Tue,  9 Jul 2024 08:55:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832E7152E0F;
	Tue,  9 Jul 2024 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515354; cv=none; b=VbdICqXftiWUqTuQX8p/Y4SmqZgDPul29FRGRPUbkCt0mvn39I+8WLPj/8m8iKJQeH6JM5UsKTTVKSYDErmtMSK/QvtKRti/I7gANCfLPseRBWTVeckf34kxeW0E3e31a6JZ6Wv4HfuP1s0QcWItvHr+eJLQb1AxJN2JlE7sI5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515354; c=relaxed/simple;
	bh=r7XJXC135fNXcHK/vnUsuCK8i8N2/QLU1/F8LN6sIfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWaTRqRqInUfe5Xd81wbZiaqFT9zke5fdYqUAlkM1gTzLMniF6kpdG+4Nf+Zm4Y4ts6yyYKeqOs35CPmCTsPPfvv43n6cI8A7hlyggG+dh+bJ3g+w088I8WqcYMD6Kq6uNIE/Ek8KfPU+dKrG91SLSbACvLzgUXOizJpkOgBEsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sR6dK-0000Pm-00; Tue, 09 Jul 2024 10:55:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BFC59C0688; Tue,  9 Jul 2024 10:51:29 +0200 (CEST)
Date: Tue, 9 Jul 2024 10:51:29 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Songyang Li <leesongyang@outlook.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Octeron: remove source file executable bit
Message-ID: <Zoz6ET4tv54fsUtN@alpha.franken.de>
References: <20240705074831.3620158-1-dominique.martinet@atmark-techno.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705074831.3620158-1-dominique.martinet@atmark-techno.com>

On Fri, Jul 05, 2024 at 04:48:30PM +0900, Dominique Martinet wrote:
> This does not matter the least, but there is no other .[ch] file in the
> repo that is executable, so clean this up.
> 
> Fixes: 29b83a64df3b ("MIPS: Octeon: Add PCIe link status check")
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> (Noticed this when reviewing the latest stable release, as the mode
> change line stood out in my viewer)
> 
>  arch/mips/pci/pcie-octeon.c | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100755 => 100644 arch/mips/pci/pcie-octeon.c
> 
> diff --git a/arch/mips/pci/pcie-octeon.c b/arch/mips/pci/pcie-octeon.c
> old mode 100755
> new mode 100644
> -- 
> 2.39.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

