Return-Path: <linux-mips+bounces-4134-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7D9276F8
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2024 15:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10F2D1F24EA6
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2024 13:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB3C1ABCCC;
	Thu,  4 Jul 2024 13:15:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C146191F69;
	Thu,  4 Jul 2024 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098916; cv=none; b=NOALWqR8T2boFwZUtAUfmIuT5Bn3VseXQd56vqXHxG/XSHmlFJwlHduaqOHBQphRpVk2hFHF/T7doGtFu8wbNLNY9rHza3mFFGgdonZbMosXIaQwye0bOpuxFAGpRT0ZwAwfU1c7EOTZtmTsvy7W2H1mspNB31dJArxcohpsVeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098916; c=relaxed/simple;
	bh=MFX7kZkRTYN9b0VDd+CSSOrsnZhZlsjPvngX0p0a8iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWuj5b4ke/EM978jO7cE+X11GZG5RN+ZArmd60lrLzblh6csnnAzQOH45b/fhTbJQCyeGqn8Z5uevri6S5bLzMapvD6iT4dFRHF9e/FFP62g1Q0iN7Bab14vgzWDucYnFIa2omI7dufj8rwKRa5RSdj9sRCxkTpgSpW3NjrQWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sPMIZ-0002xf-00; Thu, 04 Jul 2024 15:14:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B8138C0120; Thu,  4 Jul 2024 15:14:38 +0200 (CEST)
Date: Thu, 4 Jul 2024 15:14:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
Message-ID: <ZoagPhyg9WFjc1b/@alpha.franken.de>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com>
 <ZoVokcDYqZnuqd2X@alpha.franken.de>
 <7a822a33-dd67-4827-bbd0-01e75e203951@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a822a33-dd67-4827-bbd0-01e75e203951@app.fastmail.com>

On Thu, Jul 04, 2024 at 04:15:21AM +0800, Jiaxun Yang wrote:
> 
> 
> 在2024年7月3日七月 下午11:04，Thomas Bogendoerfer写道：
> > On Sun, Jun 16, 2024 at 10:03:05PM +0100, Jiaxun Yang wrote:
> >> Define enum ipi_message_type as other architectures did to
> >> allow easy extension to number of IPI interrupts, fiddle
> >> around platform IPI code to adopt to the new infra, add
> >> extensive BUILD_BUG_ON on IPI numbers to ensure future
> >> extensions won't break existing platforms.
> >> 
> >> IPI related stuff are pulled to asm/ipi.h to avoid include
> >> linux/interrupt.h in asm/smp.h.
> >> 
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>  arch/mips/cavium-octeon/smp.c   | 109 ++++++++++++-----------------------
> >>  arch/mips/include/asm/ipi.h     |  34 +++++++++++
> >>  arch/mips/include/asm/smp-ops.h |   8 +--
> >>  arch/mips/include/asm/smp.h     |  42 ++++++--------
> >>  arch/mips/kernel/smp-bmips.c    |  43 +++++++-------
> >>  arch/mips/kernel/smp-cps.c      |   1 +
> >>  arch/mips/kernel/smp.c          | 124 ++++++++++++++++++++--------------------
> >>  arch/mips/loongson64/smp.c      |  51 +++++++++--------
> >>  arch/mips/mm/c-octeon.c         |   2 +-
> >>  arch/mips/sgi-ip27/ip27-smp.c   |  15 +++--
> >>  arch/mips/sgi-ip30/ip30-smp.c   |  15 +++--
> >>  arch/mips/sibyte/bcm1480/smp.c  |  19 +++---
> >>  arch/mips/sibyte/sb1250/smp.c   |  13 +++--
> >>  13 files changed, 236 insertions(+), 240 deletions(-)
> >
> > you are touching a lot of platforms, how many did you test ?
> 
> As mentioned in cover letter:
> 
> ```
> It has been tested on MIPS Boston I6500, malta SOC-It, Loongson-2K,
> Cavium CN7130 (EdgeRouter 4), and an unannounced interaptiv UP MT
> platform with EIC.
> 
> I don't really know broadcom platforms and SGI platforms well so
> changes to those platforms are kept minimal (no functional change).

I get a merge conflict in arch/mips/loongson64/smp.c and see following
warnings:

IP30 build:

  CC      arch/mips/fw/arc/init.o
In file included from /local/tbogendoerfer/korg/linux/arch/mips/fw/arc/init.c:15:
/local/tbogendoerfer/korg/linux/arch/mips/include/asm/smp-ops.h:23:40: error: ‘enum ipi_message_type’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   23 |  void (*send_ipi_single)(int cpu, enum ipi_message_type op);
      |                                        ^~~~~~~~~~~~~~~~
/local/tbogendoerfer/korg/linux/arch/mips/include/asm/smp-ops.h:24:57: error: ‘enum ipi_message_type’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   24 |  void (*send_ipi_mask)(const struct cpumask *mask, enum ipi_message_type op);
      |   

/local/tbogendoerfer/korg/linux/arch/mips/kernel/smp.c: In function ‘smp_prepare_cpus’:
/local/tbogendoerfer/korg/linux/arch/mips/kernel/smp.c:475:6: warning: unused variable ‘rc’ [-Wunused-variable]
  475 |  int rc;

/local/tbogendoerfer/korg/linux/arch/mips/include/asm/ipi.h:49:13: warning: ‘mips_smp_show_ipi_stats’ defined but not used [-Wunused-function]
   49 | static void mips_smp_show_ipi_stats(struct seq_file *p, int prec)


bcm1480 build:

/local/tbogendoerfer/korg/linux/arch/mips/kernel/smp.c: In function ‘smp_prepare_cpus’:
/local/tbogendoerfer/korg/linux/arch/mips/kernel/smp.c:475:6: warning: unused variable ‘rc’ [-Wunused-variable]
  475 |  int rc;
      |      ^~

In file included from /local/tbogendoerfer/korg/linux/arch/mips/kernel/smp.c:34:
At top level:
/local/tbogendoerfer/korg/linux/arch/mips/include/asm/ipi.h:49:13: warning: ‘mips_smp_show_ipi_stats’ defined but not used [-Wunused-function]
   49 | static void mips_smp_show_ipi_stats(struct seq_file *p, int prec)

octeon build:

/local/tbogendoerfer/korg/linux/arch/mips/cavium-octeon/smp.c:84:6: warning: no previous prototype for ‘octeon_send_ipi_single’ [-Wmissing-prototypes]
   84 | void octeon_send_ipi_single(int cpu, enum ipi_message_type op)
      |      ^~~~~~~~~~~~~~~~~~~~~~
In file included from /local/tbogendoerfer/korg/linux/arch/mips/cavium-octeon/smp.c:20:
/local/tbogendoerfer/korg/linux/arch/mips/include/asm/ipi.h:49:13: warning: ‘mips_smp_show_ipi_stats’ defined but not used [-Wunused-function]
   49 | static void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
      |             ^~~~~~~~~~~~~~~~~~~~~~~
 
/local/tbogendoerfer/korg/linux/arch/mips/kernel/smp.c: In function ‘smp_prepare_cpus’:
/local/tbogendoerfer/korg/linux/arch/mips/kernel/smp.c:475:6: warning: unused variable ‘rc’ [-Wunused-variable]
  475 |  int rc;

/local/tbogendoerfer/korg/linux/arch/mips/include/asm/ipi.h:49:13: warning: ‘mips_smp_show_ipi_stats’ defined but not used [-Wunused-function]
   49 | static void mips_smp_show_ipi_stats(struct seq_file *p, int prec)

Please fix.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

