Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F656E9C94
	for <lists+linux-mips@lfdr.de>; Thu, 20 Apr 2023 21:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbjDTTlZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Apr 2023 15:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbjDTTlX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Apr 2023 15:41:23 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294412137;
        Thu, 20 Apr 2023 12:41:22 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id DBBC9320092B;
        Thu, 20 Apr 2023 15:41:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 20 Apr 2023 15:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1682019680; x=1682106080; bh=p6x8eK0ey2TKiUVWiknQNIvdPNRc+BGT+H/
        HROCA6Oo=; b=TTAn4A46RYtXUH3OsO4vvM6J58QWBtcNlm1KWAIK2rBw6WQab8Y
        eYK0r4XEqUm6Fi85exKZxmiZdNCWFUNrY/W6q1myzZsPU7mTEMXYeoPDxSZA+Jhu
        SU4JYUS1r4ilX8TcRlGsYTCQQJ5aJxE+/y45m+fV+S+gDWK/PcXPSYb78/lTvCJA
        fnVqqph2LB4ZbjDSTPN6TfQ/sxhwqS8EUeb2MueRRdjbcLZjjTf25XHZSH7yNVCP
        WOh4CI6XEvqEdRso3Zsz7VGswWw+w7uobFVeHMbTiTVs6jiDtWXzFCBUaGVG+t6a
        zEM0duYmTmdtmwfCfbHlN1N6G7xgaprhysA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682019680; x=1682106080; bh=p6x8eK0ey2TKiUVWiknQNIvdPNRc+BGT+H/
        HROCA6Oo=; b=LKkpd5Bt6pLMYruS67U9AxXd4uLDtlKlJeA/3CX0tRtbrMjCnAV
        s5eazZx/ZbdJRa8I3JIbc4JexkxDIrqWIumKsm55m3x305/n1TQXcndwSmAEOsAU
        F7L7gW6rz1s/BC+oFGnYioaV2KFoQt3fftp3oyyzjBCrN11is0mKkMz9HdF8vi+O
        87PY2K85AO/cJRrc7M/m/Bm7Jiggy2CXh0WAJIeh964TiNe7ywM3Y2zJmn4COkOm
        3419YQVnmJKqpqkZajJ6Qgxy94GMuoG1FECEgZPXGMfco7Z3NirlX65yl1BG2LpZ
        bViXuA867to7u+m9aiN5I0eoEPspAadwViw==
X-ME-Sender: <xms:X5VBZF1vBr8dUYHmdqUSp4X7yUAccjjQYwdQsGr7OtSDVc6cYYp-Dw>
    <xme:X5VBZMEUfbWL1txPD-0iinlHCPbDBgXLG25WLV2W7SUbbmR5kqKbyZjeliHV_Cyyg
    KHEQbBorkNWobKxQjw>
X-ME-Received: <xmr:X5VBZF6UMx5GC__32E_VS930sJeKWHHNUKN3ORcf94hG6PQ3aMKHT4n6M7r2DGyUGw7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtvddgudeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekveeileevieeukeevjeegkeffhfffkeekieekjeffvdek
    tdegveefjeeugfeggeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:X5VBZC0MzsIRlkedDetrHH2TlQlU7Bl7HuB2k_apgl6lrp7VP_PPpg>
    <xmx:X5VBZIFha4xjZx0toZms1WvORNoCajZJ0l02wIHo3jHQOTedpw4RPw>
    <xmx:X5VBZD8GJYVsH4HFJpV2lxIQo0tyYL5qChygm-hxdMQPfVqsQyn0rA>
    <xmx:YJVBZN5lEo9uJQoio3_no0g-5iNOXOB8BJZBiDGe_t8yytRiiRnvwQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 15:41:18 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v2 2/7] MIPS: Add toolchain feature dependency for
 microMIPS smartMIPS
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAKwvOd=ye9jA0-3QRpD76waZCSX=ayFeE2ZNAPPM-fLdyCq1FQ@mail.gmail.com>
Date:   Thu, 20 Apr 2023 20:41:07 +0100
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <77F56166-265A-4653-ADF4-B0057604A539@flygoat.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-3-jiaxun.yang@flygoat.com>
 <20230418130823.GA12456@alpha.franken.de>
 <CAKwvOd=ye9jA0-3QRpD76waZCSX=ayFeE2ZNAPPM-fLdyCq1FQ@mail.gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=8820=E6=97=A5 00:01=EF=BC=8CNick Desaulniers =
<ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Apr 18, 2023 at 6:13=E2=80=AFAM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
>>=20
>> On Fri, Apr 14, 2023 at 09:06:56AM +0100, Jiaxun Yang wrote:
>>> microMIPS smartMIPS kernel can only be compiled if they are =
supported
>>> by toolchain.
>>>=20
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>=20
> Question: won't the lack of this (patch and rest of the series) hurt
> our ability to test randconfig builds of ARCH=3Dmips with clang? See
> also the 0day report from Boris:
> https://lore.kernel.org/llvm/202304170748.Fg9VIgGd-lkp@intel.com/

Kconfig experts, Is there any way to generate warning based on Kconfig =
options?
So we can let users know there are something went wrong but still allow =
build to happen.

Thanks
- Jiaxun=20

>=20
> i.e. randconfig will continue to select options that can't be built =
yet.
>=20
> --=20
> Thanks,
> ~Nick Desaulniers


