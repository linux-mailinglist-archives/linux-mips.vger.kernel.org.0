Return-Path: <linux-mips+bounces-10935-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BB7B3FEDA
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 13:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D968D1B2607D
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 11:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5772F4A18;
	Tue,  2 Sep 2025 11:56:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F0026F298;
	Tue,  2 Sep 2025 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814192; cv=none; b=tlnY21e45oii6lTD5yA2zLv/mZ7tIEMS8YnEY01l/P1OuH99sMpyAu/Q3HLcUluhGaQbJhFFR6ahHcASZWt3o/b88f3KUhPNXWLm5RgbKeYuEU096zIdijr0krpOdF+OlloACAPvwMt3zLbFwUAEmLPMvcvtRHHoZ9pVzbLDQ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814192; c=relaxed/simple;
	bh=shc/J8ooiiB5CLgwUwFUvAqayCLu3IHyVA97gI0n+mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3+2iYvsnHV9i8jdmQmgEM8ooNgDPPPSG4TTIF6Ii6Aa11cKv9H51d+AqoHmlCX3VdJVhcCIVTwzhkjS+TPleimNr5ltrLguFRjpunD+w1VFZzClgy5dFd+6v6zdIAmC25+TmMepbNtMM5jb3m1MVcsJWnfYXtPoFKcU0in1QVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1utPca-0005h8-00; Tue, 02 Sep 2025 13:56:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4F32BC04FD; Tue,  2 Sep 2025 13:55:47 +0200 (CEST)
Date: Tue, 2 Sep 2025 13:55:47 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: math-emu: replace deprecated strcpy() in me-debugfs
Message-ID: <aLbbQ1vwnXYwU6JJ@alpha.franken.de>
References: <20250901133920.94022-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901133920.94022-1-osama.abdelkader@gmail.com>

On Mon, Sep 01, 2025 at 03:39:19PM +0200, Osama Abdelkader wrote:
> use strscpy() instead of deprecated strcpy().
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  arch/mips/math-emu/me-debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/math-emu/me-debugfs.c b/arch/mips/math-emu/me-debugfs.c
> index d5ad76b2bb67..94667cbe18e7 100644
> --- a/arch/mips/math-emu/me-debugfs.c
> +++ b/arch/mips/math-emu/me-debugfs.c
> @@ -41,7 +41,7 @@ static void adjust_instruction_counter_name(char *out_name, char *in_name)
>  {
>  	int i = 0;
>  
> -	strcpy(out_name, in_name);
> +	strscpy(out_name, in_name, sizeof(out_name));

this is wrong. sizeof(out_name) is the size of the pointer, but not the
size of the storage behind it. To be able to use strscpy() here you
need to pass in the size of the given buffer and use that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

