Return-Path: <linux-mips+bounces-8647-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB044A930F2
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 05:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C2117B24FD
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 03:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6E61C84AD;
	Fri, 18 Apr 2025 03:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="VXq5/xSO"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF4A1E4AB;
	Fri, 18 Apr 2025 03:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744947689; cv=none; b=b07z/2bkTgnE1nbxq4SEvrQ+o3qxxCP0r05awAzo0NzH0IRPgrIHxeNVTZLb9xdb3Fw8fN5He80nxKUsiZ2fm+giYSY5NA047NR2LD9ha3pEBrvBQ8ndBsqewrwYIGhxpqtN71VNXNRqPTHBIXzSh8lb1w3FzIqPkefUF3/nKuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744947689; c=relaxed/simple;
	bh=ttUvWPDxm515yLqjg2yqyoobvQBv22N3uj4nNc/ZZ7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UArYrrhO3RXQI9ktkzOGZOA+DTBFHxSDosnNaMUI3qbUPDcvgeHTxu1r1EgeDkVNg6B7CIov6jDAQCJlXxJxS4vqYHKxWXImI9Q6RynVYInOY9nR8MQtdwoC8WgTDAz99XIW3ghGWe8VtJFb9sY6fqy7KMBz4cuSnP+A0bUmtS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=VXq5/xSO; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DeLdxRY2vHoEKdWJ6sFRDUQGcMLf7d+q/0pRxlVp8JU=; b=VXq5/xSOluY3RsxfcvuVGjWtZR
	7jvkDa6bj3M1EaAcxKxQY1WDgoWtxg/rm+6XAbBrtL/22i8+WyfgIn92PWApVLEpoDfegP0QpPOHV
	j49Y4XDyIw1sIIkoEwstoQy941i447cYR8qbCXF/sECr1WK62m3qCFnYJ70WAowk7ZhpqPurKZXYy
	QmRJZLHzlF1wf0IN5hkkxnn1hHHtG0hLnxes0shefNdMuya+B9FXC2X7iO7mGssssJqcNQsVxqf5u
	e6j7zakwSXnJ9DlD7H7sHRU6fBUhGHklvmSKWQIcNMVdPm4+5+iJiZ2Hqul+k2BQgzx4AOyJ+YYD8
	8L9xBumA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cbR-00Gek0-2H;
	Fri, 18 Apr 2025 11:41:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:41:21 +0800
Date: Fri, 18 Apr 2025 11:41:21 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <aAHJ4X95vIujLPpu@gondor.apana.org.au>
References: <20250405182609.404216-9-ebiggers@kernel.org>
 <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
 <20250418033829.GC38960@quark.localdomain>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418033829.GC38960@quark.localdomain>

On Thu, Apr 17, 2025 at 08:38:29PM -0700, Eric Biggers wrote:
>
> Well, I forgot that an empty module_exit needs to be kept around for the module
> to be removable.  I'll send a patch that adds these back in, though I'm doubtful
> that anyone ever removes these modules in practice.

I just tried to remove chacha_x86_64 in order to make sure that I
was actually using the arch-optimised version of chacha and that's
how I noticed.

I remove the algorithm modules all the time because it's much easier
to rebuild one module rather than the whole kernel.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

