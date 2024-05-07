Return-Path: <linux-mips+bounces-3126-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A43EA8BE30E
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 15:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55FBF285415
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 13:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8E415D5DE;
	Tue,  7 May 2024 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3ee16o3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D615D5C8;
	Tue,  7 May 2024 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087252; cv=none; b=GNNFBn8PjcqlGt4M2RQx9EU4m2o8RoHg/PiBZREOFXX+7ErqK2JGz093ycUiLM8y0c6iZTlihwSzO21+W27OwVYhXCQPHdrWq2AaQeXA1dFwxu1gsaD+kInX7s0aDedlHEyqb0Qv+4KefVA0EJ9PnfKTHwC2EyHI34YOF566U4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087252; c=relaxed/simple;
	bh=07xKq6uVQTOhZY1PkzNIAHYYpUnqYhkmoVQ+zhvB8bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXR2TZ6UJEZsTrtOJos79XzDcFg0MktrH2nV5QtHkCFBkDO+BTu1gS9+R6rufcWesWYZmDGOo00bd5bOwsVqJEvhg09JqVQXTRUANn/HARxys/KnjnI45gvlgBkZXDwvaxF6jLB7Mk4NUi0vwbhNqDWC++NVgV7c75qP8G0pn/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3ee16o3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4074C4AF66;
	Tue,  7 May 2024 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087252;
	bh=07xKq6uVQTOhZY1PkzNIAHYYpUnqYhkmoVQ+zhvB8bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3ee16o3tJya6jdSpMwrMODwS3xpR7LVqzMd2sfXnEaMWgRrvo/PD1fYFfraXarDl
	 GNhPz4+37jHHVtZDgkLkj1/KG9w3bx//fmkolbNT8gV0c5bZUlh/emW7rl63XV5bUi
	 QS0QFAzoSfE56v0PgKCKBkY5s+oz8gCwSDMRFLMgtMdqmJNjaJaStmhbtmTU7Puhx0
	 uHxEgb1a/8+xxLgxV5cKQuCaiCHMF2DIITnznvlt4ESsZEoaEPL4VupnYkzTBK0bNk
	 Zf8ZmIY/8XvcG1XEeSZVBYbUBYlF7QuV2CcL1mb1XBjRHboqBmafjXE0B280/Bw/sU
	 +9EWo4Er6QUxQ==
Date: Tue, 7 May 2024 08:07:28 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: mips: brcm: Document
 brcm,bmips-cbr-reg property
Message-ID: <20240507130728.GA43076-robh@kernel.org>
References: <20240503212139.5811-1-ansuelsmth@gmail.com>
 <20240503212139.5811-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503212139.5811-4-ansuelsmth@gmail.com>

On Fri, May 03, 2024 at 11:20:59PM +0200, Christian Marangi wrote:
> Document brcm,bmips-cbr-reg and brcm,bmips-broken-cbr-reg property.
> 
> Some SoC suffer from a BUG where read_c0_brcm_cbr() might return 0
> if called from TP1. The CBR address is always the same on the SoC
> hence it can be provided in DT to handle broken case where bootloader
> doesn't init it or SMP where read_c0_brcm_cbr() returns 0 from TP1.
> 
> Usage of this property is to give an address also in these broken
> configuration/bootloader.
> 
> If the SoC/Bootloader ALWAYS provide a broken CBR address the property
> "brcm,bmips-broken-cbr-reg" can be used to ignore any value already set
> in the registers for CBR address.

Why can't these be implied from an SoC specific compatible?

It's not a great design where you have to update the DT which should be 
provided from the bootloader in order to work-around bootloader 
issues...

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/mips/brcm/soc.yaml    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> index 975945ca2888..29af8f0db785 100644
> --- a/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> @@ -55,6 +55,21 @@ properties:
>           under the "cpus" node.
>          $ref: /schemas/types.yaml#/definitions/uint32
>  
> +      brcm,bmips-broken-cbr-reg:
> +        description: Declare that the Bootloader init a broken
> +          CBR address in the registers and the one provided from
> +          DT should always be used.

Why wouldn't brcm,bmips-cbr-reg being present indicate to use it?

> +        type: boolean
> +
> +      brcm,bmips-cbr-reg:
> +        description: Reference address of the CBR.
> +          Some SoC suffer from a BUG where read_c0_brcm_cbr() might
> +          return 0 if called from TP1. The CBR address is always the
> +          same on the SoC hence it can be provided in DT to handle
> +          broken case where bootloader doesn't initialise it or SMP
> +          where read_c0_brcm_cbr() returns 0 from TP1.
> +        $ref: /schemas/types.yaml#/definitions/uint32

CBR is never defined anywhere in this patch. 

> +
>      patternProperties:
>        "^cpu@[0-9]$":
>          type: object
> @@ -64,6 +79,23 @@ properties:
>      required:
>        - mips-hpt-frequency
>  
> +dependencies:
> +  brcm,bmips-broken-cbr-reg: [ brcm,bmips-cbr-reg ]

The inline syntax (i.e. []) means you need quotes for commas.

This has no effect because you are applying it to the root node. Needs 
to be a the same level as the properties.

> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        anyOf:
> +          - const: brcm,bcm6358
> +          - const: brcm,bcm6368

Replace anyOf+const with enum.

> +
> +then:
> +  properties:
> +    cpus:
> +      required:
> +        - brcm,bmips-cbr-reg
> +
>  additionalProperties: true
>  
>  examples:
> -- 
> 2.43.0
> 

