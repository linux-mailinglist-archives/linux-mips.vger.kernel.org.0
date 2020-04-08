Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD94F1A2000
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 13:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgDHLk2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 07:40:28 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17888 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728495AbgDHLk1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 07:40:27 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586345893; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Efq+gcQEx2H8GOEA7ZDZc25+XeLXL3Woz/M2wraA/a1emfVJmXFdm8QIMVJ02bTub1vN3kZY7OhFJSobxwg9MU1C1OWqT3YoKZmNzBy2IXgUvTILgwySxE+9g/ROFGYhKdqaGixO3bisWX9rVDV0OCM65gOpuhysAY708o4rDtg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586345893; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=lgd7A/vb6X/W8mGRRVs75qEfCfZlypVe17eEG7WjjtQ=; 
        b=phiiC2xxlUbQsIdex4LxON7hhmNBXvWFYLq7Ux6Vdq2jYdpoInoYteZljbanq9fh5WdtDGwgrTkQTaBxSfg8Tz9yx3vcMGFyqVW/Os2Tw3p5ZgiGSub62+2sioRyJSL2vVFaWu2fRE5sRZ8L1X3TkRjivBOfirxozqX4HQjeg3U=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586345893;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=lgd7A/vb6X/W8mGRRVs75qEfCfZlypVe17eEG7WjjtQ=;
        b=IDHJUT/wkvueUgNmyasLLeWZXB6hPcb2zjUOvUgKOZjCX+2AZWljd8Zu4s+F69Xn
        QmemEuQkGQXe0M2ukIn+YdMWUFNOyEQvBoROE//MGwuFHuzOVwe9xzhwbkblmFzdkmU
        dNCNQ2K2mGk65bnRAWfCumAuVD2J8uz0zfmW5olg=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586345891015636.0638866174513; Wed, 8 Apr 2020 19:38:11 +0800 (CST)
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
        Sudeep Holla <sudeep.holla@arm.com>,
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
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Peter Xu <peterx@redhat.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408113505.2528103-3-jiaxun.yang@flygoat.com>
Subject: [PATCH 02/12] MIPS: prom: Add helper to parse CPU node in dt
Date:   Wed,  8 Apr 2020 19:34:12 +0800
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

Mostly identical with arm one. The only difference is that we allow
to mark a CPU Node as status =3D "disabled" in dt, which means the core
is physicaly present, but not possible for the kernel. It will occupy
a bit in cpumask as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/prom.h |  2 +
 arch/mips/kernel/prom.c      | 96 ++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/arch/mips/include/asm/prom.h b/arch/mips/include/asm/prom.h
index c42e07671934..1ec46e09dc8b 100644
--- a/arch/mips/include/asm/prom.h
+++ b/arch/mips/include/asm/prom.h
@@ -19,9 +19,11 @@ struct boot_param_header;
=20
 extern void __dt_setup_arch(void *bph);
 extern int __dt_register_buses(const char *bus0, const char *bus1);
+extern void mips_dt_init_cpu_maps(void);
=20
 #else /* CONFIG_OF */
 static inline void device_tree_init(void) { }
+static inline void mips_dt_init_cpu_maps(void) { }
 #endif /* CONFIG_OF */
=20
 extern char *mips_get_machine_name(void);
diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 9e50dc8df2f6..ebeb22ffa76a 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -89,4 +89,100 @@ int __init __dt_register_buses(const char *bus0, const =
char *bus1)
 =09return 0;
 }
=20
+void __init mips_dt_init_cpu_maps(void)
+{
+=09struct device_node *cpu, *cpus;
+=09u32 i, j, cpuidx =3D 1;
+=09u32 cpunum;
+=09u32 tmp_map[NR_CPUS] =3D { [0 ... NR_CPUS-1] =3D U32_MAX };
+=09bool cpu_possible[NR_CPUS] =3D { [0 ... NR_CPUS-1] =3D false };
+=09bool bootcpu_valid =3D false;
+
+=09cpus =3D of_find_node_by_path("/cpus");
+=09if (!cpus)
+=09=09return;
+
+=09if (cpu_has_mips_r2_r6)
+=09=09cpunum =3D get_ebase_cpunum();
+=09else
+=09=09cpunum =3D 0; /* For legacy system we assume boot from CPU 0 */
+
+=09for_each_of_cpu_node(cpu) {
+=09=09u32 hwid;
+
+=09=09pr_debug(" * %pOF...\n", cpu);
+=09=09/*
+=09=09 * A device tree containing CPU nodes with missing "reg"
+=09=09 * properties is considered invalid to build the
+=09=09 * cpu_logical_map.
+=09=09 */
+
+=09=09if (of_property_read_u32(cpu, "reg", &hwid)) {
+=09=09=09pr_debug(" * %pOF missing reg property\n", cpu);
+=09=09=09of_node_put(cpu);
+=09=09=09return;
+=09=09}
+
+=09=09/*
+=09=09 * Duplicate hwid are a recipe for disaster.
+=09=09 * Scan all initialized entries and check for
+=09=09 * duplicates. If any is found just bail out.
+=09=09 */
+=09=09for (j =3D 0; j < cpuidx; j++)
+=09=09=09if (WARN(tmp_map[j] =3D=3D hwid,
+=09=09=09=09 "Duplicate /cpu reg properties in the DT\n")) {
+=09=09=09=09of_node_put(cpu);
+=09=09=09=09return;
+=09=09=09}
+
+=09=09/*
+=09=09 * Build a stashed array of hwid values. Numbering scheme
+=09=09 * requires that if detected the boot CPU must be assigned
+=09=09 * logical id 0. Other CPUs get sequential indexes starting
+=09=09 * from 1. If a CPU node with a reg property matching the
+=09=09 * boot CPU hwid is detected, this is recorded so that the
+=09=09 * logical map built from DT is validated.
+=09=09 */
+=09=09if (hwid =3D=3D cpunum) {
+=09=09=09i =3D 0;
+=09=09=09if (of_device_is_available(cpu))
+=09=09=09=09bootcpu_valid =3D true;
+=09=09} else {
+=09=09=09i =3D cpuidx++;
+=09=09}
+
+=09=09if (WARN(cpuidx > nr_cpu_ids, "DT /cpu %u nodes greater than "
+=09=09=09=09=09=09   "max cores %u, capping them\n",
+=09=09=09=09=09=09   cpuidx, nr_cpu_ids)) {
+=09=09=09cpuidx =3D nr_cpu_ids;
+=09=09=09of_node_put(cpu);
+=09=09=09break;
+=09=09}
+
+=09=09tmp_map[i] =3D hwid;
+
+=09=09if (of_device_is_available(cpu))
+=09=09=09cpu_possible[i] =3D true;
+=09}
+
+=09if (!bootcpu_valid) {
+=09=09pr_warn("DT missing boot CPU, fall back to default cpu_logical_map\n=
");
+=09=09return;
+=09}
+
+=09init_cpu_possible(cpu_none_mask);
+=09init_cpu_present(cpu_none_mask);
+
+=09for (i =3D 0; i < cpuidx; i++) {
+=09=09set_cpu_possible(i, cpu_possible[i]);
+=09=09cpu_logical_map(i) =3D tmp_map[i];
+=09=09pr_debug("cpu logical map 0x%x\n", cpu_logical_map(i));
+=09}
+}
+
+bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
+{
+=09return phys_id =3D=3D cpu_logical_map(cpu);
+}
+
 #endif
--=20
2.26.0.rc2


