Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015D92B407E
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 11:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgKPKJh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 05:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgKPKJg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Nov 2020 05:09:36 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A332C0613CF;
        Mon, 16 Nov 2020 02:09:35 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id b17so19431929ljf.12;
        Mon, 16 Nov 2020 02:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NO89g4BA0KG8KF7MlOA7H/IfdZwmvAss5BStf1pQS/o=;
        b=fYaR5LtdamwUIqoJO6C9ch4AX4UGyszju5BzmspnWoNIny+BE/rV5P454OuE8Is7ng
         09gFpBqgPNgbFkm4eqdAO7qI0xKn7gilUCabMlBT8FumIwKikX265AhfwAOFGR3boBYA
         Fjm/pWYTM8neix4IvwypXJtWOtteJn9/AqRbnVR4mP6c1O/yBY0fxhYTc3fOZyUWexwX
         uJc1B7RDyGpkXbHolxohuIHkqijJQFxBNkTncShrJc+BTjBzQwuizdAFi4Mj3jK8TtVy
         wF/xMLUky0bHsDkTlIRpQXzYgKCelsV7YKEbkpqb77csL97V7PURu6+gAlJmIkkaeZdS
         3tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NO89g4BA0KG8KF7MlOA7H/IfdZwmvAss5BStf1pQS/o=;
        b=oFOT52bHTMntMLpC2Opl9hvHdRq0TeJS8kORhbkjrE263Gj417WU6VqcwMEtt4ziEq
         SfO+JfdQDBIZs+qnSf4LWjtHfUHvmDKx+2boXkIclkQMnsBismki6mcOT3iGmggq4eHQ
         Mq5BS6Q8iYM2JkW80zsgemxrv0or1s98DnSW8NI39Ok9j8Etd6bP33Ccn/I74aaRJ7zY
         D/PTtv1sV8aB6jElDLCfgV6thHH/h7sBbVa4I5gN52ht+dcxa/Z9Y5lwtQcFondMpOe0
         8GeUO7h0S1y7pWS8xkWR4WBiB2FhGS5uNKRK1fucEZbTMBPg/WC/PSWG5nTL3adyqXjp
         cLOg==
X-Gm-Message-State: AOAM530yjeZVoCYBZ7SzhfsyZnt+7fMaDYXNf/2ofe6Y6wiL+8aSWd4z
        W6qUj93rlLXrdYxk0Q+LPxp93sAd7hI=
X-Google-Smtp-Source: ABdhPJzQCplPGpy3jqXYfqLuh7s6Ncu4anheXxybwgKLJccqcf8x5DW1lkm3It8h7/4MpgOt4jdmfQ==
X-Received: by 2002:a2e:993:: with SMTP id 141mr5588657ljj.300.1605521373606;
        Mon, 16 Nov 2020 02:09:33 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:2fb:950d:1831:3fc8:8cb7:2cac? ([2a00:1fa0:2fb:950d:1831:3fc8:8cb7:2cac])
        by smtp.gmail.com with ESMTPSA id w10sm2672051ljm.56.2020.11.16.02.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 02:09:33 -0800 (PST)
Subject: Re: [RFC PATCH] MIPS: Kconfig: Select ARCH_WANT_FRAME_POINTERS
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1605502980-31946-1-git-send-email-yangtiezhu@loongson.cn>
 <62ea9838-70ce-ca73-7dae-e94620956ab5@gmail.com>
 <aa8b9e92-8851-60d2-32d1-cec99be1af57@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <9b6318d8-1112-d271-b775-209ccc526fcf@gmail.com>
Date:   Mon, 16 Nov 2020 13:09:28 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <aa8b9e92-8851-60d2-32d1-cec99be1af57@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16.11.2020 12:47, Tiezhu Yang wrote:

[...]
>>> Select ARCH_WANT_FRAME_POINTERS to fix the following build error under
>>> CONFIG_DEBUG_ATOMIC_SLEEP:
>>>
>>>    CC      arch/mips/kernel/signal.o
>>> {standard input}: Assembler messages:
>>> {standard input}:1775: Error: Unable to parse register name $fp
>>> scripts/Makefile.build:283: recipe for target 'arch/mips/kernel/signal.o' 
>>> failed
>>> make[2]: *** [arch/mips/kernel/signal.o] Error 1
>>> scripts/Makefile.build:500: recipe for target 'arch/mips/kernel' failed
>>> make[1]: *** [arch/mips/kernel] Error 2
>>> Makefile:1799: recipe for target 'arch/mips' failed
>>> make: *** [arch/mips] Error 2
>>>
>>> I think it is useful to get debugging information as described in the
>>> following texts:
>>>
>>> lib/Kconfig.debug
>>> config FRAME_POINTER
>>>          bool "Compile the kernel with frame pointers"
>>>          ...
>>>          default y if (DEBUG_INFO && UML) || ARCH_WANT_FRAME_POINTERS
>>>          help
>>>            If you say Y here the resulting kernel image will be slightly
>>>            larger and slower, but it gives very useful debugging information
>>>            in case of kernel bugs. (precise oopses/stacktraces/warnings)
>>>
>>> Documentation/dev-tools/kgdb.rst
>>> This option inserts code to into the compiled executable which saves
>>
>>    So to or into? :-)
> 
> Hi Sergei,
> 
> Thanks for pointing that out，this may be a typo which should be "into".

    Oops, I didn't realize it was a quote from the KGDB docs... :-)

> I will update the commit message to correct it.

    Thank you!

> Thanks,
> Tiezhu

[...]

MBR, Sergei
