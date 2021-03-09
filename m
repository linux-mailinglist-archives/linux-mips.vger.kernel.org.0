Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA56332905
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 15:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhCIOsu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 09:48:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38109 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231411AbhCIOss (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 09:48:48 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 9723A5C01AF;
        Tue,  9 Mar 2021 09:48:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 09 Mar 2021 09:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=U
        MG15ISSnKPJhOBV2Dgx4rSJNGyk0C36ELY0EUXTpvo=; b=s4tv5j3/5yffP5QcJ
        hBEsf/wF5Ht0B1mD4gdXBTilrhAOs+7s5P6TBum9Z67gU/kKxieOUu+8DSCuRXcL
        Ss99mhSStv9dDCD7nKGqdL5G0SQzwL2zEEHyw89vneftL/VtWW+sjeSCKMGBdzWX
        USj1x4Qd6BbWYmTTew7GV5J/AoTS2mXzpEgmRrvLeyVh8hV1VDb3JvEDyq9FU5Re
        zK48yvPATem+0IYv+JUQmt42R2d5zn/OZfwiCtDKMHyC8/eW+BUoO6E1kKcLJoUX
        0zpStrPpfVswltidpUASLhbLCEC6DyfdjNFU79qD+Lqr5NGmhPpYoA41sQ3acTLM
        ugPhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=UMG15ISSnKPJhOBV2Dgx4rSJNGyk0C36ELY0EUXTp
        vo=; b=GG/aCOU6rom5z5B6U6NWS6I+lTY+pYivAADL//ypR2uG5cFYuifDceCkf
        cpcjVQvM2FITAW+UO7Z0uhS7zotWGpjwWAmlXE1rGQbmu/Hy+plHpO8tsDV0GNmi
        VNgD1AtGweqR65A5w27ZLVEzbYU0s2hL9W5WE154G7y7UNiU1UCJLvV8FIa+/BIc
        Sxuaku0n3rSrS8KsMYdfl99jlYkHPkcSMlt73CxjGG5paUCA9jrW7C3k4qZjytMG
        uvo65dpN4eqz7z1ySeJ7zapyNUA63c9XpsVCzm6jR95px75Xmgxzckp3M6XDONlL
        SnC21BLmH/OrIon3wxoUcXlCSPzqQ==
X-ME-Sender: <xms:zYpHYCiUd8d1k9gD9fuU6YC-ypUWLl9yBy1maM6bOis_c0w2ffoVQQ>
    <xme:zYpHYDAh3OktMGX3cADHWHxmuH0xFObrpJxjpUxyO-TiFe_tbdUeqNaNAKEAcVlBl
    F-qIA8gu3H5-EYIJ2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepiedurdduheekrdduhedvrdduleelnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:zYpHYKGZK4iam5WkoJRT470cyoBYZD7C0HD1nPDiXObdi8I1RtScGw>
    <xmx:zYpHYLR75qnAHsOIO0A2iwa99Ib72OsiJqnbALRh7Dp1ohIdNx9uFA>
    <xmx:zYpHYPwnesijv9yWwvG8o3VgA3P6SJuAWsfgo48uG6tJCl6M8W25Hg>
    <xmx:z4pHYBunZSgUZzZzPFmqEBN4jyEi3lcYjn0boOZLYFk3etWQuL2Amw>
Received: from [192.168.21.101] (unknown [61.158.152.199])
        by mail.messagingengine.com (Postfix) with ESMTPA id 353111080054;
        Tue,  9 Mar 2021 09:48:41 -0500 (EST)
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration
 to loongson.h
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Qing Zhang <zhangqing@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-3-zhangqing@loongson.cn>
 <20210306080337.GC4744@alpha.franken.de>
 <d1072504-514b-4be0-85ba-69a6d885de58@www.fastmail.com>
 <20210306095308.GA5751@alpha.franken.de>
 <3a5481f9-d1d5-4439-9679-ad7615ba8009@www.fastmail.com>
 <20210308094947.GA4924@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <0e15b92f-753e-76cf-cf6c-c9ff6910279e@flygoat.com>
Date:   Tue, 9 Mar 2021 22:48:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308094947.GA4924@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/3/8 17:49, Thomas Bogendoerfer Ð´µÀ:
> On Sat, Mar 06, 2021 at 06:55:41PM +0800, Jiaxun Yang wrote:
>>
>> On Sat, Mar 6, 2021, at 5:53 PM, Thomas Bogendoerfer wrote:
>> [...]
>>> Just to understand you, you want
>>>
>>> arch/mips/include/asm/loongson/2ef
>>> arch/mips/include/asm/loongson/32
>>> arch/mips/include/asm/loongson/64
>> Yeah it looks reasonable but from my point of view doing these movement
>> brings no actual benefit :-(
> oh it does for sure. There will no more build errors for non loogson
> configs for things like
>
> #include <loongson_regs.h>

It should be loongson64_regs.h then....

>
> because it will not work for loongson either. And it will be clear,
> which of the 3 loongson.h is used. Which then gives chances for even
> more cleanups.

Ahh, got your point. Probably we should rename all these loongson.h
as they should be indepedent.

Thanks.

- Jiaxun

>
> Thomas.
>

