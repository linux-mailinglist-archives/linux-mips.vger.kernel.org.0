Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11700191563
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 16:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgCXPyJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 11:54:09 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17826 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727426AbgCXPyJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 11:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585065094;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=BaEVCVn7EuihrC0WZ985tTxPvg8aH8svi5ddVX2lo88=;
        b=OQxAY7ij7bXQ9IynEq4NoRTd8DJDYjA/Eteh+hbdkV6Rkv+TtWa5y1sQHD7t3Be+
        f4Iu3ClJnqwJtSg2vNzUyCAJZjYEWxQVv+dbpkaGZjs8G1RTLZGkiqbqZNK+4VOJPgr
        ue4vALAg2oUHAsw8yshR9e2J5btJdPnE71W/GjC0=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 1585065093493192.6854956797098; Tue, 24 Mar 2020 23:51:33 +0800 (CST)
Date:   Tue, 24 Mar 2020 23:51:18 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200324154747.18e8ccd5@why>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com> <20200324153624.23109-1-jiaxun.yang@flygoat.com> <20200324154747.18e8ccd5@why>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 00/11] Modernize Loongson64 Machine v6
To:     Marc Zyngier <maz@kernel.org>
CC:     linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <8C3E32B2-11DB-40A6-A19E-162B8E42330C@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
1:47:47, Marc Zyngier <maz@kernel=2Eorg> =E5=86=99=E5=88=B0:
>Jiaxun,
>
>On Tue, 24 Mar 2020 23:35:57 +0800
>Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom> wrote:
>
>> Loongson have a long history of contributing their code to mainline
>kernel=2E
>> However, it seems like recent years, they are focusing on maintain a
>kernel by themselves
>> rather than contribute there code to the community=2E
>>=20
>> Kernel is progress rapidly too=2E Their code slept in mainline for a
>long peroid without proper
>> maintainance and became outdated=2E
>>=20
>> This patchset brings modern DeviceTree and irqchip support to the
>Loongson64 machine, and leaves
>> Loongson 2e/f alone since they are too legacy to touch=2E
>>=20
>> PCI and some legacy I/O device will be converted later, together with
>LS7A PCH support=2E
>>=20
>> v1:
>> - dt-bindings fixup according to Rob's comments
>> - irqchip fixup according to Marc's comments
>> - ls3-iointc: Make Core&IP map per-IRQ
>> - Regenerate kconfigs
>> - Typo & style improvements
>>=20
>> v2:
>> - dt-bindings: Fix IOINTC, collect Rob's review tag
>> - dtbs: Drop CPU Node, merge different ways according to Huacai and
>Paul's comments
>>=20
>> v3:
>> - Split code have been merged
>> - Fix IOINTC binding to allow map any child IRQ to and parent
>> - Convert "HTINTC" into "HTPIC", which mixed HT vectors processing
>and i8259
>> - Naming style fix according to Huacai's suggestions
>>=20
>> v4:
>> - More naming related fixes
>>=20
>> v5:
>> - irqchip fixes thanks to maz (see per file changelog)
>> - Remove unnecessary details in dt-bindings
>> - Credit Huacai with Co-developed-by
>>=20
>> v6:
>> - HTPIC minor fix
>> - device binding naming fix=20
>>=20
>> ---
>> Jiaxun Yang (11):
>>   irqchip: Add driver for Loongson I/O Local Interrupt Controller
>>   irqchip: loongson-liointc: Workaround LPC IRQ Errata
>>   dt-bindings: interrupt-controller: Add Loongson LIOINTC
>>   irqchip: Add driver for Loongson-3 HyperTransport PIC controller
>>   dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
>>   irqchip: mips-cpu: Convert to simple domain
>>   MIPS: Loongson64: Drop legacy IRQ code
>>   dt-bindings: mips: Add loongson boards
>>   MIPS: Loongson64: Add generic dts
>>   MIPS: Loongson64: Load built-in dtbs
>>   MIPS: Loongson64: Move MIPS_CPU_IRQ_BASE
>
>[=2E=2E=2E]
>
>How do you want to get these merged? I can take the first 6 patches
>through the irqchip tree, and leave the rest to go via the MIPS tree=2E
>
>Otherwise, if you plan to have the whole thing go via the MIPS tree,
>please add my:
>
>Reviewed-by: Marc Zyngier <maz@kernel=2Eorg>
>
>to patches 1, 2, 4 and 6=2E
>
>Please let me know quickly, as I'd like to close the irqchip tree
>tomorrow=2E

I'd prefer all go through MIPS tree=2E

Thomas, could you please help with that?

Thanks=2E

>
>Thanks,
>
>	M=2E

--=20
Jiaxun Yang
