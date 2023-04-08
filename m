Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A7A6DBB0C
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 15:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjDHM77 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Apr 2023 08:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjDHM76 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Apr 2023 08:59:58 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2099EBDCD
        for <linux-mips@vger.kernel.org>; Sat,  8 Apr 2023 05:59:57 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D47665C00A8;
        Sat,  8 Apr 2023 08:59:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 08 Apr 2023 08:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680958793; x=1681045193; bh=+Nxxfz4TncAfyjFXqCbv6LdzAAfko3zNB73
        sMhj457M=; b=xSZzn9T9zKST9+nfeuy9CYPw9ID+pZUO0k8rNOBeaUIX2scuNWX
        LNBvLm7LjpJqg61OWayQBFgwJ5RRutO3ue01DbD4G3zws7qXzy4BbBJIiySbb7b1
        xAeXIDoEH4zycFq2YJnFigJ49qk17fsQ4HQJl+QD/CK036Bibp/Mg+RQIq4xIcvH
        f2FPexTFpDJrjDwjLvwt+jx92425yj+0QrSWCvpKf6DeyvaOGO+SosHsfwNzX1FT
        DWx4dmcAQMiCCgAtvY8DUDlfrpOpsYAu1y2ayjgg9mZcYN4B8nRMVBu4TZTlUpWF
        nPFheCFAWjqfIHIH8TYV2eqQH2NK8IC2ZFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680958793; x=1681045193; bh=+Nxxfz4TncAfyjFXqCbv6LdzAAfko3zNB73
        sMhj457M=; b=N+SVgMmqLBLYJgmZ/hLjSZ+S0/Sa0vBmbECIbGvKZRUpt9w214w
        fiu1I8WO+2MjuKdBI+9lhpSvyVqlx+aFFmBYqNeTqfv5Y7yDiqdIZ1t/nhHCJcPY
        G1tN1gM9r0RgdBsXJ0En8Q+yFdfmro+zHI5oRRvy9eAUNHFx72z+TUQIXpmaYJuh
        p108ld7zT5PeZ/xXvPUrOYrTiJR15yEZKMNhzuOG4MIn3G8hyQlmVbhKH5X2py8m
        obJVj5BlFPNNOhJBtyAqgZrXZjWmLvLzJ7sFDffZCcnJZrKceGiUFVOzC22xru7V
        /K8afpd6sVVMWwMWMnOBxB6F5c/4mteQRTA==
X-ME-Sender: <xms:SWUxZCFgg3R7-XJuM-PcmsiLU8oK5_htNl3xEQHEKSIJ0XeP5gqCeQ>
    <xme:SWUxZDWwryirPjiVnrIDkvNfi8o7MkNofNG2caa9v7NPyzfZvavwAtx925EsE6YXl
    a1OqSlUEYIw-WC6pqA>
X-ME-Received: <xmr:SWUxZML8WYltKR8mYwlBE0lSBPgGR3_PBCKrYpPceUWsAPW-2NHhLOqHqoRogwkBnnG7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejjedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepkeevieelveeiueekveejgeekfffhffekkeeikeejffdvkedt
    geevfeejuefggeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:SWUxZMFWIthtDDpgHg1rgOorucYjR90YUrmeTrPIkvnWSauua3fmxg>
    <xmx:SWUxZIUawHQC5E_cq7x0t79MeWkwzEq55Wfg34qlK9-m2b_tTcFc3w>
    <xmx:SWUxZPNkIZcNjilwmLJROH1QbG2yNg2jjLEuAVWrfiUQ9rOlGdO0vA>
    <xmx:SWUxZDcZi7SKNogQMdF9H4eBcdH7xPkq7_-xfTs2V-SMB8pdA5pk8Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Apr 2023 08:59:53 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] MIPS: Limit MIPS_MT_SMP support by ISA reversion
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230408121728.GA5953@alpha.franken.de>
Date:   Sat, 8 Apr 2023 13:59:41 +0100
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <33E9A39B-F4AF-4CE8-B2CF-4C6588B397A4@flygoat.com>
References: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
 <984bbd06-0fbf-3c97-32a1-a6b60af4b3d3@roeck-us.net>
 <CD810353-41E9-46ED-AEFB-902B6A4FFD6F@flygoat.com>
 <20230408121728.GA5953@alpha.franken.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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



> 2023=E5=B9=B44=E6=9C=888=E6=97=A5 13:17=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sat, Apr 08, 2023 at 11:10:32AM +0100, Jiaxun Yang wrote:
>>=20
>>=20
>>> 2023=E5=B9=B44=E6=9C=888=E6=97=A5 01:30=EF=BC=8CGuenter Roeck =
<linux@roeck-us.net> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On 4/7/23 15:35, Jiaxun Yang wrote:
>>>> MIPS MT ASE is only available on ISA between Release 1 and Release =
5.
>>>> Add ISA level dependency to Kconfig to fix build.
>>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>=20
>>> With this patch in place, I still get the second build failure.
>>=20
>> + Thomas
>>=20
>> Seems like PTE bits are overflowing again.
>=20
> I'm going to revert de34007751aaba992373f2d659001a846aeb8811, which =
just
> solves all new build problems in one go. Then we can try to come up =
with
> a usable solution.

Setting default CPU back to MIPS32 (R2?) [1] should also solve all those =
build problems.

However those problems are always here, just R4X00 didn=E2=80=99t get =
much care before.

[1]: =
https://lore.kernel.org/linux-mips/20230408115936.6631-1-jiaxun.yang@flygo=
at.com/

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

