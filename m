Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66EE1712645
	for <lists+linux-mips@lfdr.de>; Fri, 26 May 2023 14:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242987AbjEZMH0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 May 2023 08:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236664AbjEZMHZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 May 2023 08:07:25 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425AA95;
        Fri, 26 May 2023 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685102844; x=1716638844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9uDtaJJPHuq2pUZEOpF84Xtv1dE0EgruaQ3xoTPIbx8=;
  b=eSLj85TIVc8KHmo2poLqGB6BR9HZPOABkzhgvrS+KGk8dYxkqpfBd7g5
   0NrACf62b5e5Mmn9ADqDE9XVXmuidgB1CpXoWsIY0zCs0JxHnv5n2l9sl
   9s4PBdpiheZWF9nDcrE2iuMiRmQLYr6f1heMwu+kn00LIvmY8g+BwJ0dC
   QV37lgi8I87kewcIufDlqxQ1oyJLvggtc8Ni4Ylzmjruw985RCgH/FTid
   dTn3KMaLkSBmEhAr7WMUDPxBqPF7Ou8Abv1pos9SV7V2AbhoUTtX2OTAo
   ++87oq/kEvFhL4XU+o3rKdyWU8YEt2jPZauhNUDPUn9awzOGm/zMby3R5
   A==;
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="asc'?scan'208";a="227145655"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 May 2023 05:07:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 26 May 2023 05:07:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 26 May 2023 05:07:06 -0700
Date:   Fri, 26 May 2023 13:06:43 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>
CC:     Conor Dooley <conor@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, <loongarch@lists.linux.dev>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        <linux-mips@vger.kernel.org>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        <loongson-kernel@lists.loongnix.cn>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the
 trivial RTCs
Message-ID: <20230526-dolly-reheat-06c4d5658415@wendy>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud>
 <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lgJrIcXE3eFmHlx7"
Content-Disposition: inline
In-Reply-To: <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--lgJrIcXE3eFmHlx7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 09:37:02AM +0800, Binbin Zhou wrote:
> On Fri, May 26, 2023 at 1:05=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> > On Thu, May 25, 2023 at 08:55:23PM +0800, Binbin Zhou wrote:

>> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - loongson,ls1b-rtc
> > > +      - loongson,ls1c-rtc
> > > +      - loongson,ls7a-rtc
> > > +      - loongson,ls2k0500-rtc
> > > +      - loongson,ls2k1000-rtc
> > > +      - loongson,ls2k2000-rtc
> >
> > |+static const struct of_device_id loongson_rtc_of_match[] =3D {
> > |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_con=
fig },
> > |+       { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rtc_con=
fig },
> > |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_=
config },
> > |+       { .compatible =3D "loongson,ls2k0500-rtc", .data =3D &generic_=
rtc_config },
> > |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000=
_rtc_config },
> > |+       { .compatible =3D "loongson,ls2k2000-rtc", .data =3D &generic_=
rtc_config },
> > |+       { /* sentinel */ }
> > |+};
> >
> > This is a sign to me that your compatibles here are could do with some
> > fallbacks. Both of the ls1 ones are compatible with each other & there
> > are three that are generic.
> >
> > I would allow the following:
> > "loongson,ls1b-rtc"
> > "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> > "loongson,ls7a-rtc"
> > "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> > "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
> > "loongson,ls2k1000-rtc"
> >
> > And then the driver only needs:
> > |+static const struct of_device_id loongson_rtc_of_match[] =3D {
> > |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_con=
fig },
> > |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_=
config },
> > |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000=
_rtc_config },
> > |+       { /* sentinel */ }
> > |+};
> >
> > And ~if~when you add support for more devices in the future that are
> > compatible with the existing ones no code changes are required.
>=20
> Hi Conor:
>=20
> Thanks for your reply.
>=20
> Yes, this is looking much cleaner. But it can't show every chip that
> supports that driver.
>=20
> As we know, Loongson is a family of chips:
> ls1b/ls1c represent the Loongson-1 family of CPU chips;
> ls7a represents the Loongson LS7A bridge chip;
> ls2k0500/ls2k1000/ls2k2000 represent the Loongson-2 family of CPU chips.
>=20
> Based on my previous conversations with Krzysztof, it seems that
> soc-based to order compatible is more popular, so I have listed all
> the chips that support that RTC driver.

Right. You don't actually have to list them all *in the driver* though,
just in the binding and in the devicetree. I think what you have missed
is:
> > I would allow the following:
> > "loongson,ls1b-rtc"
> > "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> > "loongson,ls7a-rtc"
> > "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> > "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
> > "loongson,ls2k1000-rtc"

This is what you would put in the compatible section of a devicetree
node, using "fallback compatibles". So for a ls1c you put in
compatible =3D "loongson,ls1c-rtc", "loongson,ls1b-rtc";
and the kernel first tries to find a driver that supports
"loongson,ls1c-rtc" but if that fails it tries to find one that supports
"loongson,ls1b-rtc". This gives you the best of both worlds - you can
add support easily for new systems (when an ls1d comes out, you don't
even need to change the driver for it to just work!) and you have a
soc-specific compatible in case you need to add some workaround for
hardware errata etc in the future.

> > To maintain compatibility with the existing devicetrees, should the old
> > "loongson,ls2x-rtc" be kept in the driver?
>=20
> No, It seems that wildcards in compatible are not allowed."
> loongson,ls2x-rtc" itself was part of this patch series at one time,
> but apparently it is not the right way to describe these chips.

Right, but it has been merged - you are deleting the driver that supports
it after all - which means that any dtb with the old compatible will
stop working.
I don't disagree with Krzysztof that having wildcard based compatibles
is bad, but I do not think that regressing rtc support for systems with
these old devicetrees is the right way to go either.

Thanks,
Conor.

--lgJrIcXE3eFmHlx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHCg0wAKCRB4tDGHoIJi
0mWSAQCDAMxaQunRpWEDNCiW02WKO3wTUY0nxz1jUphUwGxD+AEA9ek3o9O/gDCp
hKbikL4ct/NAgvcpTLcTtunWKqjw4QY=
=LEBi
-----END PGP SIGNATURE-----

--lgJrIcXE3eFmHlx7--
