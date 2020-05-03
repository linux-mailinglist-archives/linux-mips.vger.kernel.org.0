Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3B01C2CCA
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 15:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbgECNcK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 09:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728503AbgECNcK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 09:32:10 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64477C061A0C;
        Sun,  3 May 2020 06:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588512727;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=P2n1VxAj51ovTRVckIsPeyqg24p7NzEQivx7HgyjYQo=;
        b=Ts4OUC5koCSx1kYlDKLpEXzo1eiX95xIJB6kjRL3hoecFmUb1ucJWc8Go0aXzT8m7j
        nlxNRKruUax54yyercfeJxEZBR6HaoeFDXUh+JN6BtBAc+M07lpwzL1ewmjohpPmuhGv
        k++v8Kv91ASrsoix+VrCrb8Qn8R+J4xDhEILXdMJFivuftoO536SDd1E/VNwGaCBU5/3
        fNcYQaJUk53H5zJBfv1Br6sIDzyahaf+7pAiD59eFGWXYodu2wPJQY78bxixlfxEtqnT
        oA26IdHlU6CMnerM5BEO0qx7hDpQeKZePRPb6SKyCl3Ude6cls1hxbujWtOwgPy7sfp3
        qlaQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaZXA4J2Ms="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw43DVhfoF
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 3 May 2020 15:31:43 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net>
Date:   Sun, 3 May 2020 15:31:42 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>,
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com> <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com> <NMCE9Q.LWG45P20NBVJ@crapouillou.net> <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com> <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 03.05.2020 um 14:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>>> It's possible to forbid the presence of the 'clocks' property on =
some implementations, and require it on others.
>> To be precise we have to specify the exact number of clocks (between =
0 and 4) for every architecture.
>> This also contradicts my dream to get rid of the architecture =
specific components in the long run. My dream (because I can't tell how =
it can be done) is that we can one day develop something which just =
needs compatible =3D img,530 or imp,540 or img,544. Then we can't make =
the number clocks depend on the implementation any more.
>=20
> As we said before, the number of clocks is a property of the GPU and =
*not* its integration into the SoC.

Well, it is a not very well documented property of the GPU. We have no =
data sheet of the standalone GPU. Only several SoC data sheets which =
give some indications.

It appears as if some sgx5xx versions have 3 clocks and some have 4. So =
you are right, the number of clocks depends on the sgx5xx version and =
that could be made dependent in the bindings (if necessary).

>=20
> So you would *not* have a number of clocks between 0 and 4. You get =
either 0, or 4, depending on whether or not you have a wrapper.

I think this is contradicting your previous sentence. If the number of =
clocks is a property of the GPU and not the integration it must also not =
depend on whether there is a wrapper. I.e. it must be a constant for any =
type of integration.

The really correct variant would be to always make the SoC integration =
(wrapper) a separate subsystem (because it is never part of the SGX core =
but some interface bus) and clock provider and connect it explicitly to =
the clock inputs.

To be clear: I am not at all against describing the clocks. I just doubt =
that the time we invest into discussing on this level of detail and =
adding conditional clock requirements is worth the result. IMHO the =
bindings and .dts do not become better by describing them in more detail =
than just "optional". It just takes our time from contributing to other =
subsystems.

>=20
>=20
>>> See how it's done for instance on =
Documentation/devicetree/bindings/serial/samsung_uart.yaml.
>> Yes I know the design pattern, but I wonder if such a move makes the =
whole thing even less maintainable.
>> Assume we have finished DTS for some SoC. Then these DTS have been =
tested on real hardware and are working. Clocks are there where needed =
and missing where not. We may now forbid or not forbid them for some =
implementations in the bindings.yaml but the result of dtbs_check won't =
change! Because they are tested and working and the bindings.yaml has =
been adapted to the result. So we have just duplicated something for no =
practical benefit.
>> Next, assume there is coming support for more and more new SoC. Then, =
developers not only have to figure out which clocks they need in the DTS =
but they also have to add a patch to the implementation specific part of =
the bindings.yaml to clearly define exactly the same what they already =
have written into their .dts (the clocks are either there for the =
of_node or they are not). So again the rules are for no benefit, since a =
new SoC is introduced exactly once. And tested if it works. And if it is =
there, it will stay as it is. It is just work for maintainers to review =
that patch as well.
>=20
> If you add support for a new SoC, you'd still need to modify the =
binding to add the compatible string. So the argument of "more work" is =
moot.

Agreed, I forgot this aspect. Nevertheless, it is easier to review a new =
compatible string than a new clock number rule (question: how do you =
practically review this? By looking if it does match the DTS?).

We have to add the compatible string as long as we need to have the SoC =
name in the compatible string (which as said is my dream to get rid of =
in far future). If we could get rid of it, there won't be a change any =
more. By just taking "img,sgx544" into a new SoC. The change would be =
moved into SoC specific wrappers. In such an ideal world, we would =
explicitly describe the wrappers as separate DT nodes. Even if they have =
no explicit driver (e.g. by some simple-pm-bus).

                   PRCM,bus,
Processor <<---->> Wrapper <<----->> SGX
ti,...             ti,sysc           img,sgx530
img,...            simple-bus        img,sgx540
samsung,...        ...               img,sgx544
other,             other,gpu-wrapper img,...

But this IMHO correct proposal was already rejected.

So at the moment we are circling around several proposals because none =
can fulfill all requirements.

Therefore my attempt to solve the gordian knot is to make clocks =
generally optional. This keeps the bindings simple but not generally =
wrong. And since the DTS are not only tested against bindings.yaml but =
on real hardware, the omission to enforce a specific number of clocks =
doesn't harm anyone. As said it is impossible to get the SGX running =
without defining the correct clocks (whether they are enforced by =
bindings.yaml or not).

BR and thanks,
Nikolaus

