Return-Path: <linux-mips+bounces-4247-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2BA92CE17
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 11:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF33E1C220F8
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A0218D4BB;
	Wed, 10 Jul 2024 09:21:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B741918F2F7;
	Wed, 10 Jul 2024 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720603292; cv=none; b=rT3xRKAL281H1tAUYtay3nXxowRwoQRYrLsGJNbvxHbS25AGj3c1XbqCMJBnl1IUzxqbOdt6R7OS3MZpOSX88V1uVTi2sV1OuqQkXMTBAgqzeuePjvO+3NY/BmZ5Dbje2x7t24hnMw3EccJNgVnvc3s0ZUQcaes6GzjfOe3MiXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720603292; c=relaxed/simple;
	bh=CvV6B9ZEnynNgddzGLGfSr5hjeldvTVOvNTMV/usLK0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qrYoytlqfyCbab5HMH5uyqpjx+q5F4tW6cNgvPY5lPQHLMgHiG3am8dxCk5NOm9oCDlIswwa8THSxYozCFFemlTIpjzyAFvUuUTCYTQ/n6w5ShvreWIAWwm2k0dV47LR0HvPw4mlRTgw+ISfwPz0wLRgMNaT9/zu2bx/Egvm1CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1F66292009C; Wed, 10 Jul 2024 11:21:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1B1E892009B;
	Wed, 10 Jul 2024 10:21:21 +0100 (BST)
Date: Wed, 10 Jul 2024 10:21:21 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Jonathan Corbet <corbet@lwn.net>, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
In-Reply-To: <Zo457UgAkhbAgm2R@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com> <Zn1FuxNw2CUttzdg@alpha.franken.de> <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com> <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk> <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de> <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com> <Zo457UgAkhbAgm2R@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jul 2024, Thomas Bogendoerfer wrote:

> > > I'm considering to apply your patch, how much testing/verification did
> > > this patch see ? Do have some test binaries ?
> > 
> > It has been tested against Debian rootfs. There is no need to test againt special binary,
> > but you need NaN2008 hardware such as Loongson 3A4000.
> 
> that's just one case, what about NaN2008 binaries on a legacy MIPS CPU ?

 It would be good to check with hard-float QEMU configured for writable 
FCSR.NAN2008 (which is one way original code was verified) that things 
have not regressed.  And also what happens if once our emulation has 
triggered for the unsupported FCSR.NAN2008 mode, an attempt is made to 
flip the mode bit via ptrace(2), e.g. under GDB, which I reckon our 
emulation permits for non-legacy CPUs (and which I think should not be 
allowed under the new setting).

  Maciej

