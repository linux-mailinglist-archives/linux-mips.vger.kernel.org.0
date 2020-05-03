Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1195A1C2CF5
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 16:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgECOS2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 10:18:28 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:53436 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbgECOS1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 10:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588515503; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vYs6wssFrETsp+qNNeSVPy/cndj0TdQNmxHWM359UFk=;
        b=Lr0jnkGAF04IuHztE3Vp3y/0o/vkczf8c9TJAZ28yBffO0sSmhtzfMKHriQll2mRqDs/xN
        NxcOAyO7VIz0bPGThARTJMimaMOcDyAsoeqrsNCyCQ75L2aQPud1w6ym8anwTY/5plN3Ri
        pkBpVwx4gSou1l8VxpNLyx4JtfpQYI4=
Date:   Sun, 03 May 2020 16:18:08 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination
 GPUs
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Message-Id: <8EER9Q.C206SXNSICP7@crapouillou.net>
In-Reply-To: <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
        <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
        <NMCE9Q.LWG45P20NBVJ@crapouillou.net>
        <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com>
        <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net>
        <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le dim. 3 mai 2020 =E0 15:31, H. Nikolaus Schaller <hns@goldelico.com> a=20
=E9crit :
> Hi Paul,
>=20
>>  Am 03.05.2020 um 14:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>>>  It's possible to forbid the presence of the 'clocks' property on=20
>>>> some implementations, and require it on others.
>>>  To be precise we have to specify the exact number of clocks=20
>>> (between 0 and 4) for every architecture.
>>>  This also contradicts my dream to get rid of the architecture=20
>>> specific components in the long run. My dream (because I can't tell=20
>>> how it can be done) is that we can one day develop something which=20
>>> just needs compatible =3D img,530 or imp,540 or img,544. Then we=20
>>> can't make the number clocks depend on the implementation any more.
>>=20
>>  As we said before, the number of clocks is a property of the GPU=20
>> and *not* its integration into the SoC.
>=20
> Well, it is a not very well documented property of the GPU. We have=20
> no data sheet of the standalone GPU. Only several SoC data sheets=20
> which give some indications.

Maybe we can nicely ask them?

I expect Paul Burton to have some contacts at ImgTec. Asking for a doc=20
would be too much, but maybe they can help a bit with the DT bindings.

> It appears as if some sgx5xx versions have 3 clocks and some have 4.=20
> So you are right, the number of clocks depends on the sgx5xx version=20
> and that could be made dependent in the bindings (if necessary).
>=20
>>=20
>>  So you would *not* have a number of clocks between 0 and 4. You get=20
>> either 0, or 4, depending on whether or not you have a wrapper.
>=20
> I think this is contradicting your previous sentence. If the number=20
> of clocks is a property of the GPU and not the integration it must=20
> also not depend on whether there is a wrapper. I.e. it must be a=20
> constant for any type of integration.

Well, I expected all SGX versions to have 4 clocks.

If some SGX versions have 3 clocks, and others have 4 clocks, it's=20
still OK as long as the number of clocks is enforced, so that all=20
implementations of a given SGX core will have to use the same number of=20
clocks.

> The really correct variant would be to always make the SoC=20
> integration (wrapper) a separate subsystem (because it is never part=20
> of the SGX core but some interface bus) and clock provider and=20
> connect it explicitly to the clock inputs.

About the wrapper... I don't really know how it's done there. But you=20
could very well pass all clocks unconditionally to the SGX node, even=20
if it's inside a wrapper.
The wrapper itself probably needs only one clock, the one that allows=20
it to access its registers.

> To be clear: I am not at all against describing the clocks. I just=20
> doubt that the time we invest into discussing on this level of detail=20
> and adding conditional clock requirements is worth the result. IMHO=20
> the bindings and .dts do not become better by describing them in more=20
> detail than just "optional". It just takes our time from contributing=20
> to other subsystems.
>=20

You have a new SoC with a SGX, and you only need to enable one clock to=20
get it to work. So you create a devicetree node which receives only one=20
clock.

Turns out, that the bootloader was enabling the other 3 clocks, and=20
since the last release, it doesn't anymore. You're left with having to=20
support a broken devicetree.

That's the kind of problem that can be easily avoided by enforcing the=20
number of clocks that have to be provided.
>>=20
>>=20
>>>>  See how it's done for instance on=20
>>>> Documentation/devicetree/bindings/serial/samsung_uart.yaml.
>>>  Yes I know the design pattern, but I wonder if such a move makes=20
>>> the whole thing even less maintainable.
>>>  Assume we have finished DTS for some SoC. Then these DTS have been=20
>>> tested on real hardware and are working. Clocks are there where=20
>>> needed and missing where not. We may now forbid or not forbid them=20
>>> for some implementations in the bindings.yaml but the result of=20
>>> dtbs_check won't change! Because they are tested and working and=20
>>> the bindings.yaml has been adapted to the result. So we have just=20
>>> duplicated something for no practical benefit.
>>>  Next, assume there is coming support for more and more new SoC.=20
>>> Then, developers not only have to figure out which clocks they need=20
>>> in the DTS but they also have to add a patch to the implementation=20
>>> specific part of the bindings.yaml to clearly define exactly the=20
>>> same what they already have written into their .dts (the clocks are=20
>>> either there for the of_node or they are not). So again the rules=20
>>> are for no benefit, since a new SoC is introduced exactly once. And=20
>>> tested if it works. And if it is there, it will stay as it is. It=20
>>> is just work for maintainers to review that patch as well.
>>=20
>>  If you add support for a new SoC, you'd still need to modify the=20
>> binding to add the compatible string. So the argument of "more work"=20
>> is moot.
>=20
> Agreed, I forgot this aspect. Nevertheless, it is easier to review a=20
> new compatible string than a new clock number rule (question: how do=20
> you practically review this? By looking if it does match the DTS?).
>=20
> We have to add the compatible string as long as we need to have the=20
> SoC name in the compatible string (which as said is my dream to get=20
> rid of in far future). If we could get rid of it, there won't be a=20
> change any more. By just taking "img,sgx544" into a new SoC. The=20
> change would be moved into SoC specific wrappers. In such an ideal=20
> world, we would explicitly describe the wrappers as separate DT=20
> nodes. Even if they have no explicit driver (e.g. by some=20
> simple-pm-bus).

What's wrong with having the SoC name in the compatible string?

You cannot use just a "img,sgx544" compatible string, as then you would=20
assume that the same SGX version in (e.g.) an Ingenic or a Omap SoC is=20
the exact same. This may actually be true. But the moment you discover=20
even a tiny thing that needs to be handled differently, you wouldn't=20
have the possibility to do so.

>                    PRCM,bus,
> Processor <<---->> Wrapper <<----->> SGX
> ti,...             ti,sysc           img,sgx530
> img,...            simple-bus        img,sgx540
> samsung,...        ...               img,sgx544
> other,             other,gpu-wrapper img,...
>=20
> But this IMHO correct proposal was already rejected.
>=20
> So at the moment we are circling around several proposals because=20
> none can fulfill all requirements.
>=20
> Therefore my attempt to solve the gordian knot is to make clocks=20
> generally optional. This keeps the bindings simple but not generally=20
> wrong. And since the DTS are not only tested against bindings.yaml=20
> but on real hardware, the omission to enforce a specific number of=20
> clocks doesn't harm anyone. As said it is impossible to get the SGX=20
> running without defining the correct clocks (whether they are=20
> enforced by bindings.yaml or not).

That's what I tried to explain above. You'd be able to get the SGX to=20
work without a single clock in devicetree. That doesn't mean it should=20
be allowed.

Cheers,
-Paul


