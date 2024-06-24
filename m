Return-Path: <linux-mips+bounces-3904-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAFE9157AA
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 22:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1411D1C21241
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 20:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038EC1A0702;
	Mon, 24 Jun 2024 20:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQK85FJb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5881A01DE;
	Mon, 24 Jun 2024 20:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719259972; cv=none; b=YUxEzDUyqbmTkfxQbju6DGGYcd0cQTfpn2tbA6gtKj6RPThuA8lhUsVfa3sQlePDUhM6UMRIT02oV3Bxlr58s0uaSc5UrToEbCRHef4RyF6YXw3LM2mdd1t1T2U3+H8O3ERIrv1xrInbR0m6nRomSd3TY1nlC/Wmxh9BaDX+Pac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719259972; c=relaxed/simple;
	bh=yFtE17HTlosHIVcFUM4z1zvLxD7sJ9qun5JCnkP3TKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKGKK5CJuD24JsX6vsdePLwKQFD6CbEY+zSCU9OBCqpLQAT7vuAE10v80EylWTVU/PgEbIfZtvvWB4ysDBzp2PhfAmWi2iKXQ4rm90mI9KQ3KRFWIM4b8UIz0HDV//Exn4duz31T5rB6zSvgRkv6MwsdnnyVf/f0Gm8+NhZZJQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQK85FJb; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso3111153e87.3;
        Mon, 24 Jun 2024 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719259969; x=1719864769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FG0rjkLNtZEXx+lFuMZgaZtLjyrE4I+sN/EHPPKJNHg=;
        b=GQK85FJbaFnE4addopqDmy9l9mVIDhhBhJ7PvhK/K+QH48FAl3s7VUPPBJIa0Ex+bO
         gl3oNmIxNtVQSdDxcU/6jy576/n1Jth+XhYIUrerdGDi7BwlQZ+UHszoqoYYM4rObxIt
         eYySsyKrZ2IFwS/tEXXq8Kv12aYpq8WQ2X8i0CXiJbYjwOYmZ5Hy/nxFMTBsyvSn5hus
         83nAgL2PIOvHWCqnSNQvZiQ9w4c47za/ah39DjksBQ1ire3fu+DM3bsQ8zOADfUPOER5
         u4zj1avcZvCsIo0ugz5dJQZZmgQ+R//UwOLyb5yaLyPTuD1l3c9TgFETKG4qLOQX00Dk
         vf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719259969; x=1719864769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG0rjkLNtZEXx+lFuMZgaZtLjyrE4I+sN/EHPPKJNHg=;
        b=fTfCCRO5HUMk92WUbGOzFGkhRBhrqaP3LHf3RGEzlmCCZXVNyCrH8qK0CgfJriL5n7
         NYAfOVk+Qweajc+91BHj41ec4PedU/NKO2XjZp54Fn041omTEXoYnfPmZCIox0Dn6+5I
         qtU7QyV26EuuXb7ZJyizM6piTvjkF/W5bS3zD1DE9tghMxovzFlubolmXcljdnJXMW3a
         PzC6loSqjXjH39VX1ACOWwSUaiLyktT07/B0la+lXOEOwx6b4+WOGLVAF+xz2qPYXQ4p
         +E7MERevNd0YmnHz6S2SsBcU2crMYOuQyh6rocPM5KC19r1Ny+hJsoL3Ex4k3pzcciz1
         lfGg==
X-Forwarded-Encrypted: i=1; AJvYcCWw92vorZrzWmX7PuL8C0IYU3qhrbf4PEEwfrYcY5FqYpi7GxfYkBXW1ZlHtQz8RuS0DCwjvsWjswuwHnj4Bfn3i6RDuMZndm9aG0wBrkpW5Qbm7YcDEfbJgicvizr0gPkfeL4T2Rc0qg==
X-Gm-Message-State: AOJu0YyGbaRci/dNS9HBU6mX7lYpWTz1ABqKlH7o0UcpoM4t1uhXHOwp
	JngmMHjTBp32slAzLoDllRltwt1wjg8mZtkWSmf4fTLSqir0qDdEdWAMGUFD
X-Google-Smtp-Source: AGHT+IGFJh01j7ehf+ir7t82LIj+iFCc3aatWl+En4SYM8wyeKmG2RWRNueymHtHMSB7O7vCBgY5xg==
X-Received: by 2002:ac2:464d:0:b0:52c:a88b:9997 with SMTP id 2adb3069b0e04-52ce185d20dmr4288140e87.49.1719259968861;
        Mon, 24 Jun 2024 13:12:48 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cda72b401sm959645e87.136.2024.06.24.13.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 13:12:48 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:12:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Chao-ying Fu <cfu@wavecomp.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Paul Burton <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 00/14] MIPS: Support I6500 multi-cluster configuration
