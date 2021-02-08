Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1951A3139D3
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 17:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbhBHQmW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 11:42:22 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37755 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233866AbhBHQlz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 11:41:55 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 166FEC9B;
        Mon,  8 Feb 2021 11:40:49 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Mon, 08 Feb 2021 11:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=dU5h27z4AeGVyx1E8nezZcaSez3dTWq
        QSluUdmULy/o=; b=2xPkEEZr9L+F5/OpMpvA9nJKCjOL4PBYafjCMN66RsBWuYo
        fO5RR/66b5Utyz8hQi25SIfbS+M8SuiXl3uxN7ilmx3hh4fFlIHOZAnFroIUfz9W
        RNYo1vGiUu74T0pE3Glq+PmVF76WgpjQnPA2+iqvetgq8f98Ix0Rjj7KGEI91pqG
        p9FuOjmtyfdmVlyNeYgW1hLdR1ZZpKOVcmHA+Aaev/pg0bfwejHE14SIMvSTViUk
        FydkdtnBMFHqhNFH85N3NhlxNtoh/W6fwp74pPSXLTy7L7iBsJKWNS+vGDyDMKxm
        TIn61n0IMaN2HUS1Qyb7wAf4RxrLtE6xyPgMz3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dU5h27
        z4AeGVyx1E8nezZcaSez3dTWqQSluUdmULy/o=; b=bKnKixkcNLqOhRbL2HZEhc
        jB8xv0Bf9hImrHr/TEDsHd+j/FNeJ6SyBawI/d1wDp9PaP4BiSFsA53D8rE3HEmT
        5TXcj8g50uoJZeOVFYCXHbiu2Ah00SRjPGFJSNG+IlnfIqgAKtC77VJ4s5x+EV52
        OFkIz7nHVfqW7R8w9gAJJv7CLGwXkK66mLlX9oBbrPeB5W3XxYTg+v39aOBKhrql
        kP/zZS+TGHYpU0Twks8LlL0w5X1xJ6SI1YZ/UQEoMrcub61YHct6EUsZCuj4rtNx
        As45QubAOlxtMsNHhgLYtMNWT0JiQsxCfpCHYodvWYWZ10CDzcC4THgW/3Q+wjvg
        ==
X-ME-Sender: <xms:j2khYA9txObGHdIiOS1kIPioA-bOw66KYj_msPX9D1n8RXX2KSY3gw>
    <xme:j2khYIsFaI_PbnbD961y3L2PMK7rZXv0ii1pPDHh36oUcnPUSPjByerODgzytEz3p
    e2jblid5mbU3VPSs44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepkeelheethfehffdttdelieevfeeiheeuudeifeeugeeuieel
    iedtueejheehhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:j2khYGCWySGqIEMd8IFdh4cH8RR2nzYouytZeJQncjNa7xB4bUX8qg>
    <xmx:j2khYAezUqVV7bQDXaE3FxJiWINwb1fdX3zUXUqbsOliHSlicOQikw>
    <xmx:j2khYFNIxgmFpyaV2T1uIaP6laFEPCJsugQPi-3s-gLz0PhOAIa4RA>
    <xmx:kGkhYObsRCfPFfTh4HkMzov2CmMCyugXsst11IXwW1L1VNdXmqYzhA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C4A3E130005E; Mon,  8 Feb 2021 11:40:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <59a9a55c-2866-413f-89e3-b11e274c2d34@www.fastmail.com>
In-Reply-To: <20210207193952.GA21929@alpha.franken.de>
References: <20210203123425.GA9574@alpha.franken.de>
 <a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com>
 <20210207193952.GA21929@alpha.franken.de>
Date:   Tue, 09 Feb 2021 00:40:25 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc:     "linux-mips@vger.kernel.org," <linux-mips@vger.kernel.org>,
        "Huacai Chen" <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: KVM Guest
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Mon, Feb 8, 2021, at 3:39 AM, Thomas Bogendoerfer wrote:
> On Wed, Feb 03, 2021 at 08:52:34PM +0800, Jiaxun Yang wrote:
> > 
> > 
> > On Wed, Feb 3, 2021, at 8:34 PM, Thomas Bogendoerfer wrote:
> > > Hi,
> > > 
> > > Does kvm guest kernel still work ? I'm playing with current mips-next
> > > and starting a kvm guest kernel inside an emulated malta system also
> > > running a mips-next kernel. The kvm guest kernel starts, but hangs
> > > in calibrate_delay (at least that's what info registers in qemu monitor
> > > suggests). Ayn ideas ?
> > 
> > The current KVM guest kernel is actually a Trap-and-emul guest kernel.
> > VZ based KVM uses the same binary with the host one, so does TCG.
> > 
> > TE KVM is current unmaintained. I'll try to get a malta and do some test.
> 
> hmm, so it looks broken, is unmaintained, how about removing it ?

Probably. I got remote access of a CoreLV malta but no luck to boot kernel as well.

+ Huacai as KVM/MIPS Maintainer.
+ Philippe as QEMU/MIPS Maintainer.
+ qemu-devel for wider audience.

If nobody intended to maintain it probably it's time to remove it.

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
>

-- 
- Jiaxun
