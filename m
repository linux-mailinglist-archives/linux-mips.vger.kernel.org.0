Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE6A354309
	for <lists+linux-mips@lfdr.de>; Mon,  5 Apr 2021 16:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbhDEO4k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Apr 2021 10:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235835AbhDEO4k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Apr 2021 10:56:40 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7164EC061756;
        Mon,  5 Apr 2021 07:56:34 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso11612749otq.3;
        Mon, 05 Apr 2021 07:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RRzPgjkJmWBByc4aA0l16Ys7DZ8rcO+4tzLBX0V3Xow=;
        b=j0Jsu2LZ8WGKsD/2X/ZbI7Oc/Eal1+/eEixQCrxzrai01n+0gta0kZDh6HfwvO3/eS
         C1l8f/AnlzFk7Y1nQfE043KeTlCIwfAFfhTzRWmEmSaiTnplpFBYNkg0Y9a0nYxpQTDB
         EErMx5ef9aCDBo22dYjVlfmIcYHegKtzvMBdGwcQbyqXs2Dnc7ghQGiLAE3PPgR7Ru93
         5HEy3CEIOc/bjHexCpvJABG/uMSDsjnuUEEno1OTc/eROG+QYowTYhzvvqKu+zgnIp4r
         9C2lJUJEcqmvsv5PzmgHhnoRZxmEjv94WOXYLeg++L1AiY8lTsLxpiPyZEQLWNR6X2UH
         BPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RRzPgjkJmWBByc4aA0l16Ys7DZ8rcO+4tzLBX0V3Xow=;
        b=e9ADrIpFAF3DGFWzS8FlJMI1IS7WD7HwVs8hQ7LgSRCBk6TA/21RemMy652oYAIgqE
         x0nVnt2p7DGUK2GP6aOkquZk8/mZ5h9twg5XpAUFWwrHh3IcHJ3QRqidpEx1/NpT3jHL
         gmaBlpnRmI4u9O7k/KRG+rzarlV/JMsgN9b7B+hlJqL/JLM/MrnY+Qa5oZ9ub3OmDxqy
         B4WWd8jT2UL2lVnBzUDRNe2ZHLqf5dH3NXSjurLyjvekIr11J142vFwKUewVu7PPwSIL
         IdhhSwh87rAwUzl3h0F/fJSbcatrwS099Cu36OMXMiLjE0vpCJEbxP3p4qzoRcl/b1sj
         Fd8w==
X-Gm-Message-State: AOAM532ormDW6n55mzekSQMUMAWnyqT34otixr5n8qGomRhN5h28tBj7
        Gm67+xFbmQMfzuk34pBbQmufpASQdMc=
X-Google-Smtp-Source: ABdhPJzMHRvViA4ZFCYBPdkpC+th3/iP/N5B+PMJ1/9+hZDZOSObln8WQ6yPwTT9ItIzkRVqdHYkGQ==
X-Received: by 2002:a9d:68c1:: with SMTP id i1mr22929319oto.169.1617634593464;
        Mon, 05 Apr 2021 07:56:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p64sm3132172oib.57.2021.04.05.07.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 07:56:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 11/13] kconfig: do not use allnoconfig_y option
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Terrell <terrelln@fb.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org
References: <20210313194836.372585-1-masahiroy@kernel.org>
 <20210313194836.372585-11-masahiroy@kernel.org>
 <20210331171238.GA141362@roeck-us.net>
 <CAKwvOdmNUMJTjyc7hAhNRzmWmRQa5TCayTSpwiiVnO4HH-YTOQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1e4295c5-9008-e161-c74e-19a317a562b4@roeck-us.net>
