Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDAF76DB9E8
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 11:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjDHJrb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Apr 2023 05:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjDHJrb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Apr 2023 05:47:31 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43892CC2C
        for <linux-mips@vger.kernel.org>; Sat,  8 Apr 2023 02:47:30 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id CD9A0320046E;
        Sat,  8 Apr 2023 05:47:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 08 Apr 2023 05:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680947246; x=1681033646; bh=P+LdaHQqkTUcKyex1fOjk2zirIW4YnB+O3f
        jG4pV5sk=; b=XyVtyt8dvu918S+oX1JVDVhxv1q7NyseL5qAAAnRCBGcdM+0LVS
        M2R8THvLW50qMOjaRXFHn4a1OLo/ySA02xfEsl5t80xfGP9x1V4c22nHLVW9r67A
        O2HakKbNaE2GgZTqjMjz4DZqsRLAi9owp9oNamEAy6C8TTKcHVITcAyOf6EcOChk
        NPKMUJ1CEsMFwc0pScdW526EJQRlTARer8ygF5+SbJeR6tmLPD1uyUNtWexgLmKi
        UikueFC2BmS2/egjBnCIfveJUfL1TOD/gTAT27yF7dtrYn/JJY28RRXtKnIyybje
        ufnIhsvntqsvGBXchrvYuGQfWziZZPDsBig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680947246; x=1681033646; bh=P+LdaHQqkTUcKyex1fOjk2zirIW4YnB+O3f
        jG4pV5sk=; b=NKespcM+5pmkDvyzfZ3oc5pUPjiJq8gxEJ7avL1w/HQWxzfIkVz
        ubVMh0/gE6uH1vT8WMB2y5SbPC0PsjxLuixfc/6glmkkaMBh0RmWtKwiF8RFCpQl
        2GDUUZ4nRoRKLwbFblTSzM06rHbnqtADqg41yBa/i+/iJd6O9HWt+j8E8XbBQrrI
        UkFwq63wmdA3s7kGXOUJfPvsmSm/vzmc5pU52pgM6l0fVyvaRFkAGLplvpYFUEfJ
        nKUvMjcPqPqKwuaQkAFKvRXZwF47HimMH9PbxzVWalJOu0MKYNncUhfeuXVl7+jg
        GusUA+tA+v4XvVIGZbZjfM2zLwVhpdsFhIQ==
X-ME-Sender: <xms:LTgxZIn-tQHE-1ZjJHIrEiZkztxz1kJlkrmlXvX8kYlslJhdMy02fQ>
    <xme:LTgxZH2SbvlEds7Ue2tRUmemTDhWdS0cPU_5V0FKXR7iH_JIbgjs6BfFIfgbDSdXT
    d12CTT5RM2jcxcUkYk>
X-ME-Received: <xmr:LTgxZGoFTfSpZNqpKTpo7Mjs4D8N3lZie-80dQbTkQlDxt3FBqh0W9oU1cfYe2qxLdgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejjedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:LTgxZEn2Q2ZVrMOzwimCE-iWx0xGaM1I1C6odK3h4who1ZBOgI9_tg>
    <xmx:LTgxZG03xS9ubmjM-Qu7PaRzaadDmeLN4ygNbZx8s2ZWHP0fApKCbw>
    <xmx:LTgxZLsjJ6ay7J-2HXo3tduTk2H0m6Wa_DBASb1R-5AmBE0I6xw9sw>
    <xmx:LjgxZLwl7O7gDuySUxHw61gVwRiaH_zb3FZhKjcv888YzFUDbW71Tw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Apr 2023 05:47:25 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 5/5] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAKwvOdmNR=c4toqkzR_x7ub+L5j8V5Y1PZFOi8s37YRGj9nfMw@mail.gmail.com>
Date:   Sat, 8 Apr 2023 10:47:13 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7A857648-974B-42DA-AF8B-ED982096E847@flygoat.com>
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
 <20230407102721.14814-6-jiaxun.yang@flygoat.com>
 <CAKwvOdmNR=c4toqkzR_x7ub+L5j8V5Y1PZFOi8s37YRGj9nfMw@mail.gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=887=E6=97=A5 23:23=EF=BC=8CNick Desaulniers =
<ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Apr 7, 2023 at 3:27=E2=80=AFAM Jiaxun Yang =
<jiaxun.yang@flygoat.com> wrote:
>>=20
>> LLVM does not implement some of -march option. However those march
>> does not provide any special functionality in most cases, they just
>> serves as compiler's tuning target.
>=20
> Then should we change these then to be in the form:
>=20
> -cflags-$(CONFIG_CPU_R3000)     +=3D -march=3Dr3000
> +cflags-$(CONFIG_CPU_R3000)     +=3D -march=3Dmips1 $(call =
cc-option,-mtune=3Dr3000)

Just tested with GCC and it seems like there are still some difference =
in generated code
for -march=3Dr4600 and -march=3Dmips3 -mtune=3Dr4600.
As I=E2=80=99m unable to test on a real system I=E2=80=99d prefer just =
leave them as is.

I=E2=80=99ll try to reword commit message.

Thanks
Jiaxun

>=20
> --=20
> Thanks,
> ~Nick Desaulniers


