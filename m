Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFADB1AAB74
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 17:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1414563AbgDOPKR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 11:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726083AbgDOPKO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 11:10:14 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D2EC061A0C;
        Wed, 15 Apr 2020 08:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586963411;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Q34KzgY6NfPQVgFm3W+dvYTabU2j2V7jhKL4UKLxuBE=;
        b=oN6AmaKAqNF4xXgvHoIlXBZjPlrAXBxX98Uvsi+q8lNfJQ95s1Bs/WQs3VeKNIrXTx
        mR3llMM3320nJXrDMoRTQyXT7IguWTpwYZEr+gPwC/kauMrFFwxgJuZx0K4ESHO4wT4N
        t05CBYY+gSDDSfl5V8Wsbebz/o/3edw9yEcsEcai5/IERGs+cMkbnH+0o0yqj9Eh0Xg8
        UK2HXvqO0r0GlTKR9QVqFgz8xQopKDSeBU5OI10ZK+HLM8dwgbHbxF7FixCimsdFZaMO
        YY2qRHfBUOwaKneRrBAh6auAab1wG37H+9Rr8x/NNpdzPmkGm7fSWJLo5Ac8wNnaedEY
        knoQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3FF9k2b9
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 17:09:46 +0200 (CEST)
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200415142124.yzfh6mtqq7cdq22e@gilmour.lan>
Date:   Wed, 15 Apr 2020 17:09:45 +0200
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        James Hogan <jhogan@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Daniel Vetter <daniel@ffwll.ch>, kernel@pyra-handheld.com
Content-Transfer-Encoding: 7bit
Message-Id: <DC0A2DE2-3D77-46F8-8DE1-55050FDACC9B@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com> <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan> <72919514-0657-4B71-902F-3E775E528F64@goldelico.com> <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com> <535CAEBE-F43E-4BFC-B989-612C81F0D7EF@goldelico.com> <20200415142124.yzfh6mtqq7cdq22e@gilmour.lan>
To:     Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maxime,

> Am 15.04.2020 um 16:21 schrieb Maxime Ripard <maxime@cerno.tech>:
> 
>> 
>> Well we could add clocks and resets as optional but that would
>> allow to wrongly define omap.
>> 
>> Or delegate them to a parent "simple-pm-bus" node.
>> 
>> I have to study that material more to understand what you seem
>> to expect.
> 
> The thing is, once that binding is in, it has to be backward
> compatible. So every thing that you leave out is something that you'll
> need to support in the driver eventually.

> 
> If you don't want it to be a complete nightmare, you'll want to figure
> out as much as possible on how the GPU is integrated and make a
> binding out of that.

Hm. Yes. We know that there likely are clocks and maybe reset
but for some SoC this seems to be undocumented and the reset
line the VHDL of the sgx gpu provides may be permanently tied
to "inactive".

So if clocks are optional and not provided, a driver simply can assume
they are enabled somewhere else and does not have to care about. If
they are specified, the driver can enable/disable them.

> If OMAP is too much of a pain, you can also make
> a separate binding for it, and a generic one for the rest of us.

No, omap isn't any pain at all.

The pain is that some other SoC are most easily defined by clocks in
the gpu node which the omap doesn't need to explicitly specify.

I would expect a much bigger nightmare if we split this into two
bindings variants.

> I'd say that it's pretty unlikely that the clocks, interrupts (and
> even regulators) are optional. It might be fixed on some SoCs, but
> that's up to the DT to express that using fixed clocks / regulators,
> not the GPU binding itself.

omap already has these defined them not to be part of the GPU binding.
The reason seems to be that this needs special clock gating control
especially for idle states which is beyond simple clock-enable.

This sysc target-module@56000000 node is already merged and therefore
we are only adding the gpu child node. Without defining clocks.

For example:

		sgx_module: target-module@56000000 {
			compatible = "ti,sysc-omap4", "ti,sysc";
			reg = <0x5600fe00 0x4>,
			      <0x5600fe10 0x4>;
			reg-names = "rev", "sysc";
			ti,sysc-midle = <SYSC_IDLE_FORCE>,
					<SYSC_IDLE_NO>,
					<SYSC_IDLE_SMART>;
			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
					<SYSC_IDLE_NO>,
					<SYSC_IDLE_SMART>;
			clocks = <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
			clock-names = "fck";
			#address-cells = <1>;
			#size-cells = <1>;
			ranges = <0 0x56000000 0x2000000>;

			gpu: gpu@0 {
				compatible = "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544";
				reg = <0x0 0x10000>;
				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
			};
		};

The jz4780 example will like this:

	gpu: gpu@13040000 {
		compatible = "ingenic,jz4780-sgx540-130", "img,sgx540-130", "img,sgx540";
		reg = <0x13040000 0x4000>;

		clocks = <&cgu JZ4780_CLK_GPU>;
		clock-names = "gpu";

		interrupt-parent = <&intc>;
		interrupts = <63>;
	};

So the question is which one is "generic for the rest of us"?

And how can we make a single binding for the sgx. Not one for each
special SoC variant that may exist.

IMHO the best answer is to make clocks an optional property.
Or if we do not want to define them explicitly, we use
additionalProperties: true.

An alternative could be to use a simple-pm-bus like:

	sgx_module: sgx_module@13040000 {
		compatible = "simple-pm-bus";

		clocks = <&cgu JZ4780_CLK_GPU>;
		clock-names = "gpu";
		
		#address-cells = <1>;
		#size-cells = <1>;
		ranges = <0 0x13040000 0x10000>;

		gpu: gpu@0 {
			compatible = "ingenic,jz4780-sgx540-130", "img,sgx540-130", "img,sgx540";
			reg = <0x0 0x4000>;

			interrupt-parent = <&intc>;
			interrupts = <63>;
		};
	};

This gets rid of any clock, reset and pm definitions for the sgx bindings.
But how this is done is outside this sgx bindings.

With such a scheme, the binding I propose here would be complete and fully
generic. We can even add additionalProperties: false.

BR,
Nikolaus

