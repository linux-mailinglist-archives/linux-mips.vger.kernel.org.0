Return-Path: <linux-mips+bounces-3985-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C362C91A487
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 13:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F3D2281EA3
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 11:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173EE14884B;
	Thu, 27 Jun 2024 11:05:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F36148310;
	Thu, 27 Jun 2024 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486333; cv=none; b=Uog4+0HVEuC2fpyxEfedS0wJ/nc4QtQsvGM/rzRBxeDXxEvpUD3wm/Mb/O9p5Gj0Hbc75MPRAE4/9rd/XpeLCSxPfCal6zllGoxH3iJkjL70lT67vmSgNAQ1Ff2Au8poMTO4TtSn6PA8oV8WZzyXpRj04zs9Py8lftyG3zPW9pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486333; c=relaxed/simple;
	bh=B8HlRHtRvGCLPcANh6rc9BTx0hDMXgw8LgJnHLFEqu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6CdC0uiLAp5x3E0+BhP+gc1RrXwcbYAAH5x/WNbxBYnQYBNQ7ddBf5M6xD+C/U5ieP+kyIe+QkKHluaFjUVDY8qC9nuavzboVaPSDhwWRfOtg8HvTYk1GS5yXeEW2w2HmPWDzblg0F95nVv3zsa+mA5FrLvsiySs1AqBJieZGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sMmwE-0003Wq-00; Thu, 27 Jun 2024 13:05:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EC248C0120; Thu, 27 Jun 2024 12:58:03 +0200 (CEST)
Date: Thu, 27 Jun 2024 12:58:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Message-ID: <Zn1FuxNw2CUttzdg@alpha.franken.de>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>

On Wed, Jun 12, 2024 at 09:38:19AM +0100, Jiaxun Yang wrote:
> +++ b/arch/mips/kernel/elf.c
> @@ -318,6 +318,10 @@ void mips_set_personality_nan(struct arch_elf_state *state)
>  	t->thread.fpu.fcr31 = c->fpu_csr31;
>  	switch (state->nan_2008) {
>  	case 0:
> +		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
> +			t->thread.fpu.fcr31 &= ~FPU_CSR_NAN2008;
> +		if (!(c->fpu_msk31 & FPU_CSR_ABS2008))
> +			t->thread.fpu.fcr31 &= ~FPU_CSR_ABS2008;

why is this needed ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

