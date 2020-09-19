Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E084F270CE1
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 12:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgISKRx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Sep 2020 06:17:53 -0400
Received: from relay3.mymailcheap.com ([217.182.66.161]:58674 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgISKRx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Sep 2020 06:17:53 -0400
X-Greylist: delayed 11199 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 06:17:51 EDT
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 588373F15F;
        Sat, 19 Sep 2020 12:17:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 822C32A35A;
        Sat, 19 Sep 2020 06:17:48 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600510668;
        bh=f+3FqkM/pNwL/iuQjswOcMvVBiN07kFPDR2BYPbaYao=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=0OnrWtxEbhuYm8hvZtBGaRd3F5TE9n/JODYwXLDoF7Bx2WXtzTWm/WbJChfFvW9Qx
         bs9S0mk9onQCDMaaMgiFKnTSSP3tSnqQIUDKYU+fCrdFhEKQa9pE8rsbV3/yepbfGH
         g5l9BflhldJvbQhWO5yi4FuEfA2SAVTXkH2emqh4=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EVRRaHfx1LkK; Sat, 19 Sep 2020 06:17:47 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Sat, 19 Sep 2020 06:17:46 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id E3FE640FE5;
        Sat, 19 Sep 2020 10:17:43 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="PCWB9HEf";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (unknown [223.104.145.85])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id C2D1140FE5;
        Sat, 19 Sep 2020 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600510651;
        bh=f+3FqkM/pNwL/iuQjswOcMvVBiN07kFPDR2BYPbaYao=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=PCWB9HEfUZxIj54DQp0saTxazTFuacNbggWsbOJtw92bLb3FFzMPwq65CGDTfDBjL
         fqZjihsjlz4Zn6suc75/hlD8QYWcVcETAiiWDBsEfg1bgMG93Pe8RoWOd2nK5E7CBi
         7IxntC3zl+hYPG/gmKyL0GKCQdWBdLgxp+U4hv8M=
Date:   Sat, 19 Sep 2020 18:17:21 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Youling Tang <tangyouling@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kexec: Add crashkernel=YM handling
User-Agent: K-9 Mail for Android
In-Reply-To: <e0154fb4-f2bd-5017-17ea-9827b95b8e68@loongson.cn>
References: <1600480546-10448-1-git-send-email-tangyouling@loongson.cn> <3F79DD89-BE1E-456F-9297-273DDBB4E12A@flygoat.com> <e0154fb4-f2bd-5017-17ea-9827b95b8e68@loongson.cn>
Message-ID: <8FA16E6F-19A7-4E46-A21D-A31B6BFF1B8E@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E3FE640FE5
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[223.104.145.85:received];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[4];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B49=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884=
:29:39, Youling Tang <tangyouling@loongson=2Ecn> =E5=86=99=E5=88=B0:
>
>
>On 09/19/2020 03:02 PM, Jiaxun Yang wrote:
>>
>> =E4=BA=8E 2020=E5=B9=B49=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=889:55:46, Youling Tang <tangyouling@loongson=2Ecn> =E5=86=99=E5=88=B0:
>>> When the kernel crashkernel parameter is specified with just a size,
>>> we are supposed to allocate a region from RAM to store the crashkernel=
=2E
>>> However, MIPS merely reserves physical address zero with no checking
>>> that there is even RAM there=2E
>>>
>>> Fix this by lifting similar code from x86, importing it to MIPS with t=
he
>>> MIPS specific parameters added=2E In the absence of any platform speci=
fic
>>> information, we allocate the crashkernel region from the first 512MB o=
f
>>> physical memory (limited to CKSEG0 or KSEG0 address range)=2E
>>>
>>> When X is not specified, crash_base defaults to 0 (crashkernel=3DYM@XM=
)=2E
>>>
>>> E=2Eg=2E without this patch:
>>>
>>> The environment as follows:
>>> [    0=2E000000] MIPS: machine is loongson,loongson64c-4core-ls7a
>>> =2E=2E=2E
>>> [    0=2E000000] Kernel command line: root=3D/dev/sda2 crashkernel=3D9=
6M =2E=2E=2E
>>>
>>> The warning as follows:
>>> [    0=2E000000] Invalid memory region reserved for crash kernel
>>>
>>> And the iomem as follows:
>>> 00200000-0effffff : System RAM
>>>   00200000-00b47f87 : Kernel code
>>>   00b47f88-00dfffff : Kernel data
>>>   00e60000-01f73c7f : Kernel bss
>>> 1a000000-1bffffff : pci@1a000000
>>> =2E=2E=2E
>>>
>>> With this patch:
>>>
>>> After increasing crash_base <=3D 0 handling=2E
>>>
>>> And the iomem as follows:
>>> 00200000-0effffff : System RAM
>>>   00200000-00b47f87 : Kernel code
>>>   00b47f88-00dfffff : Kernel data
>>>   00e60000-01f73c7f : Kernel bss
>>>   04000000-09ffffff : Crash kernel
>>> 1a000000-1bffffff : pci@1a000000
>>> =2E=2E=2E
>>>
>>> Signed-off-by: Youling Tang <tangyouling@loongson=2Ecn>
>>> ---
>>> arch/mips/kernel/setup=2Ec | 24 +++++++++++++++++++++---
>>> 1 file changed, 21 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/mips/kernel/setup=2Ec b/arch/mips/kernel/setup=2Ec
>>> index bf5f5ac=2E=2E59a88ea 100644
>>> --- a/arch/mips/kernel/setup=2Ec
>>> +++ b/arch/mips/kernel/setup=2Ec
>>> @@ -477,6 +477,11 @@ early_param("elfcorehdr", early_parse_elfcorehdr)=
;
>>> #endif
>>>
>>> #ifdef CONFIG_KEXEC
>>> +
>>> +/* 64M alignment for crash kernel regions */
>>> +#define CRASH_ALIGN	SZ_64M
>>> +#define CRASH_ADDR_MAX	SZ_512M
>> Hi Youling
>>
>> How do you determine the alignment requirement?
>>
>> Can we relax it?
>>
>> Thanks=2E
>>
>> - Jiaxun
>Hi Jiaxun
>
>Only when XM is not specified, 64M alignment is specified=2E
>
>After the capture kernel is configured with CRASH_DUMP, PHYSICAL_START
>defaults to 0x0xffffffff84000000 (64M)=2E The kexec -p operation will
>succeed only when the reserved Crash kernel start address is consistent
>with PHYSICAL_START=2E
>
>The description of PHYSICAL_START in arch/mips/Kconfig:2996 is as follows=
:
>This gives the CKSEG0 or KSEG0 address where the kernel is loaded=2EIf yo=
u
>plan to use kernel for capturing the crash dump change this value to star=
t
>of the reserved region (the "X" value as specified in the=20
>"crashkernel=3DYM@XM"
>command line boot parameter passed to the panic-ed kernel)=2E

Thanks for your explanation~

That makes sense=2E

- Jiaxun


>
>Thanks,
>
>- Youling

[=2E=2E=2E]
