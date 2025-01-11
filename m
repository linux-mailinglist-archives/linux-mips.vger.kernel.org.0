Return-Path: <linux-mips+bounces-7397-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AE8A0A390
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 13:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96CFB16A7DC
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 12:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5037194096;
	Sat, 11 Jan 2025 12:19:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23C719309E;
	Sat, 11 Jan 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736597942; cv=none; b=Czc4VmHILhIKJlwPJYaZNdZ4Ohyoe4+QYh50/s6emzbL2y43DBDaxIER55JZg4cuqZe3htXtUp9w1QswltFDqFADqoiHmAUYeMzu8c/nUvSfoAT2jVuSh5FnmYcG2GboMJj0ySbbBBB7odFLf0TAXfG2tmKjpZtQgwW4wX8EKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736597942; c=relaxed/simple;
	bh=K5sydUNG4iEPovuPHK9zQGCPJ/MkrUUFVN02k3Csy4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWofja8RqlJ26PWIawOrDoCJHIXrjxTyZlwUp+d98/dbJ/JgaJpptTQZA73mCXjRGxF/NQW3MvK7HOSjQrLmHdV5Gc8MwCAwUY8UA78G2RpFt/4OzvQNurh5bxOTl4kXADiZzbQAkU+P0b/wIprmkxThBkp1QEB8jI6V5rp79Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tWaRL-0006NW-00; Sat, 11 Jan 2025 13:18:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 8AE78C081B; Sat, 11 Jan 2025 13:04:18 +0100 (CET)
Date: Sat, 11 Jan 2025 13:04:18 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Klara Modin <klarasmodin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Add a blank line after __HEAD
Message-ID: <Z4JeQlQGJpyuJmM9@alpha.franken.de>
References: <20241203173431.3790387-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203173431.3790387-1-xur@google.com>

On Tue, Dec 03, 2024 at 09:34:31AM -0800, Rong Xu wrote:
> Add a blank line after __HEAD in the text section.
> 
> The __HEAD symbol was added in commit 52892ed6b03a ("MIPS:
> Place __kernel_entry at the beginning of text section").
> 
> Signed-off-by: Rong Xu <xur@google.com>
> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
> 
> ---Changelog--
> Added suggested-by.
> ---
>  arch/mips/kernel/head.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> index e3ff6179c99f9..d99ed58b7043d 100644
> --- a/arch/mips/kernel/head.S
> +++ b/arch/mips/kernel/head.S
> @@ -60,6 +60,7 @@
>  	.endm
>  
>  	__HEAD
> +
>  #ifndef CONFIG_NO_EXCEPT_FILL
>  	/*
>  	 * Reserved space for exception handlers.
> 
> base-commit: e70140ba0d2b1a30467d4af6bcfe761327b9ec95
> -- 
> 2.47.0.338.g60cca15819-goog

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

