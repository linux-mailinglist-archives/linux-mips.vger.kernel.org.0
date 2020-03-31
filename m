Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A192198CDF
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 09:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgCaHWk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 03:22:40 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17871 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726216AbgCaHWk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 31 Mar 2020 03:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585639329;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=P8yT1CgxrAul7A4Ou3JPBhH5oCc1p9yACdVHSWJAzlI=;
        b=aMJKJj3483avgBLx9X6/dYbx5RWYTJJYsVvrbzAuUKIKQkfOEMJI7ijypS0AuytQ
        sK6U/TF6uQgGc/rt0kM7Q1u6w8Ncxvnr9QT+2Hp7Zs2f0OpAeN0q0d7NWs21jt6lBBC
        CFHVnQ54CmgdqH8H4z48/3sk9maSg78WZapwCTrU=
Received: from [10.233.233.252] (183.156.33.130 [183.156.33.130]) by mx.zoho.com.cn
        with SMTPS id 1585639326353648.5257961231661; Tue, 31 Mar 2020 15:22:06 +0800 (CST)
Date:   Tue, 31 Mar 2020 15:22:04 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <c4520c91-5285-ca8d-c310-5354f3ef3cba@loongson.cn>
References: <1585638006-19439-1-git-send-email-yangtiezhu@loongson.cn> <6A188705-D65C-4500-BD26-EB944EEF0B21@flygoat.com> <c4520c91-5285-ca8d-c310-5354f3ef3cba@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Loongson: Use CONFIG_NR_CPUS_DEFAULT_64 to support more CPUs
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <F32ABF2B-9FA4-4850-9CD5-70C09C1BBAD1@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8831=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883=
:21:00, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>On 03/31/2020 03:05 PM, Jiaxun Yang wrote:
>
>>
>> =E4=BA=8E 2020=E5=B9=B43=E6=9C=8831=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=883:00:06, Tiezhu Yang
><yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>>> When I update the mainline kernel on the Loongson 2-way platform
>which
>>> has 8 CPUs, it only shows 4 CPUs due to NR_CPUS is 4, this is
>obviously
>>> wrong=2E
>>>
>>> In order to support more CPUs on the Loongson platform, it is better
>>> to use CONFIG_NR_CPUS_DEFAULT_64 instead of CONFIG_NR_CPUS_DEFAULT_4
>>> to specify the maximum number of CPUs which the kernel will support=2E
>>>
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>> Would 16 be a better option?
>> We have only 4 way platform=2E
>
>There maybe have more than 4 cores per CPU or more than 4 ways
>in the future, so I think 64 is better, otherwise we need to
>modify this configuration once more=2E

Ok, then

Acked-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

Thanks=2E

>
>>
>>> ---
>>> arch/mips/Kconfig | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>> index a1f973c=2E=2Ea0b11f5 100644
>>> --- a/arch/mips/Kconfig
>>> +++ b/arch/mips/Kconfig
>>> @@ -475,7 +475,7 @@ config MACH_LOONGSON64
>>> 	select ISA
>>> 	select I8259
>>> 	select IRQ_MIPS_CPU
>>> -	select NR_CPUS_DEFAULT_4
>>> +	select NR_CPUS_DEFAULT_64
>>> 	select USE_GENERIC_EARLY_PRINTK_8250
>>> 	select SYS_HAS_CPU_LOONGSON64
>>> 	select SYS_HAS_EARLY_PRINTK

--=20
Jiaxun Yang
