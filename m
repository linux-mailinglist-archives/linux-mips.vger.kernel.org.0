Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5A87135AB
	for <lists+linux-mips@lfdr.de>; Sat, 27 May 2023 18:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjE0QOA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 May 2023 12:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjE0QN7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 May 2023 12:13:59 -0400
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574C0DF;
        Sat, 27 May 2023 09:13:58 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id EAC9358026C;
        Sat, 27 May 2023 12:13:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 27 May 2023 12:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1685204035; x=1685211235; bh=0/2nVwXt5FMw3PaKmi8rGpo6QYJ55c2Efcp
        TwuuEPF8=; b=fnREYNyOdLSoKlXA9cPCWV02UaCKPLPb0ZODZI13UkskyjKAe6y
        m6LskSpla+SiQ+At0cku9NeQO1wRPAO+UuVAxs3zRogcryXVrp+hfbST3i9ChuNs
        Yn1rGlBBQs7oAonbWrJiJSEJ6ooQM/7eTa4TKm/+HS1iXiooS82v6UBZKM4Jrqaz
        ikJrSBeUsjApRSGq7G6TJu7rwv9Sm8nKQNKclo/6O6ow1e34f7BNY/9vlgh3wXn0
        odJQQNL4fQi7Ve21yELjOCAhkvDgriTh9N4IZL2v54VaIEC48J0gMEpUD2lPWjVV
        dgXx40dkOPj30RjzZFZqE5NWFQn3BSmio3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1685204035; x=1685211235; bh=0/2nVwXt5FMw3PaKmi8rGpo6QYJ55c2Efcp
        TwuuEPF8=; b=uPcFY4LKhKhN+0rzrK8u3+MWOUBtdqKv+EBoyEyve/rFl1Qk/MD
        ZohJQGg3LppGCOZN78ZZQLBWQufwQupkspIdtuqz1iM/yrkIkEeusAQHGOdJlPVp
        JYMOnKeIh/b66439wGpVvHQtYpskqAhHU89WcbMdM/KtdO/PzW20Kgo0huZ1BNTm
        rhiIOA7EY7kvPJ2E0q0Z9LvoTi4wPAaJ22Yw2ddA1jPu102Dbhaalegs2i0EeOB7
        YWEvtRJO+fs0gmb+Ajhez6VknvlmU23pxg4Gf0QZi++sKelPbmWV3u8c3YOYloDS
        IMYb/XzWTcroqFufoaLWu/zlTCJHYhR3x5Q==
X-ME-Sender: <xms:QSxyZHU1_wDNqPZc-A5G4ItjF0fO0DxrQsfpaDLnHMGaDEOTjHYtgQ>
    <xme:QSxyZPn8grwFORhDbglLALRWOtd5Mo5w8k7hNMNLdmi23a5IsXhNu3IOkPd_Gk1Ca
    vuvBemW2VKsbXYnGVA>
X-ME-Received: <xmr:QSxyZDbE-Q2e35SV_wKWgDctcaiCywYgl1Whlcppxfa4VjyX6_yJnZGuoIlLih_5xW1B>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:QSxyZCV7TFTalTXbtv-v3csPMPgYWf-hZvPgghZ0QYYmY_zVHH4rxA>
    <xmx:QSxyZBlxk3M3J3IxQbSEwcnnZtdCouSxmWHkurYZya_t86qrsKqTwQ>
    <xmx:QSxyZPc5Vh9SzjlRqXQ6wVmNIqhu7UOpeiPtUHpoiEDRBUmmz5SGOA>
    <xmx:QyxyZLqBT7mFeG1gao39kERImy0Zi8Ir71PgIY-tW0_L2sTfhO9rqg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 May 2023 12:13:51 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial
 RTCs
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
Date:   Sat, 27 May 2023 17:13:39 +0100
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor@kernel.org>,
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
Message-Id: <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud>
 <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy>
 <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>
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



