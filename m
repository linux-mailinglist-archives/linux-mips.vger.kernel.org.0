Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35D66A5F9D
	for <lists+linux-mips@lfdr.de>; Tue, 28 Feb 2023 20:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjB1T3S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Feb 2023 14:29:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjB1T3R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Feb 2023 14:29:17 -0500
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF41832508
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 11:29:14 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 3CE1B320098D;
        Tue, 28 Feb 2023 14:29:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 Feb 2023 14:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677612551; x=
        1677698951; bh=X5SCeNk5rNN9XMBVr4DBI6Wrwf3CGEO2Xq+xwT2Mjt4=; b=e
        UFbnrNVu0hl7+Y2A9y8cS+O++jv0kT4RR3Z6V1wUzmLlW/ejFLPGkVr73jnThs3n
        yKIOC4z+PkrjIK4cYrxN5wePus3lnQK1kg0zKH8YM2YKj4sLbxdA4aFh1xiqTmRa
        DHJm0a3bcMgDt6F/r8zUw5Z1+DRKGyqYaaIF8ne+qLGGwTawKa1VxXEKuJLjXGbi
        edJ+5DSwY0u5zyJQh+58X8fuyHWRV77Ihb3R5x3kPUYRg4i+3+dQL1Q1Icev1ytj
        T9QUb73f4YUFzGYoIQ5qqCdq8G+e6Wz0Ee5k11AivLmfSYBbomV9wXcepUO5XOJ2
        Muk7lGdlWv9wxLxEHGV+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677612551; x=
        1677698951; bh=X5SCeNk5rNN9XMBVr4DBI6Wrwf3CGEO2Xq+xwT2Mjt4=; b=G
        CBH8D5L/z/NOYf2YEOzZ84U/G1kLTKR5NnVhdcCagJ54cLHT0e3noUvANB8huGUS
        EJhh9x/iks0Uzy1RwMobaaOMy0iIjmrng+DH5UAgp/lOGaLSVxy8rxeR3jDM4fQh
        2DE0ugEVWgiejzSsYS/aBSlUihK4EnqPvplN6edHaDMIGHbdhgrFWY2qQgOeFeUg
        +7R/VY9Qszpxd9Vv4VCmkocy5opBedYVPQBd4YgbD5M6V4eNBiL4FGmeZejJnBWr
        sdlD6CGad1wQ/qoiqcTlXzN0B5smB0QG3RxRzXGNbSUAEo8g/z8oUBJgGAQIbT0n
        1jcToBGJbY/s9+oK1vQ9Q==
X-ME-Sender: <xms:B1b-Y06i8kG-sDB3jK-KRPiUnHJNw_kEJ9tV9kQrpUIjgfZgqMfFKw>
    <xme:B1b-Y15L_50I_4OZEDifBnODTUHMZ28g-vdNmcEg7wQef09UiS6uzXqDirLORy3Uk
    _51w65oG57KP-V0jmM>
X-ME-Received: <xmr:B1b-YzfjcZks1IOB8RydkdwAwVIsbk8o1KrJcK7xk5rSR6xSGS1ttZPilJleS-Q2Crsp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnheptddujedvgeduveegvdeutefftdfffefhfeeukeevffevuedt
    gfefhfevgeelfeelnecuffhomhgrihhnpehgihhthhhusgdrtghomhdplhhlvhhmrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhi
    rgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:B1b-Y5KUOBWc8F5wQiHPhs8W6jh5AHnlLyqxB5Cw6lNq811WF_vMPg>
    <xmx:B1b-Y4Iybq0yF-be1sAlYG3nk8UGMHhfn5f_p6HGwN4WwbTSfCoQOw>
    <xmx:B1b-Y6zpCqaoXteMqEqTGRNydGENoSxqWRvDX-yua9PtDiUykJO2DQ>
    <xmx:B1b-Y9Gcc3vvl-HI8V-9db9lF4uQnsLfDO8auQXmjTI6n_llwq3kPA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 14:29:10 -0500 (EST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2] MIPS: Workaround clang inline compat branch issue
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <Y/5UNdcoOvJjG+fH@dev-arch.thelio-3990X>
Date:   Tue, 28 Feb 2023 19:28:59 +0000
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
        YunQiang Su <syq@debian.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8F867934-62B4-4523-B9CE-27E55BAEEC87@flygoat.com>
References: <20230228111917.82910-1-jiaxun.yang@flygoat.com>
 <Y/5UNdcoOvJjG+fH@dev-arch.thelio-3990X>
To:     Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B42=E6=9C=8828=E6=97=A5 19:21=EF=BC=8CNathan Chancellor =
<nathan@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Feb 28, 2023 at 11:19:17AM +0000, Jiaxun Yang wrote:
>> Clang is unable to handle the situation that a chunk of inline
>> assembly ends with a compat branch instruction and then compiler
>> generates another control transfer instruction immediately after
>> this compat branch. The later instruction will end up in forbidden
>> slot and cause exception.
>>=20
>> Workaround by add a option to control the use of compact branch.
>> Currently it's selected by CC_IS_CLANG and hopefully we can change
>> it to a version check in future if clang manages to fix it.
>>=20
>> Fix boot on boston board.
>>=20
>> Link: https://github.com/llvm/llvm-project/issues/61045
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>=20
> Thanks for filing that bug and debugging this. I came across a post =
from
> the (now former) MIPS code owner and I am not sure anyone else has
> stepped up, the vast majority of commits to llvm/lib/Targets/Mips have
> been either NFC commits or treewide refactorings, so it will be
> interesting to see if we can get that fixed.

Yunqiang Su <syq@debian.org>[1] said he will take a look on that issue.

>=20
> https://discourse.llvm.org/t/mips-backend-code-owner/60737
> =
https://github.com/llvm/llvm-project/commit/7daed359111f6d151fef447f520f85=
ef1dabedf6
>=20
> For now:
>=20
> Acked-by: Nathan Chancellor <nathan@kernel.org>
>=20
> If a v3 is necessary for some reason, a link to that issue in the =
source
> itself would be useful, as we can easily grep for 'llvm/llvm-project' =
to
> audit issues; I am not sure it is worth sending a v3 just for that =
alone
> though.

Will do a v3, it also helps me document the actual issue.

Thanks

[1]: https://reviews.llvm.org/p/wzssyqa/

- Jiaxun

>=20


