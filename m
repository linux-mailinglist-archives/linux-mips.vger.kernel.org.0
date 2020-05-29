Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28BC1E74EA
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 06:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgE2EhE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 00:37:04 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17751 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbgE2EhE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 00:37:04 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1590727006; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=lWSPfm98Y1jJKvPQ+zqEgwZKWQ+dXI8RRe12Uf+NwnSxF6lY+LSqfSyZYggTHjvIIL/5uwrWXiDhwzgZohufayND5VkI/FY0P0kxbpway9c4JR+WO1eToWKqasYLQ1BAhxnrZtvuj9/N4lCgkiywdbO+49jasBfOs9zVEU7DQis=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1590727006; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=O1OREt7nYCnv4UCHr9osSF6UWeM6plYBdi9iXc26Tog=; 
        b=Rxh8XNcvWXhEjfvZKMvGHU9QIFoYNpU9ffCU/4d//cP7WY4kVqHjuVKLuLn23xETJjj30Ln5rl0hOFYo/uA/AYgXJHR2kK/Im9bH35voaasqdcHbnt1LCU3HzwejYu3RS8u18+Qg2ozEBoMyJpcJc9ZOvf/nx/EFhwX8+l6H5dk=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590727006;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=O1OREt7nYCnv4UCHr9osSF6UWeM6plYBdi9iXc26Tog=;
        b=dRak7D3Berg9lhxTTkFmLCivUWgTl4Hh3+VjjePj9fPkEr9cJ4g9WbfQ4vRX3/Hl
        iDJGstJX+RrC4jYL1G3dnZIw2q7D+Xbm0gwGOQTKkcPns0sr9hJ1FUW5tM1gfGNIHEj
        sf0PrS9Q9ays5AJptPphh0JNlEqoeHl7NsEabYg0=
Received: from [127.0.0.1] (60.177.188.90 [60.177.188.90]) by mx.zoho.com.cn
        with SMTPS id 159072700356037.37654661644967; Fri, 29 May 2020 12:36:43 +0800 (CST)
Date:   Fri, 29 May 2020 12:36:41 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Huacai Chen <chenhc@lemote.com>
CC:     Marc Zyngier <maz@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] MIPS: Loongson64: Initial LS7A PCH support
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <CAAhV-H5B+6drcEiz=JCexa0LC3JAPS0K5WZ0zwndvuKv-e9NRQ@mail.gmail.com>
References: <20200529034338.1137776-1-jiaxun.yang@flygoat.com> <CAAhV-H5B+6drcEiz=JCexa0LC3JAPS0K5WZ0zwndvuKv-e9NRQ@mail.gmail.com>
Message-ID: <82608FDB-FEF8-45FA-85D7-236B46F906B7@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8829=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
2:13:36, Huacai Chen <chenhc@lemote=2Ecom> =E5=86=99=E5=88=B0:
>Hi, Jiaxun,
>
>On Fri, May 29, 2020 at 11:45 AM Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom=
> wrote:
>>
>> With this series, LS7A and Loongson-3A4000 is finally supported
>> note that this series should depend on irqchip support[1], which
>> is likely to get merged soon=2E
>>
>> Thanks=2E
>>
>> [1]: https://lkml=2Eorg/lkml/2020/5/16/72
>>
>> Jiaxun Yang (3):
>>   dt-bindings: mips: Document two Loongson generic boards
>>   MIPS: Loongson64: DeviceTree for LS7A PCH
>>   MIPS: Loongson64:Load LS7A dtbs
>>
>>  =2E=2E=2E/bindings/mips/loongson/devices=2Eyaml       |   8 +
>>  arch/mips/boot/dts/loongson/Makefile          |   5 +-
>>  =2E=2E=2E/dts/loongson/loongson3-r4-package=2Edtsi    |  74 +++++++
>>  =2E=2E=2E/dts/loongson/loongson3_4core_ls7a=2Edts     |  25 +++
>>  =2E=2E=2E/boot/dts/loongson/loongson3_r4_ls7a=2Edts   |  10 +
>>  arch/mips/boot/dts/loongson/ls7a-pch=2Edtsi     | 185 ++++++++++++++++=
++
>>  =2E=2E=2E/asm/mach-loongson64/builtin_dtbs=2Eh        |   2 +
>>  arch/mips/loongson64/env=2Ec                    |  56 +++---
>>  8 files changed, 342 insertions(+), 23 deletions(-)
>>  create mode 100644 arch/mips/boot/dts/loongson/loongson3-r4-package=2E=
dtsi
>>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_ls7a=2E=
dts
>>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_r4_ls7a=2Edts
>>  create mode 100644 arch/mips/boot/dts/loongson/ls7a-pch=2Edtsi
>I think the naming can be like this: Old processor (Loongson 3A R1~R3)
>use loongson64c_ prefix instead of loongson3, new processor (Loongson
>3A R4) use loongson64g_ prefix instead of loongson3_r4, and
>Loongson-2K use loongson64r_ prefix, this makes them consistent with
>their PRID definitions=2E


DeviceTree bindings have stable ABI=2E Although they're currently=20
only used internally in Kernel=2E I don't think it's a good idea
to rename existing bindings=2E

Also, Loongson64C/64G/64R never came to a part of Loongson's
official naming=2E I doubt if end users will recognize these names=2E

I'd prefer keep naming as is=2E It's really not a big deal=2E

Thanks=2E


>
>>
>> --
>> 2=2E27=2E0=2Erc0
>>

--=20
Jiaxun Yang
