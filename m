Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B3E10C386
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 06:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfK1FSR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 00:18:17 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25817 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfK1FSQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 00:18:16 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574918268; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=e+ghfcZQoWhFRk2pInKR5Daap0U6K5bKBG/kv/rSvGnTmT1Qtjes4PUVOX0HlrNz9aPokmgALZPpcr3p/dwVT3EUUgLjehYoEZS0cCdWL9DK+mbXokWoL9wTN+2qj5cSoCikyn3PHhnSa9Cwt/RTbNV44gvjFG7tuRVyYLRlc3Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574918268; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=CzDsI7im9MIj1nVzpy6+/o3kzds4k62BkTKvKb0GpKc=; 
        b=hBeVXoUqd4xcrMG7mQFsDdckzqqGns5Ky2D4u1Qzfg3m8fXXcG5c3wWiOJ5N65SfYE2/78AylYbhwQ6tsUSR6bNdm5h3XPO5IgiukXS1sHTC5/SikqpqohNqv9FH/U7nYIchp7ZgmMI1PXWqhjQdS0VCmsv86XN9rtqJ09pUoks=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=S2ANrwENo2KQcdB7+D1YXfZmOo+L5K5DeGw6m3XXResQx2Bv9mvvArg44BSBW/x2AePbC8y2U/kO
    MehV7qS+bh7ChaDJbxr2THhcbhP4URHDAQT0IaqfvNgDIgD+e98k  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574918268;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=CzDsI7im9MIj1nVzpy6+/o3kzds4k62BkTKvKb0GpKc=;
        b=G8pWnTOCYB1SvVzfCkNcZBRAxlyURcJILtPioJJ61JagxCjFomAFQvRWpZpwUbPB
        OV0BENky2nJgHTnndqYE1J90jLnWDusfVk4thn5juiatTo7oMyKcb0Y8uktjKxbgUAS
        p6FRilZcrZn12d4VGlcBmHOITpyR1vkC83EVidJs=
