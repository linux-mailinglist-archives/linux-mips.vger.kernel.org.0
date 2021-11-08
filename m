Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D199447DD3
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 11:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236661AbhKHKYU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 8 Nov 2021 05:24:20 -0500
Received: from aposti.net ([89.234.176.197]:49988 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239244AbhKHKYD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Nov 2021 05:24:03 -0500
Date:   Mon, 08 Nov 2021 10:21:08 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC] MIPS: fix generic zboot support
To:     YunQiang Su <yunqiang.su@cipunited.com>
Cc:     tsbogend@alpha.franken.de, zhouyanjie@wanyeetech.com,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Message-Id: <8R092R.UUI0DN154MP31@crapouillou.net>
In-Reply-To: <2JZ82R.JILSE46R0P2T1@crapouillou.net>
References: <20211105135232.2128420-1-yunqiang.su@cipunited.com>
        <2JZ82R.JILSE46R0P2T1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi again,

Le lun., nov. 8 2021 at 09:54:38 +0000, Paul Cercueil 
<paul@crapouillou.net> a écrit :
> Hi,
> 
> Le ven., nov. 5 2021 at 09:52:32 -0400, YunQiang Su 
> <yunqiang.su@cipunited.com> a écrit :
>> There are 2 problems here:
>> 1. setting zload-y to 0xffffffff81000000 breaks booting on qemu -M 
>> boston.
>>    Why it is set here? Any other platform needs this value?
> 
> Is there another place where it should be set?
> 
> With this patch applied, kernels won't boot anymore on Ingenic boards.

Nevermind - it works, I just needed to adapt my tooling.

However, I think there should still be an option to have a fixed zload 
address, for the case where you want a vmlinuz.bin.

Cheers,
-Paul

>> 2. vmlinux.gz.itb should be appended to all-$(CONFIG_MIPS_GENERIC) 
>> instead
>>    of replacing. Otherwise, no vmlinuz will be built.
> 
> I build vmlinuz all the time, and never needed this patch.
> 
> Cheers,
> -Paul
> 
>> ---
>>  arch/mips/generic/Platform | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
>> index e1abc113b409..0c03623f3897 100644
>> --- a/arch/mips/generic/Platform
>> +++ b/arch/mips/generic/Platform
>> @@ -13,8 +13,7 @@ cflags-$(CONFIG_MACH_INGENIC_SOC)	+= 
>> -I$(srctree)/arch/mips/include/asm/mach-ing
>>  cflags-$(CONFIG_MIPS_GENERIC)	+= 
>> -I$(srctree)/arch/mips/include/asm/mach-generic
>> 
>>  load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
>> -zload-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff81000000
>> -all-$(CONFIG_MIPS_GENERIC)	:= vmlinux.gz.itb
>> +all-$(CONFIG_MIPS_GENERIC)	+= vmlinux.gz.itb
>> 
>>  its-y					:= vmlinux.its.S
>>  its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= board-boston.its.S
>> --
>> 2.30.2
>> 
> 


