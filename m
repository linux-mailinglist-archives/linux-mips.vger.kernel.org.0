Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D05132F97F
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 11:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhCFK4S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 05:56:18 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:42591 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230058AbhCFK4G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Mar 2021 05:56:06 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 23FAC16BC;
        Sat,  6 Mar 2021 05:56:05 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Sat, 06 Mar 2021 05:56:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=DgBeYPbl7qp9c6e80Nndsm0w1hmKO3h
        sAbLlZ1WpbzY=; b=Kza6bjSuFCkaYdFvoyPi4iVipcjHXWhts8ykHdUZ2tdtsKh
        G5BnvS7A+RxdELzMZ3cxBfxR9hf7xqWQY5nW1GoVPWhh6PgwnCxG8uWKLgQBU6xW
        hLFUenEBg/+nbqz/FwWQZWFOP2GFL7P8z4ZB0EPWpQDUc96mVvhqaS8NHlay1q+7
        VZzoHP8ucXLR4nMIFHeVXqrmth4AHxvsCFYjWCb/v0EhxEac4VXOsv97moMCpp9I
        rxqcqZo8Lo8tX0jl9d0jH7ygPdw8MrtUEot3fi3REbeWdd7qO6E0IxJO57IkiD/e
        ei/EOAilivBWAqn2L2+kHA/MIv7Se06sGTfsz2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DgBeYP
        bl7qp9c6e80Nndsm0w1hmKO3hsAbLlZ1WpbzY=; b=CskdT3eaYXGF4nU9ZrUkF7
        gfigLrIkveMW4b176tpPtU/331RXPgtoUeXNnkaTRW3s4xUCfbRe3eOCRatuKp3W
        aA63mjD8EXQZ7SuQdHz2bP7PH0xwS2BvFa+2z7Jc++HiXB+0lmaiFuVFv6/bbP+s
        0mZHs1CiMC2eKTfHO/UCIRfDlK9M5BZyNqC64l6My4NxLvE2dbKa0013afKbmY38
        CTbHz9XbEyTmNyQ6s5NeuV/65jnMlx2EJqRlcRYb327ioi4PwlpLbXFM0iTOTFc3
        EupKEaYaLaIG5C6ShnucbqwjYjk3qXCCKPkVaqqqWZ1B5jxtMgBOVpGoUPoJ2RcQ
        ==
X-ME-Sender: <xms:w19DYFTESn_z93xD2eeDcIZDMZZlWUW30ANfaY-732yKwCWr6_Afyw>
    <xme:w19DYOwrn3wFdBsW21td4M7Nsp5HsDHL3guFC0Urnl7O7M-iCPIzeNMIyeJ3OQR25
    t99GZR47wr0XcGhuic>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtkedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeevtdehveetkedvvdehhfeuueeffeduffduveevudeiveeu
    tedvheekteeujeegueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:w19DYK0TLC7AARoKtyVKzHiGiA0OloFw7KbuZPk65heNzNM5I6HEWg>
    <xmx:w19DYNA60bA_YycJE8xoiXM6NqsJuI_4UrKv3WoY2JKb_AYAj1Aazw>
    <xmx:w19DYOiu8BdZXTAT_MU2G05nJj2Cmk00cKE7-4TPEEB2yPrejsPdvw>
    <xmx:xF9DYGfDRqQz_f_RT2JwSuS75B5xX7QuGH87npvwr2pyaD2hSpyg9A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 524A7130005D; Sat,  6 Mar 2021 05:56:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <3a5481f9-d1d5-4439-9679-ad7615ba8009@www.fastmail.com>
In-Reply-To: <20210306095308.GA5751@alpha.franken.de>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-3-zhangqing@loongson.cn>
 <20210306080337.GC4744@alpha.franken.de>
 <d1072504-514b-4be0-85ba-69a6d885de58@www.fastmail.com>
 <20210306095308.GA5751@alpha.franken.de>
Date:   Sat, 06 Mar 2021 18:55:41 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc:     "Qing Zhang" <zhangqing@loongson.cn>,
        "Huacai Chen" <chenhuacai@kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Marc Zyngier" <maz@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_2/2]_MIPS:_Loongson64:_Move_loongson=5Fsystem=5Fcon?=
 =?UTF-8?Q?figuration_to_loongson.h?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Sat, Mar 6, 2021, at 5:53 PM, Thomas Bogendoerfer wrote:
> On Sat, Mar 06, 2021 at 05:00:15PM +0800, Jiaxun Yang wrote:
> > 
> > 
> > On Sat, Mar 6, 2021, at 4:03 PM, Thomas Bogendoerfer wrote:
> > > On Thu, Mar 04, 2021 at 07:00:57PM +0800, Qing Zhang wrote:
> > > > The purpose of separating loongson_system_configuration from boot_param.h
> > > > is to keep the other structure consistent with the firmware.
> > > > 
> > > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > > Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> > > > ---
> > > >  .../include/asm/mach-loongson64/boot_param.h   | 18 ------------------
> > > >  .../include/asm/mach-loongson64/loongson.h     | 18 ++++++++++++++++++
> > > 
> > > as you are already touching mach-loongson64 files...
> > > 
> > > Is there a chance you clean up that up even further ? My goal is to
> > > have only files in mach-<platform> files, which have an mach-generic
> > > counterpart. Everything else should go to its own directory. So in
> > > case of loongson something
> > > 
> > > like
> > > 
> > > arch/mips/include/asm/loongson		for common stuff
> > > arch/mips/include/asm/loongson/32
> > > arch/mips/include/asm/loongson/64
> > 
> > Hi Thomas
> > 
> > I'm object to this idea as loongson32/2ef/64 have nothing in common.
> 
> at least they share the name loongson, so having
> 
> arch/mips/include/asm/loongson
> 
> sounds like a good move.
> 
> And seeing 
> 
> diff -u mach-loongson2ef/ mach-loongson64/loongson.h  | diffstat
>  loongson.h |  137 +++++++++++++------------------------------------------------
>  1 file changed, 30 insertions(+), 107 deletions(-)
> 
> wc mach-loongson2ef/loongson.h 
>   318   963 11278 mach-loongson2ef/loongson.h
> 
> so there is something to shared. To me it looks like 2ef could be merged
> into 64, but that's nothing I'm wanting.

Hmm there are duplications in loongson.h just because we didn't clean them up when splitting loongson2ef out of loongson64.

> 
> Just to understand you, you want
> 
> arch/mips/include/asm/loongson/2ef
> arch/mips/include/asm/loongson/32
> arch/mips/include/asm/loongson/64

Yeah it looks reasonable but from my point of view doing these movement brings no actual benefit :-(

Thanks.

- Jiaxun

> 
> ?
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
>

-- 
- Jiaxun
