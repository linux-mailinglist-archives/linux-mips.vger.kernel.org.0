Return-Path: <linux-mips+bounces-7493-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF0A13DCE
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 16:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2F9D188C17C
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 15:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA67722BAC1;
	Thu, 16 Jan 2025 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RywjzES5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA60722B8CD;
	Thu, 16 Jan 2025 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737041799; cv=none; b=Sa8i5XUk/Q9bb/jaaZW16efRgT1px7zFmqlVwZqKAnwnM/NGgQZC20b7z7rHZ7RzzW9Suzrq0iUo3wHlJDwNEJ1bKcfsGDgM8/fFBOk79oK0lP4MnSE82TSicc2VNIstCHJdfKgGMj6uxsCcpcdULkbQ0oQk7a5wq56Lp+JRnCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737041799; c=relaxed/simple;
	bh=4ccIzb3E0CgJH6Xfmx3OHzv1JbAlmJUp0qoF4Pr9SDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aM6yoAV/Cvh3FtCOm7AIMVAljGkZ5AA8kkFr2XPEcc4qEECPZIHeWD7M3KlXke2bsqB8gP8+6DdRE+YEO0iJnFOYAn4ptFCpczeTjlHo/r5OGECSb9iolCXzFK8k4JsszubUVBpBtj9Oym3HMY5f6vMTuODOn121NKVSkZao19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RywjzES5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CD3C4CEE3;
	Thu, 16 Jan 2025 15:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737041799;
	bh=4ccIzb3E0CgJH6Xfmx3OHzv1JbAlmJUp0qoF4Pr9SDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RywjzES5BjPH8MApjg98YEqoo93PJMOtQWHmo+9zWQTOAVXgmrQVsPVvG32NXzYJH
	 VBqetBtRk5fFav5FmMNMCZs6JytxxJjjMeGACaPsQc3hdC12/rFJ/VkyIolAfPhrBk
	 KAk0QlCVGv5YBr1bgQPUFhtlVBuspLOcCsVky3OX5TdnHmkek40/12vGoB1hVFpycY
	 jm5qUCpQFrlmZ7v6GdNXizTixoC9Q58Pf1cFwliiRgkUpQu70AXsfi1yjT2UKKG/5s
	 OPPJ5V9l00QMvkWa2OP2ftNmAxWmU0xWGpXzTtI6j6w/I1MzSP+syVE3jNVL2jRAWu
	 T9519Ra1feleg==
Date: Thu, 16 Jan 2025 09:36:37 -0600
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
Subject: Re: [PATCH v2 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
Message-ID: <20250116153637.GA2567996-robh@kernel.org>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
 <20250116-cluster-hci-broken-v2-2-fc52cfb7a19e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-cluster-hci-broken-v2-2-fc52cfb7a19e@bootlin.com>

On Thu, Jan 16, 2025 at 11:59:20AM +0100, Gregory CLEMENT wrote:
> The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization is
> complete, but in reality it's not the case. It also incorrectly
> indicates that Hardware Cache Initialization is supported. This new
> compatible string allows warning about this broken feature that cannot
> be detected at runtime.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 24 ++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> index 9f500804737d23e19f50a9326168686c05d3a54e..4713673f0cfc7785bb183917ee382a815ebfe9e1 100644
> --- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> @@ -14,7 +14,12 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: mti,mips-cm
> +    oneOf:
> +      - const: mti,mips-cm
> +      - const: mti,eyeq6-cm

Being a mobileye device, the vendor prefix should be mobileye.

> +        description:
> +          On EyeQ6 the HCI (Hardware Cache Initialization) information for
> +          the L2 cache in multi-cluster configuration is broken.
>  
>    reg:
>      description:
> @@ -25,14 +30,29 @@ properties:
>  
>  required:
>    - compatible
> -  - reg
>  
>  additionalProperties: false
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mti,eyeq6-cm
> +then:
> +  properties:
> +    reg: false
> +else:
> +  required:
> +    - reg

How does one access this block with no registers? Is this some subset of 
a larger block? If so, need to define that block first.

These 2 blocks don't look related and the only property shared is 
'compatible'. This should be a separate doc.

Rob

