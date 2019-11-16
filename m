Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B34FFEB9B
	for <lists+linux-mips@lfdr.de>; Sat, 16 Nov 2019 11:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfKPKLw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Nov 2019 05:11:52 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25854 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfKPKLw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Nov 2019 05:11:52 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573899080; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=AqADR5nbwXxYeFAnDtd5/PbWa+RlLRuvsdqZgMZFS0rK452GKnsaN8b1M9vTlYn4ZKs8f8zeVrp2L6q0L+cqNFvc++bPxqf4xfplgaVre0tTV+Air/hCuq57kzWASnQ/lqW5L/64NHpvK6kdqC8yNobRoyZbFpBzm+chdNrbuJo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1573899080; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=4RTZRN3gPV3RsDvKXTvTiC6YZxmdLTZQowmHVUeiWH0=; 
        b=TYQsIpRlM37BPRXq6t4ZBkAcEyvHe9sAUJNU2fB4MlHjNr9wk4tDD/A0qsE1PUDvn1bBPsz4GHrH3ARiw+PpdXGGcCXzTla8sioe4LEDBWbOUnISjksyrViUatdhdFwmluHVUEXDCqFh58uO4FETy3nPaOKkdBW2o26EdRa/AGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=RuRPd06x7O4MMi3cUl9qTnDy9vMNnGKOoU+gVqxFaqbjfZ677l6YITGHpxcnWCy0Et5cgp9chpZw
    p8uX38zmrTMzuUspJO+jwSRJNNkw4p4tiIMOiSfnAVmz0voEWFkY  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573899080;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=3711; bh=4RTZRN3gPV3RsDvKXTvTiC6YZxmdLTZQowmHVUeiWH0=;
        b=biOQ3SJPAzUca1q7STwGcMlniJx+KmYRRAvUjCvpmcQawOzf2FEIXrTF2Quc1j6U
        0a5lq3cOjcVZoAVXdwPJmr1HUp5FYZAMRkTBDzShSboUGB0CLfel6whS2ByaMjSNXbm
        +KK3V7fgW2wm6QWhchbxzaEI+UW2Ls0Jek37XmKw=
Received: from [192.168.88.128] (222.211.204.220 [222.211.204.220]) by mx.zohomail.com
        with SMTPS id 157389907975869.64945352199459; Sat, 16 Nov 2019 02:11:19 -0800 (PST)
Subject: Re: [PATCH 2/2] MIPS: Ingenic: Disable abandoned HPTLB function.
To:     Paul Burton <paulburton@kernel.org>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
 <1571909341-10108-3-git-send-email-zhouyanjie@zoho.com>
 <20191115213716.wt4wn2moj3fup4dc@lantea.localdomain>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, jhogan@kernel.org, gregkh@linuxfoundation.org,
        paul.burton@mips.com, chenhc@lemote.com, paul@crapouillou.net,
        tglx@linutronix.de, jiaxun.yang@flygoat.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DCFCB41.3090807@zoho.com>
Date:   Sat, 16 Nov 2019 18:11:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20191115213716.wt4wn2moj3fup4dc@lantea.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8816=E6=97=A5 05:37, Paul Burton wrote:
> Hi Zhou,
>
> On Thu, Oct 24, 2019 at 05:29:01PM +0800, Zhou Yanjie wrote:
>> JZ4760/JZ4770/JZ4775/X1000/X1500 has an abandoned huge page
>> tlb, write 0xa9000000 to cp0 config5 sel4 to disable this
>> function to prevent getting stuck.
> Can you describe how we "get stuck"?

When the kernel is started, it will be stuck in the "Run /init as init=20
process"
according to the log information. After using the debug probe, it is found
that tlbmiss occurred when the run init was started, and entered the=20
infinite
loop in the "tlb-funcs.S".

> What actually goes wrong on the
> affected CPUs? Do they misinterpret EntryLo values? Which bits do they
> misinterpret?

According to Ingenic's explanation, this is because the=20
JZ4760/JZ4770/JZ4775/X1000
use the same core (both belong to PRID_COMP_INGENIC_D1). This core is=20
not fully
implemented in VTLB at design time, but only implements the 4K page mode.
Support for larger pages was implemented by a component called HPTLB that
they designed themselves, but this component was later discarded, so write
0xa9000000 to cp0 register5 sel4 to turn off HPTLB mode and return to VTLB
mode. The actual test also shows that the kernel will no longer be stuck in
the "Run / init as init process" after shutting down the HPTLB mode, and ca=
n
boot to the shell normally.

>
>> Confirmed by Ingenic,
>> this operation will not adversely affect processors
>> without HPTLB function.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>   arch/mips/kernel/cpu-probe.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index 16033a4..cfebf8c 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -1966,11 +1966,23 @@ static inline void cpu_probe_ingenic(struct cpui=
nfo_mips *c, unsigned int cpu)
>>   =09}
>>  =20
>>   =09/*
>> -=09 * The config0 register in the Xburst CPUs with a processor ID of
>> +=09 * The config0 register in the XBurst CPUs with a processor ID of
>> +=09 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb, write
>> +=09 * 0xa9000000 to cp0 config5 sel4 to disable this function to
> Saying "config5" suggests $16 sel 5 to me - Config5 is after all an
> architecturally defined register & it's not this one. It'd be better to
> say "cop0 register 5 sel 4".

Sure, I'll change it in v2.

>> +=09 * prevent getting stuck.
>> +=09 */
>> +=09if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGENIC_D1) =
{
>> +=09=09__asm__ (
>> +=09=09=09"li    $2, 0xa9000000 \n\t"
>> +=09=09=09"mtc0  $2, $5, 4      \n\t"
>> +=09=09=09"nop                  \n\t"
>> +=09=09=09::"r"(2));
> I'd prefer that you add #defines to asm/mipsregs.h to provide a
> write_c0_X() function where X is replaced with whatever the name of this
> register is, and preferably also #define macros describing the fields
> present in the register. Writing a magic number isn't ideal.

Sure, I'll change it in v2.

>> +=09/*
>> +=09 * The config0 register in the XBurst CPUs with a processor ID of
>>   =09 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
>>   =09 * but they don't actually support this ISA.
>>   =09 */
>> -=09if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGENIC_D0)
>> +=09} else if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGEN=
IC_D0)
> It might be cleaner to use a switch statement rather than writing out
> the & PRID_COMP_MASK condition twice?

Sure, I'll change it in v2.

Thanks and best regards!

>
> Thanks,
>      Paul



