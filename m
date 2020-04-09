Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484EE1A3281
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 12:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgDIKbd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 06:31:33 -0400
Received: from foss.arm.com ([217.140.110.172]:48268 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgDIKbd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Apr 2020 06:31:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A694031B;
        Thu,  9 Apr 2020 03:31:33 -0700 (PDT)
Received: from bogus (unknown [10.37.12.63])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D8893F73D;
        Thu,  9 Apr 2020 03:31:24 -0700 (PDT)
Date:   Thu, 9 Apr 2020 11:31:21 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Robert Richter <rric@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Richard Fontana <rfontana@redhat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Peter Xu <peterx@redhat.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Subject: Re: [PATCH 05/12] MIPS: Switch to arch_topology
Message-ID: <20200409103121.GD25948@bogus>
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
 <20200408113505.2528103-6-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408113505.2528103-6-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 08, 2020 at 07:34:15PM +0800, Jiaxun Yang wrote:
> Previously, MIPS is using self-defined "globalnumber" in struct
> mips_cpuinfo to store topology information. However, it's not friendly
> to DeviceTree based systems and lack of cpu_capacity related feature
> which can take advantage of multi-cluster system.
>
> Here, we enabled arch_topology for MIPS and adapted some functions
> to fit arch_topology structure.
> Also, we implmented smp_store_cpu_info to probe CPU's topology information
> by "globalnumber" registers in VP ASE or Ebase.CPUNum for legacy systems.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig                |  1 +
>  arch/mips/include/asm/cpu-info.h | 49 ----------------------------
>  arch/mips/include/asm/smp.h      |  2 --
>  arch/mips/include/asm/topology.h | 48 +++++++++++++++++++++++++---
>  arch/mips/kernel/cpu-probe.c     | 43 -------------------------
>  arch/mips/kernel/setup.c         |  1 +
>  arch/mips/kernel/smp.c           | 55 ++++----------------------------
>  arch/mips/kernel/topology.c      | 42 ++++++++++++++++++++++++
>  8 files changed, 93 insertions(+), 148 deletions(-)
>

[...]

> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 8a418783a6bb..b9fefc5dc702 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -784,6 +784,7 @@ void __init setup_arch(char **cmdline_p)
>  	dmi_setup();
>
>  	resource_init();
> +	init_cpu_topology();
>  	plat_smp_setup();
>

Continuing my reply on previous patch, I see possible_cpu_mask being
set up in plat_smp_setup. Why not reverse the order above. Further I see
that the logical->physical CPU mapping is done in plat_smp_setup which
is required to store/save any topology information.

--
Regards,
Sudeep
