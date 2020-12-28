Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C482E3375
	for <lists+linux-mips@lfdr.de>; Mon, 28 Dec 2020 02:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgL1BaB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Dec 2020 20:30:01 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:58985 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726269AbgL1BaB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Dec 2020 20:30:01 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id DF60F58026F;
        Sun, 27 Dec 2020 20:29:14 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Sun, 27 Dec 2020 20:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=4lOteVpdRiAod0MBvpqa+rUu4xjNn2J
        mIg77ldhY8lU=; b=C5QJjfyV3WuqazhtrsDC0no1ar19x78VESTzTbhnVjX0MbM
        12eTHOSyZwxNMiHSKtOO8M++s0Fs/0YlWu2ybpb5UJkCEgm5iDTuNvZLh1CGYmPM
        ZRMfhXeVBlHirNceY71YLgcNm9Hsx7gsu3CvGzZVbUAy372J8qKL0GBja7vamkfL
        rPnWDM35+o7rAzN+6OfoawbSB94SJfqMHzs1rn0OTFkJiVK6tNRHC71nk3VKB2/C
        6wMuAhdk3NILTkGqMHlBaTKVaxMF5COwjKHggcV04Vq7EskEWO/BffFmJtopsDCL
        HgTJRhO3sRRO6cXIIrFJtl5K3atyxgzpLZznVLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4lOteV
        pdRiAod0MBvpqa+rUu4xjNn2JmIg77ldhY8lU=; b=lmn6lyQxNnrOxgoCfcq2ci
        1DVrJCFkO7nb9loaWBrWfK2ADnzV78bV51rKy3YMKq5pq2Tdr4EpBIYgI47h0rVP
        cCNBhVxYXr1+q9tngod6TyXk7FmgaMilmiUAVf36XPpEilGUlBgNdQIfwa0LQA1c
        p8XSPnJiNADKRhwDUZwebUytcALhXQCZE7XzOBNF0znkGy9RroecnMVoZNeDakor
        lZBjnQN7gaA6L8kW+/6Ty2zcpR92dt5CIWLSgk/EI99r2OdF0BJxx1x2zMsVCR05
        +sBtljB6uJmEDn7pY6lK32krZy7dD2mu4QXL+uQ32uobcRihtLXCwjhau35V49ZQ
        ==
X-ME-Sender: <xms:6jTpXz4zmPMaGR76iF3t51SxG33KQAVi_SLhUl7PDW7bpgqj-DJkMw>
    <xme:6jTpX46h9b5AenjZVuVBGkqtrrDZvo1pXmeEtkiYJ2J_gQAmG0sg-nhHE61JTh3vF
    KhRLkH7aQ19Z-mFihk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddukedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekleehtefhhefftddtleeiveefieehueduieefueegueei
    leeitdeujeehheehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:6jTpX6e1AwgH2EJucOQbcTLMm9i8KCyIbRLB6IXamcFkZahv_YoGIA>
    <xmx:6jTpX0LOn0uboXiklHzdE0V2J_WjIq7T-1D8pYRaN8snvwUU6ZBPTQ>
    <xmx:6jTpX3LidWND74V-Ck8kE_LZzF0FNP1edvcTBuUnQPo4VTlbN2D3EQ>
    <xmx:6jTpX8WHuGQLeRxyedeL2jCauwkLHfhOuDq1-zU-fgWSdVD-Wz9hTA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8B1D5C200A5; Sun, 27 Dec 2020 20:29:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <0c24ee90-1872-492d-9bfe-4744aaa87615@www.fastmail.com>
In-Reply-To: <20201227222643.GA5249@alpha.franken.de>
References: <20201220193201.GA3184@alpha.franken.de>
 <d45cb374-f3dc-8c26-6b0f-27bec45854a9@flygoat.com>
 <20201227222643.GA5249@alpha.franken.de>
Date:   Mon, 28 Dec 2020 09:28:53 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: CPUs with EVA support
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Mon, Dec 28, 2020, at 6:26 AM, Thomas Bogendoerfer wrote:
> On Mon, Dec 21, 2020 at 08:38:00AM +0800, Jiaxun Yang wrote:
> > > How good is EVA support in qemu ?
> > 
> > EVA is functional in QEMU.
> > I had tested it with P5600 malta system.
> 
> and it's working for you ? I've setup a qemu malta system running
> debian buster. It boots fine when CPU is != P5600, but as soon as
> I enable -cpu P5600 it stops booting:
> 
> Run /bin/bash as init process
> request_module: kmod_concurrent_max (0) close to 0 (max_modprobes: 50), 
> for module binfmt-464c, throttling...
> request_module: modprobe binfmt-464c cannot be processed, kmod busy 
> with 50 threads for more than 5 seconds now
> Kernel panic - not syncing: Requested init /bin/bash failed (error -8).

Well you need add "ieee754=relaxed" to cmdline
to workaround this.

It's due to NAN2008 mismatch.

Thanks.

- Jiaxun

> 
> This happens independant whether EVA enabled or disabled.
> 
> Has anybody seen this ?
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
>

-- 
- Jiaxun
