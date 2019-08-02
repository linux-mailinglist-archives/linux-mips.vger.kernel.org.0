Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D53027EE86
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2019 10:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403954AbfHBIN5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Aug 2019 04:13:57 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25520 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403892AbfHBIN4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Aug 2019 04:13:56 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564733603; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=h8tRoATQZzpIgwsfUt+Ldn489jzfqJ1yg/Qs2ZK0yadGC0phKI5nQSSHM3zFh+bf77V/i3gmpPEJWHCCOYJ7l6Z8T0B6EImR93WIKB+jCxnq1yktsgGugz/NBPvZWfNpKxZDCw50zmA4B0Ao9OaLzb0YR5m8jMjHIrDbw5kzaVE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564733603; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=Fs+vn8fth/TLrVZ2M4AvC3A0UN8zPeyOrFPXexTw0jM=; 
        b=WFPpmAAvflJFVBSKuV8fFjAh6aAtTqEMGndtk+575P4I1JIUBOzHZqig2lzzbxs+VUqCGJYE7Wzi847a+3t//o4iH9Y5LyDDI0ZewNhOkXG0fSFHDgtV3SNvnr33Z3dLqBSBKy5+gviyIFnxiatWE9ZmCAYPGbX7/7UIsowojSM=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=Tum5a7pXKzcvgCmluDKiLer9qiZlKYMm+XqmMpKWPCQQuyPduxVKGkeLlXW2QXZyvzC+sd3450UA
    fGna1EdR4JHapYwAWj5Nz6GYznmL5jaiu0v5WWhiPsGZ5aWwK+pB  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564733603;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=3185; bh=Fs+vn8fth/TLrVZ2M4AvC3A0UN8zPeyOrFPXexTw0jM=;
        b=FTmmpSaF80aw+jHU/tc2ZHKMRkNBfWTeq9jXDZUrnTfCsmA5grlnJuqDkIoKPjyM
        wwKGr15vL0r8b6TVI7at6IoMF1VljZLZHvQ+nJ1aZzDnMQtFcuCiB4bKRWxnLCDBJxK
        LzhqjLYEpLFadWn3ytD23KqNzpE8G0hdCkLnD1b4=
Received: from [192.168.31.223] (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1564733602557861.6078185586043; Fri, 2 Aug 2019 01:13:22 -0700 (PDT)
Subject: Re: [PATCH 2/2 v3] MIPS: Ingenic: Fix bugs when calculate
 bogomips/lpj.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564661791-47731-1-git-send-email-zhouyanjie@zoho.com>
 <1564661791-47731-3-git-send-email-zhouyanjie@zoho.com>
 <1564709169.1988.0@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, chenhc@lemote.com,
        jiaxun.yang@flygoat.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D43F09B.7020909@zoho.com>
Date:   Fri, 2 Aug 2019 16:13:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1564709169.1988.0@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2019=E5=B9=B408=E6=9C=8802=E6=97=A5 09:26, Paul Cercueil wrote:
> Hi Zhou,
>
>
>
> Le jeu. 1 ao=C3=BBt 2019 =C3=A0 8:16, Zhou Yanjie <zhouyanjie@zoho.com> a=
 =C3=A9crit :
>> Enable BTB lookups for short loops to fix bugs when calculate
>> bogomips and loops_per_jiffy.
>
> The commit description and the code comment below seem to say two
> different things. Are we enabling the BTB lookup optimization, or not?
>
By set config7 bit 4 we are disable the BTB lookup optimization and enable
BTB lookup for short loop.
> Also, maybe change the commit title to something more meaningful, e.g.
> "MIPS: ingenic: Disable broken BTB lookup optimization" or similar.
>
OK, I'll change it in v4.
>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>  arch/mips/include/asm/mipsregs.h | 4 ++++
>>  arch/mips/kernel/cpu-probe.c     | 7 +++++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/mipsregs.h=20
>> b/arch/mips/include/asm/mipsregs.h
>> index 1e6966e..bdbdc19 100644
>> --- a/arch/mips/include/asm/mipsregs.h
>> +++ b/arch/mips/include/asm/mipsregs.h
>> @@ -689,6 +689,9 @@
>>  #define MIPS_CONF7_IAR        (_ULCAST_(1) << 10)
>>  #define MIPS_CONF7_AR        (_ULCAST_(1) << 16)
>>
>> +/* Ingenic Config7 bits */
>> +#define MIPS_CONF7_BTB_LOOP_EN    (_ULCAST_(1) << 4)
>> +
>>  /* Config7 Bits specific to MIPS Technologies. */
>>
>>  /* Performance counters implemented Per TC */
>> @@ -2813,6 +2816,7 @@ __BUILD_SET_C0(status)
>>  __BUILD_SET_C0(cause)
>>  __BUILD_SET_C0(config)
>>  __BUILD_SET_C0(config5)
>> +__BUILD_SET_C0(config7)
>>  __BUILD_SET_C0(intcontrol)
>>  __BUILD_SET_C0(intctl)
>>  __BUILD_SET_C0(srsmap)
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index eb527a1..2bdd3e1 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -1964,6 +1964,13 @@ static inline void cpu_probe_ingenic(struct=20
>> cpuinfo_mips *c, unsigned int cpu)
>>          c->cputype =3D CPU_XBURST;
>>          c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>>          __cpu_name[cpu] =3D "Ingenic XBurst";
>> +        /*
>> +         * The XBurst core by default attempts to avoid branch target
>> +         * buffer lookups by detecting & special casing loops. This
>> +         * feature will cause BogoMIPS and lpj calculate in error.
>> +         * Set cp0 config7 bit 4 to disable this feature.
>> +         */
>> +        set_c0_config7(MIPS_CONF7_BTB_LOOP_EN);
>
> Shouldn't it be MIPS_CONF7_BTB_LOOP_DIS then?
> Since the feature is disabled when the bit is set.
>
According to Ingenic's explanation and Paul's old patch in

https://github.com/paulburton/linux/commit/0d72377bd615d00e99733adc0d37e6a2=
373fcde7

In order to further reduce power consumption, the XBurst core by default=20
attempts
to avoid branch target buffer lookups by detecting & special casing=20
loops, this is
what you mentioned as "BTB lookup optimization". Enabling this feature=20
will avoid
branch target buffer lookups for loops. And now we are disable this=20
feature, so it
should be "MIPS_CONF7_BTB_LOOP_EN".
>
>>          break;
>>      default:
>>          panic("Unknown Ingenic Processor ID!");
>> --=20
>> 2.7.4
>>
>>
>
>



