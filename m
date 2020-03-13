Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8305A184CCE
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2020 17:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgCMQrz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Mar 2020 12:47:55 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40931 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgCMQrz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Mar 2020 12:47:55 -0400
Received: by mail-pg1-f196.google.com with SMTP id t24so5301841pgj.7;
        Fri, 13 Mar 2020 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KV6MXizQl2EQtb2GS7sc4PeNvf+1aSQqTf3SkUL8FCs=;
        b=FZC5iuQBEjOOouPc7R4fBUJh/Vyuhen8RnJnZDyJTxNAxIHvMlCB9DGm9Q1te7ElLk
         E7Y4XK+19BxYhEhL3hcfKGhkGd+4DxGVrxpXNBb0bRxEwbtqISwK/oQ59vsGs9gEhaFN
         VpikV7y82/akhBkyhIc2R/3CL94yT60HY1pGeFhrpTsYrFl7CM/czaE8qndB7tFi0xtK
         A4tf6XDok9PKYgqfTjKg/EfPg9buqIX7DCL3xiBmavdRAAp3n1SdqZiCf3FsWEjBns9o
         xLmZnIMwtaZlY+Hjg3d/OELWSZ8Lc3R8WRNr0JdP5a0WiEToA5GWSlDn2Yy2Q7xwDQ4e
         QVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=KV6MXizQl2EQtb2GS7sc4PeNvf+1aSQqTf3SkUL8FCs=;
        b=ikRQVOCamAAucs6DjaQCscGK+MI/k35dTHy14artNbR2qSeboZuo9Uixjq1/B6jl6w
         5zB+yn2wzbLDhkoaCH1BcTswMXA0zE8eIav3cGjoHBJFgORwjPYB60WquPDTbl8Zae4h
         Vn6X/WBjPjkU7sTP2x+PyCQ6uysZ3SWaj+yOrZ9XM9EGrri9L6/Eer7Lpn24Cvz6z7k/
         toLMEGrD4v20Zb9vwb6eatQEC308tKXA21/pDduvD0TnHcGjn6vqWWGDCz3Nso2X44FS
         FjHn8JGo6q3ik92F/ldnKZRovqkcDRq101GPlD3UFNnYcTNauC+CITIJNHb6URN9kyCw
         BdJQ==
X-Gm-Message-State: ANhLgQ0f3pU88vQOZeGzwTsqi2pYkyBVrrvKBRYhZHdqklVVqYSuj21s
        NZvk/heGaOBFJGgk9usjpsG6GNV+
X-Google-Smtp-Source: ADFU+vuPO3GHP9BVqhQV8CoSMSeBWz+CnESs00u/cLxaePjAv/lamoVNtFMUduN+GLB/NM/UHIzEVA==
X-Received: by 2002:a63:112:: with SMTP id 18mr13704404pgb.116.1584118073221;
        Fri, 13 Mar 2020 09:47:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l11sm12279036pjy.44.2020.03.13.09.47.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 09:47:52 -0700 (PDT)
Date:   Fri, 13 Mar 2020 09:47:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200313164751.GA30134@roeck-us.net>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 05, 2020 at 05:27:53PM +0530, afzal mohammed wrote:
> request_irq() is preferred over setup_irq(). Invocations of setup_irq()
> occur after memory allocators are ready.
> 
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
> 
> Hence replace setup_irq() by request_irq().
> 
> remove_irq() has been replaced by free_irq() as well.
> 
> There were build error's during previous version, couple of which was
> reported by kbuild test robot <lkp@intel.com> of which one was reported
> by Thomas Bogendoerfer <tsbogend@alpha.franken.de> as well. There were a
> few more issues including build errors, those also have been fixed.
> 
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
> 
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>

This patch causes all my mips qemu emulations to hang during boot. This affects
all mips, mips64, mipsel, and mipsel64 emulations.

Reverting this patch fixes the problem.

Example log:

...
Failed to request irq 23 (timer)
clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112584971 ns
sched_clock: 32 bits at 100MHz, resolution 9ns, wraps every 21474814971ns
Console: colour dummy device 80x25
printk: console [tty0] enabled
printk: bootconsole [uart8250] disabled

[ silence ]

Bisect log attached.

Guenter

---
# bad: [2e602db729948ce577bf07e2b113f2aa806b62c7] Add linux-next specific files for 20200313
# good: [2c523b344dfa65a3738e7039832044aa133c75fb] Linux 5.6-rc5
git bisect start 'HEAD' 'v5.6-rc5'
# bad: [acfda12b3a9b7b8d8cb4ff5f6ff0e48f688e254c] Merge remote-tracking branch 'spi-nor/spi-nor/next'
git bisect bad acfda12b3a9b7b8d8cb4ff5f6ff0e48f688e254c
# bad: [bfd143114215b2c553277ee8ae4a8b8a6201de2e] Merge remote-tracking branch 'pstore/for-next/pstore'
git bisect bad bfd143114215b2c553277ee8ae4a8b8a6201de2e
# good: [9e771e47962b731c28d1b0a12967f711bf5cc281] Merge remote-tracking branch 'scmi/for-linux-next'
git bisect good 9e771e47962b731c28d1b0a12967f711bf5cc281
# bad: [cee36340e05bf662d19cb845708fa881369ed583] Merge remote-tracking branch 'xtensa/xtensa-for-next'
git bisect bad cee36340e05bf662d19cb845708fa881369ed583
# bad: [95c7851a03071bd2374b84b4f0079b3dcae30614] Merge remote-tracking branch 'nds32/next'
git bisect bad 95c7851a03071bd2374b84b4f0079b3dcae30614
# good: [43a3834a7d0fbb9116649185ff0926968cc553d5] Merge remote-tracking branch 'tegra/for-next'
git bisect good 43a3834a7d0fbb9116649185ff0926968cc553d5
# good: [8fae22fc750017fdf998ec3aa1315741fd3de857] Merge remote-tracking branch 'h8300/h8300-next'
git bisect good 8fae22fc750017fdf998ec3aa1315741fd3de857
# good: [e798861fd7b297370a8dd7b8dad2e139c1d08446] Merge remote-tracking branch 'm68knommu/for-next'
git bisect good e798861fd7b297370a8dd7b8dad2e139c1d08446
# bad: [ac8fd122e070ce0e60c608d4f085f7af77290844] MIPS: Replace setup_irq() by request_irq()
git bisect bad ac8fd122e070ce0e60c608d4f085f7af77290844
# good: [f6541f347bba6edbcbb1c930f802bb80b0c56468] MIPS: configs: Cleanup old Kconfig options
git bisect good f6541f347bba6edbcbb1c930f802bb80b0c56468
# good: [e5096625bc6bd9e3a0d5f7f9d7ecebda0383c7f5] MIPS: pic32mzda: Drop pointless static qualifier
git bisect good e5096625bc6bd9e3a0d5f7f9d7ecebda0383c7f5
# good: [172a37e9d011510aee37f62cc5ac4e53e49d17bb] arch/mips: change duplicated word in NUMA help text
git bisect good 172a37e9d011510aee37f62cc5ac4e53e49d17bb
# good: [792a402c2840054533ef56279c212ef6da87d811] MIPS: OCTEON: irq: Fix potential NULL pointer dereference
git bisect good 792a402c2840054533ef56279c212ef6da87d811
# first bad commit: [ac8fd122e070ce0e60c608d4f085f7af77290844] MIPS: Replace setup_irq() by request_irq()