> 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 10:22=EF=BC=8CBinbin Zhou =
<zhoubb.aaron@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, May 26, 2023 at 8:07=E2=80=AFPM Conor Dooley =
<conor.dooley@microchip.com> wrote:
>>=20
>> On Fri, May 26, 2023 at 09:37:02AM +0800, Binbin Zhou wrote:
>>> On Fri, May 26, 2023 at 1:05=E2=80=AFAM Conor Dooley =
<conor@kernel.org> wrote:
>>>> On Thu, May 25, 2023 at 08:55:23PM +0800, Binbin Zhou wrote:
>>=20
>>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - loongson,ls1b-rtc
>>>>> +      - loongson,ls1c-rtc
>>>>> +      - loongson,ls7a-rtc
>>>>> +      - loongson,ls2k0500-rtc
>>>>> +      - loongson,ls2k1000-rtc
>>>>> +      - loongson,ls2k2000-rtc
>>>>=20
>>>> |+static const struct of_device_id loongson_rtc_of_match[] =3D {
>>>> |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D =
&ls1x_rtc_config },
>>>> |+       { .compatible =3D "loongson,ls1c-rtc", .data =3D =
&ls1x_rtc_config },
>>>> |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D =
&generic_rtc_config },
>>>> |+       { .compatible =3D "loongson,ls2k0500-rtc", .data =3D =
&generic_rtc_config },
>>>> |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D =
&ls2k1000_rtc_config },
>>>> |+       { .compatible =3D "loongson,ls2k2000-rtc", .data =3D =
&generic_rtc_config },
>>>> |+       { /* sentinel */ }
>>>> |+};
>>>>=20
>>>> This is a sign to me that your compatibles here are could do with =
some
>>>> fallbacks. Both of the ls1 ones are compatible with each other & =
there
>>>> are three that are generic.
>>>>=20
>>>> I would allow the following:
>>>> "loongson,ls1b-rtc"
>>>> "loongson,ls1c-rtc", "loongson,ls1b-rtc"
>>>> "loongson,ls7a-rtc"
>>>> "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
>>>> "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
>>>> "loongson,ls2k1000-rtc"
>>>>=20
>>>> And then the driver only needs:
>>>> |+static const struct of_device_id loongson_rtc_of_match[] =3D {
>>>> |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D =
&ls1x_rtc_config },
>>>> |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D =
&generic_rtc_config },
>>>> |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D =
&ls2k1000_rtc_config },
>>>> |+       { /* sentinel */ }
>>>> |+};
>>>>=20
>>>> And ~if~when you add support for more devices in the future that =
are
>>>> compatible with the existing ones no code changes are required.
>>>=20
>>> Hi Conor:
>>>=20
>>> Thanks for your reply.
>>>=20
>>> Yes, this is looking much cleaner. But it can't show every chip that
>>> supports that driver.
>>>=20
>>> As we know, Loongson is a family of chips:
>>> ls1b/ls1c represent the Loongson-1 family of CPU chips;
>>> ls7a represents the Loongson LS7A bridge chip;
>>> ls2k0500/ls2k1000/ls2k2000 represent the Loongson-2 family of CPU =
chips.
>>>=20
>>> Based on my previous conversations with Krzysztof, it seems that
>>> soc-based to order compatible is more popular, so I have listed all
>>> the chips that support that RTC driver.
>>=20
>> Right. You don't actually have to list them all *in the driver* =
though,
>> just in the binding and in the devicetree. I think what you have =
missed
>> is:
>>>> I would allow the following:
>>>> "loongson,ls1b-rtc"
>>>> "loongson,ls1c-rtc", "loongson,ls1b-rtc"
>>>> "loongson,ls7a-rtc"
>>>> "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
>>>> "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
>>>> "loongson,ls2k1000-rtc"
>>=20
>> This is what you would put in the compatible section of a devicetree
>> node, using "fallback compatibles". So for a ls1c you put in
>> compatible =3D "loongson,ls1c-rtc", "loongson,ls1b-rtc";
>> and the kernel first tries to find a driver that supports
>> "loongson,ls1c-rtc" but if that fails it tries to find one that =
supports
>> "loongson,ls1b-rtc". This gives you the best of both worlds - you can
>> add support easily for new systems (when an ls1d comes out, you don't
>> even need to change the driver for it to just work!) and you have a
>> soc-specific compatible in case you need to add some workaround for
>> hardware errata etc in the future.
>=20
> Hi Conor:
>=20
> I seem to understand what you are talking about.
> I hadn't delved into "fallback compatibles" before, so thanks for the
> detailed explanation.
>=20
> In fact, I have thought before if there is a good way to do it other
> than adding comptable to the driver frequently, and "fallback
> compatibles" should be the most suitable.
>=20
> So in the dt-bindings file, should we just write this:
>=20
>  compatible:
>    oneOf:
>      - items:
>          - enum:
>              - loongson,ls1c-rtc
>          - const: loongson,ls1b-rtc
>      - items:
>          - enum:
>              - loongson,ls2k0500-rtc
>              - loongson,ls2k2000-rtc
>          - const: loongson,ls7a-rtc
>      - items:
>          - const: loongson,ls2k1000-rtc

My recommendation is leaving compatible string as is.

Thanks
- Jiaxun

>=20
> Thanks.
> Binbin
