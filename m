Return-Path: <linux-mips+bounces-12604-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 321ABCDFC45
	for <lists+linux-mips@lfdr.de>; Sat, 27 Dec 2025 13:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9991301C92A
	for <lists+linux-mips@lfdr.de>; Sat, 27 Dec 2025 12:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47157230D35;
	Sat, 27 Dec 2025 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLWk2ary"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174D621CC58;
	Sat, 27 Dec 2025 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766839382; cv=none; b=khQd0mMw8g6EnjsBx8J9Fpk7LeGAk3RNNNvaBHins0zdQZ0vj2GjcMCowyK8Ircggh0/saAcNsGEaZfGMJx9/qJHi+cBUYJF2EPBxjLu17N8Ok2YQHJkEDqHkz2BVhQetzrKHjnyO6RJE79TAlVqqIBUQZOnovsvDRAXYmzNZEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766839382; c=relaxed/simple;
	bh=evZsjUyJHrxkPefhOiZUy0dqWLUa+4V2/GdjlFkFNnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1oQEl+gdUo7JreASseRQfNRctXfBeAeJsgSeqNNKFgwMKYA2JTgDvo/12LHdSNgBxwp5u0jfy4Z3K4wutntRaN3iRJJh3cCnuLGYSk2eU4prK/9YyagKwZnbMJMOf6We3GqB5GGpe5x4C/b1i/ZYb4WLKcu1P8RDUqLYuMbyB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLWk2ary; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB05C4CEF1;
	Sat, 27 Dec 2025 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766839379;
	bh=evZsjUyJHrxkPefhOiZUy0dqWLUa+4V2/GdjlFkFNnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLWk2arydbLSzy/AnZ2BZ6imA8M4zOPW9cm9RSS0dwJnJK4ULnLL/1TPCAPkz3ylQ
	 NYdeQeLd2rn6Ml1t+VkRE6fJ+vD32YTbNo1rEI6jETciiq65AMpCiIqI23MRgMUrJ9
	 pg2AeobEuaaT1wKWM99ISpLpG7nwiQDrg1ZF7y61h5fRSkzB8vXDN/MjeQBfbFYtRv
	 QUnOA1btcsORE9l0zGDnBQNmnaXnOKQc3E5ZogduThQlf6MwYrdjKfoBL/g6K8LEUT
	 D6p28pqUbT7T4zz2MAFErlYavypbulKlZDNoS7LQSFMJE+RUDomQhVM86g0GpYa9ns
	 wyI1hA+OPxoAA==
Date: Sat, 27 Dec 2025 13:42:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: soc: mobileye: Add EyeQ7H OLB
Message-ID: <20251227-bipedal-wombat-of-correction-d71fd8@quoll>
References: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
 <20251224-clk-eyeq7-v2-1-81744d1025d9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224-clk-eyeq7-v2-1-81744d1025d9@bootlin.com>

On Wed, Dec 24, 2025 at 11:07:14AM +0100, Beno=C3=AEt Monin wrote:
> +  '#reset-cells':
> +    description:
> +      First cell is domain and optional if compatible has a single reset=
 domain.
> +      Second cell is reset index inside that domain.
> +    enum: [ 1, 2 ]
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false

This goes before examples section.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mobileye,eyeq7h-ddr0-olb
> +              - mobileye,eyeq7h-ddr1-olb
> +              - mobileye,eyeq7h-mips0-olb
> +              - mobileye,eyeq7h-mips1-olb
> +              - mobileye,eyeq7h-mips2-olb
> +              - mobileye,eyeq7h-periph-east-olb
> +              - mobileye,eyeq7h-south-olb
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +          description:
> +            Reference input clock.

Just use items with description syntax, like everywhere else.

With these fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


