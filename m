Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5C4254966
	for <lists+linux-mips@lfdr.de>; Thu, 27 Aug 2020 17:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgH0P3F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Aug 2020 11:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgH0P3E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Aug 2020 11:29:04 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40842C061264
        for <linux-mips@vger.kernel.org>; Thu, 27 Aug 2020 08:29:04 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y2so6919092ljc.1
        for <linux-mips@vger.kernel.org>; Thu, 27 Aug 2020 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Lu+Jd3Vyz1swvDaPudUhLlzjSTbN5VfLz21uPCiCZTQ=;
        b=F+PeYV6cRu/cQg6DoJ7PBamjJ9FGVwsRqGkrc51FyTff7eDlSmst65feacP+FO8tVt
         vNnJwerjL+9FiBGtIKph0hkmx+HeguD/ccqbiQHCuaFmsNHhzcOC9tGf4GsziSeCTKdQ
         4lloftKWw2y5FPMxVXD7GrAphWkCC/MDBLjswvCKFZgmdzjLzSsyAForECgmVxr8KwxG
         BhvNjlmwQjLegEjhNH4L4DANmbWtPhAY3qg35UrqFTUpF08ffLafFMpuMmqSk65sO/5W
         +i/icor5WpmvaRBQMaNCFRqy63/zESK6mJU8+yNaz38OvP28pgbGW2tJJv3bXh3kXa26
         witg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lu+Jd3Vyz1swvDaPudUhLlzjSTbN5VfLz21uPCiCZTQ=;
        b=FEKTTGMOHZ9SrlDTXpfe0yfJGQfgRsHhJh+wB+8vnV97vy+mCNvbPVBD9spRtOnQAo
         aNkIah7BIZBwm1cGjIcd4KQ6TVGspR5qZMxCcWm7aHRv9fjBWCeIjGOTOV0SeOdnfxpK
         l2Fz97WLdgmKrGl6MQzi3uRF9UWDkKrhq/O1TcKXSSRfmjOomOjpReo1tfswE2T2mHRb
         re2vOmV36XEzL/F03LblulqD/oKaMuw8U/ILwV+zGH59Fr89dQHQTRNbdqJ9lGjf473q
         Q8gc8uuSc2Pq2URukTc9MI4rnAOlyCT94CwvD6Cm02IalZda78SYEjetnMSH6ilE4XaJ
         WPJA==
X-Gm-Message-State: AOAM533WFKxbblk62KctwP5tReQt6SIDdyRQs5H/F795SJhHuRo5bEfU
        P1/CgV7UK7M1QBfbXclLvKXTpI6JuN8=
X-Google-Smtp-Source: ABdhPJzEVMIqfcj4AAk/tvJG5bmK7jdqYzUvkZmMcx4JqXFFE/mSLnnhqfARjbyXwa9Oki4ZyO3TAQ==
X-Received: by 2002:a2e:88d4:: with SMTP id a20mr9809599ljk.326.1598542141372;
        Thu, 27 Aug 2020 08:29:01 -0700 (PDT)
Received: from mobilestation ([95.79.127.85])
        by smtp.gmail.com with ESMTPSA id b18sm600787lfp.36.2020.08.27.08.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 08:29:00 -0700 (PDT)
Date:   Thu, 27 Aug 2020 18:28:58 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPU_P5600: Cleanup unused code
Message-ID: <20200827152858.ug65tmemto5h76ob@mobilestation>
References: <1598533517-13491-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598533517-13491-1-git-send-email-hejinyang@loongson.cn>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Jinyang,

Thanks for the patch. Although the commit message doesn't reflect the essence
of the patch. Perhaps "mips: p5600: Discard UCA config selection" ?

-Sergey

On Thu, Aug 27, 2020 at 09:05:17PM +0800, Jinyang He wrote:
> $ grep "CPU_SUPPORTS_UNCACHED_ACCELERATED" -nR
> arch/mips/Kconfig:1591:	select \
> CPU_SUPPORTS_UNCACHED_ACCELERATED
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 99220e7..6ee4488 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1589,7 +1589,6 @@ config CPU_P5600
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select CPU_SUPPORTS_HIGHMEM
>  	select CPU_SUPPORTS_MSA
> -	select CPU_SUPPORTS_UNCACHED_ACCELERATED
>  	select CPU_SUPPORTS_CPUFREQ
>  	select CPU_MIPSR2_IRQ_VI
>  	select CPU_MIPSR2_IRQ_EI
> -- 
> 2.1.0
> 
