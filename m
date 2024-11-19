Return-Path: <linux-mips+bounces-6775-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49D9D2AEA
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2024 17:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C01AA283B12
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2024 16:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60131D0E31;
	Tue, 19 Nov 2024 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+HMW72x"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADCB1D095E;
	Tue, 19 Nov 2024 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033703; cv=none; b=CAkSINPNq8Czs57FFaFHUmhHK0J0zYqCg05ivRrgkEp1xpBrZWWq4RH3JOEsw9DgBp34iOs63UZbnsZuIMpCtGTjO43HM1TinoaoHYZE+DMXyepnFui/m4vSxbMOjiX3BRfz+XMkmmnTv8MJm4UaCPXOBZT7+ZzheEYyPSP4od0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033703; c=relaxed/simple;
	bh=KBza4uSj8Sl7mwmEPaBUiuRHm+NgB8MsoPLZy6vv5jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oxrt9qO3q2NTMJXBIpJEgn/pqdV695UiBG96Z3U9rHpfLEzmtH3Jqo03AhjYfCsiXrD0c3+hCVRu6C+x40ec9ocpghWhCaKKeBBy1aJHtbZZYe5NWhXr8z7eQgnMwQD/XEYamjGRoAD44rzqvcmxRy+dBAJDJiTYumVL3FASHec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+HMW72x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51C1C4CECF;
	Tue, 19 Nov 2024 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732033703;
	bh=KBza4uSj8Sl7mwmEPaBUiuRHm+NgB8MsoPLZy6vv5jM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+HMW72xEXn74cmPwrbww8PBim2JlV+59J7bynMrC+Pme/LVCkPo/NCasEmxmQIQC
	 qgYWFVGhzkRgwGWxM+Za0Lzegao+se39zTQBqvXHauMV219nPnZC8R9V1zKBU7bPqF
	 /RWzIawO2SThh7qQRk/5EM9uzRM5eTv7fT7LGbeo1DX9sDFUD+2aL8SkEs3UnVxs4G
	 YpvYoNlJm86iNtQrGDHsJvzz39FjXX6qXqZI219KMzPoWIMSRI1PTyrYJ9k54nm7xI
	 Oup1/4n+GlWX0nWOCnph725bEzEn8+rQe7pkXWMa3RaKh8AqnS5YD9frwC44eJdwQ0
	 xLzQaWXXme1Tw==
Date: Tue, 19 Nov 2024 10:28:21 -0600
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: mips: mips-cm: Add property for broken
 HCI information
Message-ID: <20241119162821.GA1767692-robh@kernel.org>
References: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
 <20241115-cluster-hci-broken-v1-2-00636800611d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-cluster-hci-broken-v1-2-00636800611d@bootlin.com>

On Fri, Nov 15, 2024 at 04:29:55PM +0100, Gregory CLEMENT wrote:
> Some CM3.5 reports show that Hardware Cache Initialization is
> complete, but in reality it's not the case. They also incorrectly
> indicate that Hardware Cache Initialization is supported. This
> optional property allows warning about this broken feature that cannot
> be detected at runtime.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> index 03a5ba5624a429c428ee2afca73b3e29127e02f9..eab31a1022c8cbdee86081110516579ebe99e640 100644
> --- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> @@ -23,6 +23,12 @@ properties:
>        block. It is conventionally decided by the system integrator.
>      maxItems: 1
>  
> +  cm3-l2-config-hci-broken:
> +    type: boolean
> +    description:
> +      If present, indicates that the HCI (Hardware Cache Initialization)
> +      information for the L2 cache in multi-cluster configuration is broken.
> +

This should be implied by a specific compatible.

>  required:
>    - compatible
>  
> 
> -- 
> 2.45.2
> 

