Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E196A411C
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 12:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjB0LpQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 06:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjB0LpP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 06:45:15 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3007AB9
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 03:45:03 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id A9B9A320090D;
        Mon, 27 Feb 2023 06:45:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 27 Feb 2023 06:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677498302; x=
        1677584702; bh=/NTTKTkIyXjSNbjfUDX725jgeGwv8aaQYHAS65/2+AA=; b=n
        9nksoMfAhd/JPkT9RS80r10pOgE3Z6rLiCQdlV7q/uzmR5UFRx+JpdcMkQBG2PHS
        c6YRJo5dSZyexvVxf3a2XbBxG+8Yn6XTQp1zjpstOhTAnoxZi3qBuTlFqO48K4DJ
        Y2uUBzngMZBDAPxuzYqpIEyN1HfLaA78WOtiGk79Hx7hDpxeaIDmvvGe+xM127vK
        LdieIYsbOUF1CYtFy78m9izXgrcVo6XbmgfYdCCXHNP2Qw9YbD48F7CJ+UQu3XjX
        ywSy11adTu800Q0OQ7UFagSq8+ImQkVocplKfsfhHmIya6aNIS69myC/G8jbKxMZ
        1BiP0l+436tMDi+xCE6Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677498302; x=
        1677584702; bh=/NTTKTkIyXjSNbjfUDX725jgeGwv8aaQYHAS65/2+AA=; b=R
        3MTk0maP10QjmPk6qkJustDXs0mDAesi4x47S5/ENRgS0y+/qJ8JMqdlRtwZ7FFW
        p6L/xWCuaEN0COb5kHulAd+XsVAV2nxDqNCT0KsVDk+fDtQ7UXrmG4Njar3xfzGf
        ssTBv4hRch5Zb0/2ePajQ70WOqVssebCMwn+MRvx3uRJsVoL8e27wmnTzjrDPyw5
        wDvE4GmTXUr8IuzMvhNA4iO/qn7iIUQWIGM4PL+5SC5CU2K/B0ugeq+VWChB2gD1
        5qkm09wlNMu7HXAeetQS5o70tC0LUmeQCwJp8GZxMBCBvTt/deZ1cGZQzPBNP8hW
        4Nz5tj3juTW4WJ8Bbes9g==
X-ME-Sender: <xms:vZf8Yx-Ksk0gq5MGYKk3fSIqbAZ5OHyRHD2qiVGJR-xJ2UieVvU0gg>
    <xme:vZf8Y1vFpvvIk4bgJRkPAYPlumSjfLVj9ylvCz312SURUbBbAobulyZU6YVsm2qLe
    cVZqQhG7hLlI3o52Zk>
X-ME-Received: <xmr:vZf8Y_Ahlsyw8vNh8pS3TuYbSDTr17WMhbGf69wVPzlLHERREkeg8ShExDZagHPC2DB8ZBIonyCGShARNbyuiT77J5eXU7-7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:vZf8Y1d_jay6Nu5K9Q9WiPPJgERnH-OPZ4_LSOdaMLspfJZHQgEV2Q>
    <xmx:vZf8Y2MmH6tXbpgXovUObIyA2P_8ONFykqFsX69S1ghhpq6UdDP4jA>
    <xmx:vZf8Y3nm6pZj9PCNm_OeXMKiy0r1rjHQYszPeMPSdCVnpPQq7wBsUw>
    <xmx:vpf8YwWNa77mCN5-fzZAa41MSNr8N0fY4fEf97ZWB4zOafFP9iUwYA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 06:45:01 -0500 (EST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH 2/2] MIPS: cevt-r4k: Offset counter value for clearing
 compare interrupt
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230227093126.GA6152@alpha.franken.de>
Date:   Mon, 27 Feb 2023 11:44:48 +0000
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1386E355-383C-464E-9821-34BA8ED4DCE3@flygoat.com>
References: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
 <20230225221008.8520-3-jiaxun.yang@flygoat.com>
 <20230226232331.GA9208@alpha.franken.de>
 <579403EF-8E0D-4AC9-9AB1-51CBB433E114@flygoat.com>
 <20230227093126.GA6152@alpha.franken.de>
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



> 2023=E5=B9=B42=E6=9C=8827=E6=97=A5 09:31=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Mon, Feb 27, 2023 at 01:22:47AM +0000, Jiaxun Yang wrote:
>>=20
>>=20
>>=20
[...]
>> Clearing interrupt happens in write_c0_compare but the problem is the =
interrupt
>> does really get cleared because it triggered again straight away.
>=20
> the function you are patching is a test function whether =
counter/compare
> is usable, so it's not in the normal timer handling. See a problem =
there
> would more to broken hardware than to a bug in that function.

The problem is sometimes on a multi-core system this function managed
to run on one of the core but then fail on another.

In our real use of compare interrupt, we are clearing interrupt by =
writing back
old value of compare, which is guarenteed to be smaller then current =
count
because there are so many instructions being executed from exception =
vector
to here.

Also as we have no way to disable compare interrupt, if this function =
determined
compare to be broken then it won=E2=80=99t register event_handler =
function, which will
cause panic for null pointer when unexpected-ish interrupt comes.

>=20
>> Had confirmed issue on MIPS I6500 uarch simulation trace.
>=20
> so not seen on real hardware ?

It was discovered on FPGA and then I tried to debug with simulation to =
reveal what=E2=80=99s
going on hardware side.

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


