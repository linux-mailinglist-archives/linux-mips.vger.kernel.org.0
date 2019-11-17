Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96786FF94C
	for <lists+linux-mips@lfdr.de>; Sun, 17 Nov 2019 12:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfKQLtm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Nov 2019 06:49:42 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:38156 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfKQLtm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 Nov 2019 06:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1573991379; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bpOPdwdclOQJndI4A9z8Lf5rv9wEQQ9QPF87PUX4glg=;
        b=hZrXlDN0aHp+mXHWmsSavxf9AB0qKQe0F7M/42X0+/j+mjOzZs9yqcu/mmzv9A08JTeba+
        oGvU9gsJjo8Qr57rOLhgmEgOm/iEecfIjwUNRS10sIapRfUUiuuD6czSWG8r6nVwTz5SpH
        VzqUS7EdiPFdG84AJLovFvOyFgPgsv8=
Date:   Sun, 17 Nov 2019 12:49:30 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] MIPS: Ingenic: Disable abandoned HPTLB function.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        jhogan@kernel.org, gregkh@linuxfoundation.org,
        paul.burton@mips.com, chenhc@lemote.com, tglx@linutronix.de,
        jiaxun.yang@flygoat.com
Message-Id: <1573991370.3.0@crapouillou.net>
In-Reply-To: <5DCFCB41.3090807@zoho.com>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
        <1571909341-10108-3-git-send-email-zhouyanjie@zoho.com>
        <20191115213716.wt4wn2moj3fup4dc@lantea.localdomain>
        <5DCFCB41.3090807@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le sam., nov. 16, 2019 at 18:11, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=C3=A9crit :
> Hi Paul,
>=20
> On 2019=E5=B9=B411=E6=9C=8816=E6=97=A5 05:37, Paul Burton wrote:
>> Hi Zhou,
>>=20
>> On Thu, Oct 24, 2019 at 05:29:01PM +0800, Zhou Yanjie wrote:
>>> JZ4760/JZ4770/JZ4775/X1000/X1500 has an abandoned huge page
>>> tlb, write 0xa9000000 to cp0 config5 sel4 to disable this
>>> function to prevent getting stuck.
>> Can you describe how we "get stuck"?
>=20
> When the kernel is started, it will be stuck in the "Run /init as=20
> init process"
> according to the log information. After using the debug probe, it is=20
> found
> that tlbmiss occurred when the run init was started, and entered the=20
> infinite
> loop in the "tlb-funcs.S".
>=20
>> What actually goes wrong on the
>> affected CPUs? Do they misinterpret EntryLo values? Which bits do=20
>> they
>> misinterpret?
>=20
> According to Ingenic's explanation, this is because the=20
> JZ4760/JZ4770/JZ4775/X1000
> use the same core (both belong to PRID_COMP_INGENIC_D1). This core is=20
> not fully
> implemented in VTLB at design time, but only implements the 4K page=20
> mode.

Actually hugepages work fine on all Ingenic SoCs I tested with, from=20
JZ4740 upwards, with the VTLB, so this is incorrect.


> Support for larger pages was implemented by a component called HPTLB=20
> that
> they designed themselves, but this component was later discarded, so=20
> write
> 0xa9000000 to cp0 register5 sel4 to turn off HPTLB mode and return to=20
> VTLB
> mode. The actual test also shows that the kernel will no longer be=20
> stuck in
> the "Run / init as init process" after shutting down the HPTLB mode,=20
> and can
> boot to the shell normally.

That's good info, please consider adding that in the comment and in the=20
commit message, and maybe also change the last sentence to reflect=20
what's actually going on with the infinite loop after the tlbmiss.

Cheers,
-Paul


>=20
>>=20
>>> Confirmed by Ingenic,
>>> this operation will not adversely affect processors
>>> without HPTLB function.
>>>=20
>>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>>> ---
>>>   arch/mips/kernel/cpu-probe.c | 16 ++++++++++++++--
>>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/arch/mips/kernel/cpu-probe.c=20
>>> b/arch/mips/kernel/cpu-probe.c
>>> index 16033a4..cfebf8c 100644
>>> --- a/arch/mips/kernel/cpu-probe.c
>>> +++ b/arch/mips/kernel/cpu-probe.c
>>> @@ -1966,11 +1966,23 @@ static inline void cpu_probe_ingenic(struct=20
>>> cpuinfo_mips *c, unsigned int cpu)
>>>   	}
>>>   =7F=7F  	/*
>>> -	 * The config0 register in the Xburst CPUs with a processor ID of
>>> +	 * The config0 register in the XBurst CPUs with a processor ID of
>>> +	 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb, write
>>> +	 * 0xa9000000 to cp0 config5 sel4 to disable this function to
>> Saying "config5" suggests $16 sel 5 to me - Config5 is after all an
>> architecturally defined register & it's not this one. It'd be better=20
>> to
>> say "cop0 register 5 sel 4".
>=20
> Sure, I'll change it in v2.
>=20
>>> +	 * prevent getting stuck.
>>> +	 */
>>> +	if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGENIC_D1) {
>>> +		__asm__ (
>>> +			"li    $2, 0xa9000000 \n\t"
>>> +			"mtc0  $2, $5, 4      \n\t"
>>> +			"nop                  \n\t"
>>> +			::"r"(2));
>> I'd prefer that you add #defines to asm/mipsregs.h to provide a
>> write_c0_X() function where X is replaced with whatever the name of=20
>> this
>> register is, and preferably also #define macros describing the fields
>> present in the register. Writing a magic number isn't ideal.
>=20
> Sure, I'll change it in v2.
>=20
>>> +	/*
>>> +	 * The config0 register in the XBurst CPUs with a processor ID of
>>>   	 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
>>>   	 * but they don't actually support this ISA.
>>>   	 */
>>> -	if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGENIC_D0)
>>> +	} else if ((c->processor_id & PRID_COMP_MASK) =3D=3D=20
>>> PRID_COMP_INGENIC_D0)
>> It might be cleaner to use a switch statement rather than writing out
>> the & PRID_COMP_MASK condition twice?
>=20
> Sure, I'll change it in v2.
>=20
> Thanks and best regards!
>=20
>>=20
>> Thanks,
>>      Paul
>=20
>=20
>=20

=

