Return-Path: <linux-mips+bounces-7492-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A98CA13DA7
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 16:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B967616710B
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 15:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FDD22A80B;
	Thu, 16 Jan 2025 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="As71ZTqw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9273581728;
	Thu, 16 Jan 2025 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737041472; cv=none; b=Ji0gkvWNp9xO+74zBfgeYxxEnq5LYT8QBTE0UqR2MOGcXhGJ1bYZ1FaC2Z0bXkZ8oPbKrVbPpdkPpzpvX2xXZXYaINyqad0weaLKZS2ovsgpBVETqiMt1lV9SXs//fkiWg15JMN4hOC3L+AvZoD8pdXPVcTlwZvDQNQz+xs5pxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737041472; c=relaxed/simple;
	bh=ZD5LNjJmZ7Q03T+Ep0tSHy+qcNEMCEQbGwgjYVx6Bwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrkiU6ZPCFgB76fSXTo8N6zRY0By3iVvX/HuvTmw+pHkUvWbcevLsQmaEB60J80pOR9D6bAHOL6JzZuaUa0hNsMUDZnjJD96UhNScumXT1RH56t2YOF0Dl7SGyOxSZ7ts1f0EiXMxufaEKV1nzMftEUbj85ELarHB8tg3wkkqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=As71ZTqw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7874C4CED6;
	Thu, 16 Jan 2025 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737041472;
	bh=ZD5LNjJmZ7Q03T+Ep0tSHy+qcNEMCEQbGwgjYVx6Bwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=As71ZTqwFlXK7xaq5dY2IrSSL6rwkqRbG/cpm4et2IkcG2FPbUrpeWUfqW+uE8NEY
	 49Iwgd1NG6+6aLgUlA4FWApX6Fjt1583vsJMbs/XM4jtEB0j+CEbV2RqMpP+llxoOS
	 snH/jFSwSJA3/ejaW+w88AIru+wQpl7+70ZWevt3I39JjPTtQs/lm2VrsEg44SXwnn
	 IsN3WbGPyQnIL7jm/TaXtpbbLcThcFd10LMtLyizgfHMHLCSMe09FbfARWfJ63UvSK
	 aU/jWn4fPcXP2SNxwr9+DLZA/vhHErk6/2Zh3SQ7aPuYuNgDJYqMryVDsQDXolfZYL
	 TwxsX7UCZz9lw==
Date: Thu, 16 Jan 2025 09:31:10 -0600
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
Subject: Re: [PATCH v2 1/5] dt-bindings: mips: Document mti,mips-cm
Message-ID: <20250116153110.GA2495012-robh@kernel.org>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
 <20250116-cluster-hci-broken-v2-1-fc52cfb7a19e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-cluster-hci-broken-v2-1-fc52cfb7a19e@bootlin.com>

On Thu, Jan 16, 2025 at 11:59:19AM +0100, Gregory CLEMENT wrote:
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Add devicetree binding documentation for MIPS Coherence Manager.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9f500804737d23e19f50a9326168686c05d3a54e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/mti,mips-cm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPS Coherence Manager
> +
> +description: |

Don't need '|'.

> +  Defines a location of the MIPS Coherence Manager registers.

Say what the h/w block does.

> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +properties:
> +  compatible:
> +    const: mti,mips-cm

Convince me a genericish compatible is okay here.

> +
> +  reg:
> +    description:
> +      Base address and size of an unoccupied region in system's MMIO address
> +      space, which will be used to map the MIPS CM global control registers
> +      block. It is conventionally decided by the system integrator.

What is decided? The address? That's not relevant.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    coherency-manager@1fbf8000 {
> +      compatible = "mti,mips-cm";
> +      reg = <0x1bde8000 0x8000>;
> +    };
> +...
> 
> -- 
> 2.45.2
> 

