Return-Path: <linux-mips+bounces-9029-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC49ABCFF1
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 08:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77EDE189F9ED
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 06:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304F625D216;
	Tue, 20 May 2025 06:56:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC181F180C;
	Tue, 20 May 2025 06:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724213; cv=none; b=E3d0Y9wxzfJPqVwH3IC0lfhSXkc1/hObYsVfwqbtxHhtQcc8qqOH9psoOIMVWfwQDE26b4ZqftKXMMPt7OM83laMRlXV+frKMhO0vz9ZbWHzEcLsUfnQuO4f2OBT2MmkNTPIIewcpMrGaYzifgDm4QVZ3gwNIYKg31jQoqbZ9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724213; c=relaxed/simple;
	bh=hiP99CePJ2mKC4e+6iQzIlVpHlYwNuQCviCkM0kP/d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iG2v9Kg/0PUS2jsgrmFOhDOw5+MsWiHiLw3KHevw0SAf10NUNhOZHmtL/TtDQGvNb/44gRKIMcWN3NUTr38cwjYfbJ0kG4KfrM1QAIOCZBBYFQctKDZ8ls4wyuTRaFPvf9UOW1UJ1l1un/bDq7Lpf7mZmUINzjEzCZh35FBkxko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uHGu1-0006iR-00; Tue, 20 May 2025 08:56:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C44B6C060E; Tue, 20 May 2025 08:50:58 +0200 (CEST)
Date: Tue, 20 May 2025 08:50:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH 1/2] mips: dts: pic32: pic32mzda: Rename the sdhci
 nodename to match with common mmc-controller binding
Message-ID: <aCwmUiUIoLanCOYw@alpha.franken.de>
References: <20250507-mchp-sdhci-v1-0-ed29de05295a@gmail.com>
 <20250507-mchp-sdhci-v1-1-ed29de05295a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-mchp-sdhci-v1-1-ed29de05295a@gmail.com>

On Wed, May 07, 2025 at 06:29:35AM +0000, Charan Pedumuru wrote:
> Rename the sdhci nodename from "sdhci@" to "mmc@" to align with
> linux common mmc-controller binding.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  arch/mips/boot/dts/pic32/pic32mzda.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/pic32/pic32mzda.dtsi b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
> index fdc721b414a88a12050497cd2ddf98ae2fbce035..feca35ba56a47adac0e2a906f4fe9c7a4e89cd4f 100644
> --- a/arch/mips/boot/dts/pic32/pic32mzda.dtsi
> +++ b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
> @@ -225,7 +225,7 @@ gpio9: gpio9@1f860900 {
>  		gpio-ranges = <&pic32_pinctrl 0 144 16>;
>  	};
>  
> -	sdhci: sdhci@1f8ec000 {
> +	sdhci: mmc@1f8ec000 {
>  		compatible = "microchip,pic32mzda-sdhci";
>  		reg = <0x1f8ec000 0x100>;
>  		interrupts = <191 IRQ_TYPE_LEVEL_HIGH>;
> 

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

