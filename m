Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE07C6E6ABA
	for <lists+linux-mips@lfdr.de>; Tue, 18 Apr 2023 19:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232396AbjDRRPl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Apr 2023 13:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbjDRRPk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Apr 2023 13:15:40 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2B9A5D4
        for <linux-mips@vger.kernel.org>; Tue, 18 Apr 2023 10:15:13 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 8E2C63200942;
        Tue, 18 Apr 2023 13:15:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 18 Apr 2023 13:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1681838110; x=1681924510; bh=S3GhOuCYcd2nhZg7uJTlbvD5zzXKBRBChgs
        30ByJ2yY=; b=Ea6ugq7MZ7XwAB6UnZ74ROq13UZ1berua3YQoaiarAYuynX0Iby
        ey24AqGu0k9l1RQiRU3FrvoYnvt4AEoY+yaNCGcCa+/42bODFluZbXB7eiTubdbm
        kQQshY/U+VPr64A3/FuCs+gMbyLkGcw7Jm/zDNW8+1M2HDYJIlqYIxjkaIRoW8gE
        SB8Rm2XJLbMLHm+/wLqugajPGP97CyVlMIBsEg/CRTK+QXSIoRXUgN8m9VIuksAB
        tXCCcTx6LMjry90GB743baMgdmV+LLXOLwJx3EuBJUPfKqgbOJF9le5oGTaUypHW
        SMiIUYZgyyEdLCusLdsutEUjoHSY8MLg5cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1681838110; x=1681924510; bh=S3GhOuCYcd2nhZg7uJTlbvD5zzXKBRBChgs
        30ByJ2yY=; b=PCCWGkQzlnHoLbF2+1mGNbWPO7GSuKa20GeRd8J6dZiBiOxsSXy
        7SlFxUZgd67Xn1UCLMpezRzCFsOdKtKAeqQ/7INv9jufrpNBRlZinEzMJJilTwru
        AMv1GuqkRQPRs7Jz30+D40GBfd7a+rRc4PhDtqWYBBq4grFBpqE6pY0OAm71ZdgB
        ALH5raDout52LuBb1b9l2YIgiMG3N18DaggHMeY4uljiBl74JyhDuKyKXpqHmq5f
        ewNIMwcse0r72Ve4xCsIA2yXDybsX9XlNZOZcwPYDSuDChZOBfM/AEBAC+qPgnpg
        ahnUapRDWRFJPPd/SFWZ7GHBg9+My/YN0lw==
X-ME-Sender: <xms:HdA-ZHQ0ckH_ArpfUE8NFU9j7oT0xBu670_tGOIPK0F6yiAhFchFCg>
    <xme:HdA-ZIypprOq8L7FPa6SCMA5nUtsdHOWRa_xHF4Lk7S3vG54fTO_XIINNFtgiKs2q
    MNBNgCxrAxkYYT6Agc>
X-ME-Received: <xmr:HdA-ZM1Quub0JCgsHQjxG_NCpAZH6J4cVFzLObEaWa3C-s_Qv9uvEgEcHZTsVRek6yHH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelkedguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:HdA-ZHABzCldI8WYftXXvw7oNbS79Q2p8KC_xhDzOOVNyiVIjTMhNQ>
    <xmx:HdA-ZAgBq8S6RrT0eX1PSeIpT4NA4GKBldrq2P_Xu23KScCpZEI16A>
    <xmx:HdA-ZLo8A8Qp-f4I5u7JBwYDxyY1W3tAxgpNk5XDYH9IMVZoPUM6EQ>
    <xmx:HtA-ZJu_rHlCzQcSQDdOQzEeDTBH5i5_D40clvnM0x2kB5z_flLFBg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Apr 2023 13:15:08 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v2 3/7] MIPS: Detect toolchain support of workarounds in
 Kconfig
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230418130945.GB12456@alpha.franken.de>
Date:   Tue, 18 Apr 2023 18:14:57 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1146BEC7-89AE-418E-8F5E-F328D578A0E0@flygoat.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-4-jiaxun.yang@flygoat.com>
 <20230418130945.GB12456@alpha.franken.de>
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



> 2023=E5=B9=B44=E6=9C=8818=E6=97=A5 14:09=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Apr 14, 2023 at 09:06:57AM +0100, Jiaxun Yang wrote:
>> LLVM toolchain does not support most of workarounds, detect
>> those supports in Kconfig so we can hide unsupported workarounds
>> to user.
>=20
> again hiding something, which then needs to be digged out is IMHO not
> a good way.

Agreed, my universal target is to make every defconfig build against =
clang so we
can leverage clang=E2=80=99s warning to find any potential problems, and =
possibly use clang
built kernel on machines that don't need those workaround. Seems like =
better option
Is to let user to drop those configs manually.

Will drop this two patch.

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

