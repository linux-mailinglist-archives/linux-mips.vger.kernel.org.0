Return-Path: <linux-mips+bounces-4166-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8041928F45
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 00:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69618285E4D
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 22:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB35145A10;
	Fri,  5 Jul 2024 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ateYmM30"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABEF1F61C;
	Fri,  5 Jul 2024 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720217701; cv=none; b=PivYLJlcBObmlgbzM9sso5T46sSwu4NQSeDdSXL7e8ftN7TN6CWf1a4+eghmJoM2z50dNGUffu/jMTZ310CQVJd19XMzB2JSExC4OH/1khVga+9Hgfrko12cYZ2bFB+FaeSJWEa2iKU5FH5LqIqEBMNhRfXt0mULLWydIyH9YcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720217701; c=relaxed/simple;
	bh=SVwKUEhXY0y9MdMKKoNIIKa8wmlSCl53FpiTZ02iho0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrpHqzJ3jA1hi+o7QWpeiRnb91FT6Tb4hNFi4fJ7w7df+Ux2stB2SOOYH3VwqE6k7Kn1SW0ccQlNfS9AyBUBN6M7GM46DFYMuiEs/hNrN6ZW/G4HT3uXI5FPBs0phuUlVf93XZkFXyjgnuQ82vFisP3PnlE5IZ3llPQxW351wOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ateYmM30; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee90f56e31so18053071fa.0;
        Fri, 05 Jul 2024 15:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720217698; x=1720822498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HbZSgvWAZL89H1u2kfo90wtZhi/ofTOBJgtdtCGP7uA=;
        b=ateYmM3054O+zdNg+icAvLxXS1qIc7g16mfvN4EwwyVL0cnDX/xOyQlNTn50+CMLl4
         uYhDfnezIvzEt5Tf5TvBG8geFtTYtWYqZ5D1wUSYpRXnQhV4idKgCOBBuYTFMHDaJIgA
         n1/jPJnuxdjJJ7DD9GJIE3kvJn20u951bT9XG3WJXS9tH4VQv96NTeL6a1T7B96EDaSZ
         CIUllUtHuZGubH6nxgYx+aqv3D75qU7xXVHrFrEDGp9hN6Huio30e+oBnK94QzUhasAL
         JpBGmksU0lfgesm0QYyoXeHdvhPLsKt37lhaX8tpap/B8J9NLMoBZcXyYcRybhKezCz0
         Ur3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720217698; x=1720822498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbZSgvWAZL89H1u2kfo90wtZhi/ofTOBJgtdtCGP7uA=;
        b=pQA/rgVMmhlKWPUS4P0ILJbJ5J6xyYaR+/JpdX+8AX3AcVp1KGa09Nk5oUC1T3Y6Fu
         OwWlEKAq12JeMpLXlS16rH0ps2Rq4Z6liF28uazIF6uKBKVKJ/xCnFK4a97UBe4yeSrl
         bH1BzZ3+ZNZs+5O2lHz+jAhu/Dy/aIUNl6iwJ1c+nvHuXVDoHrtSw3qmmerLvVAP5Pdd
         lgxg6WGWkp3L367uDPmMHUA3WKzQw8azfdnztz7YNw2F2nENh7x8TviIoFp+6StP/xCt
         H+Jqklo+2ZOLD1SCx4FsHSi6kYU+KBnWvoK7BeRsmiKz3XmGy0liGJ6PIw54vGCbzgnB
         eThQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9wPzHrD4IlqHmqYGINnrSM1ZJZqnRPjY+3UrUFrOtRKzeTuLXGefffzTLpskXcx3Gtv/sSjQI283Luixc1gmKbXUH8qujnf6WjVbboqGCRpaGRYvH7mLrSuh4AiP+M5m6HtX1pO7JZA==
X-Gm-Message-State: AOJu0Yxyuea2Tqi9nIKuh2cTr/GB6/grmCaRrZv70TUOw8MmbvSdCBZ1
	rZolYgoF4BqUwEHFquOwppr8Ugvh27v+qdo03puPPlRYWEsbMH2ztZfGhw==
X-Google-Smtp-Source: AGHT+IHujXea6fk0Hm2p6NmdQ5o0QiM+FnvvAjiennjXgwxQYW8qgNxh4EQjbnFUMFmNm0H4oEUlHA==
X-Received: by 2002:a05:6512:3127:b0:52c:b479:902d with SMTP id 2adb3069b0e04-52ea0622c8cmr4193269e87.4.1720217697610;
        Fri, 05 Jul 2024 15:14:57 -0700 (PDT)
