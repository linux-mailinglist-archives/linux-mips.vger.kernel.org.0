Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9141D67CC
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2020 13:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgEQLjr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 07:39:47 -0400
Received: from [115.28.160.31] ([115.28.160.31]:39332 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1727893AbgEQLjr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 07:39:47 -0400
Received: from [192.168.9.172] (unknown [112.65.48.201])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 14F90600B4;
        Sun, 17 May 2020 19:39:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1589715585; bh=n+Zve8bEo/RMuTVXcDHImN7lpvgw4xKbltvaIILp+oA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=uAHtiiPD6DyFztihS8mKASEQ0gbob7I0z+4SyjXMElRSzUMpUZx0HJLIr60Md/x04
         1sy5MTG7kge5BsytwvkC92YBLWqV9Fa7NHfRdAx6bymE7YrEIb1TxtrrxoqorzL7YK
         MUle23xOzfD8WbT3sHZBd+4aaHqvIVt4v6qjwcHQ=
Subject: Re: [PATCH v2 RESEND 4/4] MIPS: emulate CPUCFG instruction on older
 Loongson64 cores
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20200503103304.40678-5-git@xen0n.name>
 <20200503105012.43246-1-git@xen0n.name>
 <20200517083754.GB3939@alpha.franken.de>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <2982d83e-bcf2-2515-bcd2-b80bd1f20223@xen0n.name>
Date:   Sun, 17 May 2020 19:39:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <20200517083754.GB3939@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/17/20 4:37 PM, Thomas Bogendoerfer wrote:

> On Sun, May 03, 2020 at 06:50:13PM +0800, WANG Xuerui wrote:
>> +#endif
>> +
>> +#endif /* _ASM_MACH_LOONGSON64_CPUCFG_EMUL_H_ */
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index ca2e6f1af4fe..907e31ff562f 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -28,6 +28,8 @@
>>   #include <asm/spram.h>
>>   #include <linux/uaccess.h>
>>   
>> +#include <asm/mach-loongson64/cpucfg-emul.h>
>> +
> this doesn't fly:
>
> In file included from /local/tbogendoerfer/korg/linux/arch/mips/kernel/cpu-probe.c:31:0:
> /local/tbogendoerfer/korg/linux/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h:7:27: fatal error: loongson_regs.h: No such file or directory
>   #include <loongson_regs.h>
>                             ^
> compilation terminated.
>
> Is there a chance to put this code in a loongsoon specific file ?

Oops... I'll rebase tonight to fix this. Might be caused by the build 
system changes merged in the meantime.

As for the logic separation, I'm 100% in agreement with this, but I 
don't know of any way to invoke mach-specific bits from inside 
cpu-probe. Plus all the PRId matching logic have to be duplicated if the 
code is to be moved to the loongson64/ sub-directory. I didn't find any 
other platform that does this, so I just extended the probing code.

Other way is to treat the whole CPUCFG thing just like the r2-to-r6-emul 
thing, which means moving all the logic to kernel/ sub-directory. But 
I'd rather not do this, for reasons explained in the cover letter.

>
> Thomas.
>
