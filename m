Return-Path: <linux-mips+bounces-9608-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A41AF5880
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 15:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D9B4188AD63
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 13:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385A2285059;
	Wed,  2 Jul 2025 13:19:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C60724C692;
	Wed,  2 Jul 2025 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462361; cv=none; b=KgGPE1k61xDQY51syRsmeoSEZyBsqFc+7lYVp2Ufe53gZgv9gOCAR3tSy3X4jmu/RPqt++WY71fd2LqDJuXqR3f4cnXCh0JCJSiTB7X01VzfmOyAXJrq5Dd5c6Xb+DRhgst39KGyADlGuRAUyVCpoCGovbTBCL1cEmtGWVpuV4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462361; c=relaxed/simple;
	bh=udNkjCxyote3zQh41UVTHvu/1KfmqxyBUqy2IZz3Yk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzC5Xwxu6W4xrgSYJvFeP3ex3LNlm2Vxp7ibSZNPoaPZ834SzTasLuP6cXjcLE5AvExYqkWPSC2J3bT7FMIFMo5AHJPUjsifXeq8UfrtJI0f0dR0WpERahlyk7es/M8O+KNDVljPE23YiehQ3wOZth+JXTNc2TWcI9NUDWKMP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uWwaa-00058A-00; Wed, 02 Jul 2025 14:29:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 73176C0176; Wed,  2 Jul 2025 13:55:45 +0200 (CEST)
Date: Wed, 2 Jul 2025 13:55:45 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS/Loongson: Fix build warnings about export.h
Message-ID: <aGUeQbBfh211DNMI@alpha.franken.de>
References: <20250608142010.161632-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608142010.161632-1-chenhuacai@loongson.cn>

On Sun, Jun 08, 2025 at 10:20:10PM +0800, Huacai Chen wrote:
> After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") and 7d95680d64ac8e836c ("scripts/misc-check:
> check unnecessary #include <linux/export.h> when W=1"), we get some build
> warnings with W=1:
> 
> arch/mips/loongson64/setup.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> 
> So fix these build warnings for MIPS/Loongson.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/mips/loongson64/setup.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
> index 257038e18779..b3e590eae952 100644
> --- a/arch/mips/loongson64/setup.c
> +++ b/arch/mips/loongson64/setup.c
> @@ -3,7 +3,6 @@
>   * Copyright (C) 2007 Lemote Inc. & Institute of Computing Technology
>   * Author: Fuxin Zhang, zhangfx@lemote.com
>   */
> -#include <linux/export.h>
>  #include <linux/init.h>
>  
>  #include <asm/bootinfo.h>
> -- 
> 2.47.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

