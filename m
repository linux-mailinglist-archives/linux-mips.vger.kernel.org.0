Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED2E11A34B3
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 15:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgDINRe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 09:17:34 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17812 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726571AbgDINRd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 09:17:33 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586438087; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=RuyIp8rmg/o8bHvm1RewjknYSY0fj36DxZCts9+HYJWTFJn9F4l2hdaaW+/qSBOyrAqphjshw1xN9d4i871t645+ifBs3om41236eGQUtUP5j3I2xSlyZG/qgdiiZGphnlWjKCYOl+qkIKWhol/+LpnSzSlwScHPD2b7E5WPatM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586438087; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=ZvYtj/RbYVsRY5JpcUrg0fhrTDAU/G5r949Bh1IM33A=; 
        b=R9fenA+w6lWu1hjU2k0NUip4w+diR4Ca2IQJyOiEDmS4eZH9UffgBVN1qkLFYI3OcP3diokgEcFe0CuBmY85UIoZeL2bR/t8w4hrIwjuI1zl/oX5dmD2uuDBCPRdi++SUaI1NbEviBK7qX4DOiDQJSyUcs+hEuCD6u3Cs+ccvSg=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586438087;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=ZvYtj/RbYVsRY5JpcUrg0fhrTDAU/G5r949Bh1IM33A=;
        b=dxHrbbRDsdAAN+mZc+1Mdo6b3Gcvpy7UmqYktPeFWu5dxjbEzyksvZMZVV/V5ou2
        P7G9b5eZMfYHUsKOUI0IMYNt+Qd4eSfHL9fVEJY257hC3O7cp87pv7es5l5qn5rzkHK
        mPBw2qXJLY5rF7VFGsI7q4X6eM3SzdvjPw4U3oMY=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1586438083624724.6596107766019; Thu, 9 Apr 2020 21:14:43 +0800 (CST)
Date:   Thu, 09 Apr 2020 21:14:43 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "Sudeep Holla" <sudeep.holla@arm.com>
Cc:     "linux-mips" <linux-mips@vger.kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Huacai Chen" <chenhc@lemote.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Ingo Molnar" <mingo@redhat.com>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
        "Jiri Olsa" <jolsa@redhat.com>,
        "Namhyung Kim" <namhyung@kernel.org>,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        "Robert Richter" <rric@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Jason Cooper" <jason@lakedaemon.net>,
        "Marc Zyngier" <maz@kernel.org>,
        "Paul Burton" <paulburton@kernel.org>,
        "Allison Randal" <allison@lohutok.net>,
        "Enrico Weigelt" <info@metux.net>,
        "Kate Stewart" <kstewart@linuxfoundation.org>,
        "Vladimir Kondratiev" <vladimir.kondratiev@intel.com>,
        "Richard Fontana" <rfontana@redhat.com>,
        "Paul Cercueil" <paul@crapouillou.net>,
        "Zhou Yanjie" <zhouyanjie@zoho.com>
Message-ID: <1715f141424.c10c8fa43125.4230054954165603443@flygoat.com>
In-Reply-To: <20200409125310.GA9655@bogus>
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
 <20200408113505.2528103-6-jiaxun.yang@flygoat.com>
 <20200409103121.GD25948@bogus>
 <C2794910-48A0-4472-953A-13F40BA39423@flygoat.com>
 <20200409105832.GF25948@bogus>
 <20200409190713.3a695115@flygoat-x1e> <20200409125310.GA9655@bogus>
