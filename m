Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5842EF140
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 12:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbhAHL3C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 06:29:02 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:36237 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725791AbhAHL3C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Jan 2021 06:29:02 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 11B1F58071D;
        Fri,  8 Jan 2021 06:28:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 08 Jan 2021 06:28:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=L
        lM8EUqt5gB3oOp1UJKZQi6+qixN9zezB2HRwlVPsbs=; b=lLyL9GlAcqIaaYBww
        bbjlSkg4IEDfIopP27fc3A4WV2/XNF7uCyc+FxzwtwyVDUco6WcUIHNlbx5hsl5o
        Csf4mrjIrbXpp9JHpUg8KDuZgsAC4Yz8pNQ3Kxk5NuPztgDRwmDn4lRzS7JFqt0S
        0Xr44U+DjRI1d13STyVHbJWYFAUPR0uEH1tUkL3AyVI96JObmln43/0/5lR55vcs
        ge7LW+z6YoWJIbkE+iXh551TBHvqthX0PKQY6XsUoTexyzgxeSJ7p2JCG1aL7aCs
        x8xAvC7WOdOkJegMZdmL2Z1Bh9eSv/tnXaS5Tw087Krg0Ls1Ctl7K7ImSxOAGO8I
        hVi8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=LlM8EUqt5gB3oOp1UJKZQi6+qixN9zezB2HRwlVPs
        bs=; b=brjZtBGntYQjxUylT7mzFG9UicITM3POX1KxXwu6CsAfpWfZEMFiGX0QU
        lQfByv8tJeqoOt9GTYQqTkzkk3EHK7i81OJdNwLFyyEqWkfXGGAelwcCmUc2OcZG
        S/GKVK7KRUeWev50sv+xDQyp0BODIT7daX3zzhB7ujzQMkgqzioQMSVF+VJyA1ku
        iJCYJaBecA/5z2tyn/2ksB4B2T+uFFEl8DON+6jGa/oTBGQV0gHEg1bn3aQ7kzna
        W7MR/4wUkbuqv/ODkw9Vbtf9JhGiuJIEwnXVKR0DyhXc3WjjuVUnrtQNdO1itdE6
        zjREi2DTztUghVpwWGnb2sQcxOApA==
X-ME-Sender: <xms:z0H4X1-TcbTlEzqr6C78q7hJWk2cRCLbj0z2hl6hbYJ8M8SWD86HGA>
    <xme:z0H4X2AGAt6XsJY3NgwlurW1A8nrpSq-3pVCNCQKPk2dPw-P72CIfn_XtmTOLHP-a
    hvrZ_NoIVuefYAp6d8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:z0H4X1wAFohrkIomaLJhS_AQt9xNwTkParhjYx2ncJvSotn0L6Py-g>
    <xmx:z0H4X7RuFKvlZpIo0RCPeBnG8lDteRmwkjotPuVvoPsF3JnW_5NFWw>
    <xmx:z0H4X8_QYY37taBohBnpVtx_BjuAJ1PvOjpdwBgU2jcTXOx6aDgUsA>
    <xmx:z0H4XxukwPNurHVa-GyrWPC_alDqtxeb9iJd5nJSbvxIxvW51k0S_Q>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id E275024005B;
        Fri,  8 Jan 2021 06:28:13 -0500 (EST)
Subject: Re: [PATCH 2/6] mips: Add N64 machine type
To:     Lauri Kasanen <cand@gmx.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
References: <20210104154357.6cf126150407ba4839630177@gmx.com>
 <20210107171035.GA13117@alpha.franken.de>
 <20210108090434.d404fe2dfa604542d8c88a05@gmx.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <4eb58791-26ef-3d6d-6b06-bca0f5e13a0a@flygoat.com>
Date:   Fri, 8 Jan 2021 19:28:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108090434.d404fe2dfa604542d8c88a05@gmx.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2021/1/8 ÏÂÎç3:04, Lauri Kasanen Ð´µÀ:
> On Thu, 7 Jan 2021 18:10:35 +0100
> Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:
>
>> 32BIT kernel don't compile, because you use TO_UNCAC which only
>> exists for 64bit kernels. One solution would be to use CKSEG1 to
>> convert from physical to an uncached address. But I'd prefer if
>> you add resources to your platform device and do ioremap in device
>> drivers. This way there is also no need to export the interrupt
>> defines outside.
> :( Jiaxun told me to use TO_UNCAC because CKSEG1 was unclear to him...
>
> I will change back to CKSEG1. ioremap seems much needless overhead.


Sorry, ignored that you have 32-bit kernel as well.

- Jiaxun
