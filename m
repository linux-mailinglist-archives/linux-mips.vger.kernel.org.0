Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384421B2E57
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 19:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729200AbgDURaV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 13:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726043AbgDURaV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 13:30:21 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADE8C0610D5;
        Tue, 21 Apr 2020 10:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587490214;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=HikqoAbRox/lVm/oJtuVUkcBJdcoi2Fs9oSIyzhVSWA=;
        b=OkjAAXU/dMQV2Gnohhxbvz1AdkHU3RKU/1TDZp5Rx92yl6b93QxrT8UR4Na+dAi43e
        nkJorWREU+Ufh07M2579vYYM36/GTSdreA2NjHelDQhMThvpuw5WS2KZIZ02wylE+W1j
        4jOErVK/Os3EJRaO7FhSMbdCMHISKZAroE0LwbcbIbCYTX90/aVsOULA3haoLMDd5ylA
        +KFfAFQTZJ+RpmKSaHq0eIMToLxtr2ShAr9piDw3ULmvVraWbobB4yKTi8Aefs9PfbfL
        jdJ/fFi2pqT/XbxxI2hJjExBCzZXCUMTe187W/g/wF/NFIkQ8bR7OuldFHFfMkCZWNTG
        hsyg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43oXkQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3LHTXJfm
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 21 Apr 2020 19:29:33 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200421141543.GU37466@atomide.com>
Date:   Tue, 21 Apr 2020 19:29:32 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <20200415101008.zxzxca2vlfsefpdv@gilmour.lan> <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com> <20200415130233.rgn7xrtwqicptke2@gilmour.lan> <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com> <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com> <20200420073842.nx4xb3zqvu23arkc@gilmour.lan> <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com> <20200421112129.zjmkmzo3aftksgka@gilmour.lan> <20200421141543.GU37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Rossak <embed3d@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 21.04.2020 um 16:15 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Maxime Ripard <maxime@cerno.tech> [200421 11:22]:
>> On Tue, Apr 21, 2020 at 11:57:33AM +0200, Philipp Rossak wrote:
>>> I had a look on genpd and I'm not really sure if that fits.
>>>=20
>>> It is basically some bit that verify that the clocks should be =
enabled or
>>> disabled.
>>=20
>> No, it can do much more than that. It's a framework to control the =
SoCs power
>> domains, so clocks might be a part of it, but most of the time it's =
going to be
>> about powering up a particular device.
>=20
> Note that on omaps there are actually SoC module specific registers.

Ah, I see. This is of course a difference that the TI glue logic has
its own registers in the same address range as the sgx and this can't
be easily handled by a common sgx driver.

This indeed seems to be unique with omap.

> And there can be multiple devices within a single target module on
> omaps. So the extra dts node and device is justified there.
>=20
> For other SoCs, the SGX clocks are probably best handled directly
> in pvr-drv.c PM runtime functions unless a custom hardware wrapper
> with SoC specific registers exists.

That is why we need to evaluate what the better strategy is.

So we have
a) omap which has a custom wrapper around the sgx
b) others without, i.e. an empty (or pass-through) wrapper

Which one do we make the "standard" and which one the "exception"?
What are good reasons for either one?


I am currently in strong favour of a) being standard because it
makes the pvr-drv.c simpler and really generic (independent of
wrapping into any SoC).

This will likely avoid problems if we find more SoC with yet another
scheme how the SGX clocks are wrapped.

It also allows to handle different number of clocks (A31 seems to
need 4, Samsung, A83 and JZ4780 one) without changing the sgx bindings
or making big lists of conditionals. This variance would be handled
outside the sgx core bindings and driver.

So instead of an img+omap.yaml and an img+a81.yaml and an img+a31.yaml
etc. we have a single img,pvrsgx.yaml and individual wrappers (the omap
one already exists as bindings/bus/ti-sysc.txt).

The only drawback is that we need this "pass-through" wrapper in DTS
and driver code to handle clocks, power etc.


The second best solution in my view is to make b) the standard
and allow the clock(s) to be optional to cover the omap case.
And conditionals are added to properly describe the variance of
how the sgx is wrapped/integrated.


IMHO this is a decision which can not be easily revised later.
It is an architectural decision. So we should base it on strategic
goals.

>=20
>=20
> Regards,
>=20
> Tony
>=20

BR and thanks for clarification,
Nikolaus

