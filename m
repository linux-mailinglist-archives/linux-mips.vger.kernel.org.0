Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E9DFFAC6
	for <lists+linux-mips@lfdr.de>; Sun, 17 Nov 2019 17:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfKQQhY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Nov 2019 11:37:24 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25807 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfKQQhY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 Nov 2019 11:37:24 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574008614; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=iZvZaFt2TDN4F+bPGgxQLCYTfmtL12svU+BXnmGWAQkzPUidKWcixIK+jvPOudN5BfRdCF49nd5SbRzcFWdR0NTN9G5Hyc/bbyreSa//+eBNsNOrqBspfQnFSQ/rk1KepAMO0wwa0ntUyCpGKqClU5Pz6lfMDRXeZx5oyFcwBO8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574008614; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=82IU1NUBXG2G+tAXsvrhPZDTikNtk3RE8tTPl9Uh1wY=; 
        b=jzmCZ24wNbZU5Zq4ErheBliuqPgIb9hEpstkZ/YWKVB2dcYcNu5LDgZchphcoRQ1fH9gFvv3P2k4huj1Qn4s9noi5VZJm3ymu3gdp3MZffvZ60imkF1RczRNsvH4wbep+tJMoMDOV54EoMyXNaSvUMEm3ybzQSM7jDjvF1BwyvE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=CBMP1HfQWfMU89JNIaaATJeC427lNlhkq/Zag/M5bO3T7t8ztyLrXkYeYxxvR3h/hwXzku6J3Cra
    ZhY9nS7jL+d7kgMLNJc2sBYf0/wbSYQXUnFHm0CuYlE02xZinDCe  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574008614;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=4964; bh=82IU1NUBXG2G+tAXsvrhPZDTikNtk3RE8tTPl9Uh1wY=;
        b=OBBKzJAQbQOnpqe70EQAv78yL4AV/6Vsa1I6gaoes9dEl+60TqV5IVrHa+DNjaPv
        2zCdN5QLEmr68R8MJVThDtEY5F9VgQSdIFpVaAyIaLYzGkyumCr7C32veArLKWQYUo6
        /btTkrU/clLts0jCcLcbm8cXC5pSXjm/n2FKTQUI=
Received: from [192.168.88.128] (171.221.112.196 [171.221.112.196]) by mx.zohomail.com
        with SMTPS id 1574008614125857.3636712250745; Sun, 17 Nov 2019 08:36:54 -0800 (PST)
Subject: Re: [PATCH 2/2] MIPS: Ingenic: Disable abandoned HPTLB function.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
 <1571909341-10108-3-git-send-email-zhouyanjie@zoho.com>
 <20191115213716.wt4wn2moj3fup4dc@lantea.localdomain>
 <5DCFCB41.3090807@zoho.com> <1573991370.3.0@crapouillou.net>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        jhogan@kernel.org, gregkh@linuxfoundation.org,
        paul.burton@mips.com, chenhc@lemote.com, tglx@linutronix.de,
        jiaxun.yang@flygoat.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DD1770F.7030300@zoho.com>
Date:   Mon, 18 Nov 2019 00:36:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1573991370.3.0@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8817=E6=97=A5 19:49, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le sam., nov. 16, 2019 at 18:11, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> Hi Paul,
>>
>> On 2019=E5=B9=B411=E6=9C=8816=E6=97=A5 05:37, Paul Burton wrote:
>>> Hi Zhou,
>>>
>>> On Thu, Oct 24, 2019 at 05:29:01PM +0800, Zhou Yanjie wrote:
>>>> JZ4760/JZ4770/JZ4775/X1000/X1500 has an abandoned huge page
>>>> tlb, write 0xa9000000 to cp0 config5 sel4 to disable this
>>>> function to prevent getting stuck.
>>> Can you describe how we "get stuck"?
>>
>> When the kernel is started, it will be stuck in the "Run /init as=20
>> init process"
>> according to the log information. After using the debug probe, it is=20
>> found
>> that tlbmiss occurred when the run init was started, and entered the=20
>> infinite
>> loop in the "tlb-funcs.S".
>>
>>> What actually goes wrong on the
>>> affected CPUs? Do they misinterpret EntryLo values? Which bits do they
>>> misinterpret?
>>
>> According to Ingenic's explanation, this is because the=20
>> JZ4760/JZ4770/JZ4775/X1000
>> use the same core (both belong to PRID_COMP_INGENIC_D1). This core is=20
>> not fully
>> implemented in VTLB at design time, but only implements the 4K page=20
>> mode.
>
> Actually hugepages work fine on all Ingenic SoCs I tested with, from=20
> JZ4740 upwards, with the VTLB, so this is incorrect.

