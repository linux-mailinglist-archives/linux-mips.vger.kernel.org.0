Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8883D7D9B2
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2019 12:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbfHAK4G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Aug 2019 06:56:06 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25590 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfHAK4G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Aug 2019 06:56:06 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564656934; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=Zq1xQN4Dq3dpqcOowrFfRfTZSL6R2xa5xWr0QUnyQmRDOc0SKblPYjRq9h+FHVcIs4/+VNVw6Ndoc7Hg9UCJuk0YD0RzQjZEPTg2OG+rzZmhf0N9KYQNbRQY+65jDxZqiCiJyqSBLfkXkN0fxDNF6EmuKYjwA022+u5QOzZgtUY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564656934; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=FKwQa98aOpx600LrbRf6vLHAw0mRX3SYa7sADjgeP74=; 
        b=lPMKFx+Mcj+EWco0C76be09Ymy4n1wPuMqteefQEMnbGU3a9I1xQr2j6tyNBtWnzaNjuk2qFmFdJpuIMKZS/o52bgZn607NKk7MsOtpXc0r4ClXqEFA6aGPmJYXk8WhGAQbQYxyl4hmGWW4DGUJZCxGx+cYwykhIshfjAIIWfzQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=fTX0m5RFB+/6o9YgIdwPE9u1ZL/D1BgCiBpVya8/qiW9Tf1nAtcJi5d3+BOA3xxU8gpaZ6Kw31Za
    9aKmpbS8cTswADTuLg9T8bonhlHOzmGvhgsykOyrgFAme5O3cQck  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564656934;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=6285; bh=FKwQa98aOpx600LrbRf6vLHAw0mRX3SYa7sADjgeP74=;
        b=RbJzcmb5cZt5vtjHPe8e8F7CXrCd1A0wTZxzql8UQ+1X+DMYuGevCJ33sKv+mWFp
        cjjsVZ8iMVEy6F3P7pU6I6WgS4e13Qka+9qj3XIKdjxPvAPMGy5MWa4QNqb6VUOKnA+
        J3wDrGkuRS8GoNVMnN7Y6owpAZgzRGaUH2hpYWTY=
Received: from [192.168.10.218] (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564656932898519.5279234666671; Thu, 1 Aug 2019 03:55:32 -0700 (PDT)
Subject: Re: [PATCH v2] MIPS: Ingenic: Fix bugs when detecting X1000's
 parameters.
To:     Paul Burton <paul.burton@mips.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564547943-27505-1-git-send-email-zhouyanjie@zoho.com>
 <1564547943-27505-2-git-send-email-zhouyanjie@zoho.com>
 <20190731203430.2wst6pivwxnmtt74@pburton-laptop>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "malat@debian.org" <malat@debian.org>,
        "chenhc@lemote.com" <chenhc@lemote.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "allison@lohutok.net" <allison@lohutok.net>,
        "syq@debian.org" <syq@debian.org>,
        "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D42C51E.1090906@zoho.com>
Date:   Thu, 1 Aug 2019 18:55:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20190731203430.2wst6pivwxnmtt74@pburton-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B408=E6=9C=8801=E6=97=A5 04:34, Paul Burton wrote:
> Hi Zhou,
>
> On Wed, Jul 31, 2019 at 12:39:03PM +0800, Zhou Yanjie wrote:
>> 1.fix bugs when detecting L2 cache sets value.
>> 2.fix bugs when detecting L2 cache ways value.
>> 3.fix bugs when calculate bogoMips and loops_per_jiffy.
> This should be split into 2 patches - one that fixes the L2 cache
> detection problems, and possibly one that fixes the bogomips/lpj issue.
Thanks for your advice. I have split it in v3.
>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>   arch/mips/include/asm/mipsregs.h |  1 +
>>   arch/mips/kernel/cpu-probe.c     |  7 +++++++
>>   arch/mips/mm/sc-mips.c           | 18 +++++++++++++++---
>>   3 files changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mi=
psregs.h
>> index 1e6966e..01e0fcb 100644
>> --- a/arch/mips/include/asm/mipsregs.h
>> +++ b/arch/mips/include/asm/mipsregs.h
>> @@ -2813,6 +2813,7 @@ __BUILD_SET_C0(status)
>>   __BUILD_SET_C0(cause)
>>   __BUILD_SET_C0(config)
>>   __BUILD_SET_C0(config5)
>> +__BUILD_SET_C0(config7)
>>   __BUILD_SET_C0(intcontrol)
>>   __BUILD_SET_C0(intctl)
>>   __BUILD_SET_C0(srsmap)
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index eb527a1..547c9a0 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -1964,6 +1964,13 @@ static inline void cpu_probe_ingenic(struct cpuin=
fo_mips *c, unsigned int cpu)
>>   =09=09c->cputype =3D CPU_XBURST;
>>   =09=09c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>>   =09=09__cpu_name[cpu] =3D "Ingenic XBurst";
>> +=09=09/*
>> +=09=09 * config7 bit 4 is used to control a low-power mode in
>> +=09=09 * XBurst architecture. This mode may cause errors in the
>> +=09=09 * calculation of bogomips and loops_per_jiffy, set config7
>> +=09=09 * bit 4 to disable this feature to prevent that.
>> +=09=09 */
>> +=09=09set_c0_config7(BIT(4));
> I happen to know what this bit does - see this old patch for an
> explanation:
>
>    https://github.com/paulburton/linux/commit/0d72377bd615d00e99733adc0d3=
7e6a2373fcde7
>
> In short it disables a loop optimization in the CPU that is supposed to
> special case loops & prevent them from relying upon the BTB.
> Unfortunately that loop optimization negatively affects short loops,
> such as in __delay(), and Ingenic's vendor kernels have generally set
> this bit to disable it.
>
> Note though that bogomips is bogus, so changing the bogomips value is
> really not good justification for the patch at all (which is why I've so
> far not bothered upstreaming the patch linked above). The best
> justification I can think of is that Ingenic set the bit in their
> downstream kernels, which presumably means it's beneficial overall (or
> just that someone cares too much about bogomips).
>
> In any case, one thing I don't know for sure is which CPU versions are
> affected. I don't believe this affected older devices like the JZ4740,
> and my copy of the XBurst1 CPU Core Programming Manual documents the bit
> as reserved. Given that you're seeing the X1000 is affected, and I know
> the JZ4780 is affected, that covers at least 2 different PRIDs so we
> can't just check for that.
>
> Hopefully writing to the bit is just a no-op on older systems if it is
> actually reserved, but it'd be great if we could test that.
>
> At the very least we should define the bit in asm/mipsregs.h & properly
> document what it does - using BIT(4) here may be a little nicer than
> (1<<4), but it's still just a magic number. I don't mind if you want to
> fix your patch to do that, or one of us can resurrect mine which has
> that information already.
I have verified the Ingenic's CPU department. According to their reply,
all XBurst1 cores support this feature. Therefore, it is safe to turn off i=
t
in XBurst1.