Received: from mobilestation ([95.79.85.201])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e9fc8ab79sm628431e87.187.2024.07.05.15.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 15:14:57 -0700 (PDT)
Date: Sat, 6 Jul 2024 01:14:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] MIPS: IPI Improvements
Message-ID: <bd5wxmax7leuww6rwocafiktwynqvbca4plknod4hsiifezsfu@ooojfjci5ajf>
References: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>

Hi Jiaxun

On Fri, Jul 05, 2024 at 10:16:52PM +0800, Jiaxun Yang wrote:
> Hi all,
> 
> This series improved general handling to MIPS IPI interrupts, made
> IPI numbers scalable, and switch to IPI-MUX for all GERNERIC_IPI
> users on mux.
> 
> It is a prerequisite for enabling IRQ_WORK for MIPS.
> 
> It has been tested on MIPS Boston I6500, malta CoreFPGA3 47K MT/
> interAPtiv MPF, Loongson-2K, Cavium CN7130 (EdgeRouter 4), and an
> unannounced interaptiv UP MT platform with EIC.
> 
> I don't really know broadcom platforms and SGI platforms well so
> changes to those platforms are kept minimal (no functional change).

Performed a boot-up and some smoke multi-threaded tests on a SoC with
2x MIPS P5600 cores and MIPS GIC. No immediate problem was found. So

Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Please review.
> Thanks
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Build warning fixes
> - Massage commit messages
> - Link to v1: https://lore.kernel.org/r/20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com
> 
> ---
> Jiaxun Yang (10):
>       MIPS: smp: Make IPI interrupts scalable
>       MIPS: smp: Manage IPI interrupts as percpu_devid interrupts
>       MIPS: smp: Provide platform IPI virq & domain hooks
>       MIPS: Move mips_smp_ipi_init call after prepare_cpus
>       MIPS: smp: Implement IPI stats
>       irqchip: irq-mips-gic: Switch to ipi_mux
>       MIPS: Implement get_mips_sw_int hook
>       MIPS: GIC: Implement get_sw_int hook
>       irqchip: irq-mips-cpu: Rework software IRQ handling flow
>       MIPS: smp-mt: Rework IPI functions
> 
>  arch/mips/Kconfig                     |   2 +
>  arch/mips/cavium-octeon/smp.c         | 111 ++++++------------
>  arch/mips/fw/arc/init.c               |   1 -
>  arch/mips/generic/irq.c               |  15 +++
>  arch/mips/include/asm/ipi.h           |  71 ++++++++++++
>  arch/mips/include/asm/irq.h           |   1 +
>  arch/mips/include/asm/irq_cpu.h       |   3 +
>  arch/mips/include/asm/mips-gic.h      |  10 ++
>  arch/mips/include/asm/octeon/octeon.h |   2 +
>  arch/mips/include/asm/smp-ops.h       |   8 +-
>  arch/mips/include/asm/smp.h           |  42 +++----
>  arch/mips/kernel/irq.c                |  21 ++++
>  arch/mips/kernel/smp-bmips.c          |  43 ++++---
>  arch/mips/kernel/smp-cps.c            |   2 +
>  arch/mips/kernel/smp-mt.c             |  70 +++++++++++
>  arch/mips/kernel/smp.c                | 213 +++++++++++++++++++++-------------
>  arch/mips/loongson64/smp.c            |  52 +++++----
>  arch/mips/mm/c-octeon.c               |   3 +-
>  arch/mips/sgi-ip27/ip27-smp.c         |  15 ++-
>  arch/mips/sgi-ip30/ip30-smp.c         |  15 ++-
>  arch/mips/sibyte/bcm1480/smp.c        |  19 +--
>  arch/mips/sibyte/sb1250/smp.c         |  13 ++-
>  drivers/irqchip/Kconfig               |   2 +-
>  drivers/irqchip/irq-mips-cpu.c        | 180 ++++++++--------------------
>  drivers/irqchip/irq-mips-gic.c        | 213 +++++++++++++---------------------
>  25 files changed, 596 insertions(+), 531 deletions(-)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240616-b4-mips-ipi-improvements-f8c86b1dc677
> 
> Best regards,
> -- 
> Jiaxun Yang <jiaxun.yang@flygoat.com>
> 

