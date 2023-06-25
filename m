Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C65F73D48B
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jun 2023 23:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjFYV3d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Jun 2023 17:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjFYV3b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Jun 2023 17:29:31 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68197193
        for <linux-mips@vger.kernel.org>; Sun, 25 Jun 2023 14:29:29 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso3697058a12.0
        for <linux-mips@vger.kernel.org>; Sun, 25 Jun 2023 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687728568; x=1690320568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTfH9M3OupFue5fNOr2kpTWCwfS7CIJdAlc3JsK0Z60=;
        b=WH/Pv0vC60dg5LQaXetqwdJJ6gjX7TusNMO/6iV4l0+yEMcucIdKzH16maZbw+gTE5
         bshBq+m3EagON7qXgXpaeY3Un14Jg16gEBw2eG4rUP20MyBy+A9q9mtRg8NoKwlY2OML
         TDDRBqeD9jmqc8UzGL0fFSAtFv4NlYyGxfShWltouCZTqRFI0WJHBKqdmCCdT1ygEajo
         5uUfdycgw8QO56TYvmSWQwVtkORbn27Fu+tszv/t2sVHdmnGBUoc8/oMvM4hempXllrh
         km1os10Um941Jb7ftk00Q23nOUsTQnvKjTHQr63vApUgH2LMz7AIepbPGoouhh6C8NYy
         QxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728568; x=1690320568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTfH9M3OupFue5fNOr2kpTWCwfS7CIJdAlc3JsK0Z60=;
        b=O2/P3IjaVR/4WN/TISWw/yALGrxsJdDHt1Xe7ic+38vXhkTOFOOs2Fm1v9xjxyOVzS
         /hAPaHYaG5K1wJpOIVl0ZvfeneE/NYYGEa21nm71E5gc8zaixb0FslE6J9pMQ01M8dSL
         v9O9nTnspb2ouyqBsPq4Zn7mF2S2LSWvboSlHhAJ6LaxKsAYDAKSneJXRE3MyyR+T1AQ
         q06JspRkLMaBDwVVP0yMEjUdQ4huzSinGbAgVMNQKYuW0E7LdsVKaaJmvfyXiG1Qh3k9
         X/Q9RbGd6hykjoxZk6rVfc+f2vad3mbptA46cmURU9yOhZTJrbf3jYhMqv+xHs2D2ths
         7R2Q==
X-Gm-Message-State: AC+VfDyy9RfBgGEB9dctQh257X67S0AEIL8SpDivxqKFtz7tpEWRtwXK
        S9fB9ir1aIZ8thGsXuSxZescCg==
X-Google-Smtp-Source: ACHHUZ49hN41Iny38CX7JC8bw+Nt2eRb4muhVoX8pGYEOfz9mbYhziaAQCpgxSX5VcO2Bvt9aJ8PYw==
X-Received: by 2002:aa7:d697:0:b0:51d:9dae:a591 with SMTP id d23-20020aa7d697000000b0051d9daea591mr102645edr.21.1687728567863;
        Sun, 25 Jun 2023 14:29:27 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.212.184])
        by smtp.gmail.com with ESMTPSA id m5-20020aa7d345000000b0051495ce23absm2138387edr.10.2023.06.25.14.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 14:29:27 -0700 (PDT)
Message-ID: <9c97fcb7-bbb2-d792-6167-dc8faff0c76d@linaro.org>
Date:   Sun, 25 Jun 2023 23:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [patch 08/17] sh/cpu: Switch to arch_cpu_finalize_init()
Content-Language: en-US
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org,
        Richard Henderson <richard.henderson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Tom Lendacky <thomas.lendacky@amd.com>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.371697797@linutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230613224545.371697797@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/6/23 01:39, Thomas Gleixner wrote:
> check_bugs() is about to be phased out. Switch over to the new
> arch_cpu_finalize_init() implementation.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> ---
>   arch/sh/Kconfig                 |    1
>   arch/sh/include/asm/bugs.h      |   74 ----------------------------------------
>   arch/sh/include/asm/processor.h |    2 +
>   arch/sh/kernel/idle.c           |    1
>   arch/sh/kernel/setup.c          |   55 +++++++++++++++++++++++++++++
>   5 files changed, 59 insertions(+), 74 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

