Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 996761A228E
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 15:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgDHNFe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 09:05:34 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17822 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728273AbgDHNFe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 09:05:34 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586350997; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=qWDkOcrbjIfbp9iMEf0mjnuO7Pp9Uz2yiZqyIJuqirdubVysweKWVs3PqXtYhW9xxVZ99kgAjI2dxK63Ip8KAfGijVb7vasLyn5O/1kDd8o5yS6xycCNiR0ThfbRNt9Zrzjw4bla2vAzAnHlwPKTnfRKuViQGId3YkSbqFyIuvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586350997; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=Wb2cFU7L7AcultSr3wuDD9OjkWyYp8SDKu7wk5DT1vQ=; 
        b=ltNgh+4ffb344wTWgr50j38RmgDo8CWkup9QoRv+Oymr/HLWGKF/F9MzpWHPz9+15RuTZ+PqrnuwBbgskKp/+uRN162H/Y6+5bJGuwb4SCMDjfXPPtZyVQh1wKYhyOXC7KiHHYDOX37r5sDwHG3BfgY8nEq/buQFyjBJ7HsjLJE=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586350997;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=Wb2cFU7L7AcultSr3wuDD9OjkWyYp8SDKu7wk5DT1vQ=;
        b=SIssDSqGVxKUsmp2F5IwyFWJLHPm/2/JPZl89281ynWkamtxtqAcbAT7L1bT3SGn
        WSCq5pu0UCqwmXvvGD2QRBjmREi3vdCmDSf6JUmuKyCpmDwm6Jr1rGp0nKl3hqxrN97
        K88LOsN9djlSMzi0u+TLE/rajbM0iy/FK9ixB0gw=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586350994404844.9671026645353; Wed, 8 Apr 2020 21:03:14 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
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
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408130024.2529220-6-jiaxun.yang@flygoat.com>
Subject: [PATCH 11/12] MIPS: Loongson64: Switch to new topology interface
Date:   Wed,  8 Apr 2020 20:59:53 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the new interface to setup topology information.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../include/asm/mach-loongson64/topology.h    |  2 ++
 arch/mips/loongson64/smp.c                    | 20 +++++++++----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/i=
nclude/asm/mach-loongson64/topology.h
index 3414a1fd1783..999464ed0c20 100644
--- a/arch/mips/include/asm/mach-loongson64/topology.h
+++ b/arch/mips/include/asm/mach-loongson64/topology.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_MACH_TOPOLOGY_H
 #define _ASM_MACH_TOPOLOGY_H
=20
+#include <linux/numa.h>
+
 #ifdef CONFIG_NUMA
=20
 #define cpu_to_node(cpu)=09(cpu_logical_map(cpu) >> 2)
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e1fe8bbb377d..bb37d0a7e79c 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -353,10 +353,10 @@ static void loongson3_init_secondary(void)
 =09=09loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(i)]);
=20
 =09per_cpu(cpu_state, cpu) =3D CPU_ONLINE;
-=09cpu_set_core(&cpu_data[cpu],
+=09cpu_set_core(cpu,
 =09=09     cpu_logical_map(cpu) % loongson_sysconf.cores_per_package);
-=09cpu_data[cpu].package =3D
-=09=09cpu_logical_map(cpu) / loongson_sysconf.cores_per_package;
+=09cpu_set_cluster(cpu,
+=09=09=09cpu_logical_map(cpu) / loongson_sysconf.cores_per_package);
=20
 =09i =3D 0;
 =09core0_c0count[cpu] =3D 0;
@@ -368,7 +368,7 @@ static void loongson3_init_secondary(void)
=20
 =09if (i > MAX_LOOPS)
 =09=09i =3D MAX_LOOPS;
-=09if (cpu_data[cpu].package)
+=09if (cpu_cluster(cpu))
 =09=09initcount =3D core0_c0count[cpu] + i;
 =09else /* Local access is faster for loops */
 =09=09initcount =3D core0_c0count[cpu] + i/2;
@@ -421,9 +421,9 @@ static void __init loongson3_smp_setup(void)
 =09ipi_status0_regs_init();
 =09ipi_en0_regs_init();
 =09ipi_mailbox_buf_init();
-=09cpu_set_core(&cpu_data[0],
+=09cpu_set_core(0,
 =09=09     cpu_logical_map(0) % loongson_sysconf.cores_per_package);
-=09cpu_data[0].package =3D cpu_logical_map(0) / loongson_sysconf.cores_per=
_package;
+=09cpu_set_cluster(0, cpu_logical_map(0) / loongson_sysconf.cores_per_pack=
age);
 }
=20
 static void __init loongson3_prepare_cpus(unsigned int max_cpus)
@@ -752,8 +752,8 @@ void play_dead(void)
=20
 static int loongson3_disable_clock(unsigned int cpu)
 {
-=09uint64_t core_id =3D cpu_core(&cpu_data[cpu]);
-=09uint64_t package_id =3D cpu_data[cpu].package;
+=09uint64_t core_id =3D cpu_core(cpu);
+=09uint64_t package_id =3D cpu_cluster(cpu);
=20
 =09if ((read_c0_prid() & PRID_REV_MASK) =3D=3D PRID_REV_LOONGSON3A_R1) {
 =09=09LOONGSON_CHIPCFG(package_id) &=3D ~(1 << (12 + core_id));
@@ -766,8 +766,8 @@ static int loongson3_disable_clock(unsigned int cpu)
=20
 static int loongson3_enable_clock(unsigned int cpu)
 {
-=09uint64_t core_id =3D cpu_core(&cpu_data[cpu]);
-=09uint64_t package_id =3D cpu_data[cpu].package;
+=09uint64_t core_id =3D cpu_core(cpu);
+=09uint64_t package_id =3D cpu_cluster(cpu);
=20
 =09if ((read_c0_prid() & PRID_REV_MASK) =3D=3D PRID_REV_LOONGSON3A_R1) {
 =09=09LOONGSON_CHIPCFG(package_id) |=3D 1 << (12 + core_id);
--=20
2.26.0.rc2


