Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8630C7B8BE
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2019 06:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfGaEd2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Jul 2019 00:33:28 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25537 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbfGaEd2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Jul 2019 00:33:28 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564547577; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=T65jrmw1NGaq9JdQ/R0TkDIe23seGPrcwxka2A5bdcIKXg4Ox/EGzmGbNc6tmcUyiNPdPUgxtRrOaKz6L0gEWpUP+RmynjTd5sjsie6KqC9mhklab1a6OgJMA4vzZhD+RDSuEM5UI1Kfb/d6XeohXx0Fsf6vu/KpZVD9TP9D4CY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564547577; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=9WNHrI421+RItxWcjdx2Q00TTK66a+PCWA7EeVpS/oE=; 
        b=nyhYjbzx8vv1J7UBAqavMZCg6OO9eoIpM7B9F+Xnzcn7q8CFEXtQtyTXotnFA6wKbDM5KHT3HIPB/sZyGymAogr2Tx4V5pOG+xLizv2PQn7T/aOzwunB3ZY40aLKoVKN5DFbYI5hhlp7uAiUGGmP7vKy692TjA3SpLUDuGGkNQE=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=i9Uxk8ErqTcPDTlsECdOKloT27RlFLIQ+qa7wuw6JmAe3doAzRyQTIMtLAVDn7TvGY2wEsO5ce0g
    y+Xa5YoTNPJPacwPL6aRtKye+zEaWoGOBl1umhw/YvWKboMlrDx9  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564547577;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=3520; bh=9WNHrI421+RItxWcjdx2Q00TTK66a+PCWA7EeVpS/oE=;
        b=GTtq4Ao4psHaGAzZDgZdJl6Y8kwZOmmowUqt8+5BKqtlmv5IlpClxuWWo/XEcCIK
        220rXYTKtpwc1SJZwheSVxpMVhf5+/R2NGDAExYQe7BVCm6kbENEKuLTk79jXwYcfKm
        2UTW8jh0PfUEXIyAA7fI0z7x67r6WLohs/rGqYAQ=
Received: from [192.168.10.218] (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564547576884111.22258344736929; Tue, 30 Jul 2019 21:32:56 -0700 (PDT)
Subject: Re: [PATCH] MIPS: Ingenic: Fix bugs when detecting X1000's
 parameters.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564498510-3751-2-git-send-email-zhouyanjie@zoho.com>
 <1564509767.15799.0@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, chenhc@lemote.com, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, jiaxun.yang@flygoat.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D4119EE.50004@zoho.com>
Date:   Wed, 31 Jul 2019 12:32:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1564509767.15799.0@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,
On 2019=E5=B9=B407=E6=9C=8831=E6=97=A5 02:02, Paul Cercueil wrote:
> Hi Zhou,
>
>
>
> Le mar. 30 juil. 2019 =C3=A0 10:55, Zhou Yanjie <zhouyanjie@zoho.com> a=
=20
> =C3=A9crit :
>> 1.fix bugs when detecting L2 cache sets value.
>> 2.fix bugs when detecting L2 cache ways value.
>> 3.fix bugs when calculate bogoMips and loops_per_jiffy.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>  arch/mips/kernel/cpu-probe.c |  7 ++++++-
>>  arch/mips/mm/sc-mips.c       | 18 +++++++++++++++---
>>  2 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index eb527a1..a914435 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -1960,11 +1960,16 @@ static inline void cpu_probe_ingenic(struct=20
>> cpuinfo_mips *c, unsigned int cpu)
>>      c->options &=3D ~MIPS_CPU_COUNTER;
>>      BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
>>      switch (c->processor_id & PRID_IMP_MASK) {
>> -    case PRID_IMP_XBURST:
>> +    case PRID_IMP_XBURST: {
>> +        unsigned int config7;
>>          c->cputype =3D CPU_XBURST;
>>          c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>>          __cpu_name[cpu] =3D "Ingenic XBurst";
>> +        config7 =3D read_c0_config7();
>> +        config7 |=3D (1 << 4);
>> +        write_c0_config7(config7);
>
> If you add __BUILD_SET_C0(config7) in arch/mips/include/asm/mipsregs.h
> (search for this macro) then you can call directly=20
> set_c0_config7(BIT(4)).
>
> It's preferred to use the BIT(x) macro instead of the (1 << x) construct.
Thanks for your suggestion, I have used set_c0_config7(BIT(4)) instead
of the (1 << x) construct in v2.
> Finally, what does that bit do? I can't find it any documentation about
> it. Please add a comment describing what it does.
According to Ingenic's explanation, in the XBurst architecture this bit is
used to control a low-power mode, which is intended to allow the CPU
to further reduce power consumption, but due to some bugs, it is easy
to cause errors in the calculation of bogomips and loops_per_jiffy, So
Ingenic's suggestion is to set this bit to turn it off.
>
>>          break;
>> +    }
>>      default:
>>          panic("Unknown Ingenic Processor ID!");
>>          break;
>> diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
>> index 9385ddb..ed953d4 100644
>> --- a/arch/mips/mm/sc-mips.c
>> +++ b/arch/mips/mm/sc-mips.c
>> @@ -215,6 +215,14 @@ static inline int __init mips_sc_probe(void)
>>      else
>>          return 0;
>>
>> +    /*
>> +     * According to config2 it would be 512-sets, but that is=20
>> contradicted
>> +     * by all documentation.
>> +     */
>> +    if (current_cpu_type() =3D=3D CPU_XBURST &&
>> +                mips_machtype =3D=3D MACH_INGENIC_X1000)
>> +        c->scache.sets =3D 256;
>> +
>>      tmp =3D (config2 >> 0) & 0x0f;
>>      if (tmp <=3D 7)
>>          c->scache.ways =3D tmp + 1;
>> @@ -225,9 +233,13 @@ static inline int __init mips_sc_probe(void)
>>       * According to config2 it would be 5-ways, but that is=20
>> contradicted
>>       * by all documentation.
>>       */
>> -    if (current_cpu_type() =3D=3D CPU_XBURST &&
>> -                mips_machtype =3D=3D MACH_INGENIC_JZ4770)
>> -        c->scache.ways =3D 4;
>> +    if (current_cpu_type() =3D=3D CPU_XBURST) {
>> +        switch (mips_machtype) {
>> +        case MACH_INGENIC_JZ4770:
>> +        case MACH_INGENIC_X1000:
>> +            c->scache.ways =3D 4;
>> +        }
>> +    }
>>
>>      c->scache.waysize =3D c->scache.sets * c->scache.linesz;
>>      c->scache.waybit =3D __ffs(c->scache.waysize);
>> --=20
>> 2.7.4
>>
>>
>
>



