Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC637135B6
	for <lists+linux-mips@lfdr.de>; Sat, 27 May 2023 18:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjE0QYG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 May 2023 12:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjE0QYF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 May 2023 12:24:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DECE1;
        Sat, 27 May 2023 09:24:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5DF31603F3;
        Sat, 27 May 2023 16:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA748C433D2;
        Sat, 27 May 2023 16:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685204642;
        bh=0hlYza4BD5ghB7457yyj1b/Tsf9YdImAC+eRMrPpF5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iTY29u3k5WRMrJ/Sj/lzkb0rIAetgH4S3kQvKMMHr5Jj/FzbFdMR92Ol7rsHkpQx1
         OiwZSVHvrfz9aoJQHgu98wybb8tIhYzekJIEouEE+UQCRk3bQeKyxerrhiEBsGsOJf
         xUoF2WiY/w3xNT2Dyxf6MTZZCHdjgAefVIOf0NrofJbrAkSGP8zB3ZWdEZXGP1A073
         ZNIdcNIazN0ZJV9TcIc9oqSf/EqqvzIC6RNqnOCCNmoYSp8N47sjpW9EeIELIDIkrW
         ZRm1F0o7R32dN/IPK1M4/w0KacolxFdEfO4qsCctmA05C5pLACHGKYjeO5XvetZLPl
         ZbTUue8IM3LpA==
Date:   Sat, 27 May 2023 17:23:56 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Kelvin Cheung <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the
 trivial RTCs
Message-ID: <20230527-passing-unfixed-39e01b787808@spud>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud>
 <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy>
 <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a8yasedcE/Z2PgR2"
Content-Disposition: inline
In-Reply-To: <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--a8yasedcE/Z2PgR2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:
> > 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 10:22=EF=BC=8CBinbin Zhou <zhoubb.aa=
ron@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
> > On Fri, May 26, 2023 at 8:07=E2=80=AFPM Conor Dooley <conor.dooley@micr=
ochip.com> wrote:
> >> On Fri, May 26, 2023 at 09:37:02AM +0800, Binbin Zhou wrote:
> >>> On Fri, May 26, 2023 at 1:05=E2=80=AFAM Conor Dooley <conor@kernel.or=
g> wrote:
> >>>> On Thu, May 25, 2023 at 08:55:23PM +0800, Binbin Zhou wrote:
> >>=20
> >>>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    enum:
> >>>>> +      - loongson,ls1b-rtc
> >>>>> +      - loongson,ls1c-rtc
> >>>>> +      - loongson,ls7a-rtc
> >>>>> +      - loongson,ls2k0500-rtc
> >>>>> +      - loongson,ls2k1000-rtc
> >>>>> +      - loongson,ls2k2000-rtc
> >>>>=20
> >>>> |+static const struct of_device_id loongson_rtc_of_match[] =3D {
> >>>> |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_=
config },
> >>>> |+       { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rtc_=
config },
> >>>> |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_r=
tc_config },
> >>>> |+       { .compatible =3D "loongson,ls2k0500-rtc", .data =3D &gener=
ic_rtc_config },
> >>>> |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1=
000_rtc_config },
> >>>> |+       { .compatible =3D "loongson,ls2k2000-rtc", .data =3D &gener=
ic_rtc_config },
> >>>> |+       { /* sentinel */ }
> >>>> |+};
> >>>>=20
> >>>> This is a sign to me that your compatibles here are could do with so=
me
> >>>> fallbacks. Both of the ls1 ones are compatible with each other & the=
re
> >>>> are three that are generic.
> >>>>=20
> >>>> I would allow the following:
> >>>> "loongson,ls1b-rtc"
> >>>> "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> >>>> "loongson,ls7a-rtc"
> >>>> "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> >>>> "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
> >>>> "loongson,ls2k1000-rtc"
> >>>>=20
> >>>> And then the driver only needs:
> >>>> |+static const struct of_device_id loongson_rtc_of_match[] =3D {
> >>>> |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_=
config },
> >>>> |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_r=
tc_config },
> >>>> |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1=
000_rtc_config },
> >>>> |+       { /* sentinel */ }
> >>>> |+};
> >>>>=20
> >>>> And ~if~when you add support for more devices in the future that are
> >>>> compatible with the existing ones no code changes are required.
> >>>=20
> >>> Hi Conor:
> >>>=20
> >>> Thanks for your reply.
> >>>=20
> >>> Yes, this is looking much cleaner. But it can't show every chip that
> >>> supports that driver.
> >>>=20
> >>> As we know, Loongson is a family of chips:
> >>> ls1b/ls1c represent the Loongson-1 family of CPU chips;
> >>> ls7a represents the Loongson LS7A bridge chip;
> >>> ls2k0500/ls2k1000/ls2k2000 represent the Loongson-2 family of CPU chi=
ps.
> >>>=20
> >>> Based on my previous conversations with Krzysztof, it seems that
> >>> soc-based to order compatible is more popular, so I have listed all
> >>> the chips that support that RTC driver.
> >>=20
> >> Right. You don't actually have to list them all *in the driver* though,
> >> just in the binding and in the devicetree. I think what you have missed
> >> is:
> >>>> I would allow the following:
> >>>> "loongson,ls1b-rtc"
> >>>> "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> >>>> "loongson,ls7a-rtc"
> >>>> "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> >>>> "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
> >>>> "loongson,ls2k1000-rtc"
> >>=20
> >> This is what you would put in the compatible section of a devicetree
> >> node, using "fallback compatibles". So for a ls1c you put in
> >> compatible =3D "loongson,ls1c-rtc", "loongson,ls1b-rtc";
> >> and the kernel first tries to find a driver that supports
> >> "loongson,ls1c-rtc" but if that fails it tries to find one that suppor=
ts
> >> "loongson,ls1b-rtc". This gives you the best of both worlds - you can
> >> add support easily for new systems (when an ls1d comes out, you don't
> >> even need to change the driver for it to just work!) and you have a
> >> soc-specific compatible in case you need to add some workaround for
> >> hardware errata etc in the future.
> >=20
> > I seem to understand what you are talking about.
> > I hadn't delved into "fallback compatibles" before, so thanks for the
> > detailed explanation.
> >=20
> > In fact, I have thought before if there is a good way to do it other
> > than adding comptable to the driver frequently, and "fallback
> > compatibles" should be the most suitable.
> >=20
> > So in the dt-bindings file, should we just write this:

