Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C7E32F911
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 10:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhCFJBK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 04:01:10 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:56859 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229628AbhCFJAk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Mar 2021 04:00:40 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 326D6160C;
        Sat,  6 Mar 2021 04:00:39 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Sat, 06 Mar 2021 04:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=XcI9UfKGq9VS03wAOXrCrlzRVRboagy
        +xYHhmphtrGM=; b=h2Ev165Z4AR0TEPtjoPFBgYBTCFOXW9Oe7RD7w7tGhF1FWd
        rwxfmUHt800QaCjeV58k6cT0igB11v7nEe7dgIdANdW/MAt7l8jr9s7+rTQ4e91Y
        YqTRNAiLsfz3TmqeD7Gle9CdhrT00vKqHVeKIKV6x9jV1pbqQjZ3AkUcOEL8+RmQ
        dzvWyeCAfZQdtrO2rBFvhXUkRcLvugdCh1NlZY1254zUPBOaF2rqukTaoPgDoEHI
        2zMrDmXiMhYperXm8Lj8hlt8HDFCy3CrzuLv9UmrOpjxc84Ksw8UiFr8sB/ByepI
        pSarE5zjGim3BrwfoQq/dsKhTBUBOxOx2s0z3Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XcI9Uf
        KGq9VS03wAOXrCrlzRVRboagy+xYHhmphtrGM=; b=WPvHXwzfzntUkYahdI9mS1
        DpiiLqMfyvDtUAA4ug4si1E8IgmB7E9sUrTR15L/nboIFxSyHZZaFsVDyH4a6hpm
        eRImiaDskkEv088sf4Anb5CYwfv+bQ2Hgq/5szPP/Y9aOoVRiSnegfiLOkOqw0Mj
        euwLCmNp4Jj0k3Pc6tzvEBt+fyPShwjD3O3gfVWrTt8o5ERZC6MsSafRJaqsOL5j
        Qx4g9VdV0T5vU6yiVhMKyFHFJfCQl36calHskUAjq8p8eVcM5eNkYam06CnUL/2u
        UlinkhLHrr+JLPzPdREj7Vk97e8WAMedBzw0AHcQFscSufNrZjMSvNkXAPYc5R+g
        ==
X-ME-Sender: <xms:tERDYLjiIOOWmeTNUhI3CIsPE_oX6nuod1Y__mbJnB1WUMsnfxkj0A>
    <xme:tERDYID0RxqLQH3Yn0sQe3hS1WTzbAwpdQjBqSMEnV_ZsVgIXSyXaLVDCPj1-KFUU
    eutz6Fkr322usD2xwc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtjedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepvedtheevteekvddvhefhueeufeefudffudevveduieev
    ueetvdehkeetueejgeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:tERDYLFyrjPa9AMapU62ovpbQ1T5mvYdKKA34X9DjjHuXdGhwuS4pw>
    <xmx:tERDYIRHYToeOg8oCbucY5sFpo7mND8v82Dadm9_4HTc_tNXSPPBdQ>
    <xmx:tERDYIzPn-PabhG-gcf-5iCHDzp8acTGk1X4wFxbRLu_HcnaCa42MA>
    <xmx:tkRDYCszTkj98UdRqI1XdPKG7ARLSqhp0rseHr34lhmsBsMQFs2lAw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 46DE5130005D; Sat,  6 Mar 2021 04:00:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <d1072504-514b-4be0-85ba-69a6d885de58@www.fastmail.com>
In-Reply-To: <20210306080337.GC4744@alpha.franken.de>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-3-zhangqing@loongson.cn>
 <20210306080337.GC4744@alpha.franken.de>
Date:   Sat, 06 Mar 2021 17:00:15 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Qing Zhang" <zhangqing@loongson.cn>
Cc:     "Huacai Chen" <chenhuacai@kernel.org>,
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



On Sat, Mar 6, 2021, at 4:03 PM, Thomas Bogendoerfer wrote:
> On Thu, Mar 04, 2021 at 07:00:57PM +0800, Qing Zhang wrote:
> > The purpose of separating loongson_system_configuration from boot_param.h
> > is to keep the other structure consistent with the firmware.
> > 
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> > ---
> >  .../include/asm/mach-loongson64/boot_param.h   | 18 ------------------
> >  .../include/asm/mach-loongson64/loongson.h     | 18 ++++++++++++++++++
> 
> as you are already touching mach-loongson64 files...
> 
> Is there a chance you clean up that up even further ? My goal is to
> have only files in mach-<platform> files, which have an mach-generic
> counterpart. Everything else should go to its own directory. So in
> case of loongson something
> 
> like
> 
> arch/mips/include/asm/loongson		for common stuff
> arch/mips/include/asm/loongson/32
> arch/mips/include/asm/loongson/64

Hi Thomas

I'm object to this idea as loongson32/2ef/64 have nothing in common.

They're different cores and different SoC designed by different team with different booting protocol.

Maybe it's possible to merge loongson32 into generic platform but my LS1C borad is broken...

Thanks.

- Jiaxun

> 
> Comments ?
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
>

-- 
- Jiaxun
