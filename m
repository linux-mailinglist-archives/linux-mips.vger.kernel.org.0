Return-Path: <linux-mips+bounces-3793-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C90910F69
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6673D283004
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23161B9AA6;
	Thu, 20 Jun 2024 17:42:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCA51B3F3C;
	Thu, 20 Jun 2024 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718905323; cv=none; b=ZZiZWHkQGkEJk6n78cenkZj3RhBLreMsTkkn4KAW6TduNY1lphcKMT7d91MNNjH9nprTmKKVfz4o5SSCAVMBWEEfEsE/gYnD7+K2n++FjMzIi5wve2YtQjmU8SWnc088vSaBGOFvgOmCRytiaTMTxkewbR2j2eVhoj7SRPwoyZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718905323; c=relaxed/simple;
	bh=+nR5QNLtGvEfCYocFDjiHDm8ngwhk+jo6AdzPgyzDdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQfez70Yig4O0WHxZWAX5qo2cyOC7MFcnFV0KdtJJwN9EImJckHBVVN6qEWdnIWa2aPcntJVb0sm/aM9nOuBm8ORWJWgriqQHTpDsJj3T5QgvCfChTcb4p1ze0PoA6wFn415F83Sfvb2OyrL8ul1zPZsDAYylrcvAvx7g9AIEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKLn5-0002k1-00; Thu, 20 Jun 2024 19:41:43 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 22837C0120; Thu, 20 Jun 2024 19:41:24 +0200 (CEST)
Date: Thu, 20 Jun 2024 19:41:24 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] MIPS: Introduce config options for LLSC
 availability
Message-ID: <ZnRpxMfs0Eql87r3@alpha.franken.de>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
 <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>
 <ZnRThFlqqyDEprGz@alpha.franken.de>
 <743a2297-ff4a-4cb3-ae61-8cd4956aa565@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <743a2297-ff4a-4cb3-ae61-8cd4956aa565@app.fastmail.com>

On Thu, Jun 20, 2024 at 05:30:48PM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年6月20日六月 下午5:06，Thomas Bogendoerfer写道：
> [...]
> > do you have an user manual stating that the R5k bug is fixed on this CPUs ?
> 
> I actually investigated R5500 a little bit.
> 
> There is no explicit document mentioned this bug is fixed on R5500, but it's not
> mentioned on "VR Series 64-/32-Bit Microprocessor Programming Guide" [1] either,
> while some other hardware limitations are mentioned in that guide.
> 
> Plus EMMA platform, which was removed form the kernel, doesn't have
> cpu-feature-overrides.h. This means that the platform was running with LLSC
> enabled.
> 
> So I think this CPU is not affected.

found a preliminary datasheet and it supports your thinking;-)

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

