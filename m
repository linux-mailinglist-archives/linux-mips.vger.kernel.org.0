Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7017C1C2DFE
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 18:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgECQmA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 12:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbgECQl7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 12:41:59 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B0FC061A0E;
        Sun,  3 May 2020 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588524114;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Xkyqq9TOzPnc6C4wkQvzAdvBRk4RdbrpDKkEHV4hxwk=;
        b=VcoEj8bM1VXZ0UwK9oK57kCtaylVki7ATgi26/ANZQE0tGSzJ2NG+j9NTKpou9Qd/a
        6dU4c46QVY0X6hX9/h6woPqcn8qt+EoIAR7aWhA0xKiJ+x5xq2BD90M+VVOiyerZbmDp
        cSy8/kmD2DEFsf2bNH4gWmvKnIpdTjHWIucska24OzKAxMC5+XALEKpA//HQZfOgn6Cl
        IxSUAq5G5qB2/yghj0nEXjaAg1BOXuCrmfxpYOFjNJ8rvddf0d7kegQ1alKC5lUvunRf
        lsIX7/wLz0zfVdj6DMYHC0/5b6UDD8bFXMJb64zNWITSOCOdC3v77iq8I03c/uEZLbw3
        qkDA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCynvDBS725e6UR5TA1LRUI0mSOzQLIBphoBM195"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:262f:cd00:140b:147e:e46a:645d]
        by smtp.strato.de (RZmta 46.6.2 AUTH)
        with ESMTPSA id R0acebw43Gfag60
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 3 May 2020 18:41:36 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <8EER9Q.C206SXNSICP7@crapouillou.net>
Date:   Sun, 3 May 2020 18:41:42 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
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
Message-Id: <08B861A8-D4C2-48A6-9B05-B8CA43312834@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com> <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com> <NMCE9Q.LWG45P20NBVJ@crapouillou.net> <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com> <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net> <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com> <8EER9Q.C206SXNSICP7@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul and Paul,

> Am 03.05.2020 um 16:18 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>=20
>=20
> Le dim. 3 mai 2020 =E0 15:31, H. Nikolaus Schaller <hns@goldelico.com> =
a =E9crit :
>> Hi Paul,
>>> Am 03.05.2020 um 14:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>>>>> It's possible to forbid the presence of the 'clocks' property on =
some implementations, and require it on others.
>>>> To be precise we have to specify the exact number of clocks =
(between 0 and 4) for every architecture.
>>>> This also contradicts my dream to get rid of the architecture =
specific components in the long run. My dream (because I can't tell how =
it can be done) is that we can one day develop something which just =
needs compatible =3D img,530 or imp,540 or img,544. Then we can't make =
the number clocks depend on the implementation any more.
>>> As we said before, the number of clocks is a property of the GPU and =
*not* its integration into the SoC.
>> Well, it is a not very well documented property of the GPU. We have =
no data sheet of the standalone GPU. Only several SoC data sheets which =
give some indications.
>=20
> Maybe we can nicely ask them?

There is some (old) answer here:

=
https://github.com/MIPS/CI20_linux/blob/ci20-v3.18/arch/mips/boot/dts/jz47=
80.dtsi#L63

> I expect Paul Burton to have some contacts at ImgTec. Asking for a doc =
would be too much, but maybe they can help a bit with the DT bindings.

Good idea! It is definitively worth to try. Therefore I have moved him =
from CC: to To:

>=20
>> It appears as if some sgx5xx versions have 3 clocks and some have 4. =
So you are right, the number of clocks depends on the sgx5xx version and =
that could be made dependent in the bindings (if necessary).
>>> So you would *not* have a number of clocks between 0 and 4. You get =
either 0, or 4, depending on whether or not you have a wrapper.
>> I think this is contradicting your previous sentence. If the number =
of clocks is a property of the GPU and not the integration it must also =
not depend on whether there is a wrapper. I.e. it must be a constant for =
any type of integration.
>=20
> Well, I expected all SGX versions to have 4 clocks.
>=20
> If some SGX versions have 3 clocks, and others have 4 clocks, it's =
still OK as long as the number of clocks is enforced, so that all =
implementations of a given SGX core will have to use the same number of =
clocks.

>=20
>> The really correct variant would be to always make the SoC =
integration (wrapper) a separate subsystem (because it is never part of =
the SGX core but some interface bus) and clock provider and connect it =
explicitly to the clock inputs.
>=20
> About the wrapper... I don't really know how it's done there. But you =
could very well pass all clocks unconditionally to the SGX node, even if =
it's inside a wrapper.
> The wrapper itself probably needs only one clock, the one that allows =
it to access its registers.
>=20
>> To be clear: I am not at all against describing the clocks. I just =
doubt that the time we invest into discussing on this level of detail =
and adding conditional clock requirements is worth the result. IMHO the =
bindings and .dts do not become better by describing them in more detail =
than just "optional". It just takes our time from contributing to other =
subsystems.
>=20
> You have a new SoC with a SGX, and you only need to enable one clock =
to get it to work. So you create a devicetree node which receives only =
one clock.
>=20
> Turns out, that the bootloader was enabling the other 3 clocks,

