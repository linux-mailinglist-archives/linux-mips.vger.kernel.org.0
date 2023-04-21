Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4918A6EA5AD
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 10:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjDUISd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 04:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjDUISc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 04:18:32 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7FA2106
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 01:18:27 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id B0151320090D;
        Fri, 21 Apr 2023 04:18:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 21 Apr 2023 04:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1682065099; x=1682151499; bh=68k85WgtZxBnTEbbW9doHGXgMeqwNlwYJgH
        OKzCGTzI=; b=jiENr2TR3p0wUEQaYSy1iiTgmUTDP5UrsbHv2qXlXcltyFyHix3
        B6kyj7aYspoFz/lDCFL6FLoYbZgWnGCLC68nORyPNqD+mAvxU1CG9fjuK+k6I8Sz
        dg4rgdljC8zX6k44xncu0r/CokttbD0n4jQYBkKdfEh1I3s39XRwLC/yE359HQrS
        4d91PWztncwqCIn5F1RPDaAfU2LaGhN+WaAdsPsUG9yWy9iG6Ir84O2MFtQu2PPQ
        bZUVdE6Nwn8RXmVf8oZcgNLfJjvJ1kIhBrqqOy29llwRmECxdjS4A8jDsW8JSqXn
        QQ745ww+mzoaGKK0FGzKdOuH1E+r8miG3EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682065099; x=1682151499; bh=68k85WgtZxBnTEbbW9doHGXgMeqwNlwYJgH
        OKzCGTzI=; b=dyHbmK9DZRCC6LSGfP4y0s0TsHRP71jUAmGS78ezegmZIMqbiIB
        Sau1zVaZr40YNUE7CYX/B00EbKPsCtOVueU1iqSSI4kyXlEHzW39EPAd2Uknvmq7
        PBKqOsye9MZx4c4T65OY8jSzwjNPnXwVHSoumGBdRPSd5Ao9jZ0BzBBRj3uASDsD
        76cohu61FV+hMivETd6DZNJ3PXmJmvni2s2wRT9hH6lZV2/4mIrcFytEvNHVRcHW
        jChuVZO/4jNesu11FtLCMoLGcliNNyAtXvWJ06iDHJ8m7DubrRn1SLkpusO6jmob
        URK1HJnDNlXX/4MpJDc4vXegFFtLvatkytg==
X-ME-Sender: <xms:ykZCZFNMuqU8Q_sA3UM9o3JUJk6Rj_VtzUSEBDzX9WV5LCRxx1r0yA>
    <xme:ykZCZH8tX4_HJ8_yZ4eqqsg4ipJnk6hAVu14HfUBpcDYc8nD9sWLBbBLRyQ-2wlkU
    3inco34qcW645LfuYQ>
X-ME-Received: <xmr:ykZCZETR2pjfImM8VV_Zy_KKHwL-frkAkvfZKTXHxhVHNgShdPByXbcJXgp7D5GXI8Lf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:ykZCZBuewdRIkMDiopE0Y6u5x53Xg3D0X7c09afzIDKASDO6MZV0uQ>
    <xmx:ykZCZNdXpPGeWJXft6243erqFWrjHIRxY_vDH9ThAgn4wfV01_rhUQ>
    <xmx:ykZCZN0s_3bhjbBOkQBXTJh5dX41bupustkvXtVjKSvYHkNnTvJWXA>
    <xmx:y0ZCZB5xW3iNDEVjcrI5O-tXqrlGmlYVNB0KEvxw0yfBE8y_nl-1vg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Apr 2023 04:18:18 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 1/8] MIPS: Replace assembly isa level directives with
 macros
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230421074134.GA6209@alpha.franken.de>
Date:   Fri, 21 Apr 2023 09:18:07 +0100
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <96B10469-5D0E-4C61-9E68-E854B68CDFD8@flygoat.com>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
 <20230409104309.13887-2-jiaxun.yang@flygoat.com>
 <CAKwvOdmRobqFrnZ70ODzdMfp4A-Br0mHhRkEnmTrkyk7CmiERg@mail.gmail.com>
 <FEE1072C-2228-4B2E-92C0-760F0B471D04@flygoat.com>
 <20230421074134.GA6209@alpha.franken.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=8821=E6=97=A5 08:41=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, Apr 20, 2023 at 08:29:03PM +0100, Jiaxun Yang wrote:
>> Yes, GAS and LLVM sometimes have different opinions on what a =
instruction
>> feature should belong to. Personally I think there is no right or =
wrong in most case.
>>=20
>> So generally when we try to use some inline assembly features that =
toolchain
>> may consider belongs to higher ISA level we will use `.set mips64r2` =
directives.
>>=20
>> Having this patch just unified the defined arch across the tree, so =
it happens to fix
>> some cases where `.set` was given a improper option.
>=20
> I'd prefer, if we don't magically fix something by doing this massive
> replacement. So first bug fixing then cleanup.
It really cost a fortune to identify all of those problems, while this =
is
A one off fix for all potential problems.

>=20
> And what I don't like is the name of the #defines (I know it's not =
your
> choice, ), they don't tell me anything and it's still not clear which
> one should be used in which case.

Perhaps MIPS_ISA_SUPERSET or something?

>=20
> I see one use case, which is enabling 64bit instruction inside a 32bit
> kernel.
>=20
> What are the others ?

Mostly enabling instructions that may not belong to current -march =
config.
e.g.:
MT/MSA requires R2 but sometimes we do want to compile in for R1 kernel.

MFC0/MTC0 with sel oprand requires R1, but we are using it on earlier =
CPUs with
sel =3D 0 or on some unreachable (only determined at runtime) paths.

GAS is unhappy to assemble LLSC on some CPU variants, while we are going
to detect if we can use LLSC on those systems at runtime. The same for =
wait
and cache.

There are just too many usage in kernel.

>=20
> Do we really need all of them ? For example the change in
> arch/mips/mm/cex-oct.S, this is for a octeon kernel, which only =
supports
> and works with 64bit kernels...

I must admit by my visual inspection there is certainly some unnecessary =
.sets, sometimes
they are blindly copied from else where.

But identify them requires a lot of effort, i.e., build for all of our =
support CPUs with
different ASE/Endian options. I=E2=80=99d leave this for a future =
clean-up.

Thanks
Jiaxun




