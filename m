Return-Path: <linux-mips+bounces-5373-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919C496E994
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2024 07:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD9691C232FA
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2024 05:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1479C1386B3;
	Fri,  6 Sep 2024 05:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="FuEMpuD8"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65BA1384BF;
	Fri,  6 Sep 2024 05:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725602238; cv=none; b=mc5Un4xI0X9Ux+UxT5S74uYGBCzlIPZxzFJ7iCgWyiT5IZB/rRfkyILGp9QWKPSybzKN2c4Un5zOx4W5ErC71A9vOaKM8YxeJS4TTVlXfI6/U6yBtknOfMlGPBM3i959LhZVot8cfTK1SzGaE6AunvDcexcW1YtpQW5aHKI8LlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725602238; c=relaxed/simple;
	bh=JiIKD8F/N5Luztkt4Z4RRd8OKL1IUvleco+3UGGCm8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDMSOH4FBEo4eMApauBlSpEVfjEJTGh/2KEa2KxvQqsZOPLc6vlgpS1bdRg/iWqmE0m7Cjs2Jnw1KmV9ypR668zy0jMMRR22u/R0qg+/4anpCudhdPtxC41XZT5nagr37jUabiWqmCChbULdMgPIpyXLPkmhcVpc4kMT6Ki4Adw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=FuEMpuD8; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iHtxda7iJpHqgGjWQcxPMHTYgcUuxhaS1NQzCQw7Tg4=; b=FuEMpuD8+iVpqKY5eXeXpU3ib6
	A0Idydtmlbaghv96iib7B1pRv5Kgj7TYuYwDN01u2IsL9+unUP2kaU6oLiva9Agjb6DYQ71RJD9vq
	X3rLIg7WI/gfdTDG/cedGjk8dn3676y71Z6DzAGHPa23najs/N4KHyor8jGHXwmtykg2RvYfwtojT
	bioHv5Qrz5IJO3fpK78/5NIzpx4ZUXMoYXS/kkJK6vDXMYoJ2n4aqF7Lw18u/yrJkUKHL4ssYY75U
	/cITWkwhly1lbLIAHJ9i0fVyF2qThS2LuAc2bIMDYII3TC1y5K310blkOWgauIc1UTtk7/1ztmpVZ
	hGUTdaNQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1smRnu-000VT4-04;
	Fri, 06 Sep 2024 13:56:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Sep 2024 13:56:55 +0800
Date: Fri, 6 Sep 2024 13:56:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: WangYuli <wangyuli@uniontech.com>
Cc: davem@davemloft.net, tsbogend@alpha.franken.de,
	linux-crypto@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	Guan Wentao <guanwentao@uniontech.com>
Subject: Re: [RESEND. PATCH v2] MIPS: crypto: Clean up useless assignment
 operations
Message-ID: <ZtqZpzMH_qMQqzyc@gondor.apana.org.au>
References: <AB62DAB2DB1B854E+20240906034605.359512-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AB62DAB2DB1B854E+20240906034605.359512-1-wangyuli@uniontech.com>

On Fri, Sep 06, 2024 at 11:46:05AM +0800, WangYuli wrote:
>
> diff --git a/arch/mips/crypto/crc32-mips.c b/arch/mips/crypto/crc32-mips.c
> index ec6d58008f8e..3a80b7576ec3 100644
> --- a/arch/mips/crypto/crc32-mips.c
> +++ b/arch/mips/crypto/crc32-mips.c
> @@ -77,36 +77,29 @@ static u32 crc32_mips_le_hw(u32 crc_, const u8 *p, unsigned int len)
>  {
>  	u32 crc = crc_;
>  
> -#ifdef CONFIG_64BIT
> -	while (len >= sizeof(u64)) {
> +#if IS_ENABLED(CONFIG_64BIT)

That's not how we normally use IS_ENABLED.  The point of having
it is so that you can embed it into the C code directly, i.e.:

	if (IS_ENABLED(CONFIG_64BIT))

Please also refrain from making unrelated changes like removing
blank lines in the same patch as it makes it more difficult to
see what you're actually changing.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