Does it? I haven't seen such boot loaders. Usually they bring up only =
the core and e.g. mmc to be able to boot.

> and since the last release, it doesn't anymore. You're left with =
having to support a broken devicetree.

>=20
> That's the kind of problem that can be easily avoided by enforcing the =
number of clocks that have to be provided.
>>>>> See how it's done for instance on =
Documentation/devicetree/bindings/serial/samsung_uart.yaml.
>>>> Yes I know the design pattern, but I wonder if such a move makes =
the whole thing even less maintainable.
>>>> Assume we have finished DTS for some SoC. Then these DTS have been =
tested on real hardware and are working. Clocks are there where needed =
and missing where not. We may now forbid or not forbid them for some =
implementations in the bindings.yaml but the result of dtbs_check won't =
change! Because they are tested and working and the bindings.yaml has =
been adapted to the result. So we have just duplicated something for no =
practical benefit.
>>>> Next, assume there is coming support for more and more new SoC. =
Then, developers not only have to figure out which clocks they need in =
the DTS but they also have to add a patch to the implementation specific =
part of the bindings.yaml to clearly define exactly the same what they =
already have written into their .dts (the clocks are either there for =
the of_node or they are not). So again the rules are for no benefit, =
since a new SoC is introduced exactly once. And tested if it works. And =
if it is there, it will stay as it is. It is just work for maintainers =
to review that patch as well.
>>> If you add support for a new SoC, you'd still need to modify the =
binding to add the compatible string. So the argument of "more work" is =
moot.
>> Agreed, I forgot this aspect. Nevertheless, it is easier to review a =
new compatible string than a new clock number rule (question: how do you =
practically review this? By looking if it does match the DTS?).
>> We have to add the compatible string as long as we need to have the =
SoC name in the compatible string (which as said is my dream to get rid =
of in far future). If we could get rid of it, there won't be a change =
any more. By just taking "img,sgx544" into a new SoC. The change would =
be moved into SoC specific wrappers. In such an ideal world, we would =
explicitly describe the wrappers as separate DT nodes. Even if they have =
no explicit driver (e.g. by some simple-pm-bus).
>=20
> What's wrong with having the SoC name in the compatible string?

I'd say it should be avoided if possible. But you give a good hint and a =
little research shows some examples having the SoC name in the =
compatible string: musb, dwc2, dwc3.

>=20
> You cannot use just a "img,sgx544" compatible string, as then you =
would assume that the same SGX version in (e.g.) an Ingenic or a Omap =
SoC is the exact same. This may actually be true.

Yes. That is the assumption and I have not seen any hints for the =
opposite in the pvrsrvkm sources. They only differentiate the SoC =
integration (clocks, reset) but not in the SGX operation (memory =
mapping, communication with firmware) itself. So the differences could =
easily be factored out into a wrapper driver.

> But the moment you discover even a tiny thing that needs to be handled =
differently, you wouldn't have the possibility to do so.

You would still have the possibility. An SGX driver can instead of =
differentiating by its own compatible string table look for the wrapper =
or SoC compatible string to find out where the sgx is integrated to. It =
is just simpler to do if we have the combined soc+sgx versions. And at =
the moment we even compile separate kernel modules from the same source.

>=20
>>                   PRCM,bus,
>> Processor <<---->> Wrapper <<----->> SGX
>> ti,...             ti,sysc           img,sgx530
>> img,...            simple-bus        img,sgx540
>> samsung,...        ...               img,sgx544
>> other,             other,gpu-wrapper img,...
>> But this IMHO correct proposal was already rejected.
>> So at the moment we are circling around several proposals because =
none can fulfill all requirements.
>> Therefore my attempt to solve the gordian knot is to make clocks =
generally optional. This keeps the bindings simple but not generally =
wrong. And since the DTS are not only tested against bindings.yaml but =
on real hardware, the omission to enforce a specific number of clocks =
doesn't harm anyone. As said it is impossible to get the SGX running =
without defining the correct clocks (whether they are enforced by =
bindings.yaml or not).
>=20
> That's what I tried to explain above. You'd be able to get the SGX to =
work without a single clock in devicetree. That doesn't mean it should =
be allowed.
>=20
> Cheers,
> -Paul

BR and thanks,
Nikolaus

