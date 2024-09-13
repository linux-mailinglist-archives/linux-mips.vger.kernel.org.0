Return-Path: <linux-mips+bounces-5568-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A5977DA4
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2024 12:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEBAC282CF0
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2024 10:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7771DA31C;
	Fri, 13 Sep 2024 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="BYSQ3SOd"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16341DA315;
	Fri, 13 Sep 2024 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223506; cv=none; b=Q5nJ3ptZuw15tykwGUAu3/xuOs4jEJmuqIj3WOtzxaBO657LmREazB7qMCKZy/8Xnlmoo1PtfS60YrvtJTnxIvWIMrYZGmWUmPQEU1ji1u+w+UWaM6pcFOodk1YrxqYPe1tsp38Ltx2e1/nkOFxFL3/AU+7FuWxy/3blghvY8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223506; c=relaxed/simple;
	bh=VfzE/e2GMEtPTTZi9MH2kcW1v2jCUX3uz2k1aSyFJXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qz4/KLGRsu/8oe0mZm5C2zjONOmiALckEi8/EuLdAZY9NWvy4kXpVOCvrsJK+5tC97ID/nIhzCmzn7q68T6HrsUmfdB1yKFVYDxzm+uQcdrT2H8QuFd/12rzxZUAgDaHi3rBjHGKCX9NtX8/wMUEc3WsYYvcPfXNmsr2RygK0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=BYSQ3SOd; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qfM276FFMSEBEC/xP0ee+Dgn5beownuGHgkpyoSLAoo=; b=BYSQ3SOd6Sa93tQbj3PDkeRHkl
	L/NRovthGKy1EATKEO/54B/9+Js/EX02aRqMDVdfHdEhxvoygJ9FfLPSS8CHQ3u4JPHuf0FwYkGJx
	LniDdpyV3tcLFJ3eohrRc5sYC6iMmnOzlpLA32ex7mP/pJ1j4kqFz+lx+serFvoSo/DfEiPfgfH8V
	SLBTguXusIFvAOreAkiTWppUnVwjHKY4COQ4TFUrvqqqXJtdJhyUr/ffc+p2jq+MePBgY3GLEocno
	+ZEucPRsGfiDJE2QAxqGMeirAFKKnXfGKuU9ow88RjBZhflDI+SQo82IxfNjmDJYo5FDNHX2tnMhw
	a+OUvtTg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sp3QY-002Dw7-2S;
	Fri, 13 Sep 2024 18:31:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Sep 2024 18:31:36 +0800
Date: Fri, 13 Sep 2024 18:31:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: WangYuli <wangyuli@uniontech.com>
Cc: davem@davemloft.net, tsbogend@alpha.franken.de,
	linux-crypto@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	Guan Wentao <guanwentao@uniontech.com>
Subject: Re: [PATCH v3] MIPS: crypto: Clean up useless assignment operations
Message-ID: <ZuQUiK8-elOhoiX0@gondor.apana.org.au>
References: <C4F76EB9DD3AEFEB+20240906064002.404538-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C4F76EB9DD3AEFEB+20240906064002.404538-1-wangyuli@uniontech.com>

On Fri, Sep 06, 2024 at 02:40:02PM +0800, WangYuli wrote:
> When entering the "len & sizeof(u32)" branch, len must be less than 8.
> So after one operation, len must be less than 4.
> At this time, "len -= sizeof(u32)" is not necessary for 64-bit CPUs.
> 
> After that, replace `while' loops with equivalent `for' to make the
> code structure a little bit better by the way.
> 
> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Link: https://lore.kernel.org/all/alpine.DEB.2.21.2406281713040.43454@angie.orcam.me.uk/
> Suggested-by: Herbert Xu <herbert@gondor.apana.org.au>
> Link: https://lore.kernel.org/all/ZtqZpzMH_qMQqzyc@gondor.apana.org.au/
> Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/mips/crypto/crc32-mips.c | 70 ++++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 33 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

