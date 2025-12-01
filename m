Return-Path: <linux-mips+bounces-12383-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6B2C9670E
	for <lists+linux-mips@lfdr.de>; Mon, 01 Dec 2025 10:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 274B14E2278
	for <lists+linux-mips@lfdr.de>; Mon,  1 Dec 2025 09:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D90430217B;
	Mon,  1 Dec 2025 09:45:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98C63019A5;
	Mon,  1 Dec 2025 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582307; cv=none; b=SK863ctAcCqDzNoFnzaLB97/DnIourIGzxYdHAgn2qKzNcbR4Q0dvNYrB2HsCjpdW7rVOypHX3cNJYoZUV0749+PeNSqZLBrX3Er1ZFlChWVmulg2gKSlUTBU4Gki9eEt/wNb8qKBcJ5xHkd0W/+XL8nDg8flYNNcRsXhl7WlbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582307; c=relaxed/simple;
	bh=7lQvuIQPwXl/Y6giB1a5RkxJ3LoQ5ibsvANlLPCBq7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYtnnVNhzeSdGCEQh80V1K/dZbnye1KHmqtud2oYzDNAd99Oq5/fB4UU8roG5dUqL343sdpshBuyjxYHlo9r6eVsy+safi3aTbA5Ckd0sukVezGPAEt7D52BRbbP6VEbEppumNMsnj6fLxIiwtJ5c7BdMVNgWurqY6FcDypPA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vQ0Sn-0002g2-00; Mon, 01 Dec 2025 10:44:57 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7EA7BC0862; Mon,  1 Dec 2025 10:43:24 +0100 (CET)
Date: Mon, 1 Dec 2025 10:43:24 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] MIPS: alchemy: mtx1: switch to static device properties
Message-ID: <aS1jPMqIhl36Zucn@alpha.franken.de>
References: <retzurthfjwc6fqtkta6uhd2xje42vyugryj36yynesvxwygnv@wwmcx2yh4orm>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <retzurthfjwc6fqtkta6uhd2xje42vyugryj36yynesvxwygnv@wwmcx2yh4orm>

On Mon, Aug 11, 2025 at 03:41:28PM -0700, Dmitry Torokhov wrote:
> Convert GPIO-connected buttons and LEDs on MTX1 board to software
> nodes/properties, so that support for platform data can be removed
> from gpio-keys driver (which will rely purely on generic device
> properties for configuration).
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> This compiles but I have not tried it on real hardware.
> 
>  arch/mips/alchemy/board-mtx1.c | 181 ++++++++++++++++++++++-----------
>  1 file changed, 124 insertions(+), 57 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

