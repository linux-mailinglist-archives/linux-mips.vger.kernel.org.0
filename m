Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1171A331B
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 13:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDILVn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 07:21:43 -0400
Received: from m228-6.mailgun.net ([159.135.228.6]:16199 "EHLO
        m228-6.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgDILVn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 07:21:43 -0400
X-Greylist: delayed 349 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Apr 2020 07:21:40 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=flygoat.com; q=dns/txt; s=pic;
 t=1586431303; h=Content-Transfer-Encoding: Content-Type: MIME-Version:
 References: In-Reply-To: Message-ID: Subject: Cc: To: From: Date:
 Sender; bh=Y+6YW93LOyjZAk7Nh1dZncY1hyBBq703bBKXnSnGJAM=; b=BdoScYQnSYaI/cY26hJc1HCCCt8k4FEW7pMUyWIZSNjGKC1Snd02CllI5ORH7qH1wHdjvg4u
 zmtLQmvB8iejGnjUvBveAjiDC3wao5gIDtrTL6jBXItiWubyR9ft7NGj5NQKr9XBCzP8nKJ+
 Hy0oPxInh+E9yGp7JkULXKZbzRc=
X-Mailgun-Sending-Ip: 159.135.228.6
X-Mailgun-Sid: WyI2NzVlYyIsICJsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZyIsICJkNWIzMDRhIl0=
X-Mailgun-Batch-Id: 5e8f01f3b030e6cee349d1bc
Received: from flygoat-x1e (Unknown [122.235.212.87])
 by mxa.mailgun.org with ESMTP id 5e8f01f3.7f95148394b0-smtp-out-n02;
 Thu, 09 Apr 2020 11:07:31 -0000 (UTC)
Date:   Thu, 9 Apr 2020 19:07:13 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
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
        Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Re: [PATCH 05/12] MIPS: Switch to arch_topology
Message-ID: <20200409190713.3a695115@flygoat-x1e>
In-Reply-To: <20200409105832.GF25948@bogus>
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
        <20200408113505.2528103-6-jiaxun.yang@flygoat.com>
        <20200409103121.GD25948@bogus>
        <C2794910-48A0-4472-953A-13F40BA39423@flygoat.com>
        <20200409105832.GF25948@bogus>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 9 Apr 2020 11:58:32 +0100
Sudeep Holla <sudeep.holla@arm.com> wrote:

> On Thu, Apr 09, 2020 at 06:35:21PM +0800, Jiaxun Yang wrote:
> >
> >
> > =E4=BA=8E 2020=E5=B9=B44=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=886:31:21, Sudeep Holla
> > <sudeep.holla@arm.com> =E5=86=99=E5=88=B0: =20
> > >On Wed, Apr 08, 2020 at 07:34:15PM +0800, Jiaxun Yang wrote: =20
> > >> Previously, MIPS is using self-defined "globalnumber" in struct
> > >> mips_cpuinfo to store topology information. However, it's not =20
> > >friendly =20
> > >> to DeviceTree based systems and lack of cpu_capacity related
> > >> feature which can take advantage of multi-cluster system.
> > >>
> > >> Here, we enabled arch_topology for MIPS and adapted some
> > >> functions to fit arch_topology structure.
> > >> Also, we implmented smp_store_cpu_info to probe CPU's topology =20
> > >information =20
> > >> by "globalnumber" registers in VP ASE or Ebase.CPUNum for legacy
> > >> =20
> > >systems. =20
> > >>
> > >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >> ---
> > >>  arch/mips/Kconfig                |  1 +
> > >>  arch/mips/include/asm/cpu-info.h | 49
> > >> ---------------------------- arch/mips/include/asm/smp.h      |
> > >> 2 -- arch/mips/include/asm/topology.h | 48
> > >> +++++++++++++++++++++++++--- arch/mips/kernel/cpu-probe.c     |
> > >> 43 ------------------------- arch/mips/kernel/setup.c         |
> > >> 1 + arch/mips/kernel/smp.c           | 55 =20
> > >++++---------------------------- =20
> > >>  arch/mips/kernel/topology.c      | 42 ++++++++++++++++++++++++
> > >>  8 files changed, 93 insertions(+), 148 deletions(-)
> > >> =20
> > >
> > >[...]
> > > =20
> > >> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> > >> index 8a418783a6bb..b9fefc5dc702 100644
> > >> --- a/arch/mips/kernel/setup.c
> > >> +++ b/arch/mips/kernel/setup.c
> > >> @@ -784,6 +784,7 @@ void __init setup_arch(char **cmdline_p)
> > >>  	dmi_setup();
> > >>
> > >>  	resource_init();
> > >> +	init_cpu_topology();
> > >>  	plat_smp_setup();
> > >> =20
> > >
> > >Continuing my reply on previous patch, I see possible_cpu_mask
> > >being set up in plat_smp_setup. Why not reverse the order above.
> > >Further I see
> > >that the logical->physical CPU mapping is done in plat_smp_setup
> > >which is required to store/save any topology information. =20
> >
> > Some plat_smp_setup is touching topology so we must reset before
> > that.=20
>=20
> Can you elaborate on this ? What gets overwritten if
> init_cpu_topology is called after plat_smp_setup. I don't see any
> plat_smp_setup setting up sibling masks.

See arch/mips/kernel/smp-cps.c,
in cps_smp_setup function, it is setting "cpu_data[nvpes + v].core",
"cpu_data[nvpes + v].vpe_id", which is actually sibling thread_id and
core_id after my patch.

Thanks.

>=20
> --
> Regards,
> Sudeep
