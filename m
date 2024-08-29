Return-Path: <linux-mips+bounces-5206-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA053963F20
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3D9286D50
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8FC18E77B;
	Thu, 29 Aug 2024 08:52:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A097418E76E
	for <linux-mips@vger.kernel.org>; Thu, 29 Aug 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921548; cv=none; b=I4+4jETykYSESQjZ4dP7L3hvdiweVRWL5d0VI+50c/P+LzishDhF+YU9T5aLlYMlaivl2If8t0MHrjsef1Ry6EbomvQA90L1IWBiVQvt7ewGK6nrTg02+UEF0d8v5OvcqJp8MA42OZxK/lMlm2tOeD3CYjI+zD1uDBMTY8fxpj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921548; c=relaxed/simple;
	bh=dc3HRPTUEi8lfoxlrgFpIa9EucUtz84fk6vDY4NV768=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riEdJ2YwolqlQL7PB4te1KLtooFwuuDXP35gdu8OqU5NnSCcxlX0iJk8IYrIrECgnNlXHaKak3bbIbwaMnZUDMxiR5slDYzeICzm2ZLtLqqu6qmNDVe0IMY6HfUEmz+iZPq9HU63l/doCImyBnIQ5Yi/8fdmSuk5JIPE7MTDc5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005n1-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9162CC0AE2; Thu, 29 Aug 2024 10:47:13 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:47:13 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: javierm@redhat.com, philmd@linaro.org, arnd@arndb.de,
	dinguyen@kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] mips/jazz: remove unused jazz_handle_int()
 declaration
Message-ID: <ZtA1kWucEc4nWrW7@alpha.franken.de>
References: <20240814103739.2053421-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814103739.2053421-1-cuigaosheng1@huawei.com>

On Wed, Aug 14, 2024 at 06:37:39PM +0800, Gaosheng Cui wrote:
> The jazz_handle_int() has been removed since
> commit e4ac58afdfac ("[MIPS] Rewrite all the assembler interrupt
> handlers to C."), so remove it.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  arch/mips/jazz/setup.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
> index e318ea11c858..d21e5d441f53 100644
> --- a/arch/mips/jazz/setup.c
> +++ b/arch/mips/jazz/setup.c
> @@ -23,8 +23,6 @@
>  #include <asm/reboot.h>
>  #include <asm/tlbmisc.h>
>  
> -extern asmlinkage void jazz_handle_int(void);
> -
>  extern void jazz_machine_restart(char *command);
>  
>  static struct resource jazz_io_resources[] = {
> -- 
> 2.25.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

