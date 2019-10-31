Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB7BEB911
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2019 22:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbfJaVgj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Oct 2019 17:36:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37860 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728520AbfJaVgj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 31 Oct 2019 17:36:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id z24so401452pgu.4
        for <linux-mips@vger.kernel.org>; Thu, 31 Oct 2019 14:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=05LDpsQ9sZm8hwS6WZ18ScWrDyW/Ok/p8dIpcJxtZf8=;
        b=Gk9NnCiojXb7X9uZp5scaT0/CY5VYirai2FkZ2ugat+Yfc7uBQkm1hE9c8gPB7woLs
         7PC3XP9NtgJKNxcuFnNW85THH5dpe5cfHDvuwgJTU/EtLw7WWm1jK9errG/6venDObTn
         VhUrk8/wb+sToGC0kC/BE/SAX9tKFclbcBTAf72qRfWTdNSeX6p9+9yHN+tjieSzm3PJ
         IAwiQREAzc5THhpkJJEimxy6CIJj2tLc6d9tbfJVheMgH+f446mv4dwv1c0djU7bQbR7
         gkwVRBFHmFYXlU1nFvdQZD1aKrbk3iAn4Ptho/R/urOxyFnSj1LFR9psdzrBxLxuMITU
         lmig==
X-Gm-Message-State: APjAAAWdPS29wX59LgDAWqI3iBYj4gFKLx0FdcrB0i0uzUdIcXi/UxB4
        ucXuCrOcEipZ4lfXs3BX+wQ=
X-Google-Smtp-Source: APXvYqynHwQ1Ydim3vEYZhQXzV9PwyrOhxdx7A0zXVbkKHTTMRXdL4jNGWIuY7DiIA9+RLnWv43bNg==
X-Received: by 2002:a17:90a:98d:: with SMTP id 13mr10258641pjo.98.1572557798030;
        Thu, 31 Oct 2019 14:36:38 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id b9sm5066510pfp.77.2019.10.31.14.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 14:36:37 -0700 (PDT)
Date:   Thu, 31 Oct 2019 14:36:56 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>
Cc:     Paul Burton <paul.burton@mips.com>, ralf@linux-mips.org,
        jhogan@kernel.org, john@phrozen.org, NeilBrown <neil@brown.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH RESEND] MIPS: ralink: enable PCI support only if driver
 for mt7621 SoC is selected
Message-ID: <20191031213656.iycqiijz3nd5xtkr@lantea.localdomain>
References: <20191031071124.22102-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191031071124.22102-1-sergio.paracuellos@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergio,

On Thu, Oct 31, 2019 at 08:11:24AM +0100, Sergio Paracuellos wrote:
> diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> index 1434fa60f3db..94e9ce994494 100644
> --- a/arch/mips/ralink/Kconfig
> +++ b/arch/mips/ralink/Kconfig
> @@ -51,6 +51,7 @@ choice
>  		select MIPS_GIC
>  		select COMMON_CLK
>  		select CLKSRC_MIPS_GIC
> +		select HAVE_PCI if PCI_MT7621
>  endchoice
>  
>  choice
> diff --git a/drivers/staging/mt7621-pci/Kconfig b/drivers/staging/mt7621-pci/Kconfig
> index af928b75a940..ce58042f2f21 100644
> --- a/drivers/staging/mt7621-pci/Kconfig
> +++ b/drivers/staging/mt7621-pci/Kconfig
> @@ -2,7 +2,6 @@
>  config PCI_MT7621
>  	tristate "MediaTek MT7621 PCI Controller"
>  	depends on RALINK
> -	depends on PCI
>  	select PCI_DRIVERS_GENERIC
>  	help
>  	  This selects a driver for the MediaTek MT7621 PCI Controller.

This doesn't seem right to me - doesn't this now allow the PCI
controller driver to build without PCI support enabled? Are you sure
that won't allow more build failures?

How does enabling the driver change whether or not the SoC has PCI
support? The SoC is always the same hardware regardless of whether you
enable the driver for it, so this doesn't seem right to me.

Hauke - do you recall what the build failure you mentioned in commit
c4d48cf5e2f0 ("MIPS: ralink: deactivate PCI support for SOC_MT7621")
was?

Thanks,
    Paul
