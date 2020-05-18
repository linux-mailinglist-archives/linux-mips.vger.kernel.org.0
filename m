Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58FE1D6F13
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 04:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgERCog (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 22:44:36 -0400
Received: from [115.28.160.31] ([115.28.160.31]:47424 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726680AbgERCog (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 22:44:36 -0400
Received: from hanazono.local (unknown [116.236.177.50])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 10826600B4;
        Mon, 18 May 2020 10:44:34 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1589769874; bh=1M4ZzKGiGH3FAlVo4yl3asYIfIGTFIcmE/xKPCnMBXk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IHMIUWXGZ6ZxmnZlGoIoVvK26rS6kLAZ+G9sgqDxgGZ9QDUZ/HYK7MLRNoX4Kknb/
         5mwpwHl097wGnPA2CnQZHj5S7Lw0d0M94GOBO37ORAqEXMdpjGySV8XwP+j41i0SKa
         UiEKz8FkNghA6/N5ewH4CGe3r9z4hk7wWpKhP2L4=
Subject: Re: [PATCH v2 RESEND 4/4] MIPS: emulate CPUCFG instruction on older
 Loongson64 cores
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20200503103304.40678-5-git@xen0n.name>
 <20200503105012.43246-1-git@xen0n.name>
 <20200517083754.GB3939@alpha.franken.de>
 <2982d83e-bcf2-2515-bcd2-b80bd1f20223@xen0n.name>
 <20200517151735.GA8048@alpha.franken.de>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <574fa5af-709d-1f52-af8e-7af815a4ab7e@xen0n.name>
Date:   Mon, 18 May 2020 10:44:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <20200517151735.GA8048@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020/5/17 23:17, Thomas Bogendoerfer wrote:

> On Sun, May 17, 2020 at 07:39:44PM +0800, WANG Xuerui wrote:
>> On 5/17/20 4:37 PM, Thomas Bogendoerfer wrote:
>>
>>> On Sun, May 03, 2020 at 06:50:13PM +0800, WANG Xuerui wrote:
>>>> +#endif
>>>> +
>>>> +#endif /* _ASM_MACH_LOONGSON64_CPUCFG_EMUL_H_ */
>>>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>>>> index ca2e6f1af4fe..907e31ff562f 100644
>>>> --- a/arch/mips/kernel/cpu-probe.c
>>>> +++ b/arch/mips/kernel/cpu-probe.c
>>>> @@ -28,6 +28,8 @@
>>>>   #include <asm/spram.h>
>>>>   #include <linux/uaccess.h>
>>>> +#include <asm/mach-loongson64/cpucfg-emul.h>
>>>> +
>>> this doesn't fly:
>>>
>>> In file included from /local/tbogendoerfer/korg/linux/arch/mips/kernel/cpu-probe.c:31:0:
>>> /local/tbogendoerfer/korg/linux/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h:7:27: fatal error: loongson_regs.h: No such file or directory
>>>   #include <loongson_regs.h>
>>>                             ^
>>> compilation terminated.
>>>
>>> Is there a chance to put this code in a loongsoon specific file ?
>> Oops... I'll rebase tonight to fix this. Might be caused by the build system
>> changes merged in the meantime.
> just to make it clear, the failing config is a RALINK config, but looking
> at the failure probaly everything but loongson64 fails.
Thanks for the clarification; I've found out the mistake last night. The 
include of loongson_regs.h needs to go inside the config guard to 
prevent inclusion on other platforms where the include path is not set 
up for it.
>> As for the logic separation, I'm 100% in agreement with this, but I don't
>> know of any way to invoke mach-specific bits from inside cpu-probe.
> implement your code in a new/fitting file, provide a header file,
> which has prototypes for this functions if CONFIG_xxx option is enabled
> or empty stubs, if not. Then call these functions from cpu-probe.c.

Sure. I'll move these into cpucfg-emul.c to minimize intrusion to 
cpu-probe.c.

I'll send v3 later today (in my timezone) after I go home.

And thanks for your instruction!

> Thomas.
>
