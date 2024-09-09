Return-Path: <linux-mips+bounces-5452-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF9970DFA
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 08:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C291C21C7A
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 06:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1DE1AC45F;
	Mon,  9 Sep 2024 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zuxn0T1q"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF1335A7;
	Mon,  9 Sep 2024 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725863907; cv=none; b=sHmgx6PXP9wDzPp59yk5u4IS1J52wllMEzd/jBW5I4awwnVgzIv4saLZSZrmeGJot6ToMS944yEAMKiDNSkU8AShNo2ZdDHcxw8nMzv3sVmBxvUqa2g2Tt6RlNfe2A5kqKnwoY3JbB/OQPqIgwo5jWRDIcXVdoC3vl944mfWTzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725863907; c=relaxed/simple;
	bh=PrE+vmp+YuruV5xPvzE2CNTbonarogVhQjvr8wPqSzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwTYnq+N7InfZ8mbBq5mPwv4QZ7JGSVjL3ZctncWD1ltBX4qr1+39OOEEG93s6+nbat8pY4FKBlAUZASJLXe3J4IINu+sTZuBu1LFJd9E/gU2lkop9DgCy6/v6mNZKStrxH/ElW4FJNrIjULIU5hHgFdLnLRNwKEto3oSKgug0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zuxn0T1q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86402C4CEC5;
	Mon,  9 Sep 2024 06:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725863907;
	bh=PrE+vmp+YuruV5xPvzE2CNTbonarogVhQjvr8wPqSzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zuxn0T1qdNlZeEDMmAo4TJE+F3nWIg5ZYEixIBVM2kGcRcIwmzIuMfx2ccj/nQ6/o
	 8l2dbJnwec5qobdEEEy8R6AjGf+93MjMZc//gPqKupm5kQuUJkhokalyIk3mUErVh4
	 TgBkU+l0gM00D1/Jj2oeSlAnbmmNYYXRYUF0F1PUcrsJ6TqvAplxp8sPM4AXkOwlPg
	 s95knC6NrCAjaCTUmayOxdK4eNLvlxYNMZ+8y4Lhkz0gm4IRNDQzr3YEflTdKVMpbt
	 wfUEmcDe6TQo5vNEs+Xy1NHYeTGd4jLzJGaH84Mw064BWP2HtJDa6zsyOLa0Ie1/cC
	 mlsQoforll3RA==
Date: Mon, 9 Sep 2024 08:38:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add Realtek switch
Message-ID: <63sbuzij27crjxv6d6qjblv55al5zk4ivsah4ji2kvddhbua57@xo4vt2tqs5cn>
References: <20240909014707.2003091-1-chris.packham@alliedtelesis.co.nz>
 <20240909014707.2003091-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909014707.2003091-2-chris.packham@alliedtelesis.co.nz>

On Mon, Sep 09, 2024 at 01:47:06PM +1200, Chris Packham wrote:
> Add device tree schema for the Realtek switch. Currently the only
> supported feature is the syscon-reboot which is needed to be able to
> reboot the board.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../bindings/mfd/realtek,switch.yaml          | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,switch.yaml

Use compatible as filename.

> 
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,switch.yaml
> new file mode 100644
> index 000000000000..84b57f87bd3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/realtek,switch.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/realtek,switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek Switch with Internal CPU

What sort of Switch? Like network switch? Then this should be placed in
respective net (or deeper, e.g. net/dsa/) directory.

Maintainers go here. See example-schema.

> +
> +description:
> +  The RTL9302 ethernet switch has an internal CPU. The switch is a multi-port
> +  networking switch that supports many interfaces. Additionally, the device can
> +  support MDIO, SPI and I2C busses.

I don't get why syscon node is called switch. This looks incomplete or
you used description from some other device.

But if this is DSA, then you miss dsa ref and dsa-related properties.

> +
> +maintainers:
> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - realtek,rtl9302c-switch
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  reboot:
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - reboot
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    switch0: ethernet-switch@1b000000 {

Drop unused label.

Best regards,
Krzysztof


