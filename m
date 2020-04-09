Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 400DC1A33F9
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 14:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgDIMXp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 08:23:45 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17681 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725970AbgDIMXp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 08:23:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586434995; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=k6oQV9Ik5cHRdNyA2DKWk00SdMyiZJdLX2yIdQ+kvjAaWoZ1mqD2ESaLQADRY/5qcaNLY/d0gxSnmUMJdXyuyOUQi8V2zhx2tlBalmdgnBca9wnB2UcG/6p4D9h81a/JgEUOHbhTecEr5/F0UIpcf2Tye0wyXxDnIglbQsW2szY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586434995; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=7Gi/U9gbHDr1fJuuMi8qV5B2giMAOVeNAuodGZ/Mn8s=; 
        b=CEq3G84Cg5MjXdScyRZcbsn04sB7ieypdBiKr1HV3XlXHaTB0TFdpelWAXc/wMS0D3ONXrclhSwuphAaPg6HIaik8DQ1iEdbW7u7m7hQJ5TQuJdlN4TtuGoVIwUqN/k7e22P8iHz7QRjSkCW9o882FfKbStbeKOYB6gN+uLJzzE=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586434995;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=7Gi/U9gbHDr1fJuuMi8qV5B2giMAOVeNAuodGZ/Mn8s=;
        b=Tf6uA9rhjaYTAlNaHzK05z9FI8n+8Urqz043Qu1CtMqpOyZMQVlVitlZ96+HrIt+
        Q7ntwqFMVO7Yg6l82R6jTAj8rweiTAX/2uMg/SKMJXLaGAGfhnWGoMoYRhjcHyOuF0v
        9OxN+KhlXJZPXVM/5vvJM1ytVUqYF0jjU6s5uJCc=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1586434993193644.1752655984294; Thu, 9 Apr 2020 20:23:13 +0800 (CST)
Date:   Thu, 09 Apr 2020 20:23:13 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "Sudeep Holla" <sudeep.holla@arm.com>
Cc:     "linux-mips" <linux-mips@vger.kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Vladimir Kondratiev" <vladimir.kondratiev@intel.com>,
        "Richard Fontana" <rfontana@redhat.com>
Message-ID: <1715ee4ec25.101145f913108.2026113345842851287@flygoat.com>
In-Reply-To: <20200409105832.GF25948@bogus>
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
 <20200408113505.2528103-6-jiaxun.yang@flygoat.com>
 <20200409103121.GD25948@bogus>
 <C2794910-48A0-4472-953A-13F40BA39423@flygoat.com> <20200409105832.GF25948@bogus>
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

 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E5=9B=9B, 2020-04-09 18:58:32 Sudeep Hol=
la <sudeep.holla@arm.com> =E6=92=B0=E5=86=99 ----
 > On Thu, Apr 09, 2020 at 06:35:21PM +0800, Jiaxun Yang wrote:
 > >
 > >
 > > =E4=BA=8E 2020=E5=B9=B44=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=886:31:21, Sudeep Holla <sudeep.holla@arm.com> =E5=86=99=E5=88=B0:
 > > >On Wed, Apr 08, 2020 at 07:34:15PM +0800, Jiaxun Yang wrote:
 > > >> Previously, MIPS is using self-defined "globalnumber" in struct
 > > >> mips_cpuinfo to store topology information. However, it's not
 > > >friendly
 > > >> to DeviceTree based systems and lack of cpu_capacity related featur=
e
 > > >> which can take advantage of multi-cluster system.
 > > >>
 > > >> Here, we enabled arch_topology for MIPS and adapted some functions
 > > >> to fit arch_topology structure.
 > > >> Also, we implmented smp_store_cpu_info to probe CPU's topology
 > > >information
 > > >> by "globalnumber" registers in VP ASE or Ebase.CPUNum for legacy
 > > >systems.
 > > >>
 > > >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
 > > >> ---
 > > >>  arch/mips/Kconfig                |  1 +
 > > >>  arch/mips/include/asm/cpu-info.h | 49 ----------------------------
 > > >>  arch/mips/include/asm/smp.h      |  2 --
 > > >>  arch/mips/include/asm/topology.h | 48 +++++++++++++++++++++++++---
 > > >>  arch/mips/kernel/cpu-probe.c     | 43 -------------------------
 > > >>  arch/mips/kernel/setup.c         |  1 +
 > > >>  arch/mips/kernel/smp.c           | 55
 > > >++++----------------------------
 > > >>  arch/mips/kernel/topology.c      | 42 ++++++++++++++++++++++++
 > > >>  8 files changed, 93 insertions(+), 148 deletions(-)
 > > >>
 > > >
 > > >[...]
 > > >
 > > >> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
 > > >> index 8a418783a6bb..b9fefc5dc702 100644
 > > >> --- a/arch/mips/kernel/setup.c
 > > >> +++ b/arch/mips/kernel/setup.c
 > > >> @@ -784,6 +784,7 @@ void __init setup_arch(char **cmdline_p)
 > > >>      dmi_setup();
 > > >>
 > > >>      resource_init();
 > > >> +    init_cpu_topology();
 > > >>      plat_smp_setup();
 > > >>
 > > >
 > > >Continuing my reply on previous patch, I see possible_cpu_mask being
 > > >set up in plat_smp_setup. Why not reverse the order above. Further I
 > > >see
 > > >that the logical->physical CPU mapping is done in plat_smp_setup whic=
h
 > > >is required to store/save any topology information.
 > >
 > > Some plat_smp_setup is touching topology so we must reset before that.
 > >
 >=20
 > Can you elaborate on this ? What gets overwritten if init_cpu_topology i=
s
 > called after plat_smp_setup. I don't see any plat_smp_setup setting up
 > sibling masks.

See arch/mips/kernel/smp-cps.c,
in cps_smp_setup function, it is setting "cpu_data[nvpes + v].core", "cpu_d=
ata[nvpes + v].vpe_id",
which is actually sibling thread_id and core_id after my patch.

Thanks.

 >=20
 > --
 > Regards,
 > Sudeep
 >=20
--
Jiaxun Yang
