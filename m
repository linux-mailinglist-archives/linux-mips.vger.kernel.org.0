Return-Path: <linux-mips+bounces-8796-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E37FA9E124
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBD647A39FD
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0254F1F4736;
	Sun, 27 Apr 2025 08:48:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57E02C9D;
	Sun, 27 Apr 2025 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743705; cv=none; b=sD0MEsMvtdRLHyFuPEap+qaPrTcBJQc/tlm/DjPc/A0eOgPFt4eBzaVl0Qd5PHSBuhjkmjV5jOQla/20MDSQKOJr8cZ8vGMLeZVODwAewHKficw+cdnyje13k3UxCqovGUKighoxaWvOlSJhsMY5tFmgcSvDj3BsJGJyHcY9QUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743705; c=relaxed/simple;
	bh=LDbOW/OeKhxk0X7ZGisuyjNFcuXY231ebdf3zLav5fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Av5D8ARuyUtikbhwuh5pJnrDj7y88VVSa2jz5GVtvpQeOIa4Zy/R2i1WpiyWCWKZHwVtr7AFPzgn1FkNqDRuIKeUG5jL3MMVkTxRdmHSCKzEODatVZtLa+54e8boc52oQVqpZh8cbjGLmEKbAqbbN989Oes0FpsSq0JqcNFBViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8wsd-0007Km-00; Sun, 27 Apr 2025 09:56:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 73E17C0AE5; Sun, 27 Apr 2025 09:55:01 +0200 (CEST)
Date: Sun, 27 Apr 2025 09:55:01 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/4] MIPS: convert board-file GPIO drivers to using new
 value setters
Message-ID: <aA3i1f9swE1olhCV@alpha.franken.de>
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>

On Mon, Apr 07, 2025 at 09:25:06AM +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of 
> converting all GPIO drivers to using the new API. This series converts 
> all MIPS board-file level controllers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (4):
>       MIPS: rb532: gpio: use new line value setter callbacks
>       MIPS: bcm63xx: gpio: use new line value setter callbacks
>       MIPS: alchemy: gpio: use new line value setter callbacks
>       MIPS: txx9: gpio: use new line value setter callbacks
> 
>  arch/mips/alchemy/common/gpiolib.c | 6 ++++--
>  arch/mips/bcm63xx/gpio.c           | 7 ++++---
>  arch/mips/kernel/gpio_txx9.c       | 8 +++++---
>  arch/mips/rb532/gpio.c             | 8 +++++---
>  arch/mips/txx9/generic/setup.c     | 8 +++++---
>  5 files changed, 23 insertions(+), 14 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

