Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEF41AAE85
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 18:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410382AbgDOQmv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 12:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404584AbgDOQmt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Apr 2020 12:42:49 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178CBC061A0C;
        Wed, 15 Apr 2020 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586968966;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=H2qE4hwg4kGp3kHpuvtDMm+CDX8JoRFz/HdnCL4Fkbw=;
        b=qA8B9s/eN+7B9tp0LlIY986v4xx94MVvvF5dBi1whC/y+qRyZ+xd6yF69QNVyYQNxZ
        ArZnCxrtgCIAbyMptoAy2F2lD1P1IwsJf3b8YnSeofbPetS/icuvUHU5/B8N653z9Gu6
        0a5YeUKFbWoOXy/fRx74t7vAKMIILD9dqdGfaotph0O1lUFPr7mGsgtDK7ffek52rM6H
        tG3NxTKoOGAlWTnXOn9P92WyjQeAbbCgbN9AF7c8efXd7jvgBXxFkmQ44pQ/+RzQcM7Z
        5SS7adJXfm5G330FupT27FRmp+v9u8dn1Y2guZjks4Il/nF4jJ6bUkZwT5uAIQ/JPRoc
        PiFw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3FGgI2rK
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 18:42:18 +0200 (CEST)
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200415162151.rwym4ioqz27migfn@gilmour.lan>
Date:   Wed, 15 Apr 2020 18:42:18 +0200
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <45F411C0-150B-4FBA-A0E1-B863B3F36DF6@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com> <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan> <72919514-0657-4B71-902F-3E775E528F64@goldelico.com> <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com> <535CAEBE-F43E-4BFC-B989-612C81F0D7EF@goldelico.com> <20200415142124.yzfh6mtqq7cdq22e@gilmour.lan> <DC0A2DE2-3D77-46F8-8DE1-55050FDACC9B@goldelico.com> <20200415162151.rwym4ioqz27migfn@gilmour.lan>
To:     Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maxime,

> Am 15.04.2020 um 18:21 schrieb Maxime Ripard <maxime@cerno.tech>:
>=20
> On Wed, Apr 15, 2020 at 05:09:45PM +0200, H. Nikolaus Schaller wrote:
>> Hi Maxime,
>>=20
>> Hm. Yes. We know that there likely are clocks and maybe reset
>> but for some SoC this seems to be undocumented and the reset
>> line the VHDL of the sgx gpu provides may be permanently tied
>> to "inactive".
>>=20
>> So if clocks are optional and not provided, a driver simply can =
assume
>> they are enabled somewhere else and does not have to care about. If
>> they are specified, the driver can enable/disable them.
>=20
> Except that at the hardware level, the clock is always going to be
> there. You can't control it, but it's there.

Sure, we can deduce that from general hardware design knowledge.
But not every detail must be described in DT. Only the important
ones.

>=20
>>> If OMAP is too much of a pain, you can also make
>>> a separate binding for it, and a generic one for the rest of us.
>>=20
>> No, omap isn't any pain at all.
>>=20
>> The pain is that some other SoC are most easily defined by clocks in
>> the gpu node which the omap doesn't need to explicitly specify.
>>=20
>> I would expect a much bigger nightmare if we split this into two
>> bindings variants.
>>=20
>>> I'd say that it's pretty unlikely that the clocks, interrupts (and
>>> even regulators) are optional. It might be fixed on some SoCs, but
>>> that's up to the DT to express that using fixed clocks / regulators,
>>> not the GPU binding itself.
>>=20
>> omap already has these defined them not to be part of the GPU =
binding.
>> The reason seems to be that this needs special clock gating control
>> especially for idle states which is beyond simple clock-enable.
>>=20
>> This sysc target-module@56000000 node is already merged and therefore
>> we are only adding the gpu child node. Without defining clocks.
>>=20
>> For example:
>>=20
>> 		sgx_module: target-module@56000000 {
>> 			compatible =3D "ti,sysc-omap4", "ti,sysc";
>> 			reg =3D <0x5600fe00 0x4>,
>> 			      <0x5600fe10 0x4>;
>> 			reg-names =3D "rev", "sysc";
>> 			ti,sysc-midle =3D <SYSC_IDLE_FORCE>,
>> 					<SYSC_IDLE_NO>,
>> 					<SYSC_IDLE_SMART>;
>> 			ti,sysc-sidle =3D <SYSC_IDLE_FORCE>,
>> 					<SYSC_IDLE_NO>,
>> 					<SYSC_IDLE_SMART>;
>> 			clocks =3D <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
>> 			clock-names =3D "fck";
>> 			#address-cells =3D <1>;
>> 			#size-cells =3D <1>;
>> 			ranges =3D <0 0x56000000 0x2000000>;
>>=20
>> 			gpu: gpu@0 {
>> 				compatible =3D "ti,omap5-sgx544-116", =
"img,sgx544-116", "img,sgx544";
>> 				reg =3D <0x0 0x10000>;
>> 				interrupts =3D <GIC_SPI 21 =
IRQ_TYPE_LEVEL_HIGH>;
>> 			};
>> 		};
>>=20
>> The jz4780 example will like this:
>>=20
>> 	gpu: gpu@13040000 {
>> 		compatible =3D "ingenic,jz4780-sgx540-130", =
"img,sgx540-130", "img,sgx540";
>> 		reg =3D <0x13040000 0x4000>;
>>=20
>> 		clocks =3D <&cgu JZ4780_CLK_GPU>;
>> 		clock-names =3D "gpu";
>>=20
>> 		interrupt-parent =3D <&intc>;
>> 		interrupts =3D <63>;
>> 	};
>>=20
>> So the question is which one is "generic for the rest of us"?
>=20
> I'd say the latter.

Why?

TI SoC seem to be the broadest number of available users
of sgx5xx in the past and nowadays. Others are more the exception.

> If your clock is optional, then you define it but don't mandate
> it. Not documenting it will only result in a mess where everyone will
> put some clock into it, possibly with different semantics each and
> every time.

So you mean that we should require a dummy clock for the omap gpu node
or did I misunderstand that?

Well, yes there is of course a clock connection between the
omap target-module and the sgx but it is IMHO pointless to
describe it because it can't and does not need to be controlled
separately.

As said the target-module is already accepted and upstream and my
proposal is to get the gpu node described there. There is simply
no need for a clocks node for the omap.

What I also assume is that developers of DTS know what they do.
So the risk that there is different semantics is IMHO very low.

If you agree I can add the clocks/clock-names property as an
optional property. This should solve omap and all others.

>=20
> This has nothing to do with the binding being complete. And if you use
> a binding like this one, you'll be severely limited when you'll want
> to implement things like DVFS.

Now you have unhooked me... Nobody seems to know if and how DVFS can be
applied to SGX. IMHO we should bake small bread first and get initial
support into mainline.

BR,
Nikolaus