Subject: Re: [PATCH 05/12] MIPS: Switch to arch_topology
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E5=9B=9B, 2020-04-09 20:53:10 Sudeep Hol=
la <sudeep.holla@arm.com> =E6=92=B0=E5=86=99 ----
 > On Thu, Apr 09, 2020 at 07:07:13PM +0800, Jiaxun Yang wrote:
 > > On Thu, 9 Apr 2020 11:58:32 +0100
 > > Sudeep Holla <sudeep.holla@arm.com> wrote:
 > >
 > > > On Thu, Apr 09, 2020 at 06:35:21PM +0800, Jiaxun Yang wrote:
 > > > >
 > > > >
 > > > > =E4=BA=8E 2020=E5=B9=B44=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=886:31:21, Sudeep Holla
 > > > > <sudeep.holla@arm.com> =E5=86=99=E5=88=B0:
 > > > > >On Wed, Apr 08, 2020 at 07:34:15PM +0800, Jiaxun Yang wrote:
 > > > > >> Previously, MIPS is using self-defined "globalnumber" in struct
 > > > > >> mips_cpuinfo to store topology information. However, it's not
 > > > > >friendly
 > > > > >> to DeviceTree based systems and lack of cpu_capacity related
 > > > > >> feature which can take advantage of multi-cluster system.
 > > > > >>
 > > > > >> Here, we enabled arch_topology for MIPS and adapted some
 > > > > >> functions to fit arch_topology structure.
 > > > > >> Also, we implmented smp_store_cpu_info to probe CPU's topology
 > > > > >information
 > > > > >> by "globalnumber" registers in VP ASE or Ebase.CPUNum for legac=
y
 > > > > >>
 > > > > >systems.
 > > > > >>
 > > > > >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
 > > > > >> ---
 > > > > >>  arch/mips/Kconfig                |  1 +
 > > > > >>  arch/mips/include/asm/cpu-info.h | 49
 > > > > >> ---------------------------- arch/mips/include/asm/smp.h      |
 > > > > >> 2 -- arch/mips/include/asm/topology.h | 48
 > > > > >> +++++++++++++++++++++++++--- arch/mips/kernel/cpu-probe.c     |
 > > > > >> 43 ------------------------- arch/mips/kernel/setup.c         |
 > > > > >> 1 + arch/mips/kernel/smp.c           | 55
 > > > > >++++----------------------------
 > > > > >>  arch/mips/kernel/topology.c      | 42 ++++++++++++++++++++++++
 > > > > >>  8 files changed, 93 insertions(+), 148 deletions(-)
 > > > > >>
 > > > > >
 > > > > >[...]
 > > > > >
 > > > > >> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.=
c
 > > > > >> index 8a418783a6bb..b9fefc5dc702 100644
 > > > > >> --- a/arch/mips/kernel/setup.c
 > > > > >> +++ b/arch/mips/kernel/setup.c
 > > > > >> @@ -784,6 +784,7 @@ void __init setup_arch(char **cmdline_p)
 > > > > >>      dmi_setup();
 > > > > >>
 > > > > >>      resource_init();
 > > > > >> +    init_cpu_topology();
 > > > > >>      plat_smp_setup();
 > > > > >>
 > > > > >
 > > > > >Continuing my reply on previous patch, I see possible_cpu_mask
 > > > > >being set up in plat_smp_setup. Why not reverse the order above.
 > > > > >Further I see
 > > > > >that the logical->physical CPU mapping is done in plat_smp_setup
 > > > > >which is required to store/save any topology information.
 > > > >
 > > > > Some plat_smp_setup is touching topology so we must reset before
 > > > > that.
 > > >
 > > > Can you elaborate on this ? What gets overwritten if
 > > > init_cpu_topology is called after plat_smp_setup. I don't see any
 > > > plat_smp_setup setting up sibling masks.
 > >
 > > See arch/mips/kernel/smp-cps.c,
 > > in cps_smp_setup function, it is setting "cpu_data[nvpes + v].core",
 > > "cpu_data[nvpes + v].vpe_id", which is actually sibling thread_id and
 > > core_id after my patch.
 > >
 >=20
 > Sorry, I still don't understand how these relate to cpu_topology in
 > arch_topology.c

 cpu_data[nvpes + v].vpe_id  means cpu_topo->thread_id ,=20
cpu_data[nvpes + v].core means cpu_topo->core_id after my patch.
Here the topology isn't initialized by DT but being filled in plat_smp_setu=
p.

And smp_store_cpu_info won't help as other SMP functions require topology
information immediately, before the core being brought up.

Thanks.

>=20
 > --
 > Regards,
 > Sudeep
 >=20


--
Jiaxun Yang
