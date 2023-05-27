Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC107136E2
	for <lists+linux-mips@lfdr.de>; Sun, 28 May 2023 00:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjE0WAO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 May 2023 18:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjE0WAL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 May 2023 18:00:11 -0400
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC668D9;
        Sat, 27 May 2023 15:00:09 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id CE0682B069B3;
        Sat, 27 May 2023 18:00:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 27 May 2023 18:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1685224804; x=1685232004; bh=xOIzaS7TUXsjeL9bN87xBLkkvq7cSpZ1H0T
        BffNzGWA=; b=SelzHpDvDO2/Uc8sItLHkL+JRlOvhcW97Mg+l+n6jEx9v/4mEwo
        PPmre7YNjuzhzCDTSVbbTp1Fr5KrfvZCZY7gGk8lII5WCo0jeue7owokkpmI2hVh
        V7O05e1Dp1qdECUKkezUBFr24dSoJvqagmsm6jLNCyVRC6FlNBZei6rQtQVoHAC4
        Xc1AgMC0OzI3/6AzZHr2DvyLAXOKDOdisz1RxdhLum2JEpsEnEf+Hyk8/VgVc8G4
        yUlFMLUXrNQ79MQXiJj8EVOWCf8qDvQmcwVqx10qtllEQqsSAyBK3ij5L6eDZiII
        d2b0uTohwjcoVnJBDs7lB8y4jkljUNbwKxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1685224804; x=1685232004; bh=xOIzaS7TUXsjeL9bN87xBLkkvq7cSpZ1H0T
        BffNzGWA=; b=LPAOotBQXGDhjkLWauny8SGUXXp8g/81IsNlqnMZV+7aKHnHpqg
        wp+FpodNaV2G66QTv8e4nTA64x06BhM23snxWMiVBFjwkGyLukjBlik6mcl1FrzW
        YQHUgM1TYw7mThwjL2lwEq3CY/CKWPDyhkZ+mVwbymwAuln5f5G7fSVlE3T8p1uN
        Qa04eNvZRvhXcKDz95xMjeuGNBEEBrCLUHeTNU2z/KFAJPK5GHtv3d0WRYkk4w/Z
        6/H7cH9DY6eSDuHFbRQu+swjpKCAOO56qkaq9rXPdP8RUexffxdoQ22X9pvHncNf
        N1+8SGFv0ZnwRFyPbPFtSmRHK05PhMYYpKA==
X-ME-Sender: <xms:Yn1yZDHl1uPgjzDH30w7NSnIX8sOi0HvBHM25lBPVKsDUJTn-I-FUw>
    <xme:Yn1yZAW4iyMw2VbshlSiuz4vWscOpNGdtjQIJUR2XJSOggK8FAH4xKDS551K3nS_y
    9SEN799xnxAG6of5lo>
X-ME-Received: <xmr:Yn1yZFIwzptFpKQrMK7_xlFZUG5oDk46JoNiXp5_TIO_UHCXtpz7FRlV2MtQa4jAC2rM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekvddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Yn1yZBGrr4JBvxJTyLeuYPXNXpsb84cYRo08wU32pCWMFyTML1iW3g>
    <xmx:Yn1yZJXgbCau8D5td5_MWByEjEy-bwDrCdbdRc7t2pl4FzOT-js9xA>
    <xmx:Yn1yZMMZZO75dAmvLiF7S4RzdaFw3lOCTgQFli0etvUKOKmYk84hMQ>
    <xmx:ZH1yZAb6gvfsIuuriJiv9Nt3jlwkBfDhqvjNPLSKbwhj5zmV_EIn-xhm3lQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 May 2023 17:59:59 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial
 RTCs
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230527-passing-unfixed-39e01b787808@spud>
Date:   Sat, 27 May 2023 22:59:48 +0100
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud>
 <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy>
 <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
 <20230527-passing-unfixed-39e01b787808@spud>
