Return-Path: <linux-mips+bounces-3927-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8BB91606C
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2024 09:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2962A1C2230D
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2024 07:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E67146A96;
	Tue, 25 Jun 2024 07:52:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D05614658B;
	Tue, 25 Jun 2024 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719301973; cv=none; b=tBeyMWAHcGzxWZyvervqVdh68JDxm0qAvavIBD/mnppnPNgGltt/FQd1h7W3hLWzBBrTrJBiuQYpWxOujlb/l8ZCxSmKGnKvFp5SpWKJna7AO27/+8S8PwA3aLL0F+l5kS+OGRuDavgHk26xfzM3Xd4bnpAZb6kTlq4/0zGdzos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719301973; c=relaxed/simple;
	bh=AvYC5GQjP0eJrzzg9YU4bnUFsZcc1IeukHb4ta+oexY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H46cbq/w0+KtvO7mQUYpNFyWdtEB5t9dkVGgbc87M4wBcsqdR9Z2s2QoHNeyXGkQzxKPHalFgocrZE7y04spVhuUcJXCruWidzy/XywYk4QvmLymQR4EdioLQBYRVAJ58NvtgmTWmT/3r+7wV3jkjYeea7RjvmyxnRy2xGGBJKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sM0yX-0007Ce-00; Tue, 25 Jun 2024 09:52:25 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 31012C0120; Tue, 25 Jun 2024 09:52:04 +0200 (CEST)
Date: Tue, 25 Jun 2024 09:52:04 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Khalid Aziz <khalid@gonehiking.org>, Baoquan He <bhe@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: Re: [PATCH V2] mips: kernel: fix detect_memory_region() function
Message-ID: <Znp3JKF6UUn2YuvL@alpha.franken.de>
References: <TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>

On Tue, Jun 25, 2024 at 09:44:44AM +0800, Shiji Yang wrote:
> The detect_memory_region() has been broken on 6.6 kernel[1]. This
> patch fixes it by:
> 1. Do not use memcmp() on unallocated memory, as the new introduced
>    fortify dynamic object size check[2] will return unexpected result.

hmm, so there should a new way for doing memory probing without
triggering this fortify check. How do other platforms deal with this ?

> 2. Use a fixed pattern instead of a random function pointer as the
>    magic value.

why is this better ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