Message-ID: <sshcqxwvt7gh4log4u7prw6udsd5k23wpautiocuwitapajhur@bffjuaeoxtaq>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>

Hi folks,

On Sat, May 11, 2024 at 12:43:27PM +0200, Aleksandar Rikalo wrote:
> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> 1 cluster/4 VPU configurations.

Finally got it tested on my P5600-based SoC. No problems has been
spotted. So for the entire patchset:

Tested-by: Serge Semin <fancer.lancer@gmail.com>

> 
> v4:
>  - Re-base onto the master branch, with no functionality impact.


>  - Refactor MIPS FDC driver in the context of multicluster support.

I failed to see anything useful in the MIPS FDC refactoring. Besides
there is no patches utilizing the change provided in the patches 13
and 14 with the refactoring. The commits log don't well justify the
changes either. Moreover the commit log of the patch providing the
actual refactoring says "Separate the FDC driver code into two parts,
common and mips-specific." Has _MIPS_ FDC been utilized in some
non-MIPS arch, or what?

To sum up I'd drop the FDC refactoring patches from these series and
have them added to the patchset where the changes are actually needed
(if there is one).

-Serge(y)

> 
> v3:
>  - Add Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com> for the patch 02/12.
>  - Add the changes requested by Marc Zyngier for the 3/12 patch.
>  - Remove the patch 11/12 (a consequence of a discussion between Jiaxun Yang
>    and Marc Zyngier.
>  - Re-base onto the master branch, with no functionality impact.
> 
> v2:
>  - Apply correct Signed-off-by to avoid confusion.
> 
> Aleksandar Rikalo (3):
>   mips: Enable FDC on MIPS R6 platforms.
>   mips: Move FDC driver to a separate directory
>   mips: FDC driver refactor
> 
> Chao-ying Fu (1):
>   irqchip: mips-gic: Setup defaults in each cluster
> 
> Paul Burton (10):
>   MIPS: CPS: Add a couple of multi-cluster utility functions
>   MIPS: GIC: Generate redirect block accessors
>   irqchip: mips-gic: Introduce for_each_online_cpu_gic()
>   irqchip: mips-gic: Support multi-cluster in for_each_online_cpu_gic()
>   irqchip: mips-gic: Multi-cluster support
>   clocksource: mips-gic-timer: Always use cluster 0 counter as
>     clocksource
>   clocksource: mips-gic-timer: Enable counter when CPUs start
>   MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
>   MIPS: CPS: Introduce struct cluster_boot_config
>   MIPS: CPS: Boot CPUs in secondary clusters
> 
>  arch/mips/include/asm/mips-cm.h               |  18 ++
>  arch/mips/include/asm/mips-cps.h              |  38 +++
>  arch/mips/include/asm/mips-gic.h              |  50 ++-
>  arch/mips/include/asm/smp-cps.h               |   7 +-
>  arch/mips/kernel/asm-offsets.c                |   3 +
>  arch/mips/kernel/cps-vec.S                    |  19 +-
>  arch/mips/kernel/mips-cm.c                    |  41 ++-
>  arch/mips/kernel/pm-cps.c                     |  35 ++-
>  arch/mips/kernel/smp-cps.c                    | 288 ++++++++++++++----
>  drivers/bus/Kconfig                           |   2 +-
>  drivers/clocksource/mips-gic-timer.c          |  45 ++-
>  drivers/irqchip/Kconfig                       |   1 +
>  drivers/irqchip/irq-mips-gic.c                | 276 ++++++++++++++---
>  drivers/tty/Makefile                          |   2 +-
>  drivers/tty/mips_fdc/Makefile                 |   4 +
>  drivers/tty/mips_fdc/ejtag-fdc-mips.c         |  29 ++
>  .../ejtag-fdc.c}                              |  66 +---
>  drivers/tty/mips_fdc/ejtag-fdc.h              |  55 ++++
>  18 files changed, 794 insertions(+), 185 deletions(-)
>  create mode 100644 drivers/tty/mips_fdc/Makefile
>  create mode 100644 drivers/tty/mips_fdc/ejtag-fdc-mips.c
>  rename drivers/tty/{mips_ejtag_fdc.c => mips_fdc/ejtag-fdc.c} (92%)
>  create mode 100644 drivers/tty/mips_fdc/ejtag-fdc.h
> 
> -- 
> 2.25.1
> 

