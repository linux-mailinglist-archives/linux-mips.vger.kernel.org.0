Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A7C6A3622
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 02:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjB0BXF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Feb 2023 20:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB0BXF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Feb 2023 20:23:05 -0500
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E914A24E
        for <linux-mips@vger.kernel.org>; Sun, 26 Feb 2023 17:23:04 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 0D4B43200392;
        Sun, 26 Feb 2023 20:23:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 26 Feb 2023 20:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677460980; x=
        1677547380; bh=BStcnzskaFO67at571YcieUwvgiyg9Ejon+OfWyA8eg=; b=C
        zLYlHirFyrvmsv+tC250IerPb6jdqJx56A/ah4l7A1fMu3YHGQJw2yHxUSpEsiu6
        FVfoJw3aY6VTd9e4oFdZCE5mrMWpZpH/cyASg3w+xTNzKmCKTMiCjGhApIOn4KNF
        lZu1DJy5d/NJwEZ3NVTl3kIDmf1jJayBf/sRfZMsjsGlJ0s1IbTiRsWCpBdAroGg
        vPUfAdES1YxqLJyCn54mZXS2+cIDgd6vMdZORfPFPbNX/Yuq8Bubn5g/1BvTqMu/
        VYLhOeOBg52C9+ZNazppL6FvlzJU/LLDrqMGDJtPFiuk3LkDvvusn2VhFZRi8jml
        s4YGwzx2Nm4U0yUqCa2/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677460980; x=
        1677547380; bh=BStcnzskaFO67at571YcieUwvgiyg9Ejon+OfWyA8eg=; b=J
        S/ibbwAhpOkPbwUFOABgZXbgByD/K7dmodLh8q9pjjRadIlgd6jtB2ey4b1WYmDK
        bph94cvJ7DniffmSNDmeSGwpIpSHPCgGMi2klaEJj6bT8/Hmn2On23xTbNgKtFjd
        jYYv3gWeHnpcZUhtFMWIBO16aY/khmW3ut/g3BC0Z8Jqbu+3iuDBYVuxKbfg6AKk
        RO0etL2T0YWxYk60JucQ7uJqzgnWqyZgjA3Wvi74EAWegPLrUd7BRtX3pjjsKxC3
        w5H0DYrZOGVQ5i6Ks5p3NjJOPCv50HA+GxwE9/jM9A+VJkaYWRAYRy1LImpLc2HB
        llep8W0E8a/+wZIg/ikzQ==
X-ME-Sender: <xms:9AX8Y7kEcEeTqB8ZCae7eGF12yvS3ihMxaOE4kQ10frO_bN8LGV5vQ>
    <xme:9AX8Y-1Uch9TFbM6PtyHfLnjVsR1_DZavuSkk52AqxYwhntkhscoX5Em_01j9ZAQP
    cM4c-UsV4p-7cddIuE>
X-ME-Received: <xmr:9AX8Yxpv1-PIOqdo1QH4oMPTjAHaBElpSe8Jd3u8CA1mWqQP0r4SeYjbi4SuHyd1YqSHRug-siQ2-MVKybQ_IJ7LcjjvLx4l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekledgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:9AX8YzkWZ83Yy9U55E7YhpIDdtvbqyL8zosAgWOuUDVZ4BKSMzAA8w>
    <xmx:9AX8Y51wqzkkLIzFayqT5zUTfK9vEY0pnIlmDf8Ay54vDVHoP7a2_w>
    <xmx:9AX8Yyudzgy8IXmbbCOkVRLv8NC9S58FW-BOcfd7L5smS-Wy2tY6-g>
    <xmx:9AX8Y2-V1Yl0RHDnZ-_Wpy3dFUjg2ntEjpuf-48zpGgMTttY3dpK2w>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Feb 2023 20:22:59 -0500 (EST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH 2/2] MIPS: cevt-r4k: Offset counter value for clearing
 compare interrupt
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230226232331.GA9208@alpha.franken.de>
Date:   Mon, 27 Feb 2023 01:22:47 +0000
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <579403EF-8E0D-4AC9-9AB1-51CBB433E114@flygoat.com>
References: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
 <20230225221008.8520-3-jiaxun.yang@flygoat.com>
 <20230226232331.GA9208@alpha.franken.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B42=E6=9C=8826=E6=97=A5 23:23=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sat, Feb 25, 2023 at 10:10:08PM +0000, Jiaxun Yang wrote:
>> In c0_compare_int_usable we clear compare interrupt by write value
>> just read out from counter to compare register.
>>=20
>> However sometimes if those all instructions are graduated together
>> then it's possible that at the time compare register is written, the
>> counter haven't progressed, thus the interrupt is triggered again.
>>=20
>> It also applies to QEMU that instructions is execuated significantly
>> faster then counter.
>>=20
>> Offset the counter value a litlle bit to prevent that happen.
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> arch/mips/kernel/cevt-r4k.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/arch/mips/kernel/cevt-r4k.c =
b/arch/mips/kernel/cevt-r4k.c
>> index 32ec67c9ab67..bbc422376e97 100644
>> --- a/arch/mips/kernel/cevt-r4k.c
>> +++ b/arch/mips/kernel/cevt-r4k.c
>> @@ -200,6 +200,8 @@ int c0_compare_int_usable(void)
>> */
>> if (c0_compare_int_pending()) {
>> cnt =3D read_c0_count();
>> + // Drawdown a little bit in case counter haven't progressed
>=20
> no C++ comments
>=20
>> + cnt -=3D COMPARE_INT_SEEN_TICKS;
>> write_c0_compare(cnt);
>> back_to_back_c0_hazard();
>> while (read_c0_count() < (cnt  + COMPARE_INT_SEEN_TICKS))
>=20
> this doesn't make sense. clearing of the interrupts happes because of
> this loop. So either COMPARE_INT_SEEN_TICKS is too small or you are
> hunting a different bug.

Clearing interrupt happens in write_c0_compare but the problem is the =
interrupt
does really get cleared because it triggered again straight away.

Had confirmed issue on MIPS I6500 uarch simulation trace.

Ah I see, it makes more sense if I move minus into write_c0_compare so =
the
loop will still run. Though this loop is not required on any MTI cores, =
TI is
always clear immediately since very early 4Kc.

Will send v2 later.

Thanks.

=20

>=20
> Thomas.
>=20
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not =
necessarily a
> good idea.                                                [ RFC1925, =
2.3 ]

