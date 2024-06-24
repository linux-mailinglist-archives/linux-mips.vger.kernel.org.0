Return-Path: <linux-mips+bounces-3905-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9A9157D5
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 22:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55F101F21512
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 20:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC381A01DA;
	Mon, 24 Jun 2024 20:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kG4UjMzW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6A262A3;
	Mon, 24 Jun 2024 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719260409; cv=none; b=i7YgcLZ/Kxsgm2Ow5YinNVytx85HfD4nQIAHzYQ6NUWGodqwLeg/IcxdE8vPZA6mE1TGoHyv89jZuLUXxkhFHH1CdOMwUL9Vqgb4BrX9m8yfdP3QLprqZHukOFAGmM38ugt6cgXSPx6yPvgCOvVoaCGbkzAkc5TyQh1I78Xbe64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719260409; c=relaxed/simple;
	bh=tAbvRsIY1ZRGz3ZBltZKorbmqsymD3xAmW5bX7SWz0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksbiB8MYlu8NozWk3zyvU9mdRIOucCrlnynCflZ+/H0rS5l0RX+SFGALSJA08HZLFLnPWR2RlXmWOV0IcY4LRP6JQhup1g8JLnWWZ6kjbu5dqdbUn6Xj/5Yrt3QEffksawdWpSlBHe8EbuyrvTqdUqCDzQtNhHrCGxqd095ONQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kG4UjMzW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A344C2BBFC;
	Mon, 24 Jun 2024 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719260409;
	bh=tAbvRsIY1ZRGz3ZBltZKorbmqsymD3xAmW5bX7SWz0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kG4UjMzWgKqQiuAL6L8kJJl0l9QgfrYuqk1lu/FNf9omEVFDKK62+iwEcEHbfhrIw
	 xu33wFmB95HERgacLucs8oOP5WnzpzKfKgbMvgG297XDsCIvphRvaUzGMsDF+RK+C/
	 MwhLHecaZwfYujomPDGhMfMCqSG0b3UkGBt0s136Y+TcLGwHf4X6G9zUPIPNW/tZv1
	 XmtTFlwKypGF01Kk7qcAM/ULUbdjpq7C7X9iQ6LWqkHKvognZpBkqzSa0q5PUc2zCD
	 G/FdHO+oRsGHdqZKe93u4gT4H9VaCQk2gNE0EsPBxcE4vPdEBatKwlORhVEoW5XdQC
	 iCNxw3D7xS1Jg==
Date: Mon, 24 Jun 2024 14:20:07 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/9] Revert "dt-bindings: reset: mobileye,eyeq5-reset:
 add bindings"
Message-ID: <20240624202007.GA333492-robh@kernel.org>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
 <20240620-mbly-olb-v3-2-5f29f8ca289c@bootlin.com>
 <171890801579.3178249.13779438329936311446.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171890801579.3178249.13779438329936311446.robh@kernel.org>

On Thu, Jun 20, 2024 at 12:26:57PM -0600, Rob Herring (Arm) wrote:
> 
> On Thu, 20 Jun 2024 19:30:54 +0200, Théo Lebrun wrote:
> > Switch from one sub-node per functionality in the system-controller to a
> > single node representing the entire OLB instance. This is the
> > recommended approach for controllers handling many different
> > functionalities; it is a single controller and should be represented by
> > a single devicetree node.
> > 
> > The reset bindings is removed and all properties will be described by:
> > soc/mobileye/mobileye,eyeq5-olb.yaml
> > 
> > Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> > ---
> >  .../bindings/reset/mobileye,eyeq5-reset.yaml       | 43 ----------------------
> >  1 file changed, 43 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sound/st,stm32-sai.example.dtb: /example-0/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dtb: /example-0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq8074-wcss-pil']
> Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.example.dtb: /example-0/avs-monitor@7d5d2000: failed to match any schema with compatible: ['brcm,bcm2711-avs-monitor', 'syscon', 'simple-mfd']
> Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.example.dtb: /example-1/syscon@20e00000: failed to match any schema with compatible: ['sprd,sc9863a-glbregs', 'syscon', 'simple-mfd']
> Documentation/devicetree/bindings/clock/milbeaut-clock.example.dtb: /example-2/serial@1e700010: failed to match any schema with compatible: ['socionext,milbeaut-usio-uart']
> Documentation/devicetree/bindings/arm/hisilicon/controller/hi3798cv200-perictrl.example.dtb: /example-0/peripheral-controller@8a20000/phy@850: failed to match any schema with compatible: ['hisilicon,hi3798cv200-combphy']
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dtb: ahb@38000000: Unevaluated properties are not allowed ('reg' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/arm/stm32/st,mlahb.yaml#

Not sure what happened here, but this can be ignored.

Rob

