Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3391E542833
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jun 2022 09:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbiFHHcD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jun 2022 03:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354549AbiFHGTk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Jun 2022 02:19:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02FD36330;
        Tue,  7 Jun 2022 23:13:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9BB3EB8259F;
        Wed,  8 Jun 2022 06:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599A5C34116;
        Wed,  8 Jun 2022 06:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654668807;
        bh=+tGU0kDGt9VkoZ/wddxpu2C3Os/w5qVmkhL4xgFsvmw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=So7YcT2bKK9jBf+p3nAGjPzyymGbv2C7K53kuPxonWdlWuSQWUjBt8iLkP+clNU5v
         0bLRY7e9KKZWxUvXPUrP8Hm8KrGlJRhQ3sTjuWJXumerdH0x6YN2UXpfb+uMyvIIYh
         wIkXdL2UcTMp09uqQDZsTlfSxI+rWaVxw5Z5zKyREcYCXdYj7jG24VgzpJeQ5zD6sW
         cl/LtcJYoTn4XqqYyJtgOctv0yNagdk1hsaSg197qBZO2vrS5+0RaXuXmDD5DFWUcE
         /Wl7bdQfc7qHcjZ5ejUg9/iWVthAI70gjszPPiFmtHd1E6DG4H8bp0yjEjT7IpQdj4
         rGINXPcJ4gQ6g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nyowW-00GVju-S1; Wed, 08 Jun 2022 07:13:24 +0100
Date:   Wed, 08 Jun 2022 07:13:24 +0100
Message-ID: <87o7z3znqz.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Chao-ying Fu <cfu@wavecomp.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@kernel.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v2 11/12] MIPS: Report cluster in /proc/cpuinfo
In-Reply-To: <bf97d10b-d5c9-46d6-c440-fc7de09c3abf@flygoat.com>
References: <20220525121030.16054-1-Dragan.Mladjenovic@syrmia.com>
        <20220525121030.16054-12-Dragan.Mladjenovic@syrmia.com>
        <87sfoi3pek.wl-maz@kernel.org>
        <bf97d10b-d5c9-46d6-c440-fc7de09c3abf@flygoat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, Dragan.Mladjenovic@syrmia.com, tsbogend@alpha.franken.de, cfu@wavecomp.com, daniel.lezcano@linaro.org, geert@linux-m68k.org, gerg@kernel.org, hauke@hauke-m.de, ilya.lipnitskiy@gmail.com, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, paulburton@kernel.org, peterz@infradead.org, fancer.lancer@gmail.com, tglx@linutronix.de, yangtiezhu@loongson.cn
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 07 Jun 2022 19:27:36 +0100,
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>=20
>=20
>=20
> =E5=9C=A8 2022/6/6 14:14, Marc Zyngier =E5=86=99=E9=81=93:
> > On Wed, 25 May 2022 13:10:29 +0100,
> > Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com> wrote:
> >> From: Paul Burton <paulburton@kernel.org>
> >>=20
> >> When >=3D CM3.5 output cluster number.
> >>=20
> >> Signed-off-by: Paul Burton <paulburton@kernel.org>
> >> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> >>=20
> >> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> >> index bb43bf850314..a66e7705315d 100644
> >> --- a/arch/mips/kernel/proc.c
> >> +++ b/arch/mips/kernel/proc.c
> >> @@ -12,6 +12,7 @@
> >>   #include <asm/cpu.h>
> >>   #include <asm/cpu-features.h>
> >>   #include <asm/idle.h>
> >> +#include <asm/mips-cps.h>
> >>   #include <asm/mipsregs.h>
> >>   #include <asm/processor.h>
> >>   #include <asm/prom.h>
> >> @@ -282,6 +283,8 @@ static int show_cpuinfo(struct seq_file *m, void *=
v)
> >>   	seq_printf(m, "kscratch registers\t: %d\n",
> >>   		      hweight8(cpu_data[n].kscratch_mask));
> >>   	seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
> >> +	if (mips_cm_revision() >=3D CM_REV_CM3_5)
> >> +		seq_printf(m, "cluster\t\t\t: %d\n", cpu_cluster(&cpu_data[n]));
> >>   	seq_printf(m, "core\t\t\t: %d\n", cpu_core(&cpu_data[n]));
> >>     #if defined(CONFIG_MIPS_MT_SMP) || defined(CONFIG_CPU_MIPSR6)
> > This will break userspace. Please don't do that.
> Hmm, userspace always parse cpuinfo line by line so I guess it won't be
> a problem if we add a new line here.

Given that you cannot audit all userspace, this is a pretty bold
statement ;-).

> We accumulated some new additions to cpuinfo in past years and there
> was never a single complain for that.

Consider yourself lucky. Other architectures have see tons of
regressions as soon as a /proc file was updated.

> Though I don't like the idea of using CM version to switch on the
> cluster display....

But the other question is *what information* does this bring to a
user? Very little, if at all. And if you want to this to be exhaustive
and usable by SW that runs across architectures, then providing
accurate and parseable topology information is the way to do it, using
a standard interface:

maz@valley-girl:~$ ls -1 /sys/devices/system/cpu/cpu0/topology/
cluster_cpus
cluster_cpus_list
cluster_id
core_cpus
core_cpus_list
core_id
core_siblings
core_siblings_list
package_cpus
package_cpus_list
physical_package_id
thread_siblings
thread_siblings_list

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.
