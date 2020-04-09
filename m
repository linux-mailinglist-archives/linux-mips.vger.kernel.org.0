Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF511A3250
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 12:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgDIKNm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 06:13:42 -0400
Received: from foss.arm.com ([217.140.110.172]:48000 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgDIKNm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Apr 2020 06:13:42 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2922D31B;
        Thu,  9 Apr 2020 03:13:42 -0700 (PDT)
Received: from bogus (unknown [10.37.12.63])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A5833F73D;
        Thu,  9 Apr 2020 03:13:33 -0700 (PDT)
Date:   Thu, 9 Apr 2020 11:13:30 +0100
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
        Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Richard Fontana <rfontana@redhat.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Peter Xu <peterx@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Subject: Re: [PATCH 03/12] arch_topology: Make it avilable for MIPS
Message-ID: <20200409101330.GB25948@bogus>
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
 <20200408113505.2528103-4-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408113505.2528103-4-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 08, 2020 at 07:34:13PM +0800, Jiaxun Yang wrote:
> Simply drop unnecessary archtecture limitions and add dummy
> function for platforms without OF/COMMON_CLK support.
> Also exclude functions for arm that existed in platform code.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/base/arch_topology.c | 121 +++++++++++++++++++----------------
>  1 file changed, 66 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 4d0a0038b476..9c2405d08dae 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -143,57 +143,6 @@ void topology_normalize_cpu_scale(void)
>  	}
>  }
>

[...]

>  #ifdef CONFIG_CPU_FREQ
>  static cpumask_var_t cpus_to_visit;
>  static void parsing_done_workfn(struct work_struct *work);
> @@ -275,7 +224,64 @@ static void parsing_done_workfn(struct work_struct *work)
>  core_initcall(free_raw_capacity);
>  #endif
>
> -#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> +#if defined(CONFIG_OF) && !defined(CONFIG_ARM)

topology_parse_cpu_capacity is used even on ARM, so you can't do the above.

> +#if defined(CONFIG_COMMON_CLK)

Not required, it will either fail in of_clk_get or clk_get_rate if the
platform doesn't support.

[...]

> -#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> +#if !defined(CONFIG_ARM)

I think we need to see if we can merge ARM support too or rename these
functions in ARM. Since we wanted to keep changes minimum when we moved
ARM64 and RISCV to common, we skipped ARM. May be worth giving it a shot ?

--
Regards,
Sudeep
