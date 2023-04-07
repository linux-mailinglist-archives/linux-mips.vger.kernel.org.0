Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDAD6DB6AA
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 00:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjDGWwJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 18:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDGWwH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 18:52:07 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05FFD53B
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 15:52:06 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 66B2B5C005E;
        Fri,  7 Apr 2023 18:52:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 07 Apr 2023 18:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680907926; x=1680994326; bh=saxvszkaK5MFMNOYc3N7Z2cVULTVdeuh+Hy
        Sof/af28=; b=4E783XAq58q3e4NNBUNomQ2pNScK2RnHf1mBgyFjpEQn02rnnhu
        tE3dS52vvbShiSjqU/c2Ef0P2NTJBiHke57auH/T5qJvTxgcJ+i6+EGD2Ncl4HT0
        acCscs8gZuRJb3mXKacaHPc6IspHvBKk3J6YabT9ir+FSKS2Gwf3jMdYYdzA0lEB
        AIt9lqoqGMiJER0VfL2fU/8KTJJaYgY9THJjKYBZP0G2nJRJJ5JJmYtk5m7GjgxZ
        kMj4XxAQc523wU/AY+wpQsvM0euhoxHB1rufoksL4fIA0kQeF+Yj5U3E1Vp0cenQ
        WagJ3wRTnE9vNFaegXqR4+jLphK7Jpqs4Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680907926; x=1680994326; bh=saxvszkaK5MFMNOYc3N7Z2cVULTVdeuh+Hy
        Sof/af28=; b=U4f6r7RrmnuXCiIOSc24TK8UmfzdOWaH2iouea3OE9LjerJZDvi
        m/BALg3+P4cWAteiidlNSkFYrmKz6iPCWJRWdo0Y3lj7iaOKjykVlYtLQiLTCC+2
        pQk/1UPq/qaIO/abGokfou2cch+5Z9zlplSkfU41B98MHHWyl/71CfOdP+DBfzk5
        2fFkySz+NMk5v7EX3ld/z1F0JVAbDTYxPiVRxJl8quMJc5DZoz+ZDC91/1NBwfYK
        yP1C1sKR6yIWOrnQL4Hilx51G0VB9KJmF2upf4A75DnbX7iOWZnC6QIysEg9jIzh
        ItoEdXheDtgR33YbtTgce3gQFOKGHLlxG0g==
X-ME-Sender: <xms:lp4wZJnntqqo-FHs3vh8qMCiakYyzO2WYqdv90QToUJl0WG8MHNMzA>
    <xme:lp4wZE0u9npFCI0kzZLdy-SqE3CS_TfURR5brb2wOH-boR7i-tn9JvyuxDcJhCUHM
    ASh5ZgCOObPlY6nMqI>
X-ME-Received: <xmr:lp4wZPo8x_RkAOfpavqwjSweLC8yv2DrCcRlJ67jvzaTa9tVKd4VYD4lLXR_u__21t8F>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejiedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:lp4wZJn--IDougsJTCh-YidJSF_otD9cBMRmpm2mu0t7Za1R1QLAqg>
    <xmx:lp4wZH2hET6_XXoCTI4ZRzX4UlwLGEGxZkddoTTw82Snk7MTlufPtg>
    <xmx:lp4wZIusugrpGbGLDNECwhiw-jikASwKCCdLRSiZZhE1widjGHocVA>
    <xmx:lp4wZIz4-X0zYbpJqtWcv-JBMMFuCny7ei_EXIcx5_whP4i8VN1u-g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 18:52:05 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 1/5] MIPS: Move various toolchain ASE check to Kconfig
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230407185723.GA1511753@dev-arch.thelio-3990X>
Date:   Fri, 7 Apr 2023 23:51:54 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A8685C0F-1EFE-42EF-A33D-2517E061E453@flygoat.com>
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
 <20230407102721.14814-2-jiaxun.yang@flygoat.com>
 <20230407185723.GA1511753@dev-arch.thelio-3990X>
To:     Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=887=E6=97=A5 19:57=EF=BC=8CNathan Chancellor =
<nathan@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Jiaxun,
>=20
> On Fri, Apr 07, 2023 at 11:27:17AM +0100, Jiaxun Yang wrote:
>> Use Kconfig to perform Kconfig toolchain feature check, so we will
>> be able to have toolchain feature availablility information in =
Kconfig
>> to guard relevant options.
>>=20
>=20
> First of all, thank you a lot for this series! I applied them on top =
of
> mips-next and my allnoconfig issue appears to be gone. However, with
> this change, 32r1{,el}_defconfig is broken for =
arch/mips/kernel/traps.c.
>=20
> $ make -skj"$(nproc)" ARCH=3Dmips CROSS_COMPILE=3Dmips-linux-gnu- =
LLVM=3D1 LLVM_IAS=3D0 O=3Dbuild mrproper 32r1_defconfig =
arch/mips/kernel/traps.o
> ...
> /tmp/traps-f8ea56.s: Assembler messages:
> /tmp/traps-f8ea56.s:8227: Error: `fp=3D64' used with a 32-bit fpu
> /tmp/traps-f8ea56.s:8228: Error: `fp=3D64' used with a 32-bit fpu
> /tmp/traps-f8ea56.s:8228: Warning: the `msa' extension requires MIPS32 =
revision 2 or greater
> clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)
> ...


Oh that=E2=80=99s actually a problem in code.
Will add a patch to address this in v2.

>=20
> In case it matters:
>=20
> $ clang --version | head -1
> ClangBuiltLinux clang version 16.0.1
>=20
> $ mips-linux-gnu-as --version | head -1
> GNU assembler (GNU Binutils) 2.40
>=20
> A few comments below, I have not tested anything beyond this.
>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> arch/mips/Kconfig                | 27 +++++++++++++++++++++++++++
>> arch/mips/Makefile               | 29 +++--------------------------
>> arch/mips/crypto/crc32-mips.c    |  4 ++--
>> arch/mips/include/asm/asmmacro.h |  8 ++++----
>> arch/mips/include/asm/ginvt.h    |  2 +-
>> arch/mips/include/asm/mipsregs.h | 10 +++++-----
>> arch/mips/include/asm/msa.h      |  4 ++--
>> 7 files changed, 44 insertions(+), 40 deletions(-)
>>=20
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 770d098b11bf..c52401c155a4 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -3157,6 +3157,12 @@ config MIPS32_N32
>>=20
>>   If unsure, say N.
>>=20
>> +config CC_HAS_SMARTMIPS
>> + def_bool $(cc-option,-mmicromips)
>=20
> -msmartmips?

Good catch :-D

>=20
>> +
>> +config CC_HAS_MICROMIPS
>> + def_bool $(cc-option,-mmicromips)
>=20
> Neither of these configurations are used in this change. Should they =
be
> moved to the next change in the series?

Hmm I=E2=80=99d prefer leave them here because this patch tracks all =
compiler checks that
we have in Makefile.


Thanks
- Jiaxun


