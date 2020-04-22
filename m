Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F02B1B49BE
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 18:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgDVQJZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 12:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgDVQJY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Apr 2020 12:09:24 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBE2C03C1A9;
        Wed, 22 Apr 2020 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587571762;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ceaM0Q57EWu8SAKxL8w74OvIguml9sO5tkQvRprE6B8=;
        b=Z92zmf5zc5DAwK/4sqYPnPboFccD1cImi6PPOfixec3c/E69kLkMo3qtjNS5JkQh9s
        RHOnVQnUSzwgID+0WyNm9hsbTcUw1JMGhOmyY1sfMqCrEGQ+n4zm396nzyfHmbU1wPTu
        vHG8La6UEk+wavIXlNHebRDWldJKTxVdcrO/QJpTkw7Be+O2DwrcnpmSIHoFqg0h1Wzm
        TB/0Eetbzh9TOHDDy2wNkKXVgf0dc/ur1esrCeOIfyta9SSPQc/qWC7PcgyMqVpZcjAP
        SR0vj8kipr2LX0Dvx0srUmXJaZmqqabdNUDZRDxLNOs8ckxJ4FkoExkQTh0LskpP1Zw+
        3W/g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMiw43tskc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3MG923NL
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 22 Apr 2020 18:09:02 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan>
Date:   Wed, 22 Apr 2020 18:09:01 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
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
Message-Id: <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com>
References: <20200415130233.rgn7xrtwqicptke2@gilmour.lan> <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com> <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com> <20200420073842.nx4xb3zqvu23arkc@gilmour.lan> <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com> <20200421112129.zjmkmzo3aftksgka@gilmour.lan> <20200421141543.GU37466@atomide.com> <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com> <20200422065859.quy6ane5v7vsy5tf@gilmour.lan> <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com> <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan>
To:     Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maxime,

> Am 22.04.2020 um 17:13 schrieb Maxime Ripard <maxime@cerno.tech>:
>=20
> On Wed, Apr 22, 2020 at 09:10:57AM +0200, H. Nikolaus Schaller wrote:
>>> Am 22.04.2020 um 08:58 schrieb Maxime Ripard <maxime@cerno.tech>:
>>>>=20
>>>> It also allows to handle different number of clocks (A31 seems to
>>>> need 4, Samsung, A83 and JZ4780 one) without changing the sgx =
bindings
>>>> or making big lists of conditionals. This variance would be handled
>>>> outside the sgx core bindings and driver.
>>>=20
>>> I disagree. Every other GPU binding and driver is handling that just =
fine, and
>>> the SGX is not special in any case here.
>>=20
>> Can you please better explain this? With example or a description
>> or a proposal?
>=20
> I can't, I don't have any knowledge about this GPU.

Hm. Now I am fully puzzled.
You have no knowledge about this GPU but disagree with our proposal?
Is it just gut feeling?

Anyways, we need to find a solution. Together.

>=20
>> I simply do not have your experience with "every other GPU" as you =
have.
>> And I admit that I can't read from your statement what we should do
>> to bring this topic forward.
>>=20
>> So please make a proposal how it should be in your view.
>=20
> If you need some inspiration, I guess you could look at the mali and =
vivante
> bindings once you have an idea of what the GPU needs across the SoCs =
it's
> integrated in.

Well, I do not need inspiration, we need to come to an agreement about
img,pvrsgx.yaml and we need some maintainer to finally pick it up.

I wonder how we can come to this stage.

If I look at vivante,gc.yaml or arm,mali-utgard.yaml I don't
see big differences to what we propose and those I see seem to come
from technical differences between sgx, vivante, mali etc. So there
is no single scheme that fits all different gpu types.

One thing we can learn is that "core" seems to be a de facto standard=20
for the core clock-name. An alternative "gpu" is used by =
nvidia,gk20a.txt.

BR and thanks,
Nikolaus