Date:   Mon, 5 Apr 2021 07:56:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmNUMJTjyc7hAhNRzmWmRQa5TCayTSpwiiVnO4HH-YTOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/31/21 11:25 AM, Nick Desaulniers wrote:
> On Wed, Mar 31, 2021 at 10:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Sun, Mar 14, 2021 at 04:48:34AM +0900, Masahiro Yamada wrote:
>>> allnoconfig_y is a bad hack that sets a symbol to 'y' by allnoconfig.
>>>
>>> allnoconfig does not mean a minimum set of CONFIG options because a
>>> bunch of prompts are hidden by 'if EMBEDDED' or 'if EXPERT', but I do
>>> not like to do a workaround this way.
>>>
>>> Use the pre-existing feature, KCONFIG_ALLCONFIG, to provide a one
>>> liner config fragment. CONFIG_EMBEDDED=y is still forced under
>>> allnoconfig.
>>>
>>> No change in the .config file produced by 'make tinyconfig'.
>>>
>>> The output of 'make allnoconfig' will be changed; we will get
>>> CONFIG_EMBEDDED=n because allnoconfig literally sets all symbols to n.
>>>
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>
>> With this patch in place, mips:allnoconfig fails to build with
>> the following error.
>>
>> Error log:
>> WARNING: modpost: vmlinux.o(.text+0x9c70): Section mismatch in reference from the function reserve_exception_space() to the function .meminit.text:memblock_reserve()
>> The function reserve_exception_space() references
>> the function __meminit memblock_reserve().
>> This is often because reserve_exception_space lacks a __meminit
>> annotation or the annotation of memblock_reserve is wrong.
>> ERROR: modpost: Section mismatches detected.
>> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
>> make[2]: *** [scripts/Makefile.modpost:62: vmlinux.symvers] Error 1
>> make[2]: *** Deleting file 'vmlinux.symvers'
>> make[1]: *** [Makefile:1292: vmlinux] Error 2
>> make: *** [Makefile:222: __sub-make] Error 2
> 
> Thanks for the report. I suspect this is related to allnoconfig
> disabling CONFIG_ARCH_KEEP_MEMBLOCK, which changes the definition of
> __init_memblock in include/linux/memblock.h.
> 
> So allnoconfig would unselect CONFIG_ARCH_KEEP_MEMBLOCK, making
> __init_memblock equivalent to __meminit triggering the above warning.
> 
> arch/mips/Kconfig
> 14:     select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL
> 
> so DEBUG_KERNEL is probably also disabled by allnoconfig.
> 
> commit a8c0f1c634507 ("MIPS: Select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL
> to enable sysfs memblock debug")
> 
> probably should drop the `if DEBUG_KERNEL` part.
> 

Agreed.

Guenter

>>
>> Guenter
>>
>>> ---
>>>
>>>  init/Kconfig                    | 1 -
>>>  kernel/configs/tiny-base.config | 1 +
>>>  scripts/kconfig/Makefile        | 3 ++-
>>>  3 files changed, 3 insertions(+), 2 deletions(-)
>>>  create mode 100644 kernel/configs/tiny-base.config
>>>
>>> diff --git a/init/Kconfig b/init/Kconfig
>>> index 46b87ad73f6a..beb8314fdf96 100644
>>> --- a/init/Kconfig
>>> +++ b/init/Kconfig
>>> @@ -1769,7 +1769,6 @@ config DEBUG_RSEQ
>>>
>>>  config EMBEDDED
>>>       bool "Embedded system"
>>> -     option allnoconfig_y
>>>       select EXPERT
>>>       help
>>>         This option should be enabled if compiling the kernel for
>>> diff --git a/kernel/configs/tiny-base.config b/kernel/configs/tiny-base.config
>>> new file mode 100644
>>> index 000000000000..2f0e6bf6db2c
>>> --- /dev/null
>>> +++ b/kernel/configs/tiny-base.config
>>> @@ -0,0 +1 @@
>>> +CONFIG_EMBEDDED=y
>>> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
>>> index 7df3c0e4c52e..46f2465177f0 100644
>>> --- a/scripts/kconfig/Makefile
>>> +++ b/scripts/kconfig/Makefile
>>> @@ -102,7 +102,8 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
>>>
>>>  PHONY += tinyconfig
>>>  tinyconfig:
>>> -     $(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
>>> +     $(Q)KCONFIG_ALLCONFIG=kernel/configs/tiny-base.config $(MAKE) -f $(srctree)/Makefile allnoconfig
>>> +     $(Q)$(MAKE) -f $(srctree)/Makefile tiny.config
>>>
>>>  # CHECK: -o cache_dir=<path> working?
>>>  PHONY += testconfig
>>> --
>>> 2.27.0
>>>
> 
> 
> 

