Return-Path: <linux-mips+bounces-6485-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9AE9B15B9
	for <lists+linux-mips@lfdr.de>; Sat, 26 Oct 2024 09:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB1AEB22890
	for <lists+linux-mips@lfdr.de>; Sat, 26 Oct 2024 07:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A164178CDE;
	Sat, 26 Oct 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="jJvK92xW"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD116EBE6;
	Sat, 26 Oct 2024 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729926251; cv=none; b=pG8xApv3Jr7tcu/K/gf5TluWX1y2B2nm1jN/jV2Ztljyu2HBV1ApXp6xe3l1+Ari6GSMv6m513QAs+YaF3HxNa3M7bum1Qkb4MRZMUp3hZRYfBkqNjp2gbYzB0my0gxEJyxRPj20mtemTm+smyDBMtrxolQx8FFWGrEqIke3IVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729926251; c=relaxed/simple;
	bh=0RhtS4B5xn2cmpZIIwFuhcwXkOIudN4PHOd4CuJZo2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TmuYpx9Ay44l21k1rAC69V3z6sF8ttD2I2C52KzT4dyRgRf63a5jj5kzha7YUauCzv+rbEXf10Zh7HinZQdnSdRyzJ7sqxXorpMALjDYJ3tGdKjCih17iXM/PPzFJrwuarn/i4KxPUeNJMvat6liMCZsWoDxmE9f2G2wUhLSSD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=jJvK92xW; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dRAXR7rfKz1oJGPh1yosp7uhrSNvVs9MNNRkDpeUBqQ=; b=jJvK92xWFAPXmhZP/wRtFAXYUq
	lqRRYiLg9TCgUnpY8le+DjPLPx7uR4VvB6rHh/XKvSQ303BPmWzFMuYBwU+IPvNjB691OaReUl3NI
	tnsTYXp2cf2ivfEMQTGb7h3GTvHa11U9csergRANhM6bAkWU8L/FoXaq2uZdY3yrXOF+UHsB2U89I
	PUOe6Y9GVsjC40+8GHpzeUab3R87LAqNUjhXIqWfsNyTaSmOrafp4zsjftPP/Ezr7vFp69imO7iUS
	Lt+FDa5d2NrJQQrko27AxArl2PYOlyRf8VDpsocJi8HgOW5FLZPbONHG1mMha885MScqpfMLzmaau
	k4ew2A5g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t4aqD-00CG1k-32;
	Sat, 26 Oct 2024 15:04:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 26 Oct 2024 15:04:05 +0800
Date: Sat, 26 Oct 2024 15:04:05 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, guanwentao@uniontech.com,
	wangyuli@uniontech.com
Subject: Re: [PATCH] crypto: mips/crc32 - fix the CRC32C implementation
Message-ID: <ZxyUZWbn2wnz3ra4@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020180258.8060-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel

Eric Biggers <ebiggers@kernel.org> wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Commit ca459e5f826f ("crypto: mips/crc32 - Clean up useless assignment
> operations") changed crc32c_mips_le_hw() to use the instructions that
> use the "regular" CRC32 polynomial instead of the Castagnoli polynomial.
> Therefore it can't be computing CRC32C values correctly anymore.
> 
> I haven't been successful in running a MIPS kernel in QEMU, but based on
> code review this is the fix that is needed.
> 
> Fixes: ca459e5f826f ("crypto: mips/crc32 - Clean up useless assignment operations")
> Cc: Guan Wentao <guanwentao@uniontech.com>
> Cc: WangYuli <wangyuli@uniontech.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> This is a regression in 6.12, so it should be fixed in a 6.12-rc.
> 
> arch/mips/crypto/crc32-mips.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

