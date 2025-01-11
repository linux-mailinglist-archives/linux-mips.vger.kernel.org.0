Return-Path: <linux-mips+bounces-7398-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B3EA0A3AF
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 13:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DD277A3FEE
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 12:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3795F197A9F;
	Sat, 11 Jan 2025 12:53:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27E3192B60;
	Sat, 11 Jan 2025 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736600026; cv=none; b=OKEavQ+Qbo+tJ1DiDYWbip0zPwWYUU99eZuvkmRUbLpUTnpIdRVGUj/oIZZGcEinhYmso3NEqG0vUVxum4or17UiaelVpAmVrVKntyoeEElaDVcdMv+FAViqhPYYjt0DP3MLZR+b6o/PRiv/mCuV/COMYcYgcSojxbO8TR61z7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736600026; c=relaxed/simple;
	bh=nkOd5pwuVZzlnB7i7t5I98nDx37d3CzRIf8buPUa/7k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/khIjPiujOc4CThSqr4XfgajVFXKviuYfd/E+EzIKoo9bsxXbWGBTFchNFzEpH2dEPGzEbG/n8+exptAAMEqN/4carmTaq7tevy0hy7NoSkivIzW8HV9MNosxvZP+PjWsnq1VXfvixSdYj+l8tIk+sVy9Jlj4oYW4IR7NKaZcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tWaRM-0006Na-00; Sat, 11 Jan 2025 13:18:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 24D2CC0898; Sat, 11 Jan 2025 13:04:43 +0100 (CET)
Date: Sat, 11 Jan 2025 13:04:43 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Rename read/write_c0_ecc to
 read/writec0_errctl
Message-ID: <Z4JeW1eQJ0qh8Svq@alpha.franken.de>
References: <20241202153937.27640-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202153937.27640-1-tsbogend@alpha.franken.de>

On Mon, Dec 02, 2024 at 04:39:36PM +0100, Thomas Bogendoerfer wrote:
> CP0 register 26 is used as ECC register for legacy cores, but newer
> cores (MIPS32/MIPS64) use it as an ErrCtl register. Since the kernel only
> uses CP0 26 as ErrCtl register rename the access functions to the more
> fitting name.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mipsregs.h |  4 ++--
>  arch/mips/kernel/mips-mt.c       |  7 +++----
>  arch/mips/kernel/spram.c         |  4 ----
>  arch/mips/kernel/traps.c         | 32 ++++++++++++++++----------------
>  4 files changed, 21 insertions(+), 26 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

