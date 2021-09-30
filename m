Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3668E41DFD8
	for <lists+linux-mips@lfdr.de>; Thu, 30 Sep 2021 19:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350116AbhI3RP5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 13:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349211AbhI3RP4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Sep 2021 13:15:56 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC7BC06176A;
        Thu, 30 Sep 2021 10:14:13 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id g15so3209227vke.5;
        Thu, 30 Sep 2021 10:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGWIbMmsx7WG4yhXW+uZPfLvkXpXxKk0c7o0MXap4F8=;
        b=Bm5cSAasty4inLGEN4knXf8rUTAiyHDdGHF/QG4Lcw8xYnyxb3W7e2syGWnuItvXtv
         3O3zY+he3CHb1a87VnrpjfmKNjW08w6CHd8M3S1JIZi9UNA+CR/azL8fSeOnWAoxnLDl
         evoxoRhoBcTeAj+uINAjhg0G4bqB9prrNF2xW67gH8H1QCYZQngrc12Gtc1ro8dyyA+j
         JOdFUVI57VHWMCVWRsIzqQlYFv1IMPZj2aG1A00dkXfy8/aMNx4HcOZX1OtWM4nNu60G
         8acGjJ4Ma2El98oIRmfG45ar4tYIkrTp0VJgC8AI42ytzMN1gtL3vfV7t6M/KW5fO5XL
         j9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGWIbMmsx7WG4yhXW+uZPfLvkXpXxKk0c7o0MXap4F8=;
        b=pd55lYdzTNIyzt99pmwAF2QitEEZeayXv2fPMeqlaCyg5pvlbHVA6Xjp5Bsau+cMVb
         Uz4JS11ybFk3lirN5ccVUl2Xm4+ulirRQarx2ARO0kCtBAGF3mlYKDYqts8j83J+uit4
         9SzWXd/WLZG1DBd9htZo++UMRXSuCWPUA3eBZmTc3xM74KuYThz76UaM/pfr89Zpg5D5
         bO71IJkYJz9Kclk6QL2IO7CE7FpXey5tV7ynJIg63mbLJwnEuN2ZejVSIIDC1JmnRjLU
         0EbWGvk6YmNoKgZMgdz11NBmQvWdAwUyv7KGlkoR5mTodPPR47SCvB6eY3kXFBpRPv5L
         kaaA==
X-Gm-Message-State: AOAM532MQ50g6lD9eZEImMw3ZGp4r4cM3Jsee8BkUkAQCW1zVQjqQ8fp
        0sZwEUmsLMSrO1QWZTgRfkYeJ9g+ihmRMochmdQ=
X-Google-Smtp-Source: ABdhPJy+fCOr4VeoHOBqxv9MkR25S/ByZRSnQvCyAgbv8mf1AbQXnluYiREOJNXTrKRFzv3OJBCTE6hElAKIYg+I9GA=
X-Received: by 2002:a1f:5f4d:: with SMTP id t74mr4213433vkb.5.1633022052464;
 Thu, 30 Sep 2021 10:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210930165741.9662-1-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20210930165741.9662-1-ilya.lipnitskiy@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 30 Sep 2021 19:14:00 +0200
Message-ID: <CAMhs-H_Tkp0FV4ruR95O2CzXrjj5nTw17aW4my-4xzeyqW8zLA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Revert "add support for buggy MT7621S core detection"
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg Ungerer <gerg@kernel.org>,
        Strontium <strntydog@gmail.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 30, 2021 at 6:58 PM Ilya Lipnitskiy
<ilya.lipnitskiy@gmail.com> wrote:
>
> This reverts commit 6decd1aad15f56b169217789630a0098b496de0e. CPULAUNCH
> register is not set properly by some bootloaders, causing a regression
> until a bootloader change is made, which is hard if not impossible on
> some embedded devices. Revert the change until a more robust core
> detection mechanism that works on MT7621S routers such as Netgear R6220
> as well as platforms like Digi EX15 can be made.
>
> Link: https://lore.kernel.org/lkml/4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org
> Fixes: 6decd1aad15f ("MIPS: add support for buggy MT7621S core detection")
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/include/asm/mips-cps.h | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
     Sergio Paracuellos
>
> diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
> index 35fb8ee6dd33..fd43d876892e 100644
> --- a/arch/mips/include/asm/mips-cps.h
> +++ b/arch/mips/include/asm/mips-cps.h
> @@ -10,8 +10,6 @@
>  #include <linux/io.h>
>  #include <linux/types.h>
>
> -#include <asm/mips-boards/launch.h>
> -
>  extern unsigned long __cps_access_bad_size(void)
>         __compiletime_error("Bad size for CPS accessor");
>
> @@ -167,30 +165,11 @@ static inline uint64_t mips_cps_cluster_config(unsigned int cluster)
>   */
>  static inline unsigned int mips_cps_numcores(unsigned int cluster)
>  {
> -       unsigned int ncores;
> -
>         if (!mips_cm_present())
>                 return 0;
>
>         /* Add one before masking to handle 0xff indicating no cores */
> -       ncores = (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
> -
> -       if (IS_ENABLED(CONFIG_SOC_MT7621)) {
> -               struct cpulaunch *launch;
> -
> -               /*
> -                * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
> -                * always reports 2 cores. Check the second core's LAUNCH_FREADY
> -                * flag to detect if the second core is missing. This method
> -                * only works before the core has been started.
> -                */
> -               launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
> -               launch += 2; /* MT7621 has 2 VPEs per core */
> -               if (!(launch->flags & LAUNCH_FREADY))
> -                       ncores = 1;
> -       }
> -
> -       return ncores;
> +       return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
>  }
>
>  /**
> --
> 2.33.0
>
