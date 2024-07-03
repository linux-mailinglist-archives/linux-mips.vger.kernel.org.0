Return-Path: <linux-mips+bounces-4109-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6D99264C0
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 17:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECAC71F22E38
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 15:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED34C1607A3;
	Wed,  3 Jul 2024 15:24:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6071DA318;
	Wed,  3 Jul 2024 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720020289; cv=none; b=oJSxj1vPwfT2vcSGWJZOxGXdKO1wLr/Q2R3QE7Jf1NCWm8Z9nKFOCsRHtRqdNh6y/as012RtayED4iQjaBUnq+y7es39JochPhxdgImI6/0FiuSxIyqYz2506QVs1k26gQv9pUXMmLijEAhHW1JTKhsCU2NxhKmgJdf/IATAif4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720020289; c=relaxed/simple;
	bh=f2VlntDPZyYsu2l+HIMJ//cyiso6k/4+/tCuWCWUWpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uE3gz6Rc5Amo7zv+dh/keQZvWq29mzqzqkXoIlibAx9rt+W4r/SddQdRhJrHfiIy81rQHSpowd7ED+yZy5JAHzB1XVpARiTYDdzCQ1RpJiUqS8y+cdeM+A8odnTYkRQtjUtQ+8uD/TSwCjfMyjCMkteBMZ87nz/VedU6rljZFjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sP1qd-0000Hc-00; Wed, 03 Jul 2024 17:24:43 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 67022C0120; Wed,  3 Jul 2024 17:18:37 +0200 (CEST)
Date: Wed, 3 Jul 2024 17:18:37 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Martin Schiller <ms@dev.tdt.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: switch to use software nodes for GPIOs
Message-ID: <ZoVrzeDowOCaq+SU@alpha.franken.de>
References: <ZoNAWoJ12DyApZ1s@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoNAWoJ12DyApZ1s@google.com>

On Mon, Jul 01, 2024 at 04:48:42PM -0700, Dmitry Torokhov wrote:
> Switch to use software nodes/properties to describe GPIOs for the
> ADS7846 touchscreen and the SPI controller (away from using GPIO lookup
> tables). This allows removing use of ADS7846 platform data, which will
> be going away.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> Compiled only, as I do not have access to the hardware. However I would
> very much like to get rid of ads7846_platform_data from the
> kernel/ads7846 driver, and this is one of the last 3 users of it.
> 
>  arch/mips/alchemy/devboards/db1000.c | 80 +++++++++++++++-------------
>  1 file changed, 42 insertions(+), 38 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