It may be that I have misunderstood their explanation. I will check this=20
with Ingenic
again tomorrow. However, one thing is certain: these chips default to=20
HPTLB mode
after power-on, which will cause the kernel to be stuck (tested on=20
JZ4770/JZ4775/X1000).
Then need to shutdown HPTLB mode and use VTLB to start normally.

>
>
>> Support for larger pages was implemented by a component called HPTLB=20
>> that
>> they designed themselves, but this component was later discarded, so=20
>> write
>> 0xa9000000 to cp0 register5 sel4 to turn off HPTLB mode and return to=20
>> VTLB
>> mode. The actual test also shows that the kernel will no longer be=20
>> stuck in
>> the "Run / init as init process" after shutting down the HPTLB mode,=20
>> and can
>> boot to the shell normally.
>
> That's good info, please consider adding that in the comment and in=20
> the commit message, and maybe also change the last sentence to reflect=20
> what's actually going on with the infinite loop after the tlbmiss.

OK, I will add them to the v3's comment and commit message.

Thanks and best regards=EF=BC=81

>
> Cheers,
> -Paul
>
>
>>
>>>
>>>> Confirmed by Ingenic,
>>>> this operation will not adversely affect processors
>>>> without HPTLB function.
>>>>
>>>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>>>> ---
>>>>   arch/mips/kernel/cpu-probe.c | 16 ++++++++++++++--
>>>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/mips/kernel/cpu-probe.c=20
>>>> b/arch/mips/kernel/cpu-probe.c
>>>> index 16033a4..cfebf8c 100644
>>>> --- a/arch/mips/kernel/cpu-probe.c
>>>> +++ b/arch/mips/kernel/cpu-probe.c
>>>> @@ -1966,11 +1966,23 @@ static inline void cpu_probe_ingenic(struct=20
>>>> cpuinfo_mips *c, unsigned int cpu)
>>>>       }
>>>>   =7F=7F      /*
>>>> -     * The config0 register in the Xburst CPUs with a processor ID of
>>>> +     * The config0 register in the XBurst CPUs with a processor ID of
>>>> +     * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb, write
>>>> +     * 0xa9000000 to cp0 config5 sel4 to disable this function to
>>> Saying "config5" suggests $16 sel 5 to me - Config5 is after all an
>>> architecturally defined register & it's not this one. It'd be better to
>>> say "cop0 register 5 sel 4".
>>
>> Sure, I'll change it in v2.
>>
>>>> +     * prevent getting stuck.
>>>> +     */
>>>> +    if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGENIC_D=
1) {
>>>> +        __asm__ (
>>>> +            "li    $2, 0xa9000000 \n\t"
>>>> +            "mtc0  $2, $5, 4      \n\t"
>>>> +            "nop                  \n\t"
>>>> +            ::"r"(2));
>>> I'd prefer that you add #defines to asm/mipsregs.h to provide a
>>> write_c0_X() function where X is replaced with whatever the name of=20
>>> this
>>> register is, and preferably also #define macros describing the fields
>>> present in the register. Writing a magic number isn't ideal.
>>
>> Sure, I'll change it in v2.
>>
>>>> +    /*
>>>> +     * The config0 register in the XBurst CPUs with a processor ID of
>>>>        * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2=20
>>>> compatible,
>>>>        * but they don't actually support this ISA.
>>>>        */
>>>> -    if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGENIC_D=
0)
>>>> +    } else if ((c->processor_id & PRID_COMP_MASK) =3D=3D=20
>>>> PRID_COMP_INGENIC_D0)
>>> It might be cleaner to use a switch statement rather than writing out
>>> the & PRID_COMP_MASK condition twice?
>>
>> Sure, I'll change it in v2.
>>
>> Thanks and best regards!
>>
>>>
>>> Thanks,
>>>      Paul
>>
>>
>>
>
>



