Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B5F6D96D2
	for <lists+linux-mips@lfdr.de>; Thu,  6 Apr 2023 14:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjDFMMB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Apr 2023 08:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjDFMMA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Apr 2023 08:12:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92161B1
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 05:11:56 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id v6-20020a05600c470600b003f034269c96so13385399wmo.4
        for <linux-mips@vger.kernel.org>; Thu, 06 Apr 2023 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680783115;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pf/5RTGQzng0+vJUHWj6WASxpHEz08X0S5cziiT2Jw=;
        b=ZlUsZGWYFDg4UhGyZPv8RhSfcEx4Yuh29/j2njqG+zXlBFNV3VKgPK7ASlefOt2GsT
         IsxrrbCuphO8maU7vKG+Spd8DlsLkNidD3grHLR4ZtnMdCUeW7XQl3e5PlGvOAwuQX2r
         bdE/ru14jVMewkELxyBeohX1VRQWA98AQZ/CmGq6qleGx7pjOXf+p0GlamSjW3rsOx0/
         z5Vs5DUv+jBL19DRgxe43vQtusq2nzMeWrIGYK8DMNbvvNqRx5zfdMALjrn5O9xIppvO
         HPweJUOyYZguX7v1ySLtS/kIx6hn2rQmB51IwYIu3RA6cP3wrwE1s8aTW74b3mqHv9Yl
         N41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783115;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+pf/5RTGQzng0+vJUHWj6WASxpHEz08X0S5cziiT2Jw=;
        b=1dLvVQVj+yfmBVpnxvC5RJpzTEwUOVCOEmDkmBo3iLgidePdqaicMcF5x9oOJChWDX
         cKd5AigBAU1tF4obrxbvwijEpk/0XH7uzDOwBBXq5MoH+aVtErQ+Z4O/Nv38k1SOnOhW
         5LMp4LiTgTOlcQ5g3yvwJtNrroSKGCi5TZR0gnPFFJUBVG0PPpUChecAG3oY/iOke+bf
         F/QX9JVxK9tnCECnC0BoQd3zCPSnnepuApLJQRjs8K6qfh0INZx8ZAx6KnP7tVnraxog
         Re9gq/n13yxTnn3C70BUcGC1XJ1gTMD/BFgIXAlUSjG7KQS5/iaGxitU6hcrd61pEBC7
         51/g==
X-Gm-Message-State: AAQBX9cxjxifrQ5XlNr4aCnwvknDT4NdZi0BemqtUbW5GAG7iE9xzDI8
        8FqPyt9eXhKfcXGruV9FDRnFaA==
X-Google-Smtp-Source: AKy350bEuX8V/PWsyidAnBUufnyHVFnfsOg/uBPMZpwOMTR26CCH6LxdtsLiR7fDEczKi8Bp5EcK8A==
X-Received: by 2002:a7b:ce85:0:b0:3ee:2b04:e028 with SMTP id q5-20020a7bce85000000b003ee2b04e028mr7738048wmj.14.1680783114995;
        Thu, 06 Apr 2023 05:11:54 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id h4-20020a1ccc04000000b003ed2433aa4asm1413474wmb.41.2023.04.06.05.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:11:54 -0700 (PDT)
Message-ID: <296671a0-9434-23a2-848a-2f2ad2c280c3@linaro.org>
Date:   Thu, 6 Apr 2023 14:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] MIPS: Remove deprecated CONFIG_MIPS_CMP
Content-Language: en-US
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230405185128.15237-1-tsbogend@alpha.franken.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405185128.15237-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/4/23 20:51, Thomas Bogendoerfer wrote:
> Commit 5cac93b35c14 ("MIPS: Deprecate CONFIG_MIPS_CMP") deprecated
> CONFIG_MIPS_CMP and after 9 years it's time to remove it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Marc, if you prefer an extra patch for the irqchip change, I'll
> split this. Otherwise I would take it through the MIPS tree.
> 
>   arch/mips/Kconfig                    |  34 +----
>   arch/mips/include/asm/rtlx.h         |   1 -
>   arch/mips/include/asm/smp-ops.h      |  16 ---
>   arch/mips/include/asm/vpe.h          |   4 -
>   arch/mips/kernel/Makefile            |   3 -
>   arch/mips/kernel/rtlx-cmp.c          | 122 ------------------
>   arch/mips/kernel/smp-cmp.c           | 148 ----------------------
>   arch/mips/kernel/vpe-cmp.c           | 180 ---------------------------
>   arch/mips/kernel/vpe.c               |   2 +-
>   arch/mips/mti-malta/Makefile         |   2 -
>   arch/mips/mti-malta/malta-amon.c     |  88 -------------
>   arch/mips/mti-malta/malta-init.c     |   2 -
>   arch/mips/mti-malta/malta-platform.c |   2 -
>   arch/mips/ralink/mt7621.c            |   2 -
>   drivers/irqchip/irq-mips-gic.c       |  26 ----
>   15 files changed, 3 insertions(+), 629 deletions(-)
>   delete mode 100644 arch/mips/kernel/rtlx-cmp.c
>   delete mode 100644 arch/mips/kernel/smp-cmp.c
>   delete mode 100644 arch/mips/kernel/vpe-cmp.c
>   delete mode 100644 arch/mips/mti-malta/malta-amon.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

