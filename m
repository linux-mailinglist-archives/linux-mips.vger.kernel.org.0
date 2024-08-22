Return-Path: <linux-mips+bounces-4999-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8EE95B0F2
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 10:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 290971C22729
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 08:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B7316EB65;
	Thu, 22 Aug 2024 08:54:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D78516DEB4;
	Thu, 22 Aug 2024 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724316889; cv=none; b=qtmmtIeOYCp9u4aOpAzf7KZhcaeDYBUtgSD6Su4fQ9m7JcwDR7cxD5LZBvT6fGljat7xcNdX8UgwHUZSwKX7WvV2cUsr6TCRqjO282dSAhR77ebt0AdhwcUPIlLp46aWm6pgMqKIz2ovgrElLZrH++VzBfkGkUcg/W98G3nKovQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724316889; c=relaxed/simple;
	bh=g+vbckvut28hrw/OH7JbIKytllYN5NMqB2Wdl1mgKFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCtJ4SWyCMWJHR7XGU1Tok8ey3OmHSTNKEoPwtUAJoIq5nHcHbU2Zll/4trZ8v2+RfI1bu20pk7gTCpmn6jW54fdrtflxXCTwxC8p5fme8xHjxi/V1WH1xrK6f9GFld3ev9/OmY29SD/YQ2ssr3u1GJ1W8QKWEIzMqU4jni8YGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sh2m0-0002Co-00; Thu, 22 Aug 2024 10:02:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 75D72C0877; Thu, 22 Aug 2024 10:02:14 +0200 (CEST)
Date: Thu, 22 Aug 2024 10:02:14 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Message-ID: <ZsbwhoTS+ji41FuW@alpha.franken.de>
References: <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>
 <Zo457UgAkhbAgm2R@alpha.franken.de>
 <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk>
 <a8741e38-837b-4fbb-8656-1e6d50bdfcc0@app.fastmail.com>
 <alpine.DEB.2.21.2407110315170.38148@angie.orcam.me.uk>
 <de07ff44-41ee-4158-b629-90a1835bd9cb@app.fastmail.com>
 <alpine.DEB.2.21.2407121250350.38148@angie.orcam.me.uk>
 <dad7b36f-2e37-44db-939e-cdb454875e2a@app.fastmail.com>
 <alpine.DEB.2.21.2407150225310.58077@angie.orcam.me.uk>
 <ac94941f-3ac3-4820-b94d-aeb72a7a7a5c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac94941f-3ac3-4820-b94d-aeb72a7a7a5c@app.fastmail.com>

On Mon, Jul 15, 2024 at 08:35:21PM +0800, Jiaxun Yang wrote:
> 在2024年7月15日七月 下午8:15，Maciej W. Rozycki写道：
> >  It's not much to do anyway, as I have prepared `ptrace_setfcr31' already 
> > to handle masking correctly, so all you have to do is to set the mask as 
> > required for the right thing to happen.  I shouldn't have needed to point 
> > you at it though, as that code is easy to find.
> 
> I think I got your point, will try to implement it.

any news about this ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