However, the hardware that I can use normally is JZ4760 and later, so
the JZ4730/JZ4740/JZ4750 has not been tested. So for safe we can also
turn off this feature only in JZ4760 and later if necessary. Wait for your
comments and if necessary I will change it in v4.
>>   =09=09break;
>>   =09default:
>>   =09=09panic("Unknown Ingenic Processor ID!");
>> diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
>> index 9385ddb..ed953d4 100644
>> --- a/arch/mips/mm/sc-mips.c
>> +++ b/arch/mips/mm/sc-mips.c
>> @@ -215,6 +215,14 @@ static inline int __init mips_sc_probe(void)
>>   =09else
>>   =09=09return 0;
>>  =20
>> +=09/*
>> +=09 * According to config2 it would be 512-sets, but that is contradict=
ed
>> +=09 * by all documentation.
>> +=09 */
>> +=09if (current_cpu_type() =3D=3D CPU_XBURST &&
>> +=09=09=09=09mips_machtype =3D=3D MACH_INGENIC_X1000)
>> +=09=09c->scache.sets =3D 256;
>> +
>>   =09tmp =3D (config2 >> 0) & 0x0f;
>>   =09if (tmp <=3D 7)
>>   =09=09c->scache.ways =3D tmp + 1;
>> @@ -225,9 +233,13 @@ static inline int __init mips_sc_probe(void)
>>   =09 * According to config2 it would be 5-ways, but that is contradicte=
d
>>   =09 * by all documentation.
>>   =09 */
>> -=09if (current_cpu_type() =3D=3D CPU_XBURST &&
>> -=09=09=09=09mips_machtype =3D=3D MACH_INGENIC_JZ4770)
>> -=09=09c->scache.ways =3D 4;
>> +=09if (current_cpu_type() =3D=3D CPU_XBURST) {
>> +=09=09switch (mips_machtype) {
>> +=09=09case MACH_INGENIC_JZ4770:
>> +=09=09case MACH_INGENIC_X1000:
>> +=09=09=09c->scache.ways =3D 4;
>> +=09=09}
>> +=09}
>>  =20
>>   =09c->scache.waysize =3D c->scache.sets * c->scache.linesz;
>>   =09c->scache.waybit =3D __ffs(c->scache.waysize);
> Given that we need to fix up both sets & ways, I think this would be
> cleaner if both were done in the switch statement here after we've read
> the values from Config2. ie. something like:
>
> =09if (current_cpu_type() =3D=3D CPU_XBURST) {
> =09=09switch (mips_machtype) {
> =09=09case MACH_INGENIC_JZ4770:
> =09=09=09c->scache.ways =3D 4;
> =09=09=09break;
>
> =09=09case MACH_INGENIC_X1000:
> =09=09=09c->scache.sets =3D 256;
> =09=09=09c->scache.ways =3D 4;
> =09=09=09break;
> =09=09}
> =09}
>
> With appropriate comments added for each machine/SoC.

Thanks for you advice. I have change it in v3.
>
> Thanks,
>      Paul



