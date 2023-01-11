Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41BC6660EE
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jan 2023 17:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbjAKQrp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Jan 2023 11:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232408AbjAKQri (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Jan 2023 11:47:38 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01061B86;
        Wed, 11 Jan 2023 08:47:37 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 484493200945;
        Wed, 11 Jan 2023 11:47:36 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute2.internal (MEProxy); Wed, 11 Jan 2023 11:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1673455655; x=
        1673542055; bh=317hm/HGpgVr00LGmqYgdx8qn5gsqlg5pbk+Bphz3lk=; b=O
        2i5LKBJTP4Ytl/BdYnkPjuUsQ5C8JoSm2tGohQY2mNNyAIQSja5JDIEdhtN1Vuxw
        rLOppgBaGzjRTFYUPLf/A0qY7+FyFznyXX1Fw5cFQQhEAX1uz0Xem4ZX8owE3P6t
        jgu4n7+dzLNRaolapwY5DRBnj5DKLrF7K6xc5agpu+RvJKvU3Z0KnLiNQxOPJVBx
        Dsw0pzQiuHMp4qmquZOtloj2R270AX35hE4VTq+rx8SV+GlDFEa+VoR0V41YIiEA
        dqDFTT0lwylBKu8pjCSMLC3CXMzlNHPwvJkY6UqC33N4PzFGgFXShHHA7bvRkUxD
        StYE/xeEqOmRoBynwgCYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673455655; x=
        1673542055; bh=317hm/HGpgVr00LGmqYgdx8qn5gsqlg5pbk+Bphz3lk=; b=T
        ZRlvkmRpkPS8vsjiZds74p9YlgD0Ps4Tt2Bqe4DectWKc0i/ZK2/Ix/kdBU7+Eo9
        rni9vWUoOgPtyk6qMsbnEMnR0Q+l21EjKiX90qFCPxtxaxDwRm466/Bai3GE/OJZ
        wDhBbNULdUIxgOpztj/4ViSLxSWg6WX9YOdOZnILKew+R/wXzLYB5HZ5vQSse+oK
        hn0XwNMa7YqAGaX+4mQ4RMTtGsP5yc1BXWiX6bSH1V6/XPX/c9W4ViPGufQu50kq
        w2x8MQVPRL7G80emOYbSJctrTlS82c8fn/lpLb4whBqqWokRK8da2+XiNSJ/wixh
        I4cAHtiUC27A9+y7yNSoA==
X-ME-Sender: <xms:Jui-Y70m9x498enBJPQbxeUPMFcRBTJQRJC-Zy-0PG6-8NF9sjrFiw>
    <xme:Jui-Y6FoOyD6VuN3WzW0tLKALSwJdMge_yahGdMX74kBQT3dZ2_HCKUXjUmVz2TLw
    mSXfk1llKIkPbQs9b0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeggdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Jui-Y76KGCNLr_Fo-pv_X0BK3eKyg6jMfE2_AL3vLd9gS0Cy1IQ3fg>
    <xmx:Jui-Yw0zJe7kllYpaBtUmbBiuL-3A8-H6SZxVAZfavSU5k6FXclEBw>
    <xmx:Jui-Y-Eu9GMmEMeUKNzaXTiqKJKOD3-IfXbwo4fGuVj9-TQVujzN1A>
    <xmx:J-i-Y6HnrkzHfe0zXx9zceFoazuZwE6DNSl8-jG4XO2EeNSI3bFjaA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2C25036A0073; Wed, 11 Jan 2023 11:47:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <f6c80b25-c11d-4f11-885c-6d7fb71bb92f@app.fastmail.com>
In-Reply-To: <8be1bf437f5407c54a93e7be2c6303d0eb6eeb83.1673227292.git.zhoubinbin@loongson.cn>
References: <cover.1673227292.git.zhoubinbin@loongson.cn>
 <8be1bf437f5407c54a93e7be2c6303d0eb6eeb83.1673227292.git.zhoubinbin@loongson.cn>
Date:   Wed, 11 Jan 2023 16:47:13 +0000
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Binbin Zhou" <zhoubinbin@loongson.cn>,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Huacai Chen" <chenhuacai@loongson.cn>,
        "Xuerui Wang" <kernel@xen0n.name>
Cc:     linux-rtc@vger.kernel.org,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        loongarch@lists.linux.dev, "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, "Qing Zhang" <zhangqing@loongson.cn>,
        "Tiezhu Yang" <yangtiezhu@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, "WANG Xuerui" <git@xen0n.name>
Subject: Re: [PATCH V2 6/7] MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E5=9C=A82023=E5=B9=B41=E6=9C=889=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=881:36=EF=BC=8CBinbin Zhou=E5=86=99=E9=81=93=EF=BC=9A
> The Loongson-2K RTC module is now supported, enable it.
>
> The MMIO address is unclear from the Loongson 2K1000 user manual, I to=
ok
> it from Loongson's out-of-tree fork of Linux 4.19.

Can confirm this MMIO address is correct. It matches current confbus BAR
setting by PMON.

>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>


> ---
>  arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi=20
> b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> index 8143a61111e3..c22414595140 100644
> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> @@ -57,6 +57,13 @@ pm: reset-controller@1fe07000 {
>  			reg =3D <0 0x1fe07000 0 0x422>;
>  		};
>=20
> +		rtc0: rtc@1fe07800 {
> +			compatible =3D "loongson,ls2x-rtc";
> +			reg =3D <0 0x1fe07800 0 0x78>;
> +			interrupt-parent =3D <&liointc0>;
> +			interrupts =3D <60 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +
>  		liointc0: interrupt-controller@1fe11400 {
>  			compatible =3D "loongson,liointc-2.0";
>  			reg =3D <0 0x1fe11400 0 0x40>,
> --=20
> 2.31.1

--=20
- Jiaxun