Received: from [192.168.88.130] (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1574918267078361.23929737831827; Wed, 27 Nov 2019 21:17:47 -0800 (PST)
Subject: Re: [PATCH] MIPS: X1830: Add X1830 system type.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1574749075-99329-1-git-send-email-zhouyanjie@zoho.com>
 <1574749075-99329-2-git-send-email-zhouyanjie@zoho.com>
 <1574874984.3.2@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, fancer.lancer@gmail.com, syq@debian.org,
        yamada.masahiro@socionext.com, tglx@linutronix.de,
        malat@debian.org, jiaxun.yang@flygoat.com, sernia.zhou@foxmail.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DDF586A.2080605@zoho.com>
Date:   Thu, 28 Nov 2019 13:17:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1574874984.3.2@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8828=E6=97=A5 01:16, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le mar., nov. 26, 2019 at 14:17, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> Add X1830 system type for cat /proc/cpuinfo to give out X1830.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>  arch/mips/include/asm/bootinfo.h |  1 +
>>  arch/mips/include/asm/cpu.h      |  5 ++--
>>  arch/mips/jz4740/setup.c         |  4 +++
>>  arch/mips/kernel/cpu-probe.c     | 65=20
>> ++++++++++++++++++++++------------------
>>  4 files changed, 44 insertions(+), 31 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/bootinfo.h=20
>> b/arch/mips/include/asm/bootinfo.h
>> index 34d6222..07f4cfe 100644
>> --- a/arch/mips/include/asm/bootinfo.h
>> +++ b/arch/mips/include/asm/bootinfo.h
>> @@ -82,6 +82,7 @@ enum loongson_machine_type {
>>  #define  MACH_INGENIC_JZ4770    2    /* JZ4770 SOC        */
>>  #define  MACH_INGENIC_JZ4780    3    /* JZ4780 SOC        */
>>  #define  MACH_INGENIC_X1000        4    /* X1000 SOC        */
>> +#define  MACH_INGENIC_X1830        5    /* X1830 SOC        */
>>
>>  extern char *system_type;
>>  const char *get_system_type(void);
>> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
>> index 7fddcb8..fa7c1e8 100644
>> --- a/arch/mips/include/asm/cpu.h
>> +++ b/arch/mips/include/asm/cpu.h
>> @@ -46,7 +46,7 @@
>>  #define PRID_COMP_NETLOGIC    0x0c0000
>>  #define PRID_COMP_CAVIUM    0x0d0000
>>  #define PRID_COMP_LOONGSON    0x140000
>> -#define PRID_COMP_INGENIC_D0    0xd00000    /* JZ4740, JZ4750 */
>> +#define PRID_COMP_INGENIC_D0    0xd00000    /* JZ4740, JZ4750, X1830 */
>>  #define PRID_COMP_INGENIC_D1    0xd10000    /* JZ4770, JZ4775, X1000 */
>>  #define PRID_COMP_INGENIC_E1    0xe10000    /* JZ4780 */
>>
>> @@ -183,7 +183,8 @@
>>   * These are the PRID's for when 23:16 =3D=3D PRID_COMP_INGENIC_*
>>   */
>>
>> -#define PRID_IMP_XBURST           0x0200
>> +#define PRID_IMP_XBURST_REV1    0x0200    /* XBurst with MXU SIMD=20
>> ISA        */
>> +#define PRID_IMP_XBURST_REV2    0x0100    /* XBurst with MXU2 SIMD=20
>> ISA    */
>>
>>  /*
>>   * These are the PRID's for when 23:16 =3D=3D PRID_COMP_NETLOGIC
>> diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
>> index dc8ee21..880c268 100644
>> --- a/arch/mips/jz4740/setup.c
>> +++ b/arch/mips/jz4740/setup.c
>> @@ -44,6 +44,8 @@ static void __init jz4740_detect_mem(void)
>>
>>  static unsigned long __init get_board_mach_type(const void *fdt)
>>  {
>> +    if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1830"))
>> +        return MACH_INGENIC_X1830;
>>      if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1000"))
>>          return MACH_INGENIC_X1000;
>>      if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4780"))
>> @@ -86,6 +88,8 @@ void __init device_tree_init(void)
>>  const char *get_system_type(void)
>>  {
>>      switch (mips_machtype) {
>> +    case MACH_INGENIC_X1830:
>> +        return "X1830";
>>      case MACH_INGENIC_X1000:
>>          return "X1000";
>>      case MACH_INGENIC_JZ4780:
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index 8abadfe..94b3cc5 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -1948,10 +1948,8 @@ static inline void cpu_probe_ingenic(struct=20
>> cpuinfo_mips *c, unsigned int cpu)
>>      BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
>>
>>      switch (c->processor_id & PRID_IMP_MASK) {
>> -    case PRID_IMP_XBURST:
>> -        c->cputype =3D CPU_XBURST;
>> -        c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>> -        __cpu_name[cpu] =3D "Ingenic JZRISC";
>> +    case PRID_IMP_XBURST_REV1:
>> +
>>          /*
>>           * The XBurst core by default attempts to avoid branch target
>>           * buffer lookups by detecting & special casing loops. This
>> @@ -1959,34 +1957,43 @@ static inline void cpu_probe_ingenic(struct=20
>> cpuinfo_mips *c, unsigned int cpu)
>>           * Set cp0 config7 bit 4 to disable this feature.
>>           */
>>          set_c0_config7(MIPS_CONF7_BTB_LOOP_EN);
>> -        break;
>> -    default:
>> -        panic("Unknown Ingenic Processor ID!");
>> -        break;
>> -    }
>>
>> -    switch (c->processor_id & PRID_COMP_MASK) {
>> -    /*
>> -     * The config0 register in the XBurst CPUs with a processor ID of
>> -     * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb mode, this
>> -     * mode is not compatible with the MIPS standard, it will cause
>> -     * tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
>> -     * when starting the init process. After chip reset, the default
>> -     * is HPTLB mode, Write 0xa9000000 to cp0 register 5 sel 4 to
>> -     * switch back to VTLB mode to prevent getting stuck.
>> -     */
>> -    case PRID_COMP_INGENIC_D1:
>> -        write_c0_page_ctrl(XBURST_PAGECTRL_HPTLB_DIS);
>> -        break;
>> -    /*
>> -     * The config0 register in the XBurst CPUs with a processor ID of
>> -     * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
>> -     * but they don't actually support this ISA.
>> -     */
>> -    case PRID_COMP_INGENIC_D0:
>> -        c->isa_level &=3D ~MIPS_CPU_ISA_M32R2;
>> +        switch (c->processor_id & PRID_COMP_MASK) {
>> +
>> +        /*
>> +         * The config0 register in the XBurst CPUs with a processor=20
>> ID of
>> +         * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2=20
>> compatible,
>> +         * but they don't actually support this ISA.
>> +         */
>> +        case PRID_COMP_INGENIC_D0:
>> +            c->isa_level &=3D ~MIPS_CPU_ISA_M32R2;
>> +            break;
>> +
>> +        /*
>> +         * The config0 register in the XBurst CPUs with a processor=20
>> ID of
>> +         * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb mode,=20
>> this
>> +         * mode is not compatible with the MIPS standard, it will cause
>> +         * tlbmiss and into an infinite loop (line 21 in the=20
>> tlb-funcs.S)
>> +         * when starting the init process. After chip reset, the=20
>> default
>> +         * is HPTLB mode, Write 0xa9000000 to cp0 register 5 sel 4 to
>> +         * switch back to VTLB mode to prevent getting stuck.
>> +         */
>> +        case PRID_COMP_INGENIC_D1:
>> +            write_c0_page_ctrl(XBURST_PAGECTRL_HPTLB_DIS);
>> +            break;
>> +
>> +        default:
>> +            break;
>> +        }
>
> I see no "break" here. If that's intended, please add a /*=20
> fall-through */ comment here. It will prevent GCC from issuing a=20
> warning when -Wimplicit-fallthrough is used.
>

Sure, I will add it in v2.

>> +
>> +    case PRID_IMP_XBURST_REV2:
>> +        c->cputype =3D CPU_XBURST;
>> +        c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>> +        __cpu_name[cpu] =3D "Ingenic XBurst";
>
> The CPU name switched from "Ingenic JZRISC" to "Ingenic XBurst". If=20
> that's intended (I believe it is) please mention it in the commit=20
> message.
>

Ok, I will mention it in the commit message when I send v2.

Thanks and best regards!

> Cheers,
> -Paul
>
>>          break;
>> +
>>      default:
>> +        panic("Unknown Ingenic Processor ID!");
>>          break;
>>      }
>>  }
>> --=20
>> 2.7.4
>>
>>
>
>



