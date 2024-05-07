Return-Path: <linux-mips+bounces-3125-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0FA8BE28A
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 14:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2F61F26673
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 12:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D021F15B992;
	Tue,  7 May 2024 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGPbKqa1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976D315B12B;
	Tue,  7 May 2024 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715086315; cv=none; b=EJ7vIS8n6pddTFFIJWMYOgskVHeR2ivq0ibgYbgx0KrvGhLgTaOn8t8lxm2l5PuAoOJfmEl2r1dZ0ZfFPvYdHZ+bBfkF0j6WQ9t14J5HfO6sibpC9rkx68ZXQV4zPHDpbbJINp4Yk1Cjt3UDt6Rsi+dn8xNONnWFEYKt57K6Di0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715086315; c=relaxed/simple;
	bh=YkrG41OUg30UlrJKdM2bXKdavDQXZarnRBrRAJenv4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMYeNzV63szQv+ZoaQ9fzc6TdJMniSSdwgGVn75+TJoMphCrm+JRI0oYMN8Rm6n37tb+PRgvQLs9PzLAsR6vRs2aQOFXWdM3QKLEAUz5SjgY3J/fIwwD1hFcTLDAPoXu56Mt/COfjjAkkq6nPskdirzuYNsnUOJD+5SY4+yP6sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGPbKqa1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23982C2BBFC;
	Tue,  7 May 2024 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715086315;
	bh=YkrG41OUg30UlrJKdM2bXKdavDQXZarnRBrRAJenv4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGPbKqa1QRN6Q8vFBcvwfLx5Wt0iXO2sD7KX/SqIxxdt7QCFRTz59ORppTJzP/E5E
	 E+o5R2lTJKTnve0vuPp7cVVXZpzmLKXIOrZArK+Q6i6BeGTxTLNoaeobynnF1zW6pa
	 pM1WTbYOysJHbgGRcD6z3H5idi+XFleUZu9ys5UFfGq503If2Ob2d2b7XpQsPM3a/a
	 8q7Dj6g32Y+2DS+lXznIz4TvIhD3GdvEFdo5CyO1TwZs8vZxnqlpsymVbhUdvB7Lqk
	 3fyNLOhyfENEckwYD0ia99Ne2XOAtcLZPo/G7tTHXEx474rUyeyQnlHsdZ7DosI1LZ
	 LXSrzSxeS8jnw==
Date: Tue, 7 May 2024 07:51:52 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: soc: mobileye: add EyeQ OLB system
 controller
Message-ID: <20240507125152.GA38845-robh@kernel.org>
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <20240503-mbly-olb-v2-3-95ce5a1e18fe@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503-mbly-olb-v2-3-95ce5a1e18fe@bootlin.com>

On Fri, May 03, 2024 at 04:20:48PM +0200, Théo Lebrun wrote:
> Add documentation to describe the "Other Logic Block" system-controller.
> It deals with three platforms: EyeQ5, EyeQ6L and EyeQ6H. First two have
> a single instance, whereas EyeQ6H has seven named instances.
> 
> Features provided are:
>  - Clocks, children to main crystal. Some PLLs and divider clocks.
>  - Resets. EyeQ6H central, south, DDR0 and DDR1 do not have resets.
>  - Pinctrl. Only EyeQ5 has such feature.
> 
> Those are NOT the only registers exposed in OLB system-controllers! Many
> individual registers, related to IP block integration, can be found.
> 
> We simplify devicetree references to OLB in two ways:
>  - Compatibles exposing a single clock do not ask for a index argument.
>  - Compatibles exposing a single reset domain do not ask for a domain
>    index, only a reset index.
> 
> About pinctrl subnodes: all pins have two functionality, either GPIO or
> something-else. The latter is pin dependent, we express constraints
> using many if-then.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 375 +++++++++++++++++++++
>  MAINTAINERS                                        |   2 +
>  include/dt-bindings/clock/mobileye,eyeq5-clk.h     |  21 ++
>  3 files changed, 398 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
> new file mode 100644
> index 000000000000..bbd75b81166e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
> @@ -0,0 +1,375 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mobileye/mobileye,eyeq5-olb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mobileye EyeQ SoC system controller
> +
> +maintainers:
> +  - Grégory Clement <gregory.clement@bootlin.com>
> +  - Théo Lebrun <theo.lebrun@bootlin.com>
> +  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> +
> +description:
> +  OLB ("Other Logic Block") is a hardware block grouping smaller blocks. Clocks,
> +  resets, pinctrl are being handled from here. EyeQ5 and EyeQ6L host a single
> +  instance. EyeQ6H hosts seven instances.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mobileye,eyeq5-olb
> +          - mobileye,eyeq6l-olb
> +          - mobileye,eyeq6h-acc-olb
> +          - mobileye,eyeq6h-central-olb
> +          - mobileye,eyeq6h-east-olb
> +          - mobileye,eyeq6h-west-olb
> +          - mobileye,eyeq6h-south-olb
> +          - mobileye,eyeq6h-ddr0-olb
> +          - mobileye,eyeq6h-ddr1-olb
> +      - const: syscon
> +      - const: simple-mfd

You are getting rid of the child nodes, so you shouldn't need simple-mfd 
any more.

Rob

