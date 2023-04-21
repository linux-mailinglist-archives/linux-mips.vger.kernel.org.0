Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690526EAAB5
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 14:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbjDUMoL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 08:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjDUMnw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 08:43:52 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1579A118F7
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 05:43:28 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id E17675C0125;
        Fri, 21 Apr 2023 08:43:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 21 Apr 2023 08:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1682080989; x=1682167389; bh=MjYiLPZSoK/R59nkyiuKtpzVDszctJX3rDT
        Em9/z6q0=; b=H7VA3SyFU73sznHlr3tvL1odW9urEx9hRyXtvhVbNXTge4VQp1r
        /bUbS7Xk/af/FkMwgXLxhVdqqiW+2hPbvIQmYAahrDZxKVrlS5MCNyCas4VBFK0p
        qbAin1XTw0nsK8csbsa3l3ssbfw8DxwjxuKo+qeSXvlv319fNUW1uN+p+4m6+a7y
        4jJ8zXWd8pz0ANaCl38UK16adoIoRAoaRIGHNI1CuDF9AjPAkoAvREvocyjzqB9H
        VUT+TSq5+30gyo7JVW+04WlXwRdTY+s6SiMppJEzxKmqOv1WSLR8opSPvnSS3tML
        QN2PLkqGDsG5JKoe2JrV+44vluXde9MmYQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682080989; x=1682167389; bh=MjYiLPZSoK/R59nkyiuKtpzVDszctJX3rDT
        Em9/z6q0=; b=NhmWbl5ow5a1/wbn1cmQUkpEtkiAIBOK6ATDFGAeyC32Q01j6Se
        3HhLxRNxfHsIodF7C9wirNt5O/mAWq07avqpSKqjub9BrkFCut2MnwUCoJULDOpV
        QMoS4A8QFguvLTFGpuphUtov2j/MGE3ylULjptMAPGN4VEwkc67QfWkLBK4h4Ciy
        uftQi0zuZfBRWKv1wpqwF3MzN8/PkCtuJJsBX9bpNyRevLBAYw/MejpPc2sZBF44
        cEHqSTQH2ACn/CoGBOVtG1dUxBF1rWomKnVN7Y7Py+8N3ggqn1QtsMFz+a+flImL
        OT5+encmIF+b3AM+5Zb5NYfM8hDOODrX0Zg==
X-ME-Sender: <xms:3YRCZN8isGSvjsls2dOD5BI6H1luYk6DEGi9q9flWgSPVtHotzXT-Q>
    <xme:3YRCZBtP3e3x0nsDUYxjMx0BqcwuZ828Sdgk3i3ap1Y6PU0hWoEJfmDP3nT5YEwmi
    VOF8wjRRtjtBN9WaCk>
X-ME-Received: <xmr:3YRCZLBIkWqvN88G9v5CkQCNYjbRtG0ihrR8SW66lMOEFyCCKzJQji3OO4ow0yKanXhv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:3YRCZBd_Tc5zID5XD5ywnpOcL-B8XmLSHFIroeZvsc1Vpzlnc3AN0A>
    <xmx:3YRCZCOLpc7qaMbJ0WJL5ioB92kGdYz5H_B7hpHukwcvVlrXxO6vag>
    <xmx:3YRCZDlMqNaQgBIu_G6rEheWzxPBdXv5T34MsMhRUzao2NWVCq51EQ>
    <xmx:3YRCZPqf7oOEvf2iH52dXiY0bHZz3RTy75styWle3UzqE54zW_DzWQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Apr 2023 08:43:08 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 5/8] MIPS: mipsregs: Parse fp and sp register by name in
 parse_r
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230421122125.GA10237@alpha.franken.de>
Date:   Fri, 21 Apr 2023 13:42:57 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <913B06A9-8D95-4735-8BAD-B74F0EF92F7A@flygoat.com>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
 <20230409104309.13887-6-jiaxun.yang@flygoat.com>
 <20230421104832.GA9238@alpha.franken.de>
 <F861FB0C-C6B3-4B16-8ECD-FD01E62DD429@flygoat.com>
 <20230421122125.GA10237@alpha.franken.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=8821=E6=97=A5 13:21=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Apr 21, 2023 at 12:38:07PM +0100, Jiaxun Yang wrote:
>>=20
>>=20
>>> 2023=E5=B9=B44=E6=9C=8821=E6=97=A5 11:48=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Sun, Apr 09, 2023 at 11:43:06AM +0100, Jiaxun Yang wrote:
>>>> parse_r helper is used to parse register number from oprand,
>>>> it only handles oprand which use number to refer register before.
>>>>=20
>>>> However compiler may use $gp and $sp to reference register 29 and
>>>> 30. Handle this situation by adding relevant match name.
>>>=20
>>> are you sure the compiler is doing that ? Which compiler is this ?
>>> To me this feels more like missing #defines from asm/regdef.h for
>>> some inline assembly stuff...
>>=20
>> Yes, clang is doing that, see[1].
>>=20
>> There is no inline assembly mentioning $fp for cfcmsa but clang is =
still generating $fp for
>> cfcmsa.
>>=20
>> I was able to reproduce this by dumping assembly generated by clang, =
but I=E2=80=99m
>> unable to reproduce it for now, it seems like clang will only =
allocate $fp in rare cases.
>=20
> so is this clang miss-behaviour ? If yes fix should be done there.

I think it is not forbidden. Clang is doing nothing wrong and as long as =
assembler is ok with that
parse_r should able to handle it.

Thanks
Jiaxun

>=20
> Thomas.
>=20
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not =
necessarily a
> good idea.                                                [ RFC1925, =
2.3 ]


