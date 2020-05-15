Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F001D46EC
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 09:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgEOHTV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 03:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726434AbgEOHTU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 03:19:20 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920BCC061A0C;
        Fri, 15 May 2020 00:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589527155;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/LlQLnJSjr1dPjlAnAK+u/lQG0tGroGOnAwr3HRIIDg=;
        b=V4rmYoQNMiSdVNe+dWbLMntZAM4z93rruWDqBl4jIT/149VE95L/x3e6Izb3Bs3eyg
        tk4HunCz0xxntP2hQvK0O33IO16iO3NAOWHc3cB8Z8OrBMXwXk/yWXFHvPmWk+xX8Ll5
        dF1YuCJ16hBNa93UGhg1Vh3qjEL0JdM8chtrEPk4SXOOA9AiBdNddJqmOAkHqpwuz2AM
        1N58+yn/d/9SNgUyZ8GRDkvhQ/ehCXXpQJuWL+H0JVTHKXvfmFeiNUIdgs9FOGJn8FvE
        dJvnMUo1CiW0KXL9HUGsXmDQ9dv4BC3Cdg0//a56AAyC7WYbePBDs6kpZU0JPm0bhf77
        xLNQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vtwDOvBTU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw4F7IYYRg
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 15 May 2020 09:18:34 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <08B861A8-D4C2-48A6-9B05-B8CA43312834@goldelico.com>
Date:   Fri, 15 May 2020 09:18:33 +0200
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
Message-Id: <D1D14684-2532-46A4-ADA0-2F88F4D2228E@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com> <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com> <NMCE9Q.LWG45P20NBVJ@crapouillou.net> <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com> <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net> <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com> <8EER9Q.C206SXNSICP7@crapouillou.net> <08B861A8-D4C2-48A6-9B05-B8CA43312834@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul & Paul,

> Am 03.05.2020 um 18:41 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Paul and Paul,
>=20
>> Am 03.05.2020 um 16:18 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>=20
>>=20
>> Le dim. 3 mai 2020 =E0 15:31, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>>> Hi Paul,
>>>> Am 03.05.2020 um 14:52 schrieb Paul Cercueil =
<paul@crapouillou.net>:
>>>>>> It's possible to forbid the presence of the 'clocks' property on =
some implementations, and require it on others.
>>>>> To be precise we have to specify the exact number of clocks =
(between 0 and 4) for every architecture.
>>>>> This also contradicts my dream to get rid of the architecture =
specific components in the long run. My dream (because I can't tell how =
it can be done) is that we can one day develop something which just =
needs compatible =3D img,530 or imp,540 or img,544. Then we can't make =
the number clocks depend on the implementation any more.
>>>> As we said before, the number of clocks is a property of the GPU =
and *not* its integration into the SoC.
>>> Well, it is a not very well documented property of the GPU. We have =
no data sheet of the standalone GPU. Only several SoC data sheets which =
give some indications.
>>=20
>> Maybe we can nicely ask them?
>=20
> There is some (old) answer here:
>=20
> =
https://github.com/MIPS/CI20_linux/blob/ci20-v3.18/arch/mips/boot/dts/jz47=
80.dtsi#L63
>=20
>> I expect Paul Burton to have some contacts at ImgTec. Asking for a =
doc would be too much, but maybe they can help a bit with the DT =
bindings.
>=20
> Good idea! It is definitively worth to try. Therefore I have moved him =
from CC: to To:

Do we already have an idea if we can get into contact and get help from =
ImgTec for this topic or if we have to live with what we have?

BR and thanks,
Nikolaus

