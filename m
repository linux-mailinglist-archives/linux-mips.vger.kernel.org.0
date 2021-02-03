Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5B630DA53
	for <lists+linux-mips@lfdr.de>; Wed,  3 Feb 2021 13:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhBCM4V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 07:56:21 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33505 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231553AbhBCMyP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Feb 2021 07:54:15 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 99C3F5C01AE;
        Wed,  3 Feb 2021 07:53:08 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Wed, 03 Feb 2021 07:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm1; bh=swlZwsUiGBMMZ55mtjzyZ68Ud7VT0bR
        xEXdD2+J6nAQ=; b=n8nzoGGAQlzHbvCgOVDwVvM5ItyafDJsD0Ry9eHpuiKGOWt
        Xx2KxvKf0PcJi/Jd9D3HSDp12uw5JQOA1VQBZw+akvclJqKFIss/Di+Ceqm3bHJW
        0ayVA1hd8o8zrs1XPr4LCCbr0hhVTJAdfAM0fUDCbLcJWgf0o9GWveqPTgAb4psG
        UkuSnXzFon7xaQPuRdQw8wX90xx45XboNZMJSgvAD1t+tEAS80ru0UTv82ql8aRh
        P9l8I6i/C/5R4gcoNCUhF3X/fIhpsneC1+kTfcBRja1cO+9ia7uA86gOE3Finoj0
        lTpu+HplyZjok9loQqj/StFnAJOPE5ZSteqOyuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=swlZws
        UiGBMMZ55mtjzyZ68Ud7VT0bRxEXdD2+J6nAQ=; b=YViDdOdPqld+b+RkeetySv
        qK86yKBvl0MQ6Wl6al1orLC47aYN2qKcrhbo43CRhbH/Yb5dCOh9b9Z2kSe3RJhC
        zkdDCk9/9QXiCM4p4JehUR7fZdZdM3GVlsjy6UoxsYNwbavmrzMCC+3xdKKu5/9O
        oQNOIbJpDakJuuPsY0uHsnmIFTw2rNv0gujNV4bFCAc4pb+RDUG+CoTELaZR4loE
        VHXVx+JCAEC3QymAXOir+yYBjxZFc9LTunEFVwdyUfIUhD4VznpYpmYikjSUmgDd
        0u6Xob6Dt69V7c8qIIVhGlm/Vhk7pXz1N5xIrbRwNiRs2mTkL60eInXzhW5d08Jw
        ==
X-ME-Sender: <xms:tJwaYN1o4g4yE5KlwH0uSwJ0Ehn75rgbPpko--ofqR5Ee-EiGPp3fw>
    <xme:tJwaYEFQT1o2H0K71SjuAQk464NRS96z0u8mn5RaK2o1lXg27J4dQj8yD__wEpOI9
    yxk3LwG5GsWcfuAGTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepkeelheethfehffdttdelieevfeeiheeuudeifeeugeeuieel
    iedtueejheehhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:tJwaYN7pKweOf34mowL4DvDyNn1fO5qjH_hS3v_ZETeXH7HotugpNw>
    <xmx:tJwaYK1zW-P7qrg3XpnNWRbGvnHMaizXDn2h37ddZZ-O__lJHua-GQ>
    <xmx:tJwaYAFznd3BdEbPhTIsujQ6COCNN9Fp45B9FK2vEOadcWpGxLZflw>
    <xmx:tJwaYDzqOk9h1lliaEpo1_QhzTjce1YGsxvVCXcJ-7QyHeFZ049Jtw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 03212130005D; Wed,  3 Feb 2021 07:53:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com>
In-Reply-To: <20210203123425.GA9574@alpha.franken.de>
References: <20210203123425.GA9574@alpha.franken.de>
Date:   Wed, 03 Feb 2021 20:52:34 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: KVM Guest
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, Feb 3, 2021, at 8:34 PM, Thomas Bogendoerfer wrote:
> Hi,
> 
> Does kvm guest kernel still work ? I'm playing with current mips-next
> and starting a kvm guest kernel inside an emulated malta system also
> running a mips-next kernel. The kvm guest kernel starts, but hangs
> in calibrate_delay (at least that's what info registers in qemu monitor
> suggests). Ayn ideas ?

The current KVM guest kernel is actually a Trap-and-emul guest kernel.
VZ based KVM uses the same binary with the host one, so does TCG.

TE KVM is current unmaintained. I'll try to get a malta and do some test.

Thanks.


- Jiaxun


> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
>

-- 
- Jiaxun
