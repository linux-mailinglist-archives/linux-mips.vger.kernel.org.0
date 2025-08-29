Return-Path: <linux-mips+bounces-10811-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AE5B3B8CF
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1D72A05657
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461C630C371;
	Fri, 29 Aug 2025 10:31:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010C0309DA0;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463485; cv=none; b=UDTgw9Ygh52aAgvvwkm0ZXU0SN7qODicV8Wlu2FY/U3WDXPpQ/Ku6eGcd3gwdngnFqPNOA6wcaWERg7Mum28pk3eQxKWfvfB2kV6Oem3oowbNKDjx7wZXVoa34rkwMIsjyADquJzHRfXS3MqHrkez5yjSZYCi/FaM6x22FAUU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463485; c=relaxed/simple;
	bh=wbPXNPK2UMZKOqx0cGQkbhuVFvgZZikESOvnMbAeHE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tawL4Bv1g15zGHBaCrHZYSoGxGlEQaXdGm2ESmCR0kTq6cIRHw8gkaHs44/TLiCSrOUAD/tpR2zaM1c/LiSz465F0b/vGAdcQxjayFlR+66q9/crPw74zylz3d1bzJiiamAu/R+jWDvf7qKX0DX7tOvVKzPVtB6POzQ40tsNk/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004Fl-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BB021C0B7C; Fri, 29 Aug 2025 12:24:13 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:24:13 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: lantiq: danube: add model to EASY50712 dts
Message-ID: <aLF_zZAu8NpRc3bH@alpha.franken.de>
References: <20250812140612.990460-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812140612.990460-1-olek2@wp.pl>

On Tue, Aug 12, 2025 at 04:06:04PM +0200, Aleksander Jan Bajkowski wrote:
> This fixes the following warning:
> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: / (lantiq,xway): 'model' is a required property
> 	from schema $id: http://devicetree.org/schemas/root-node.yaml#
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/mips/boot/dts/lantiq/danube_easy50712.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/lantiq/danube_easy50712.dts b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
> index 1ce20b7d05cb..0c60584092cd 100644
> --- a/arch/mips/boot/dts/lantiq/danube_easy50712.dts
> +++ b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
> @@ -4,6 +4,8 @@
>  /include/ "danube.dtsi"
>  
>  / {
> +	model = "Intel EASY50712";
> +
>  	chosen {
>  		bootargs = "console=ttyLTQ0,115200 init=/etc/preinit";
>  	};
> -- 
> 2.47.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

