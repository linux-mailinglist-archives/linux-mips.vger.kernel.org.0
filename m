Return-Path: <linux-mips+bounces-7654-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A2A23A28
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 08:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E483C168F60
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 07:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55E7149E17;
	Fri, 31 Jan 2025 07:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9XrRKKJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD56EED8;
	Fri, 31 Jan 2025 07:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738308701; cv=none; b=p5PTk/U2Em0wZFrEldAiX8upQxSXCdhfTIFCO1YSgQQEK60B7C0GUq2yRvq2FNkdAHB/5qbDiF+29o5QsoxSEA2LmlpMkkc47/Nr7nSTUrIbiMJv3GmtpoRtEj0ysP2RLKZIdzZd6BOsuEx4mWoQqzeMbFfF2Iza5n02JYP4UfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738308701; c=relaxed/simple;
	bh=qdt9dwUcq0ta+TSNmQPWYtAwOwtBzqrQuyk0eGFKKQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jx23KxhGMieHHeHNSTPEYQZHT4288E3NIDIp2WY5JT6rI6HAfPra6u0cIuQw82UzJZYULOqxvRU1x9WQKUe+sOqu+NBtCHVRQOm0uJx7rhHHRX2ThfKblfpl+3+U0+Oft4eK4lfX/6BA5qdP5mLa4zuffiiqUzmvxn2DAKrqJUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9XrRKKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC466C4CED1;
	Fri, 31 Jan 2025 07:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738308700;
	bh=qdt9dwUcq0ta+TSNmQPWYtAwOwtBzqrQuyk0eGFKKQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9XrRKKJiIl6VBBUrgystUKaCittMpIeRf0YynogsNTx8rJ1pw+IyDe1+ihvgqaeZ
	 ife/ZG9ZOidFMO1XSEhIA34o+J1f3nuzLWTgxvR5u5SGkMJUMZLMWDLDmLE9MnYeiG
	 usaARMt1bdosGcytO6IdRcmo9Rp/rPQHWPzLwO2RkeSw9u6ILgr3LlzWT28hBpuA6k
	 q0/e0wKGZjS5lET68XEzVRkXKDENE7gtd6jAa6tKWM0F9F2CNT7pIg+ocGLx7zKxft
	 YeMaNdBeM17lASmE6CXotfYkXWVw7qHNLcWskeejqODucgLbBUp/rdv7oomgDSgNQx
	 RP5fE/HfEML0Q==
Date: Fri, 31 Jan 2025 08:31:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, sander@svanheule.net, 
	markus.stockhausen@gmx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: net: Add Realtek MDIO controller
Message-ID: <20250131-omniscient-obedient-locust-9313c0@krzk-bin>
References: <20250131010151.2527688-1-chris.packham@alliedtelesis.co.nz>
 <20250131010151.2527688-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131010151.2527688-2-chris.packham@alliedtelesis.co.nz>

On Fri, Jan 31, 2025 at 02:01:48PM +1300, Chris Packham wrote:
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '^mdio-bus@[0-4]$':

4 or 5 buses?

> +    $ref: mdio.yaml#
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +    patternProperties:
> +      '^ethernet-phy@[a-f0-9]+$':
> +        type: object
> +        $ref: ethernet-phy.yaml#
> +
> +        properties:
> +          realtek,port:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description:
> +              The MDIO communication on the RTL9300 is abstracted by the switch. At
> +              the software level communication uses the switch port to address the
> +              PHY with the actual MDIO bus and address having been setup via the
> +              parent mdio-bus and reg property.

maximum: 8 ?

also property should be required or you miss here default.

Best regards,
Krzysztof


