Return-Path: <linux-mips+bounces-3582-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C708E903BCB
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 14:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29F54286895
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 12:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D1517C9F1;
	Tue, 11 Jun 2024 12:22:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0533217C22E;
	Tue, 11 Jun 2024 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108546; cv=none; b=D+AV81/fCvP0v73rf/I7+JZ3xJRkwsTuEIn8RT0H2VyCxWv2l/e6FYsuNXkK5KfRXdJOZ4EOS1H23if8yeA61eDflYCgRspo17/dtCXqlZG+Ue/LXWsOj0F0ZXsyQ/LXOM5OWE6YEoC92tiRSKkDImqk4bycFT8t53R6WVhGqqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108546; c=relaxed/simple;
	bh=eIWN7NRUfG25J8xTCyoCIcTUao9W0hMxtDsFna6hIvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T85sQ6xcnf2uWVZGaF0EBevC0+EdKhI5WM75bXwfGtV/jC/t8cJszWrsKsAS/a7jkVY0sAtG23/Qupb66FM6WfBSqt3/6JmBPXb8BjWhY+8c+i9hl3bLTaurBRSvFLVr3mtbkQ3iaOuIwYLSACziKmjc+Ctfrn3byCbWfhyDGJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sH0Vq-0002Bh-00; Tue, 11 Jun 2024 14:22:06 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4838BC0A35; Tue, 11 Jun 2024 13:21:54 +0200 (CEST)
Date: Tue, 11 Jun 2024 13:21:54 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Genjian <zhanggenjian@126.com>
Cc: chenhuacai@kernel.org, jiaxun.yang@flygoat.com, ricardo@marliere.net,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Genjian Zhang <zhanggenjian@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH 3/3] MIPS: ip22-gio: Make ip22_gio_set_64bit() and
 ip22_gio_init() static
Message-ID: <ZmgzUqORONkQLWoA@alpha.franken.de>
References: <20240516115906.1224164-1-zhanggenjian@126.com>
 <20240516115906.1224164-3-zhanggenjian@126.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240516115906.1224164-3-zhanggenjian@126.com>

On Thu, May 16, 2024 at 07:59:06PM +0800, Genjian wrote:
> From: Genjian Zhang <zhanggenjian@kylinos.cn>
> 
> These functions are used in only one file.
> Made them static to fix the following build error:
> 
> arch/mips/sgi-ip22/ip22-gio.c:249:6: error: no previous prototype for ‘ip22_gio_set_64bit’ [-Werror=missing-prototypes]
> arch/mips/sgi-ip22/ip22-gio.c:398:12: error: no previous prototype for ‘ip22_gio_init’ [-Werror=missing-prototypes]
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
> ---
>  arch/mips/sgi-ip22/ip22-gio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

