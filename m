Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A387073D477
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jun 2023 23:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjFYV1v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Jun 2023 17:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjFYV1t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Jun 2023 17:27:49 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA4E18D
        for <linux-mips@vger.kernel.org>; Sun, 25 Jun 2023 14:27:47 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3110ab7110aso3189220f8f.3
        for <linux-mips@vger.kernel.org>; Sun, 25 Jun 2023 14:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687728466; x=1690320466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75eDqtaV4HxjbOY0L3WJNiE0VV9dzyg9cgqtVXJznBY=;
        b=P4OMFY0E+kb5eR0W9Y6kEgLPJuc6u7faK0X1O+XQGbwqlajdF/jfFWAcx8BRjDqGzO
         mh6gHGoaEUDX+sh3nKQRSDJ7HA0jh2sHDYtRXrtRDSCN3zTIndInhtFLLYMRLTUVyOKS
         YpCq/XTlPUo+K6NWRXFBXfXuAiMnnc5n0pIhRCxDVLvmATOI8nFzSZ2lOhnffLdUEmwd
         VeArt9sQbwQphWxkK4kf1essGtLoTUS/ckhnahsuy5pt7r3o+oJjlr5xYi1q+x0YAcvy
         jUeA3jWRJo1IshymxkGUWJrB/2Mitej5Iu/x3GJN9KZtlWpfpaIlbv4Lf+DJiRh45Kkw
         WFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728466; x=1690320466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75eDqtaV4HxjbOY0L3WJNiE0VV9dzyg9cgqtVXJznBY=;
        b=MT1SqtVVJPEBDiT9OsIijSZCdwRlwAMaALHxJwJ3MUjP2UrZ0YaCQefX9HecHJvLua
         uy641YKfEccYxcFLE/tSy9tn51ZdLJW3AEuFbWcvJiIz0ONxxo7gH6/WFMPNOzGuFLc2
         eWdOCDyeu2ZGOMH5TKC/OIxVNzQWE8JcGN6RvBuAratJrEIr6OSoesogbtTNdy2PayR2
         qap34GbqZUliKsW2H6tg+CBMEABtFrszqftd8mnL334DCw0leTWaIAZ+Q///SiBSTkAb
         +g1GYmdcHa6TA4+v1p0aaNudPrzNHeQzZPtTnV8e+yxOqeqUMH7fiQOPsUIVdDMmGyUj
         Ssng==
X-Gm-Message-State: AC+VfDwxcFeP//PF0Pay+LrV8BNUOjgVujsjTDc12frtvD/9LSqC+geM
        7qeZANWkipCUylBtujbwiJFlaA==
X-Google-Smtp-Source: ACHHUZ6Hjasu9Lrk/CatQAEzcCmcG0JhA1BO0YkpChmI4xEA5JcA/nNpFTMJqb3YFVfr7dLSsRzufQ==
X-Received: by 2002:a5d:474f:0:b0:313:f07b:8027 with SMTP id o15-20020a5d474f000000b00313f07b8027mr1072096wrs.36.1687728466257;
        Sun, 25 Jun 2023 14:27:46 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.212.184])
        by smtp.gmail.com with ESMTPSA id r13-20020adfe68d000000b0030fb4b55c13sm5420254wrm.96.2023.06.25.14.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 14:27:45 -0700 (PDT)
Message-ID: <9c362e4f-ba40-02a6-fb22-aed6598ec536@linaro.org>
Date:   Sun, 25 Jun 2023 23:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [patch 03/17] ARM: cpu: Switch to arch_cpu_finalize_init()
Content-Language: en-US
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
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
 <20230613224545.078124882@linutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230613224545.078124882@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/Kconfig            |    1 +
>   arch/arm/include/asm/bugs.h |    4 ----
>   arch/arm/kernel/bugs.c      |    3 ++-
>   3 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

