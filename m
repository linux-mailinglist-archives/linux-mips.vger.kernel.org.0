Return-Path: <linux-mips+bounces-4020-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F107491BC71
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 12:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A74F61F21DDD
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 10:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BBB15534B;
	Fri, 28 Jun 2024 10:12:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from norbury.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A1F154444;
	Fri, 28 Jun 2024 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.24.177.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719569575; cv=none; b=YrhU3RFToRbn6sFDpfrp6IukI0D28IXCOXXA2imWUfd3jXK6f4KGluRxUSFO/aP3rr79K98RqohbD5c7ZFWhxqD+k9fHPkLvJSTCVwKEmli2Jyfi+aT80wAjNrjcAL24/sPDOySgsRVaKv0WDf3/gLJ3+ImfNmV0tlnC1hX31+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719569575; c=relaxed/simple;
	bh=pzwr6heChKxBnt2X3WfkhfOjAnEHnig9DA7aY1PlUp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTKAjQ/DDBTNUFaOKQScy0WVsgL/bixWHB/9WHtCDSleWH0UN+TMKRXHioIpdeJhKvQgFD7h2snBh0xdZ2XRKF33xjASxwQkEastbmZheDy1+M592Gd/ShnFN5je3KiPkcpw2fFU1gFBf9sZ7PJoYNCWd8WxL7ZgLEzOgoLfioM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=216.24.177.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by norbury.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sN8ag-004LRC-0i;
	Fri, 28 Jun 2024 20:12:27 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 28 Jun 2024 20:12:26 +1000
Date: Fri, 28 Jun 2024 20:12:26 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: WangYuli <wangyuli@uniontech.com>
Cc: davem@davemloft.net, tsbogend@alpha.franken.de,
	linux-crypto@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guan Wentao <guanwentao@uniontech.com>
Subject: Re: [PATCH] MIPS: crypto: Clean up useless assignment operations
Message-ID: <Zn6MiqGOD6p6YEul@gondor.apana.org.au>
References: <1D248893502B75F5+20240628084117.84264-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1D248893502B75F5+20240628084117.84264-1-wangyuli@uniontech.com>

On Fri, Jun 28, 2024 at 04:41:17PM +0800, WangYuli wrote:
> When entering the "len & sizeof(u32)" branch, len must be less than 8.
> So after one operation, len must be less than 4.
> At this time, "len -= sizeof(u32)" is not necessary for 64-bit CPUs.
> 
> A similar issue has been solved at Loongarch.
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.10-rc5&id=fea1c949f6ca5059e12de00d0483645debc5b206
> Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/mips/crypto/crc32-mips.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/mips/crypto/crc32-mips.c b/arch/mips/crypto/crc32-mips.c
> index ec6d58008f8e..505d2d897849 100644
> --- a/arch/mips/crypto/crc32-mips.c
> +++ b/arch/mips/crypto/crc32-mips.c
> @@ -94,7 +94,9 @@ static u32 crc32_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
>  
>  		CRC32(crc, value, w);
>  		p += sizeof(u32);
> +#ifndef CONFIG_64BIT
>  		len -= sizeof(u32);
> +#endif

First of all, did you verify that this actually makes a difference?
Please post the actual assembly output with and without this patch.

If it does make a difference, you should avoid doing ifdefs as they
are more likely to cause build failures.  Instead do something like

		if (!IS_ENABLED(CONFIG_64BIT))
			len -= sizeof(u32);

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

