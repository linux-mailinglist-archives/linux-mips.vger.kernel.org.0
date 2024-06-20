Return-Path: <linux-mips+bounces-3750-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E4D9108C2
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2BE28497D
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 14:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E055D1AD9EB;
	Thu, 20 Jun 2024 14:45:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D448176255;
	Thu, 20 Jun 2024 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894759; cv=none; b=Ve+wY+CXoYWXaAVRdsgpgAL9Mm8V43e1SjHkG83xIZ7SzLRHj89wSWOlgfmu2fOmP52Y5+hn57KIKGBDqqniVVKFKOW6jkfDzSWGusqjiqcJaPh+RvuS1BpYf1m1243hhSewDNOl1+4lo0LKhcGkkxMfcrLyAF/bMvw+bW1gxjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894759; c=relaxed/simple;
	bh=uL73iW/sBxwetobM0anVhjrpZe0qhCcB/4/aFNL5+ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwn5+3u6Ut+jkPwayZj6Dz4e+BEL+vBJJRRdeLeA2Z9A07twFD8BysCdBEEvGsKfFnSyEUmvJlf6AdFu+d5V4ENitjg6xDEF7whVct/wJzmIXV9AHlcmmsNzAaRoLa99FR23y9yu3W7P3fvtetyvqGgZSUGRd/9st6lBGDyj6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKJ2m-0000tN-00; Thu, 20 Jun 2024 16:45:44 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BEB89C031A; Thu, 20 Jun 2024 16:43:31 +0200 (CEST)
Date: Thu, 20 Jun 2024 16:43:31 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH fixes 1/4] MIPS: mipsmtregs: Fix target register for MFTC0
Message-ID: <ZnRAEzRQpfm7yHHc@alpha.franken.de>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
 <20240616-mips-mt-fixes-v1-1-83913e0e60fc@flygoat.com>
 <859402a6-4e31-4029-a6ad-87c3be4d3fdd@app.fastmail.com>
 <14cc8572-406e-47c4-a590-540d6c69466b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14cc8572-406e-47c4-a590-540d6c69466b@app.fastmail.com>

On Wed, Jun 19, 2024 at 12:37:48PM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年6月19日六月 下午12:32，Jiaxun Yang写道：
> > 在2024年6月16日六月 下午2:25，Jiaxun Yang写道：
> >> Target register of mftc0 should be __res instead of $1, this is
> >> a leftover from old .insn code.
> >>
> >> Fixes: dd6d29a61489 ("MIPS: Implement microMIPS MT ASE helpers")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >
> > Hi Thomas,
> >
> > I saw you sent mips-fixes_6.10_1 pull request but this series is
> > not included in that PR while one of my later patch is included.
> >
> > If you think the whole series is not fit for fixes tree then please
> > at least let this series go through fixes tree. There are many MT
>                     ^ Sorry I meant patch.

sorry I've missed the fixes tag. As the rest looks like a lot of re-shuffling
I'd prefer to just place the first patch to mips-fixes and the rest to
mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

