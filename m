Return-Path: <linux-mips+bounces-6544-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 017999B42C2
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 08:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 335ED1C21DD8
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 07:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33322201265;
	Tue, 29 Oct 2024 07:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDIktIGM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4A1DED6B;
	Tue, 29 Oct 2024 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730185393; cv=none; b=ampLmcxRSfX1rwn13dZKb09xO3pz8KfRV0kNhRecWFRj1fAaPosIb8CHiht3oy5d1jUmPcOfydd88IkQhQc/jTwcBQ/X7dF01uXJ5OauVFKJM65/JpboRlURCNheJaTXcwczfH8/SqA+tIoTaP9cS2iwYGJO4dJkhNPfg8K8Gww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730185393; c=relaxed/simple;
	bh=QxqKpjr3j81s4iho0+i46YEc7fsoo1C2blZAngfatuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuEI2U3ntHk9v1UaIOz/R9G+CZARJwjAqsypRED0eC15PM+ouuID4RaIaQg4oVp9ZqNLOMI124MOsfzSgDlolpVgwcN8m8u50dWW5gTTBCRBeiNzuxTHuCk42WV4sBAWvuJWuaJkJrudwABXmrg8VJ+l+sXurANyxvRrUIvbEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDIktIGM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CD2C4CECD;
	Tue, 29 Oct 2024 07:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730185392;
	bh=QxqKpjr3j81s4iho0+i46YEc7fsoo1C2blZAngfatuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDIktIGMkaaQXvdyGyQqaxDrJK09fIz0i0j6ZMafBi6/Cz78/SAk8bbjarKXmHah5
	 aGifmEzp1JhGtAjuPUfKGdFNOFcYEEbYtO11/0sD9Xf0yp+6tEPMKAKnLr4yW+ZjlT
	 FLZjdVw3iMWVvbQ11wxrmP0vDQuAvHTlFLgn4TKnCsV8PmSmRGu405YfPWzJ9MpNeZ
	 FNOTfO2BdwcAcZrdQin/3lhRyZ72aafte/jzgEwOHLM33637ikshWYh/62TRtkUax4
	 GcqzeENdG6Q4eSgFBPVQ/Rzee+tI0WTmn1sZiXak47pbkkC4JdOUy96q49EtBqMXw0
	 jK8kR5xdHtq7w==
Date: Tue, 29 Oct 2024 08:03:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Theo Lebrun <theo.lebrun@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Chao-ying Fu <cfu@wavecomp.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Paul Burton <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v8 10/13] dt-bindings: mips: cpu: Add property for broken
 HCI information
Message-ID: <avz4crm2yrk3fg7r4qxkgkt3ka5hmk54v2wtcms453tsnewu5w@jzjxmyd4b7yg>
References: <20241028175935.51250-1-arikalo@gmail.com>
 <20241028175935.51250-11-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028175935.51250-11-arikalo@gmail.com>

On Mon, Oct 28, 2024 at 06:59:32PM +0100, Aleksandar Rikalo wrote:
> From: Gregory CLEMENT <gregory.clement@bootlin.com>
> 
> Some CM3.5 reports show that Hardware Cache Initialization is
> complete, but in reality it's not the case. They also incorrectly
> indicate that Hardware Cache Initialization is supported. This
> optional property allows warning about this broken feature that cannot
> be detected at runtime.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mips/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

I cannot find this patch in v6, nothing in changelog explaining what
happened here.

> diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
> index a85137add668..57e93c07ab1b 100644
> --- a/Documentation/devicetree/bindings/mips/cpus.yaml
> +++ b/Documentation/devicetree/bindings/mips/cpus.yaml
> @@ -47,6 +47,12 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  cm3-l2-config-hci-broken:

Are these names - cm3, l2, hci - obvious and known in MIPS? HCI usually
means something else - see drivers/bluetooth/ and drivers/nfc/

Is this property applicable for all MIPS vendors? There is no vendor
prefix here, so this is generic for this architecture, right?

Best regards,
Krzysztof


