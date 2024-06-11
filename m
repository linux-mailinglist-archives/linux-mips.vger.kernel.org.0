Return-Path: <linux-mips+bounces-3581-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45945903BCA
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 14:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58A561C2313B
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 12:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E42717C7DB;
	Tue, 11 Jun 2024 12:22:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7763217C212;
	Tue, 11 Jun 2024 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108545; cv=none; b=LBiL3VYrFxCum/6g9PIz6VvzDZXUBGD4ToGIIGEMUbH6i7tnvm7yUQxjU8RyNbPxztbbVnM05MommInGm9mtJYlCx6J+H2G2a08HZiRXgtQD2HJRRFMX4Ir/7vHWLNWbXgOGDhgW0hJXhOJGLCym2tnoJOQQNNd3Zi+ugK1nd8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108545; c=relaxed/simple;
	bh=s4i3OIqNsYgSVGWVGLsHEh5Gly0pjWx7R8CJF+pwBnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rE0HNEZYuT14P7YLwP3D7wjxlQVQFDCOQfWTyTlPrEKWkGqQEL9Q0HjoT0oDjgiqhkoJQzSV8Y1BLiFgrxhZSJQ1UZ8iY1NR5kTr3jwmPnjXYEGLI5w2JIt/WDv6h0k4/aQ4U8tRGD5/wGYrvQczJsEaz4b2UKgaVBNLyRsqpbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sH0Vq-0002Bj-00; Tue, 11 Jun 2024 14:22:06 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 44D0EC0411; Tue, 11 Jun 2024 13:21:25 +0200 (CEST)
Date: Tue, 11 Jun 2024 13:21:25 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Genjian <zhanggenjian@126.com>
Cc: chenhuacai@kernel.org, jiaxun.yang@flygoat.com, ricardo@marliere.net,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Genjian Zhang <zhanggenjian@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH 2/3] MIPS: sgi-ip22: Add prototypes for several functions
 to header
Message-ID: <ZmgzNcCw9PIwvK1x@alpha.franken.de>
References: <20240516115906.1224164-1-zhanggenjian@126.com>
 <20240516115906.1224164-2-zhanggenjian@126.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240516115906.1224164-2-zhanggenjian@126.com>

On Thu, May 16, 2024 at 07:59:05PM +0800, Genjian wrote:
> From: Genjian Zhang <zhanggenjian@kylinos.cn>
> 
> This fixes the following build warning:
> 
> arch/mips/sgi-ip22/ip22-time.c:119:18: error: no previous prototype for ‘indy_8254timer_irq’ [-Werror=missing-prototypes]
> arch/mips/sgi-ip22/ip22-berr.c:89:6: error: no previous prototype for ‘ip22_be_interrupt’ [-Werror=missing-prototypes]
> arch/mips/sgi-ip22/ip22-berr.c:113:13: error: no previous prototype for ‘ip22_be_init’ [-Werror=missing-prototypes]
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
> ---
>  arch/mips/include/asm/sgi/ip22.h | 3 +++
>  arch/mips/sgi-ip22/ip22-int.c    | 2 --
>  arch/mips/sgi-ip22/ip22-setup.c  | 2 --
>  3 files changed, 3 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

