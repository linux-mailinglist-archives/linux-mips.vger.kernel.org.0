Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25971C339C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 14:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731291AbfJAMA4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 08:00:56 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:55205 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726131AbfJAMA4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Oct 2019 08:00:56 -0400
Received: from mxback23o.mail.yandex.net (mxback23o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::74])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id C7871F21182;
        Tue,  1 Oct 2019 15:00:51 +0300 (MSK)
Received: from sas2-b0ca3cd64eaa.qloud-c.yandex.net (sas2-b0ca3cd64eaa.qloud-c.yandex.net [2a02:6b8:c14:718c:0:640:b0ca:3cd6])
        by mxback23o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 1N2e8GAzMn-0orauqwk;
        Tue, 01 Oct 2019 15:00:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1569931251;
        bh=CFjTu00A06m+sp8vEvai0/UZaJ9/+yfU/cO5F4YlOG8=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=lqmgMNyIark8SWsubs29lk1z8Uud94r7wmk93hAJ95bXL8lh07FKKf2dL9h+zMTs0
         v9hCQBy/eosp8YfxtRcDSi8fSK1ROcG7jj4vC8PH03nJDY4exYNapy/DBLhwiDfY6v
         XoJLIxCrp50emFXVRN5MalAdfx1Yem4hW+0BxNj4=
Authentication-Results: mxback23o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas2-b0ca3cd64eaa.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id IXAnvLjvZC-0mIeI0Af;
        Tue, 01 Oct 2019 15:00:49 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH] MIPS: cpu-bugs64: Mark inline functions as
 __always_inline
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <20190927053339.11866-1-jiaxun.yang@flygoat.com>
 <20190930223452.ouznftjxryfp5zux@pburton-laptop>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <27d1e488-12c1-94c2-4910-b923fc1ca7e9@flygoat.com>
Date:   Tue, 1 Oct 2019 20:00:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930223452.ouznftjxryfp5zux@pburton-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2019/10/1 上午6:34, Paul Burton wrote:
> Hi Jiaxun,
> 
> On Fri, Sep 27, 2019 at 01:33:39PM +0800, Jiaxun Yang wrote:
>> Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING forcibly")
>> allows compiler to uninline functions marked as 'inline'. Leading to section
>> mismatch in this case.
>>
>> Since we're using const variables to pass assembly flags, 'inline's can't
>> be dropped. So we simply mark them as __always_inline.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Cc: Paul Burton <paul.burton@mips.com>
>> Cc: linux-mips@vger.kernel.org
>> ---
>>   arch/mips/kernel/cpu-bugs64.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/mips/kernel/cpu-bugs64.c b/arch/mips/kernel/cpu-bugs64.c
>> index fa62cd1dff93..93d23232357c 100644
>> --- a/arch/mips/kernel/cpu-bugs64.c
>> +++ b/arch/mips/kernel/cpu-bugs64.c
>> @@ -24,7 +24,7 @@ static char r4kwar[] __initdata =
>>   static char daddiwar[] __initdata =
>>   	"Enable CPU_DADDI_WORKAROUNDS to rectify.";
>>   
>> -static inline void align_mod(const int align, const int mod)
>> +static __always_inline void align_mod(const int align, const int mod)
>>   {
>>   	asm volatile(
>>   		".set	push\n\t"
>> @@ -113,7 +113,7 @@ static __always_inline void mult_sh_align_mod(long *v1, long *v2, long *w,
>>   	*w = lw;
>>   }
>>   
>> -static inline void check_mult_sh(void)
>> +static __always_inline void check_mult_sh(void)
>>   {
>>   	long v1[8], v2[8], w[8];
>>   	int bug, fix, i;
> 
> So far so good, I see align_mod() uses arguments in inline asm &
> check_mult_sh() makes use of it (via mult_sh_align_mod() which is
> already __always_inline).
> 
> I'd prefer that we add the __init annotation too though, even if all
> it's doing is making it clear to human readers when this code can be
> used.
Hi Paul,

You're right.
> 
>> @@ -176,7 +176,7 @@ asmlinkage void __init do_daddi_ov(struct pt_regs *regs)
>>   	exception_exit(prev_state);
>>   }
>>   
>> -static inline void check_daddi(void)
>> +static __always_inline void check_daddi(void)
>>   {
>>   	extern asmlinkage void handle_daddi_ov(void);
>>   	unsigned long flags;
>> @@ -242,7 +242,7 @@ static inline void check_daddi(void)
>>   
>>   int daddiu_bug	= IS_ENABLED(CONFIG_CPU_MIPSR6) ? 0 : -1;
>>   
>> -static inline void check_daddiu(void)
>> +static __always_inline void check_daddiu(void)
>>   {
>>   	long v, w, tmp;
>>   
> 
> I'm not seeing a reason for always inlining check_daddi() or
> check_daddiu() though - neither one appears to use arguments as inline
> asm immediates, so I'd prefer that we just mark them with __init & let
> the compiler decide whether to inline.
> 
> Does that sound good to you?
LGTM. Should I send v2 or you just fix them at apply time?

Thanks.
--
Jiaxun
