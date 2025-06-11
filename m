Return-Path: <linux-mips+bounces-9245-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C687AD49B7
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 05:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F66189F88B
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 03:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979236BFCE;
	Wed, 11 Jun 2025 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="mkFa3OhC"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280AF1FDA94;
	Wed, 11 Jun 2025 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613615; cv=none; b=pmmKSTkKbNkoq5KHVD92Z1OHxs71Va3ChIADfDaZgCd42I/ii62XhRF5DJFvJjTv3zsGCTZ8Re3PL2Wl9PMxDObdWIAufJwy9dme9RAVJLq/beIQTuNaNmJbMbSi7ZlhwhEkK+KuXV1IgvySqhAEf2LBc0t+MCG0T2G+dtU6FfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613615; c=relaxed/simple;
	bh=oxGGKo2SzS/d0PM18T3o9qSmS9kbEB5Ud4wDWF0Zsi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9404hKc61Cb70k8Wqcr95ZVyRpk0jh3IRjVdtCsAoKNW2IynxySifQC8XbCZQ6nAwRe1WfHDmYXl0Y0jalqyxoE1+ccOi7cBVvRCQnaVcSEgpym+0exDoT/2SJjcIGO5qmjhh/Q59VUAvS8knHsHHRbtiomtLDLJutkKIOlgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=mkFa3OhC; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FaUxGj4VtfSrMWJ+tBWopr/w3bGCwOfzq4u3E//ODvI=; b=mkFa3OhC+Qo4uggq0lm+VesVgK
	ws5RLDEtaTsq4bUYSBpul0obfyudjKCh/9tUf+YUaCcXdNPAIqDUATISwpCILd5hxw2B3ByCr7wZM
	CiaXuBOcN1xsetLKjVg/ex3IbYABc3Uec4Yv02lkMzqtMm/rVW/x0qmK1tU3JDKqMd06vYQz6OL4H
	wxzG2kV9vwkdEtrzGsOlS954o/HhO+YsgXgFbP+INSiUq1g1MwjULr6MpamQeCsQgax9LuV/VPcwE
	+X61xGRTLI6NKWhWfIqnDiaZ0lgwTtuudG76/yMtoYPyPBMt1wZStvPLtENAGMHHmj8UXrtRyvHsw
	Xs2BEJkg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uPCQJ-00CFcx-0o;
	Wed, 11 Jun 2025 11:46:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 11 Jun 2025 11:46:47 +0800
Date: Wed, 11 Jun 2025 11:46:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611033957.GA1484147@sol>

On Tue, Jun 10, 2025 at 08:39:57PM -0700, Eric Biggers wrote:
>
> Do you have a concrete example (meaning, a specific driver) where this actually
> matters?  Historically, export and import have always had to be paired for the
> same transformation object, i.e. import was called only with the output of
> export.  There is, and has never been, any test that tests otherwise.  This
> seems like a brand new "requirement" that you've made up unnecessarily.

It's not just drivers that may be using fallbacks, the ahash API
code itself now relies on this to provide fallbacks for cases that
drivers can't handle, such as linear addresses.

I did add the testing for it, which revealed a few problems with
s390 so it was reverted for 6.16.  But I will be adding it back
after the s390 issues have been resolved.
 
> I'll add export and import functions if you insist, but it seems pointless.
>
> Could you at least provide proper definitions for the legacy structs so that I
> don't have to do pointer arithmetic to generate them?

Just expose the sha512 block functions and use them as is.  There
is no need to do the export/import dance.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

