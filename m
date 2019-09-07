Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3EEAAC433
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2019 05:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389091AbfIGDOz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Sep 2019 23:14:55 -0400
Received: from forward105j.mail.yandex.net ([5.45.198.248]:39912 "EHLO
        forward105j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726940AbfIGDOz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Sep 2019 23:14:55 -0400
Received: from mxback1g.mail.yandex.net (mxback1g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:162])
        by forward105j.mail.yandex.net (Yandex) with ESMTP id EF329B208EF;
        Sat,  7 Sep 2019 06:14:51 +0300 (MSK)
Received: from smtp4j.mail.yandex.net (smtp4j.mail.yandex.net [2a02:6b8:0:1619::15:6])
        by mxback1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 2JKCtu78lv-EpdWVWF0;
        Sat, 07 Sep 2019 06:14:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567826091;
        bh=tcgGh/VZT5QIu1UNGlfycg1MLojs4whv2stVJZ09gQQ=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=S4Y7LQrwUYkeQkmnwJ5juysEF5QAalUf3/9h3ETa1gOzQmmUt98t8PxI3JLHgXZ5b
         9pZ0q8Zph7d3x6kuUT5oHCG1TXKIA2GLsG0uFxYTN94SQuIA/5g7k7gMcmeLHC3gt2
         0N8UQxZdqkn4qOk0g7VsA7qkm41KLxXz5Yfw8v/M=
Authentication-Results: mxback1g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp4j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 1wa3aXpB17-EK4Kh1TM;
        Sat, 07 Sep 2019 06:14:50 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH v2 14/19] MIPS: Loongson64: Add generic dts
To:     Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
 <20190905144316.12527-15-jiaxun.yang@flygoat.com>
 <CAAhV-H7jzUZr9fGHF_=F3pri9F3zN3ygHhd3xWZevOugaStcfA@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <182a271e-6a66-ed71-2d68-509d8e85d857@flygoat.com>
Date:   Sat, 7 Sep 2019 11:14:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7jzUZr9fGHF_=F3pri9F3zN3ygHhd3xWZevOugaStcfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/9/7 上午10:53, Huacai Chen wrote:
> On Thu, Sep 5, 2019 at 10:47 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> Add generic device dts for Loongson-3 devices.
>> They seems identical but will be different later.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Hi, Jiaxun,
>
> I'm very glad to see that dts files become less in this version, but I
> think we also don't need to distinguish cpu types (i.e.,
> 3a1000/3b1500/3a2000/3a3000). Then, we only need three dts files
> (loongson3_ls2h.dts, loongson3_ls7a.dts, loongson3_rs780.dts) which is
> the same as in our own git repository. If we really need to
> distinguish cpu type, PRID or CPUCFG in Loongson-3A4000 is more
> suitable than dts. In other words, I want dts only do as minimal as
> possible.

Hi Huacai,

I have the  same consideration with you. However, the reason why I split 
this dts is that these chips have significant differences.

For example, 3B1x00 have different memory and config registers layout, 
Their HT config space is a delicate node, HTMSI interrupts is not 
functional until 3A3000, and their syscon registers are not identical.

You may say they can be identified by PRID, but I'm not intend to spread 
PRID all the way in other subsystems, thus I think dts is still the best 
way to tell these differences.

Thanks

--

Jiaxun Yang

>
> Huacai
>