To:     Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 17:23=EF=BC=8CConor Dooley =
<conor@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:
>>> 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 10:22=EF=BC=8CBinbin Zhou =
<zhoubb.aaron@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>> On Fri, May 26, 2023 at 8:07=E2=80=AFPM Conor Dooley =
<conor.dooley@microchip.com> wrote:
>>>> On Fri, May 26, 2023 at 09:37:02AM +0800, Binbin Zhou wrote:
>>>>> On Fri, May 26, 2023 at 1:05=E2=80=AFAM Conor Dooley =
<conor@kernel.org> wrote:
>>>>>> On Thu, May 25, 2023 at 08:55:23PM +0800, Binbin Zhou wrote:
>>>>=20
>>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    enum:
>>>>>>> +      - loongson,ls1b-rtc
>>>>>>> +      - loongson,ls1c-rtc
>>>>>>> +      - loongson,ls7a-rtc
>>>>>>> +      - loongson,ls2k0500-rtc
>>>>>>> +      - loongson,ls2k1000-rtc
>>>>>>> +      - loongson,ls2k2000-rtc
>>>>>>=20
>>>>>> |+static const struct of_device_id loongson_rtc_of_match[] =3D {
>>>>>> |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D =
&ls1x_rtc_config },
>>>>>> |+       { .compatible =3D "loongson,ls1c-rtc", .data =3D =
&ls1x_rtc_config },
>>>>>> |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D =
&generic_rtc_config },
>>>>>> |+       { .compatible =3D "loongson,ls2k0500-rtc", .data =3D =
&generic_rtc_config },
>>>>>> |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D =
&ls2k1000_rtc_config },
>>>>>> |+       { .compatible =3D "loongson,ls2k2000-rtc", .data =3D =
&generic_rtc_config },
>>>>>> |+       { /* sentinel */ }
>>>>>> |+};
>>>>>>=20
>>>>>> This is a sign to me that your compatibles here are could do with =
some
>>>>>> fallbacks. Both of the ls1 ones are compatible with each other & =
there
>>>>>> are three that are generic.
>>>>>>=20
>>>>>> I would allow the following:
>>>>>> "loongson,ls1b-rtc"
>>>>>> "loongson,ls1c-rtc", "loongson,ls1b-rtc"
>>>>>> "loongson,ls7a-rtc"
>>>>>> "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
>>>>>> "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
>>>>>> "loongson,ls2k1000-rtc"
>>>>>>=20
>>>>>> And then the driver only needs:
>>>>>> |+static const struct of_device_id loongson_rtc_of_match[] =3D {
>>>>>> |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D =
&ls1x_rtc_config },
>>>>>> |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D =
&generic_rtc_config },
>>>>>> |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D =
&ls2k1000_rtc_config },
>>>>>> |+       { /* sentinel */ }
>>>>>> |+};
>>>>>>=20
>>>>>> And ~if~when you add support for more devices in the future that =
are
>>>>>> compatible with the existing ones no code changes are required.
>>>>>=20
>>>>> Hi Conor:
>>>>>=20
>>>>> Thanks for your reply.
>>>>>=20
>>>>> Yes, this is looking much cleaner. But it can't show every chip =
that
>>>>> supports that driver.
>>>>>=20
>>>>> As we know, Loongson is a family of chips:
>>>>> ls1b/ls1c represent the Loongson-1 family of CPU chips;
>>>>> ls7a represents the Loongson LS7A bridge chip;
>>>>> ls2k0500/ls2k1000/ls2k2000 represent the Loongson-2 family of CPU =
chips.
>>>>>=20
>>>>> Based on my previous conversations with Krzysztof, it seems that
>>>>> soc-based to order compatible is more popular, so I have listed =
all
>>>>> the chips that support that RTC driver.
>>>>=20
>>>> Right. You don't actually have to list them all *in the driver* =
though,
>>>> just in the binding and in the devicetree. I think what you have =
missed
>>>> is:
>>>>>> I would allow the following:
>>>>>> "loongson,ls1b-rtc"
>>>>>> "loongson,ls1c-rtc", "loongson,ls1b-rtc"
>>>>>> "loongson,ls7a-rtc"
>>>>>> "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
>>>>>> "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
>>>>>> "loongson,ls2k1000-rtc"
>>>>=20
>>>> This is what you would put in the compatible section of a =
devicetree
>>>> node, using "fallback compatibles". So for a ls1c you put in
>>>> compatible =3D "loongson,ls1c-rtc", "loongson,ls1b-rtc";
>>>> and the kernel first tries to find a driver that supports
>>>> "loongson,ls1c-rtc" but if that fails it tries to find one that =
supports
>>>> "loongson,ls1b-rtc". This gives you the best of both worlds - you =
can
>>>> add support easily for new systems (when an ls1d comes out, you =
don't
>>>> even need to change the driver for it to just work!) and you have a
>>>> soc-specific compatible in case you need to add some workaround for
>>>> hardware errata etc in the future.
>>>=20
>>> I seem to understand what you are talking about.
>>> I hadn't delved into "fallback compatibles" before, so thanks for =
the
>>> detailed explanation.
>>>=20
>>> In fact, I have thought before if there is a good way to do it other
>>> than adding comptable to the driver frequently, and "fallback
>>> compatibles" should be the most suitable.
>>>=20
>>> So in the dt-bindings file, should we just write this:
>=20
> Not quite, because you still need to allow for ls1b-rtc and ls7a-rtc
> appearing on their own. That's just two more entries like the
> ls2k1000-rtc one.
>=20
>>>=20
>>> compatible:
>>>   oneOf:
>>>     - items:
>>>         - enum:
>>>             - loongson,ls1c-rtc
>>>         - const: loongson,ls1b-rtc
>>>     - items:
>>>         - enum:
>>>             - loongson,ls2k0500-rtc
>>>             - loongson,ls2k2000-rtc
>>>         - const: loongson,ls7a-rtc
>=20
>>>     - items:
>>>         - const: loongson,ls2k1000-rtc
>=20
> This one is just "const:", you don't need "items: const:".
> I didn't test this, but I figure it would be:
> compatible:
>   oneOf:
>     - items:
>         - enum:
>             - loongson,ls1c-rtc
>         - const: loongson,ls1b-rtc
>     - items:
>         - enum:
>             - loongson,ls2k0500-rtc
>             - loongson,ls2k2000-rtc
>         - const: loongson,ls7a-rtc
>     - const: loongson,ls1b-rtc
>     - const: loongson,ls2k1000-rtc
>     - const: loongson,ls7a-rtc
>=20
>> My recommendation is leaving compatible string as is.
>=20
> "as is" meaning "as it is right now in Linus' tree", or "as it is in
> this patch"?

Ah sorry I meant in this patch.

Since there won=E2=80=99t be any new ls1x chip that will boot Linux any =
time soon (due to
Loongson move away from MIPS but LoongArch32 is undefined for now), and
rest compatible strings are wide enough to cover their family, I think =
the present
compatible strings in this patch describes hardware best.

Thanks
- Jiaxun

>=20
> Cheers,
> Conor.


