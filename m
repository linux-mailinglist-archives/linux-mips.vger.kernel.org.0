Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDD31ABEF3
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 13:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632852AbgDPLP4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 07:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632775AbgDPLOK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Apr 2020 07:14:10 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBEDC061A0C;
        Thu, 16 Apr 2020 04:14:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i10so4309631wrv.10;
        Thu, 16 Apr 2020 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yrEAo/Qlbfc9GeX5Dwif5D5gCiJZ0+6j0nBqBeNFgGI=;
        b=pjd0p1TG20XK+VM3xpl2elbHjVE8BdV/MM3NVaDdeZ84c0vMPxIOgiExN8sG4Rbl/N
         1J2GsvesXPUCjUkWiKuALhwm7M4E5YeabuXrWhCih8+zLmXArmEw3HUnjI4NcImef+Hv
         T4dYMeFfSHccJQefBSDA+gy5VR/7P+/UprrQt/RmTixRftDa5RUpkqukwMaHbw0FxqYR
         w4HhlT0/oae6x+Sr7gFfy+YwSzUOgFXhV6OBrOc7jdr3gwtctDvWfndGdjBY3RpDn6we
         Sn41PQEgDBdWFTYTeTgah/R2IWBPUR1nUizhY+x6Dx725W9gi2NxwZLSENCkEota1qX6
         ta8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yrEAo/Qlbfc9GeX5Dwif5D5gCiJZ0+6j0nBqBeNFgGI=;
        b=uiNtfnCTNnBh9p84T0mHHsTKkcKPeSBAqYQvDwf40cC2MxD6bXtez2Hvx1BCCc/Owt
         bRK+vl3xPp5V7rYGarF2pTRE4d3zP+ebII0l3wz+FhFw8XiDvZb+Z20FrDGonrtwvFoS
         gU8gZQXNiNQn4x361WtMCIhWwhBpzYsBdeL9neNSZC/uenxagJyzV4Y0RNFZlwqeB6dA
         H5qVDlRkyOjYEL663zsrQRcvBNU9pooCdsL/T2Uvx65DqsN6s0Gzcv7wxhVBZxU3Xd6W
         GU01GTjOkZU7uajXO8A5OiFP9budIyG8XqDmJoTwMowBXjQbNtLI0A/CaVyYot2oTFXz
         BvWQ==
X-Gm-Message-State: AGi0PuZviedjg1ne1FeyJ91aUuF0UwUuuGdXRZqowZOI6i6l8kQzqvzR
        r4j0VH+6iMd0ggpzVMefi4BR//sO
X-Google-Smtp-Source: APiQypKlpX5AGWI2ULeMFPLHN2hX3xxdXqKWj54FI3XYhx3TrUtU6ZlctXL11THJp2P6bmZfWiPxaQ==
X-Received: by 2002:adf:eccb:: with SMTP id s11mr24435059wro.138.1587035648543;
        Thu, 16 Apr 2020 04:14:08 -0700 (PDT)
Received: from ?IPv6:2001:a61:2482:101:3351:6160:8173:cc31? ([2001:a61:2482:101:3351:6160:8173:cc31])
        by smtp.gmail.com with ESMTPSA id y20sm27927051wra.79.2020.04.16.04.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 04:14:08 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-mips@vger.kernel.org,
        linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] getauxval.3: MIPS, AT_BASE_PLATFORM passes ISA level
To:     YunQiang Su <syq@debian.org>
References: <20200322095527.397716-1-syq@debian.org>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <74dc42c8-d249-828e-7cc8-54e63d5e92a8@gmail.com>
Date:   Thu, 16 Apr 2020 13:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322095527.397716-1-syq@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/22/20 10:55 AM, YunQiang Su wrote:
> Since Linux 5.7, on MIPS, we use AT_BASE_PLATFORM to pass ISA level.
> The values may be:
>   mips2, mips3, mips4, mips5,
>   mips32, mips32r2, mips32r6,
>   mips64, mips64r2, mips64r6.
> 
> This behavior is different with PowerPC.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e585b768da111f2c2d413de6214e83bbdfee8f22
> Signed-off-by: YunQiang Su <syq@debian.org>

Hello YunQiang Su,

Thank you. I've applied your patch.

Cheers,

Michael

> 
> ----
> v1 -> v2: fix typo
> ---
>  man3/getauxval.3 | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/getauxval.3 b/man3/getauxval.3
> index 456371c6a..bcc116dd2 100644
> --- a/man3/getauxval.3
> +++ b/man3/getauxval.3
> @@ -60,9 +60,10 @@ values are present on all architectures.
>  The base address of the program interpreter (usually, the dynamic linker).
>  .TP
>  .BR AT_BASE_PLATFORM
> -A pointer to a string identifying the real platform; may differ from
> -.BR AT_PLATFORM
> -(PowerPC only).
> +A pointer to a string (PowerPC and MIPS only).
> +On PowerPC, this identifies the real platform; may differ from
> +.BR AT_PLATFORM "."
> +On MIPS, this identifies the ISA level (Since 5.7).
>  .TP
>  .BR AT_CLKTCK
>  The frequency with which
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
