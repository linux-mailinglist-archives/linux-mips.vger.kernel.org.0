Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1126EA96A
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 13:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbjDULjc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 07:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjDULj3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 07:39:29 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84925C659
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 04:39:00 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id BF9F33200943;
        Fri, 21 Apr 2023 07:38:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 21 Apr 2023 07:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1682077100; x=1682163500; bh=hZYMEOcDYn/ycwlyGnipImNCZwHHk4SbjC5
        OsWxiVbY=; b=E2MMtMCGQlxUt/3yM1kOAWk/VPfDeW1t+58ehIn+APaGrWIjyMh
        hejxkfd/GacYWP0SGREBS25iiBcr5wWLrdHEyZY+7pb2tIHaibww8eM4lszciamm
        slogzVyQmJXzE+3pGiabMV1K9bm99iGtHWJ/gfwcg5dYMlMb52MATrfK2j49JmX4
        TCl/nqzOJjqitEbnvMFYbYD+Bt4egFmkX90XkZC3+WAVBztS9/o1p1CFrj/+hs6Z
        42R4F673mCpvJfiqz6pjnk530NJnQ/QAl624Q2S9DBABj8/84HuL8TbuKM109hZk
        9ZovM+AeMuwM81fDVJN1/7455Z6g0MZuMog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682077100; x=1682163500; bh=hZYMEOcDYn/ycwlyGnipImNCZwHHk4SbjC5
        OsWxiVbY=; b=Taqiex1fej7YRaIg8F2kd8gIBLkb0ITCE+gStgCgf7pAjxUH1gF
        vCo7Qihx0ZcHHowKIhOAPI7poVop5ZuqKEjC3nKHECTHUdMUyhW/u2gBLkKzlWOO
        KaPf3v0aM/3mBN/BM4k8q4aaDBvW9bxGEKURQ29MYXDNo/Nobi8LtFX3UorZbTIH
        UapVt4W634owOJMELrBIW4eTnFQfBKyOlIiAu1hrWDHoI3OMfr0i83WY6y7ALFDI
        qwEvo5A9mHyRGuYs+4Fe3oI0dC/8JX1u7PS+bVM+gO9TmLn04Tg8CW2DvFtZhuSH
        LrVIcRGwF5JoTgMiWGd1gGQ1VEBUOTiKA3Q==
X-ME-Sender: <xms:rHVCZAPV2TMCh__fe8gZr70fVVehP7aCVG1tMyKcIOoEI_lB5ed8xg>
    <xme:rHVCZG-A2gn7ufPjWpsvPME2PD6XDfkpOiVG3W-BvturJbK2ZC9J-uvc0qWB3HUq-
    cM2wbKlynNGQ3ZVEt4>
X-ME-Received: <xmr:rHVCZHTBICF3d7L-Z8wxN5gjT7IfDPW_0JUurfX0WdqPHF5_1n2G_MgntGnnDBsJNKX8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepkeevieelveeiueekveejgeekfffhffekkeeikeejffdvkedt
    geevfeejuefggeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:rHVCZIsClLwuCmiNSao_AyN4oKquMMF0nnnXZrqlAbROsSqBHll-gg>
    <xmx:rHVCZIe7tWMk2L0zoQi8LhSEfbcCMXE0XJZrobIZqZzZhuVlHXbCKA>
    <xmx:rHVCZM2-Ni4xUSKrevs2h6q5dNW5RA8GJgDqXgiZgAirixLvjm_Dzg>
    <xmx:rHVCZA5R2cGkBghPiLsvUw-McIqLA4ULUYA3uYsczbWSWlxFaUIAzw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Apr 2023 07:38:19 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 5/8] MIPS: mipsregs: Parse fp and sp register by name in
 parse_r
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230421104832.GA9238@alpha.franken.de>
Date:   Fri, 21 Apr 2023 12:38:07 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F861FB0C-C6B3-4B16-8ECD-FD01E62DD429@flygoat.com>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
 <20230409104309.13887-6-jiaxun.yang@flygoat.com>
 <20230421104832.GA9238@alpha.franken.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=8821=E6=97=A5 11:48=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sun, Apr 09, 2023 at 11:43:06AM +0100, Jiaxun Yang wrote:
>> parse_r helper is used to parse register number from oprand,
>> it only handles oprand which use number to refer register before.
>>=20
>> However compiler may use $gp and $sp to reference register 29 and
>> 30. Handle this situation by adding relevant match name.
>=20
> are you sure the compiler is doing that ? Which compiler is this ?
> To me this feels more like missing #defines from asm/regdef.h for
> some inline assembly stuff...

Yes, clang is doing that, see[1].

There is no inline assembly mentioning $fp for cfcmsa but clang is still =
generating $fp for
cfcmsa.

I was able to reproduce this by dumping assembly generated by clang, but =
I=E2=80=99m
unable to reproduce it for now, it seems like clang will only allocate =
$fp in rare cases.

[1]: https://lore.kernel.org/all/202210180436.ruWBhXRe-lkp@intel.com/

Thanks
- Jiaxun

>=20
> Thomas.
>=20
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not =
necessarily a
> good idea.                                                [ RFC1925, =
2.3 ]

