Return-Path: <linux-mips+bounces-3753-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2171A9108CF
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2086B255F8
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 14:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F811AE08B;
	Thu, 20 Jun 2024 14:46:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FB61AC42B;
	Thu, 20 Jun 2024 14:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894770; cv=none; b=qAoV68mfcC0bqR/o3bTq2Rr3xy0w9VQwX9xq1rm15SxSvorJaH2dOI1WDyjyXGL/Oy+vnaJAbxgOOmSrtVb1NKjDWgtXozsSoaAN3uyGW+Xu4UGt4KwQq36hTfrMnfFWc+rKiwryJT2mt2MIPIvXnR20HRyz538OeoUgCUi+3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894770; c=relaxed/simple;
	bh=JaVmcivnWj+9Be8PMYO7S0M/Z8S5Cwc4xP0uTz/4Mac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct+1J6271FL7WtCkchJsg7J321+Liqc87Gp5u7KJhOmHExVXxPlmPn9pk/YXNAneC08sZRTlOfIIpQLieT38KqshtGpYmILESvk3ghjA0WXLv5VO3t6yEF60psfTlz4rDssswUiWqvrHW8QbGcZjjvhP9a/knkThVVhEz6VoEx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKJ2m-0000tJ-00; Thu, 20 Jun 2024 16:45:44 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C46EFC0411; Thu, 20 Jun 2024 16:31:40 +0200 (CEST)
Date: Thu, 20 Jun 2024 16:31:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: mips/poly1305 - add missing MODULE_DESCRIPTION()
 macro
Message-ID: <ZnQ9TK9q/g3mSWga@alpha.franken.de>
References: <20240618-md-mips-arch-mips-crypto-v1-1-1ba592871112@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-md-mips-arch-mips-crypto-v1-1-1ba592871112@quicinc.com>

On Tue, Jun 18, 2024 at 06:01:29PM -0700, Jeff Johnson wrote:
> With ARCH=mips, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/mips/crypto/poly1305-mips.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  arch/mips/crypto/poly1305-glue.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/crypto/poly1305-glue.c b/arch/mips/crypto/poly1305-glue.c
> index bc6110fb98e0..867728ee535a 100644
> --- a/arch/mips/crypto/poly1305-glue.c
> +++ b/arch/mips/crypto/poly1305-glue.c
> @@ -186,6 +186,7 @@ static void __exit mips_poly1305_mod_exit(void)
>  module_init(mips_poly1305_mod_init);
>  module_exit(mips_poly1305_mod_exit);
>  
> +MODULE_DESCRIPTION("Poly1305 transform (MIPS accelerated");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS_CRYPTO("poly1305");
>  MODULE_ALIAS_CRYPTO("poly1305-mips");
> 
> ---
> base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
> change-id: 20240618-md-mips-arch-mips-crypto-19785d95418c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

