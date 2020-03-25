Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C98E192B2E
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 15:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbgCYOdV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 10:33:21 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17809 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727566AbgCYOdV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 10:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585146687;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=WUIqMTbG4P3A6zbN3GpLXbJ8Ubb/GOs43bUPmngTtEw=;
        b=XITeJn9EVhgHJXIRTsYdv6whZhZfE5OBEn9ae/y5pKEFuEv38GYT6wq2lH/M8F9j
        BIW5j3U3FUJZuLwaJ/CRnHi5YhyjRmIFHYlG2CjMhBMd//H03UmcVLYrTCSZacXF5ha
        /e+YY0j0pWw1XH5yU8MHk7M26r54N4+xmrsajRUs=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 1585146685016379.50509572583246; Wed, 25 Mar 2020 22:31:25 +0800 (CST)
Date:   Wed, 25 Mar 2020 22:31:21 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <c4520c4b0b0eaaba5fdbaebfce7b4460@kernel.org>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com> <20200325035537.156911-7-jiaxun.yang@flygoat.com> <20200325123742.GA9911@alpha.franken.de> <a69f727d37daac6e20ac08de022245b1@kernel.org> <C4892878-8463-448D-897B-5F2C56F5A340@flygoat.com> <5eb9ce9ea665ee32da40779f00fc9b37@kernel.org> <4BB367D3-B8AD-47B6-ACC2-30752137BC1B@flygoat.com> <c4520c4b0b0eaaba5fdbaebfce7b4460@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 06/11] irqchip: mips-cpu: Convert to simple domain
To:     Marc Zyngier <maz@kernel.org>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <39CF835E-D1D9-4B52-ABDC-BDB17B650936@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:15:16, Marc Zyngier <maz@kernel=2Eorg> =E5=86=99=E5=88=B0:
>On 2020-03-25 13:59, Jiaxun Yang wrote:
>
>[=2E=2E=2E]
>
>>>> So probably we can use legacy domain when  MIPS IRQ BASE is in the
>>>> range of legacy IRQ
>>>> and switch to simple domain when it's not in that range?
>>>=20
>>> No, see below=2E
>>>=20
>>>> Here in Loongson systems IRQ 0-15 is occupied by I8259 so I did
>this
>>>> hack=2E
>>>=20
>>> Well, if you have to consider which Linux IRQ gets assigned,
>>> then your platform is definitely not ready for non-legacy
>>> irqdomains=2E Just stick to legacy for now until you have removed
>>> all the code that knows the hwirq mapping=2E
>>=20
>> Thanks=2E
>>=20
>> So I have to allocate irq_desc here in driver manually?
>
>No, you are probably better off just dropping this patch, as MIPS
>doesn't seem to be ready for a wholesale switch to virtual interrupts=2E

It can't work without this patch=2E

Legacy domain require IRQ number within 0-15=20
however it's already occupied by i8259 or "HTPIC" driver=2E

Previously Loongson even didn't enable IRQ domain so it's not a problem=2E


>
>         M=2E

--=20
Jiaxun Yang
