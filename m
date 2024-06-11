Return-Path: <linux-mips+bounces-3586-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16409903E7E
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 16:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3CEDB2527E
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 14:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD2217D891;
	Tue, 11 Jun 2024 14:14:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC621DDF4;
	Tue, 11 Jun 2024 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718115295; cv=none; b=FEK+/ayTHNL/jWlenb0XGcl7u/p9qwv8rbV8hoL9tPx9ZxERBVBoBP/Ckdjg5rQSgQzihEJJKmYYOKirGSibgYeg8I4Wsl8hWDeuduGIPVyXj87Qov/+UBgtQy3XszM/NQsJ48k8v5J7AL8hbk7NfkjqxctXUCayP0D6Hnjjy/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718115295; c=relaxed/simple;
	bh=wQbEJocG3DYWCV/bbjuTe2rWvWiRPGvtjmOpsxe4i7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9vCELntNBJjYje6Z8dvBIcjgmUKTCo66euCjlRpgxTLmNE1SjW1ZN3wJ2WcpDajJJL7iif+zSxtVShxXhvw46h3qdlW3qqozQDGnFVRMx0lSxfQxuIfHVa9WENzmIxlAylFxbxBKjSGn7q6IBxpL+E3Lm22VtHZKgKT76Wg3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sH2Gu-00034I-00; Tue, 11 Jun 2024 16:14:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 54997C0411; Tue, 11 Jun 2024 16:12:57 +0200 (CEST)
Date: Tue, 11 Jun 2024 16:12:57 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] mips: bmips: BCM6358: make sure CBR is correctly
 set
Message-ID: <ZmhbaZQbLf6Q3yoz@alpha.franken.de>
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
 <20240611113538.9004-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611113538.9004-2-ansuelsmth@gmail.com>

On Tue, Jun 11, 2024 at 01:35:33PM +0200, Christian Marangi wrote:
> It was discovered that some device have CBR address set to 0 causing
> kernel panic when arch_sync_dma_for_cpu_all is called.
> 
> This was notice in situation where the system is booted from TP1 and
> BMIPS_GET_CBR() returns 0 instead of a valid address and
> !!(read_c0_brcm_cmt_local() & (1 << 31)); not failing.
> 
> The current check whether RAC flush should be disabled or not are not
> enough hence lets check if CBR is a valid address or not.
> 
> Fixes: ab327f8acdf8 ("mips: bmips: BCM6358: disable RAC flush for TP1")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  arch/mips/bmips/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

