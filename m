Return-Path: <linux-mips+bounces-11266-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D779B54FF5
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 15:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 669591D61061
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 13:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90B3155CB3;
	Fri, 12 Sep 2025 13:46:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EB72DC779;
	Fri, 12 Sep 2025 13:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757684800; cv=none; b=pJEe2ag0wWDffAD/uMFYYVUIWcPS2Z9L61BzM2UdvW7V3SoEVcpEZVtRz57KkNucM2B4FgvAlEyHsb6n1ptVgqwc2J9R/jSs5X+z3tGGM7RN4GzL0GCQwuItlsqwCdkG8HlidcE6hsiu3NmJ/m652XeWLed2+jCQwrp9PJPKfBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757684800; c=relaxed/simple;
	bh=awM10ARnSomfRf77X4JpgNoOS8RRUpOlj7vgTKGAv9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZ5I5VkMUYogPp/51saWw00COcj0etqbIcKhwuB7yVFOWF7wF5XuA/ISi5zh5sxNK1N7ocApBTrd99fqhKZmUN9GlSmH4YBf4Ezzg3N9NkrN2g2sGoo7A2O1jnDUutA8151VlrwbF6HJoy49zbd1li13zH7femEL310tc5ezDcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1ux3eW-0007Zl-00; Fri, 12 Sep 2025 15:17:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D91C6C0770; Fri, 12 Sep 2025 13:51:54 +0200 (CEST)
Date: Fri, 12 Sep 2025 13:51:54 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: macro@orcam.me.uk, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mips: math-emu: replace deprecated strcpy() in
 me-debugfs
Message-ID: <aMQJWlDsvZ8sADQ1@alpha.franken.de>
References: <20250904192525.39830-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904192525.39830-1-osama.abdelkader@gmail.com>

On Thu, Sep 04, 2025 at 09:25:25PM +0200, Osama Abdelkader wrote:
> use strscpy() instead of deprecated strcpy().
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
> v2:
> change function signature to get len and the caller.
> v3:
> use same parameters and arguments order
> ---
>  arch/mips/math-emu/me-debugfs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/math-emu/me-debugfs.c b/arch/mips/math-emu/me-debugfs.c
> index d5ad76b2bb67..49bf2b827ce2 100644
> --- a/arch/mips/math-emu/me-debugfs.c
> +++ b/arch/mips/math-emu/me-debugfs.c
> @@ -37,11 +37,11 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_fpuemu_stat, fpuemu_stat_get, NULL, "%llu\n");
>   * used in debugfs item names to be clearly associated to corresponding
>   * MIPS FPU instructions.
>   */
> -static void adjust_instruction_counter_name(char *out_name, char *in_name)
> +static void adjust_instruction_counter_name(char *out_name, char *in_name, size_t len)
>  {
>  	int i = 0;
>  
> -	strcpy(out_name, in_name);
> +	strscpy(out_name, in_name, len);
>  	while (in_name[i] != '\0') {
>  		if (out_name[i] == '_')
>  			out_name[i] = '.';
> @@ -226,7 +226,7 @@ do {									\
>  
>  #define FPU_STAT_CREATE_EX(m)						\
>  do {									\
> -	adjust_instruction_counter_name(name, #m);			\
> +	adjust_instruction_counter_name(name, #m, sizeof(name));			\
>  									\
>  	debugfs_create_file(name, 0444, fpuemu_debugfs_inst_dir,	\
>  				(void *)FPU_EMU_STAT_OFFSET(m),		\
> -- 
> 2.43.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

