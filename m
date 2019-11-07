Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17AF5F261A
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 04:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733035AbfKGDm3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 22:42:29 -0500
Received: from forward102o.mail.yandex.net ([37.140.190.182]:39227 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727751AbfKGDm3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 22:42:29 -0500
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id 7A82C6680889;
        Thu,  7 Nov 2019 06:42:21 +0300 (MSK)
Received: from mxback3q.mail.yandex.net (mxback3q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:4545:437c])
        by forward101q.mail.yandex.net (Yandex) with ESMTP id 755F5CF4000B;
        Thu,  7 Nov 2019 06:42:21 +0300 (MSK)
Received: from vla5-9cb0c276d29e.qloud-c.yandex.net (vla5-9cb0c276d29e.qloud-c.yandex.net [2a02:6b8:c18:3588:0:640:9cb0:c276])
        by mxback3q.mail.yandex.net (mxback/Yandex) with ESMTP id NJ5kpGfnQf-gKqKf0TQ;
        Thu, 07 Nov 2019 06:42:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1573098141;
        bh=89DxZYdoJS2mRJitgsWNrMjMG1hBmJ/PYku0FD0Gw3U=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=L0SUoRJDC619VHVANo4MqT1ocl46MgHyL2cTDaJbmqqSFpC1DfLUOspIRRakniuoB
         Bh5jsf2WVJKWIc4ue8Zre+ISdOrFtcrvu55L0l9idrHKKdL5zglm9p9SFcKdAgG8uz
         oJNAHHkv9LAXvlXVjYcCB4KW3hgN8MPis/TgPuQY=
Authentication-Results: mxback3q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla5-9cb0c276d29e.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id pSxcuexVFd-gIUaX98s;
        Thu, 07 Nov 2019 06:42:18 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Thu, 07 Nov 2019 11:42:07 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <7aa12639-b94e-e3db-647f-ec1d399fbffd@loongson.cn>
References: <1573056341-21159-1-git-send-email-yangtiezhu@loongson.cn> <480995AF-A678-479F-A3EA-11662474E600@flygoat.com> <7aa12639-b94e-e3db-647f-ec1d399fbffd@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Scan the DMI system information
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yinglu Yang <yangyinglu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <381B89FB-E922-456B-9417-EAF8E8BB6847@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B411=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:42:23, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>On 11/07/2019 08:35 AM, Jiaxun Yang wrote:
>>
>> =E4=BA=8E 2019=E5=B9=B411=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8812:05:41, Tiezhu Yang
><yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>>> Enable DMI scanning on the MIPS architecture, this setups DMI
>>> identifiers
>>> (dmi_system_id) for printing it out on task dumps and prepares DIMM
>>> entry
>>> information (dmi_memdev_info) from the SMBIOS table=2E With this
>patch,
>>> the
>>> driver can easily match various of mainboards=2E
>>>
>>> In the SMBIOS reference specification, the table anchor string
>"_SM_"
>>> is
>>> present in the address range 0xF0000 to 0xFFFFF on a 16-byte
>boundary,
>>> but there exists a special case for loongson platform, when call
>>> function
>>> dmi_early_remap, it should specify the start address to 0xFFFE000
>due
>>> to
>>> it is reserved for SMBIOS and can be normally access in the BIOS=2E
>>>
>>> Co-developed-by: Yinglu Yang <yangyinglu@loongson=2Ecn>
>>> Signed-off-by: Yinglu Yang <yangyinglu@loongson=2Ecn>
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>>> ---
>>> arch/mips/Kconfig           | 12 ++++++++++++
>>> arch/mips/include/asm/dmi=2Eh | 43
>>> +++++++++++++++++++++++++++++++++++++++++++
>>> arch/mips/kernel/setup=2Ec    |  2 ++
>>> 3 files changed, 57 insertions(+)
>>> create mode 100644 arch/mips/include/asm/dmi=2Eh
>>>
>>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>> index 7cb8947=2E=2E0a67b18 100644
>>> --- a/arch/mips/Kconfig
>>> +++ b/arch/mips/Kconfig
>>> @@ -2757,6 +2757,18 @@ config HW_PERF_EVENTS
>>> 	  Enable hardware performance counter support for perf events=2E If
>>> 	  disabled, perf events will use software events only=2E
>>>
>>> +# Mark as expert because too many people got it wrong=2E
>>> +# The code disables itself when not needed=2E
>>> +config DMI
>>> +	default y
>>> +	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
>>> +	bool "Enable DMI scanning" if EXPERT
>>> +	help
>>> +	  Enabled scanning of DMI to identify machine quirks=2E Say Y
>>> +	  here unless you have verified that your setup is not
>>> +	  affected by entries in the DMI blacklist=2E Required by PNP
>>> +	  BIOS code=2E
>>> +
>>> config SMP
>>> 	bool "Multi-Processing support"
>>> 	depends on SYS_SUPPORTS_SMP
>>> diff --git a/arch/mips/include/asm/dmi=2Eh
>b/arch/mips/include/asm/dmi=2Eh
>>> new file mode 100644
>>> index 0000000=2E=2E1f3da37
>>> --- /dev/null
>>> +++ b/arch/mips/include/asm/dmi=2Eh
>>> @@ -0,0 +1,43 @@
>>> +/* SPDX-License-Identifier: GPL-2=2E0 */
>>> +#ifndef _ASM_MIPS_DMI_H
>>> +#define _ASM_MIPS_DMI_H
>>> +
>>> +#define dmi_early_remap		mips_early_memremap
>>> +#define dmi_early_unmap		mips_early_memunmap
>>> +#define dmi_remap(_x, _l)	mips_memremap(_x, _l, MEMREMAP_WB)
>>> +#define dmi_unmap(_x)		mips_memunmap(_x)
>>> +
>>> +#define dmi_alloc(l)		memblock_alloc_low(l, PAGE_SIZE)
>>> +
>>> +void __init *mips_early_memremap(resource_size_t phys_addr,
>unsigned
>>> long size)
>>> +{
>>> +#if defined(CONFIG_MACH_LOONGSON64)
>>> +	if (phys_addr =3D=3D 0xF0000)
>>> +		phys_addr =3D 0xFFFE000;
>>> +
>>> +	return (void *)TO_CAC(phys_addr);
>>> +#else
>>> +	return NULL;
>>> +#endif
>>> +}
>> Hi Tiezhu,
>>
>> It is really tricky to hijack dmi address here during remap=2E
>> I think we should set the dmi table address at  dmi_scan=2Ec by a marco
>or something else rather than hijack it during remap=2E
>
>Hi Jiaxun,
>
>Thanks for your review=2E I agree with you, let me think about it and try
>to
>find a proper way, and then I will send a v2 patch=2E
>
>>
>> Btw: Probably we should set DMI default y when MACH_LOONGSON64 is
>set?
>
>CONFIG_DMI is set to y by default, I think there is no need to select=20
>DMI when
>set CONFIG_MACH_LOONGSON64=2E

Sorry, I meant only default to y when MACH_LOONGSON64 is set or even depen=
ds on MACH_LOONGSON64=2E As Loongson is the only known MIPS platform that s=
upports DMI=2E Default y unconditionally may lead to regression on other MI=
PS platforms=2E

>
>Thanks,
>
>Tiezhu Yang
>
>>
>> Thanks=2E
>>

--=20
Jiaxun Yang
