Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2631A2012
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 13:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbgDHLnh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 07:43:37 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17840 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728506AbgDHLng (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 07:43:36 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586345939; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=pPf/pc3k9vjuwDh3UVX8al2oStSaSo6Rs7akY2rznXSXpkV830E+GsikAYsA6oo9r689yqSBtj+b4AnpcNfFDBxheRiGDPT3nnrLVvHIs9QRtXsyb7Q5Pu948mNlWvuVX7T5iHKTECUa5cFceTGsSuHhQvqpqCPaIWILYbmKwcg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586345939; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=+So5B32ryvAjtvrOHDFwVo1iY55d65dAEsJtVoTGv5Q=; 
        b=Ba2o7RTwLWy5uk8yTbup8yR+cmbVpqlx9hVsJ34b7jX6yucCagtUm43kBIbUp88uvdau2h2HU9NmdWz128QG4vUhUmcEGKjQrcGw2tXziyNYibcd/t8RmXSx6bvVteoXFHRDRkF09wmiFd+mWmmQMGka6aWGnzAkT6KOCVLeDdg=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586345939;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=+So5B32ryvAjtvrOHDFwVo1iY55d65dAEsJtVoTGv5Q=;
        b=K0DaOXAuXjFvMhmHcm7BcxQVDkPi5ZjFwjhz4Fxtwor2KjS6ZeeoyHMizo7lUQh9
        ++8jadptvuPjbDE/obpLSuimF9R/KtsvKCrduI62b/YAOMM0sJYzLIPjzF9Qw8AHJ8s
        FTtJnETJcvqIBl01LNef6XLWN6EpzvhHGxjvIj8g=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586345938193401.8350435087435; Wed, 8 Apr 2020 19:38:58 +0800 (CST)
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
        Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
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
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408113505.2528103-4-jiaxun.yang@flygoat.com>
Subject: [PATCH 03/12] arch_topology: Make it avilable for MIPS
Date:   Wed,  8 Apr 2020 19:34:13 +0800
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

Simply drop unnecessary archtecture limitions and add dummy
function for platforms without OF/COMMON_CLK support.
Also exclude functions for arm that existed in platform code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/base/arch_topology.c | 121 +++++++++++++++++++----------------
 1 file changed, 66 insertions(+), 55 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 4d0a0038b476..9c2405d08dae 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -143,57 +143,6 @@ void topology_normalize_cpu_scale(void)
 =09}
 }
