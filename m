Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00DE78E25C
	for <lists+linux-mips@lfdr.de>; Thu, 31 Aug 2023 00:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244374AbjH3WeZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Aug 2023 18:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237283AbjH3WeY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Aug 2023 18:34:24 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610FBA1
        for <linux-mips@vger.kernel.org>; Wed, 30 Aug 2023 15:34:01 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-401ceda85cdso1773875e9.1
        for <linux-mips@vger.kernel.org>; Wed, 30 Aug 2023 15:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693434837; x=1694039637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFgqEWtVuYdRSUZpjBvrGjrECLnZnCx4HSWx8oAmcF4=;
        b=IRIDPSXxw+Lb0lty00OO3SLNM2W7XtLpuS1YYxLU++xh0stLYaQshOsW4DFUyv2BsQ
         ZEsjq8VZnGUhnkvNfoVq4HtERfP6ExJk88c8i48H/C/iRgXAkwRxO4+5zntPTNLuKWCP
         jnem7R+aFoIuRnUp960rYyVh05F01xdgknwiNNax7VcTb59AVkFgDqnToxU77N4gkG0K
         ze+K7QufJwOR/OKs9p/Ht1rHjdfQ/JI/Cg681BHRayV/lFtt747qnGqfcMv7Ck4CwWO7
         zKXYlk5bEDbJjQ4Wv4LnyrbTrIS8rA8Fgp2ru7+8FH6XfsT4d5A4b8q+M1edkVuDy/q1
         /Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693434837; x=1694039637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFgqEWtVuYdRSUZpjBvrGjrECLnZnCx4HSWx8oAmcF4=;
        b=PKSNzB7pEHHCLAhMwAhoqoBCnrButhvtvTo/L74viIKN2zliW+2L3/5e65WsCDqUIk
         ZkeDMqXYZrkjr2U9Cw8OL9Whw4gWRuu4dVmcI6vzeGi+Y2axs5EjpjT3cpdpzLwjt41o
         L8peXiBqLZCSO/qFmoKhBw79gCiO1CgvJAnNcOqaQH/TnuGwfKi2/iUg8BJM6xmqwmUt
         8ayJ45fqofJCzXKvEVkVrDojqCDzLyqNFVl1DnnTM6bjTHB/5hXDM2HGVUkNxLIMZh+r
         EUn5vZePPx/OjQ180Lv/SCqYpCroL+I77XgdZfwBEo8uFqf1dJ2bTtYuDoMzUUyCXcCP
         r4wg==
X-Gm-Message-State: AOJu0Yzf32yie8kXXZWhYo7QU86Yh8cM0EFqlW8u+L6dLWAdyVT3Pz8W
        RxOGdSla+dHm8JGPgDKR3HXyQEhqaq6AK7708oRPwGmB
X-Google-Smtp-Source: AGHT+IG21XBSa1NpHpt7D+LPwmJ7vTfz0uF1Uy6n+9CUCNidaI4H0QF7ZDd2THIXqsoHVG3zSka6Mw==
X-Received: by 2002:a1c:7704:0:b0:401:daf2:2735 with SMTP id t4-20020a1c7704000000b00401daf22735mr2467982wmi.31.1693429884760;
        Wed, 30 Aug 2023 14:11:24 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.142.89])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d4b4c000000b0031416362e23sm17719142wrs.3.2023.08.30.14.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 14:11:24 -0700 (PDT)
Message-ID: <34466e53-9cab-4094-7a9e-ae1f65385194@linaro.org>
Date:   Wed, 30 Aug 2023 23:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v3] MIPS: loongson32: Remove dma.h and nand.h
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230830133505.505597-1-keguang.zhang@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230830133505.505597-1-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 30/8/23 15:35, Keguang Zhang wrote:
> Since commit 7b3415f581c7 ("MIPS: Loongson32: Remove
> unused platform devices"), struct plat_ls1x_dma and plat_ls1x_nand
> are unused. Then, dma.h and nand.h are useless.
> Therefore, remove these useless header files.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> V2 -> V3: Fix the build error
>            Add Reviewed-by tag from Philippe Mathieu-Daudé
> V1 -> V2: Remove include of dma.h and nand.h
>            Update the commit message
> ---
>   arch/mips/include/asm/mach-loongson32/dma.h   | 21 ---------------
>   arch/mips/include/asm/mach-loongson32/nand.h  | 26 -------------------
>   .../include/asm/mach-loongson32/platform.h    |  3 ---
>   arch/mips/loongson32/common/platform.c        |  2 --
>   arch/mips/loongson32/ls1b/board.c             |  2 --
>   5 files changed, 54 deletions(-)
>   delete mode 100644 arch/mips/include/asm/mach-loongson32/dma.h
>   delete mode 100644 arch/mips/include/asm/mach-loongson32/nand.h


> diff --git a/arch/mips/include/asm/mach-loongson32/platform.h b/arch/mips/include/asm/mach-loongson32/platform.h
> index 2cdcfb5f6012..f74292b13bc3 100644
> --- a/arch/mips/include/asm/mach-loongson32/platform.h
> +++ b/arch/mips/include/asm/mach-loongson32/platform.h
> @@ -8,9 +8,6 @@
>   
>   #include <linux/platform_device.h>
>   
> -#include <dma.h>
> -#include <nand.h>

Doh I missed that one in v2 :/

Thanks, R-b stands.