Not quite, because you still need to allow for ls1b-rtc and ls7a-rtc
appearing on their own. That's just two more entries like the
ls2k1000-rtc one.

> >=20
> >  compatible:
> >    oneOf:
> >      - items:
> >          - enum:
> >              - loongson,ls1c-rtc
> >          - const: loongson,ls1b-rtc
> >      - items:
> >          - enum:
> >              - loongson,ls2k0500-rtc
> >              - loongson,ls2k2000-rtc
> >          - const: loongson,ls7a-rtc

> >      - items:
> >          - const: loongson,ls2k1000-rtc

This one is just "const:", you don't need "items: const:".
I didn't test this, but I figure it would be:
	compatible:
	  oneOf:
	    - items:
	        - enum:
	            - loongson,ls1c-rtc
	        - const: loongson,ls1b-rtc
	    - items:
	        - enum:
	            - loongson,ls2k0500-rtc
	            - loongson,ls2k2000-rtc
	        - const: loongson,ls7a-rtc
	    - const: loongson,ls1b-rtc
	    - const: loongson,ls2k1000-rtc
	    - const: loongson,ls7a-rtc

> My recommendation is leaving compatible string as is.

"as is" meaning "as it is right now in Linus' tree", or "as it is in
this patch"?

Cheers,
Conor.

--a8yasedcE/Z2PgR2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHIunAAKCRB4tDGHoIJi
0m/uAQCuzkw1wso84qc7hQg1yRGe54Qq/5n7d4oNNpITxmc7EQD9F9V4W2yGCIzX
HriOW3sQjp9fOFGxxuiNypG2GeFP5QY=
=imah
-----END PGP SIGNATURE-----

--a8yasedcE/Z2PgR2--
