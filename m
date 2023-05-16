Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C700705816
	for <lists+linux-mips@lfdr.de>; Tue, 16 May 2023 21:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjEPT5N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 May 2023 15:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjEPT5M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 May 2023 15:57:12 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8302BB9
        for <linux-mips@vger.kernel.org>; Tue, 16 May 2023 12:57:00 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 311C25C0094;
        Tue, 16 May 2023 15:56:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 16 May 2023 15:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1684267018; x=1684353418; bh=0v3wJ5WXy1jG+g/J/F9Z/d9MNYhKtJVOLI3
        LaEchl5c=; b=QT6QgXzHOwetfYv9MWvXo5F8XgK+ACS/4SpvlDIUHataitIHL/S
        cMWMvB3zm2Bj+nIp9h8e2xhyqrto5RNQRo7wvPX6cjdz0BPh7TJnKqSsNT8aRO5U
        XqZ9t89ZupBiFSKnjHKI2GeBNoJouiU25xg9utnk+kWJJ0092rCjcsaAY2mQmsus
        Y2AP1zVaszKt4CZx4BbX1ITL4bJMHYsxV1nK9QUFpIKce3zq6YJw/LjEvteejgUb
        iMh/RZ1YoSaD7bEBprz+blY0ciswbGIWZ3iQfRhnpiHFRJ1nJ7/UWZK29S+YjwMm
        Hck85Ijv4P8uxL88pZtl4ATledLVBogtKrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1684267018; x=1684353418; bh=0v3wJ5WXy1jG+g/J/F9Z/d9MNYhKtJVOLI3
        LaEchl5c=; b=KUiNhkQvdcKiSFS5Oo+n8FzjuHNTnCAIX9RUnjB9yoqYySc8Qsp
        nIgur8mqqwA0hKvODmivnU2U2AC2H7nptN3z4i9l0gkfRLVHjeuS0qLjVTgH5MuL
        ZxUNZLHiVFtWU5I8AComhgh/NV2MObakXxLhojTQnoG/+qxjtYnkzgDR/ohTIe39
        FEF5yX3dsPaZOPKYRgDlr8Piw5K6/8jXl+13RbBg0AtYnkG3KJeOGdir57SZYnRK
        d+xVrjIV95lH9CqR9ootQrVFGlKs7pGH02Tz1kdeoQ4qKRRcDQYfq0jAqhWim2BY
        ARkySH/H8b9oFSRSwUxdWD6nHT8nMz+u8Cw==
X-ME-Sender: <xms:CeBjZLyD_6p6oq9c-sKKgy9k0tav1mbO4tqaIbDTPg5NxxjhNqdHRg>
    <xme:CeBjZDQbbCBjFGNSmyhqDChCtereK5Hi9CXUV3sfohekQSwv9mGoWZ6oZ1s_wSwmK
    FpcLBg4u_i8YUi9Rw0>
X-ME-Received: <xmr:CeBjZFWlyBEMZTv2_ZATVR0cmM1iRrD1OQncZYL0g35XY5wBP7U-bNWohM8k2yKQd7PL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehledgudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:CeBjZFgvODy2dhZqFH64NOly-GvhtQbdnGh5ozdidpsoy83HAlz2aQ>
    <xmx:CeBjZND82E-hasKadaZFyStR9g5VTBiuifKQy-Cife0UOBz3YkmRWQ>
    <xmx:CeBjZOIgLeNCZuQbcQyeYlqfmWd7Y3OCJRrb-eDdkRvy71weQ20gnQ>
    <xmx:CuBjZAPU2IYMtxr6fVvxLppCV8OaOpRFays11oUQgTVBpPkO7thO9Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 May 2023 15:56:56 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] MIPS: Limit MIPS_MT_SMP support by ISA reversion
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <alpine.DEB.2.21.2305161542290.50034@angie.orcam.me.uk>
Date:   Tue, 16 May 2023 20:56:45 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <62F0038E-F2A2-4D1E-B53A-E84916598102@flygoat.com>
References: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
 <alpine.DEB.2.21.2305161542290.50034@angie.orcam.me.uk>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
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



> 2023=E5=B9=B45=E6=9C=8816=E6=97=A5 16:05=EF=BC=8CMaciej W. Rozycki =
<macro@orcam.me.uk> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, 7 Apr 2023, Jiaxun Yang wrote:
>=20
>> MIPS MT ASE is only available on ISA between Release 1 and Release 5.
>> Add ISA level dependency to Kconfig to fix build.
>=20
> Actually the MIPS MT ASE is explicitly from R2 onwards only[1] and it =
has=20
> *not* been withdrawn as at R6[2].

Thanks for the info!

I=E2=80=99m a little bit confused with relationship of MT and VP though, =
I thought VP
suppressed MT, and they look conflicting, does it mean there are two =
possible
ways of multithreading in R6?

If so I=E2=80=99d probably rewrite cps-sec in uasm to take that into =
account, sigh.=20

Thanks
- Jiaxun

>=20
> NB I was onboard with MTI when the MT ASE was introduced (I was a =
member=20
> of the 34K team, working on CPU bringup), so I know this stuff first =
hand.
>=20
> References:
>=20
> [1] "MIPS32 Architecture for Programmers, VolumeIV-f: The MIPS MT=20
>     Application-Specific Extension to the MIPS32 Architecture", MIPS=20=

>     Technologies, Inc., Document Number: MD00378, Revision 1.00,=20
>     September 28, 2005, Section 1.1 "Background", p. 1
>=20
> [2]  "MIPS32 Architecture For Programmers, Volume I-A: Introduction to =
the=20
>     MIPS32 Architecture", Imagination Technologies LTD., Document =
Number:=20
>     MD00082, Revision 6.01, August 20, 2014, Chapter 1 "About This =
Book",=20
>     p. 12
>=20
>  Maciej

