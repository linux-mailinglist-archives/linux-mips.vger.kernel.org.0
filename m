Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49CD23AB75
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 19:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgHCRRF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 13:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgHCRRF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Aug 2020 13:17:05 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19904C06174A;
        Mon,  3 Aug 2020 10:17:05 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 9so270053wmj.5;
        Mon, 03 Aug 2020 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6V/SvPSvcydXl8vov4q/FEf8a3anRu2OXMNMMPVyZMI=;
        b=R0NZy6RvyWdSCMisKC3VJKNbXfy8Esv/ZJQbeJ2cuUW6hIc+wt65Pijg3uaiWXwi6c
         lufrTuTtF3jCUv6LED8TgfEkCyObIv9cWwgmZk231R0XVj9igN119wBoeLovX0HAg8Bc
         zeQFXkW7W2R0XE5iNnlJpmre+xiYIxXj/MQq4A9x3BLH7O5FJ9PW0B7btEdzQ+TboDR0
         /rIjVFzwBwbX7Con7q8HaFO96WyuF1YTA1RjG/f6ixqF58aroINubnbAGGtgFZ+P7LZr
         ivvbdy+GqfD1PE6K3VBXrJpkKR10o6ncb/nd/9VKzoZ3YXDoPgwBkUGYUAjY5okpB8Gb
         /9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6V/SvPSvcydXl8vov4q/FEf8a3anRu2OXMNMMPVyZMI=;
        b=Xh1RdzGlIwLrkk1Z3GDHvp/Djo8AboaIA7i7ZKR9/oUNKPghWSgChXgu2naW4En+7k
         Tcy4onqyZwXOyPXuMDhUfJtFq6uHg4hCTrQnxunLE8p36SFoW1YO1gPshiE/JQh0qrcC
         GNv2l1b8M+ukFpOZqTIOBtgChkY/XeKI0Wk7Iuq5vR+2oYQpOw8lRRRWcC1tlK9FmNlL
         RvHnFQLMKI0sjY6x4/FRZWg7YHIc6Oxq8i5YL0Q/F8WxzTTIZKVGFd/S3Nf6OwE0R9Ms
         TmqeMB/nD1UIUXrLStGyx5ZDVDey5SFdp046zxp/5HnZ05hO/nmEXRncsfagKDzYU3+/
         6+Kw==
X-Gm-Message-State: AOAM531xh5NI5Fg+M0ldSwKOnkDpZaW3NzLh8OvvYDpa0U1T5/kGGIng
        Vk5urXo469fETPx+MFSj5WBPEED7
X-Google-Smtp-Source: ABdhPJwgofQRPJKD/LVWdkbG55ngDJlBIBRd24sFtdJziWvFeBHsvJqB1R8cBpfZafZbsljU5TrGaw==
X-Received: by 2002:a1c:6002:: with SMTP id u2mr240003wmb.170.1596475023501;
        Mon, 03 Aug 2020 10:17:03 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f131sm378221wme.40.2020.08.03.10.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 10:17:02 -0700 (PDT)
Subject: Re: [PATCH] MIPS: BMIPS: Disable pref 30 for buggy CPUs
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@linux-mips.org,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200731042401.22871-1-f.fainelli@gmail.com>
 <21ad5472-1287-acba-5604-09f2e633c043@flygoat.com>
 <46de49ec-cc8b-708a-0cdd-82389b041078@gmail.com>
 <20200803113020.GA8958@alpha.franken.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <bcd3255c-bbb0-f4c0-1a33-7a16ee9f7b93@gmail.com>
Date:   Mon, 3 Aug 2020 10:16:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803113020.GA8958@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/3/2020 4:30 AM, Thomas Bogendoerfer wrote:
> On Fri, Jul 31, 2020 at 03:49:28PM -0700, Florian Fainelli wrote:
>> On 7/31/20 3:34 AM, Jiaxun Yang wrote:
>>>
>>>
>>> 在 2020/7/31 下午12:24, Florian Fainelli 写道:
>>>> Disable pref 30 by utilizing the standard quirk method and matching the
>>>> affected SoCs: 7344, 7346, 7425.
>>>>
>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>> ---
>>>>   arch/mips/bmips/setup.c | 17 +++++++++++++++++
>>>>   1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
>>>> index 19308df5f577..df0efea12611 100644
>>>> --- a/arch/mips/bmips/setup.c
>>>> +++ b/arch/mips/bmips/setup.c
>>>> @@ -110,6 +110,20 @@ static void bcm6368_quirks(void)
>>>>       bcm63xx_fixup_cpu1();
>>>>   }
>>>>   +static void bmips5000_pref30_quirk(void)
>>>> +{
>>>> +    __asm__ __volatile__(
>>>> +    "    li    $8, 0x5a455048\n"
>>>> +    "    .word    0x4088b00f\n"    /* mtc0 $8, $22, 15 */
>>>> +    "    nop; nop; nop\n"
>>>> +    "    .word    0x4008b008\n"    /* mfc0 $8, $22, 8 */
>>>> +    /* disable "pref 30" on buggy CPUs */
>>>> +    "    lui    $9, 0x0800\n"
>>>> +    "    or    $8, $9\n"
>>>> +    "    .word    0x4088b008\n"    /* mtc0 $8, $22, 8 */
>>>> +    : : : "$8", "$9");
>>>> +}
>>> Hi,
>>>
>>> Is there any toolchain issue blocking read_c0_**** family helpers being
>>> used?
>>>
>>> Use .word looks unreasonable.
>>
>> Yes, the assembler would be choking on the custom $22 selector, however
> 
> I guess you meant selector 8 and 15. If BMIPS has a 4 bit selector field
> it might be good to do a binutils patch supporting it.

Yes, sorry that is what I meant. I don't think an assembler patch makes
sense at this point given this is an isolated use, and there is not just
binutils these days, the Clang/LLVM integrated assembler would also need
to be supported, and then we would need to have the kernel say: I
require this minimum version to support the customer selectors, not
worth the trouble if you ask me.

> 
>> this patch should not be necessary given that the boot loader (CFE)
>> should have long been updated by now to disable pref 30.
> 
> so, should I add it or drop it ?

You can drop it and I would resubmit it with feedback addressed if this
later comes back.
-- 
Florian
