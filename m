Return-Path: <linux-mips+bounces-12213-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A5EC5457C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 21:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BC20B3479A0
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 20:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE80B2C21CB;
	Wed, 12 Nov 2025 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pseUIglz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1C02C17B4;
	Wed, 12 Nov 2025 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762977827; cv=none; b=lrftIhNWfRB+ftO8JH/P74g5jksTJXGZiGyYEqzJOf5jtfJsDffl3nYWMScBW3pmXtCu0M36trkpXxR3jspBLmVyu/GhGXTnFcWXAU/uGTiEVCdHWOd82x2kFMsCuBcqRGUDUGUBar46WJx2/Q1N5DXqw/WyLnrjhVuChBP2KsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762977827; c=relaxed/simple;
	bh=yPtrlmY0IQVG2j8kOjS21draicu9LupkNCxZyl2KJs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrkSTlm2c3tlUpr9CdsUjmw/1V3ihrQXwCsBxu1gDUdexsaS+bzxNoPfZ6FgS7RrM0b98C+HTQzPnNAP4CcMT0M3VWwlI0Q8htJHO/2FfbcgTqul+nCKRM5+tVgVFnBhBPc3FOfDea5trzyN7FnN9+XJ1LJ/cRi/q8ntxnQEHsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pseUIglz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9848C4CEF1;
	Wed, 12 Nov 2025 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977827;
	bh=yPtrlmY0IQVG2j8kOjS21draicu9LupkNCxZyl2KJs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pseUIglzfH77wCOtINpw4wNljlqAXfilMaf+ELGuMA4dE9ngP9hIwCAr6f0booGAI
	 KGS3ahcwI3EKsfa02eyAbS5hdRtWdzVsGzXuxWciW0c8UB91X+lv73569lka9lXOjo
	 9UgY/UZ53h5zs9LLLMTLHGLG9gOXpN139PBlV8xn7dIvZkyWvDK0YfN3HF4VhLPRpY
	 F1ii9M1+Rt8t25qp/G5CL+NO2XGWqVT3q1gZiL7tZmIyG9UAiZL2XLfrk9wk5wTFm5
	 o50YhE0QEdM1vOQMLJ7P4GtSyESJbHIrkZHgt2Nei0dWtoOsa/+sLdTKSJBLe+T8dj
	 puB2ZKLo9xyhA==
Date: Wed, 12 Nov 2025 20:56:46 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 10/10] kbuild: simplify CC_CAN_LINK
Message-ID: <aRTmfreiEEMez2gs@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-10-faeec46e887a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-10-faeec46e887a@linutronix.de>

On Tue, Oct 14, 2025 at 03:05:25PM +0200, Thomas Weiﬂschuh wrote:
> All architectures supporting multiple ABIs have been migrated to
> ARCH_CC_CAN_LINK. The remaining ones do not require any special flag,
> so simplify the logic.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile     | 11 +++--------
>  init/Kconfig |  3 +--
>  2 files changed, 4 insertions(+), 10 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

