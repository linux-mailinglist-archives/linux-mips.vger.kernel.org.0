Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496672B3F79
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 10:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgKPJIe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 04:08:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbgKPJId (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Nov 2020 04:08:33 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09901C0613CF;
        Mon, 16 Nov 2020 01:08:33 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id e139so4624885lfd.1;
        Mon, 16 Nov 2020 01:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kzUvZq0RkKZk3WfU3fUahsDNWpzd7MnGlgZVNqSYumY=;
        b=VKdzzi39I3BJCGaAJx31QiXuBZCuWSe28Zh6ePDQs5pI8/oj8UV6c8FDbbmbX++Zlz
         iO5r0hdrytHg554BDOvcuPA76WldV/JKCFtuJkJgAs6YNCJe7UPOdkV2DTnuX9Eufz2S
         zz/wwDFTFjI/ylJhHCIVzkY4447aA4RLbFfdghB3CxZO/7ZctQw9VlmZ9Io/ZGp+5T6e
         fW4kXs7r1q0vPxx0O5Pu3jUkSLploq97YR4RJGT23nl41F1TY7A2eS2NsE9dTHZIVXnS
         0GwqIGpmlC9AfS8uY8a3RH2tZ8Z3FdaKMoZagZxkMK3iHtU01MfJOM6a+CFEp3ik11Lw
         Dz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kzUvZq0RkKZk3WfU3fUahsDNWpzd7MnGlgZVNqSYumY=;
        b=tVkGvaS/RxGWY6ovAG6gxOu8dWlIF5QhlyOc3ZFrkipJT1j3xXgto1vwKXpOMalAZ2
         slqUw5/hV5gl0oS2pW8P5k5dRV64r0sqE7Pa6pfd6pNTGmQlNe8DUZp8EcEvOEF5cP+I
         x1pwCmil3LoH/dvCh6rc5+X/xARYhyc0ijiq96TjTQ5jnewpcWxRHbKKMAxoA3TKb+kv
         n8p11YW8yFvaZAJ9uhgbKyuclBRDOh9plOSnxP3aD9/py+JwtEfio2Wlv1R0CgORg10g
         ET7r5Eg8vZEjAqV/IrmKKzn0NFOSSsQ7s1ZZEVI94/oG1HZBKMg+9nXhflr0/itnty/n
         r/Eg==
X-Gm-Message-State: AOAM532X7T25d7e4LzkpCmW4xfBG9B0hhU9uXiVJR7XF3HirRDp7IbpY
        4P44iA6xSCao/wOAGfBpL/xv7+6vuoo=
X-Google-Smtp-Source: ABdhPJzjX3Ktbj9rIuoS7M93kmCjOK50JLz6uRplm90LKu1na2zN/uG3cFbnD89Ltln3/XtvrBMGEA==
X-Received: by 2002:a19:2407:: with SMTP id k7mr5428878lfk.533.1605517711522;
        Mon, 16 Nov 2020 01:08:31 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:2fb:950d:1831:3fc8:8cb7:2cac? ([2a00:1fa0:2fb:950d:1831:3fc8:8cb7:2cac])
        by smtp.gmail.com with ESMTPSA id k23sm2637670ljh.95.2020.11.16.01.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 01:08:31 -0800 (PST)
Subject: Re: [RFC PATCH] MIPS: Kconfig: Select ARCH_WANT_FRAME_POINTERS
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1605502980-31946-1-git-send-email-yangtiezhu@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <62ea9838-70ce-ca73-7dae-e94620956ab5@gmail.com>
Date:   Mon, 16 Nov 2020 12:08:26 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1605502980-31946-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 16.11.2020 8:03, Tiezhu Yang wrote:

> Select ARCH_WANT_FRAME_POINTERS to fix the following build error under
> CONFIG_DEBUG_ATOMIC_SLEEP:
> 
>    CC      arch/mips/kernel/signal.o
> {standard input}: Assembler messages:
> {standard input}:1775: Error: Unable to parse register name $fp
> scripts/Makefile.build:283: recipe for target 'arch/mips/kernel/signal.o' failed
> make[2]: *** [arch/mips/kernel/signal.o] Error 1
> scripts/Makefile.build:500: recipe for target 'arch/mips/kernel' failed
> make[1]: *** [arch/mips/kernel] Error 2
> Makefile:1799: recipe for target 'arch/mips' failed
> make: *** [arch/mips] Error 2
> 
> I think it is useful to get debugging information as described in the
> following texts:
> 
> lib/Kconfig.debug
> config FRAME_POINTER
>          bool "Compile the kernel with frame pointers"
>          ...
>          default y if (DEBUG_INFO && UML) || ARCH_WANT_FRAME_POINTERS
>          help
>            If you say Y here the resulting kernel image will be slightly
>            larger and slower, but it gives very useful debugging information
>            in case of kernel bugs. (precise oopses/stacktraces/warnings)
> 
> Documentation/dev-tools/kgdb.rst
> This option inserts code to into the compiled executable which saves

    So to or into? :-)

> the frame information in registers or on the stack at different points
> which allows a debugger such as gdb to more accurately construct stack
> back traces while debugging the kernel.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
[...]

MBR, Sergei