=20
-bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int =
cpu)
-{
-=09struct clk *cpu_clk;
-=09static bool cap_parsing_failed;
-=09int ret;
-=09u32 cpu_capacity;
-
-=09if (cap_parsing_failed)
-=09=09return false;
-
-=09ret =3D of_property_read_u32(cpu_node, "capacity-dmips-mhz",
-=09=09=09=09   &cpu_capacity);
-=09if (!ret) {
-=09=09if (!raw_capacity) {
-=09=09=09raw_capacity =3D kcalloc(num_possible_cpus(),
-=09=09=09=09=09       sizeof(*raw_capacity),
-=09=09=09=09=09       GFP_KERNEL);
-=09=09=09if (!raw_capacity) {
-=09=09=09=09cap_parsing_failed =3D true;
-=09=09=09=09return false;
-=09=09=09}
-=09=09}
-=09=09raw_capacity[cpu] =3D cpu_capacity;
-=09=09pr_debug("cpu_capacity: %pOF cpu_capacity=3D%u (raw)\n",
-=09=09=09cpu_node, raw_capacity[cpu]);
-
-=09=09/*
-=09=09 * Update freq_factor for calculating early boot cpu capacities.
-=09=09 * For non-clk CPU DVFS mechanism, there's no way to get the
-=09=09 * frequency value now, assuming they are running at the same
-=09=09 * frequency (by keeping the initial freq_factor value).
-=09=09 */
-=09=09cpu_clk =3D of_clk_get(cpu_node, 0);
-=09=09if (!PTR_ERR_OR_ZERO(cpu_clk)) {
-=09=09=09per_cpu(freq_factor, cpu) =3D
-=09=09=09=09clk_get_rate(cpu_clk) / 1000;
-=09=09=09clk_put(cpu_clk);
-=09=09}
-=09} else {
-=09=09if (raw_capacity) {
-=09=09=09pr_err("cpu_capacity: missing %pOF raw capacity\n",
-=09=09=09=09cpu_node);
-=09=09=09pr_err("cpu_capacity: partial information: fallback to 1024 for a=
ll CPUs\n");
-=09=09}
-=09=09cap_parsing_failed =3D true;
-=09=09free_raw_capacity();
-=09}
-
-=09return !ret;
-}
-
 #ifdef CONFIG_CPU_FREQ
 static cpumask_var_t cpus_to_visit;
 static void parsing_done_workfn(struct work_struct *work);
@@ -275,7 +224,64 @@ static void parsing_done_workfn(struct work_struct *wo=
rk)
 core_initcall(free_raw_capacity);
 #endif
=20
-#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+#if defined(CONFIG_OF) && !defined(CONFIG_ARM)
+#if defined(CONFIG_COMMON_CLK)
+bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int =
cpu)
+{
+=09struct clk *cpu_clk;
+=09static bool cap_parsing_failed;
+=09int ret;
+=09u32 cpu_capacity;
+
+=09if (cap_parsing_failed)
+=09=09return false;
+
+=09ret =3D of_property_read_u32(cpu_node, "capacity-dmips-mhz",
+=09=09=09=09   &cpu_capacity);
+=09if (!ret) {
+=09=09if (!raw_capacity) {
+=09=09=09raw_capacity =3D kcalloc(num_possible_cpus(),
+=09=09=09=09=09       sizeof(*raw_capacity),
+=09=09=09=09=09       GFP_KERNEL);
+=09=09=09if (!raw_capacity) {
+=09=09=09=09cap_parsing_failed =3D true;
+=09=09=09=09return false;
+=09=09=09}
+=09=09}
+=09=09raw_capacity[cpu] =3D cpu_capacity;
+=09=09pr_debug("cpu_capacity: %pOF cpu_capacity=3D%u (raw)\n",
+=09=09=09cpu_node, raw_capacity[cpu]);
+
+=09=09/*
+=09=09 * Update freq_factor for calculating early boot cpu capacities.
+=09=09 * For non-clk CPU DVFS mechanism, there's no way to get the
+=09=09 * frequency value now, assuming they are running at the same
+=09=09 * frequency (by keeping the initial freq_factor value).
+=09=09 */
+=09=09cpu_clk =3D of_clk_get(cpu_node, 0);
+=09=09if (!PTR_ERR_OR_ZERO(cpu_clk)) {
+=09=09=09per_cpu(freq_factor, cpu) =3D
+=09=09=09=09clk_get_rate(cpu_clk) / 1000;
+=09=09=09clk_put(cpu_clk);
+=09=09}
+=09} else {
+=09=09if (raw_capacity) {
+=09=09=09pr_err("cpu_capacity: missing %pOF raw capacity\n",
+=09=09=09=09cpu_node);
+=09=09=09pr_err("cpu_capacity: partial information: fallback to 1024 for a=
ll CPUs\n");
+=09=09}
+=09=09cap_parsing_failed =3D true;
+=09=09free_raw_capacity();
+=09}
+
+=09return !ret;
+}
+#else
+bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int =
cpu)
+{
+=09=09return false;
+}
+#endif /* CONFIG_COMMON_CLK */
 /*
  * This function returns the logic cpu number of the node.
  * There are basically three kinds of return values:
@@ -461,7 +467,12 @@ static int __init parse_dt_topology(void)
 =09of_node_put(cn);
 =09return ret;
 }
-#endif
+#else
+static int __init parse_dt_topology(void)
+{
+=09return 0;
+}
+#endif /* CONFIG_OF & !CONFIG_ARM */
=20
 /*
  * cpu topology table
@@ -562,7 +573,7 @@ __weak int __init parse_acpi_topology(void)
 =09return 0;
 }
=20
-#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+#if !defined(CONFIG_ARM)
 void __init init_cpu_topology(void)
 {
 =09reset_cpu_topology();
@@ -576,4 +587,4 @@ void __init init_cpu_topology(void)
 =09else if (of_have_populated_dt() && parse_dt_topology())
 =09=09reset_cpu_topology();
 }
-#endif
+#endif /* !CONFIG_ARM */
--=20
2.26.0.rc2


