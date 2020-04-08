Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8F11A1FF8
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 13:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbgDHLjo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 07:39:44 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17845 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728495AbgDHLjo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 07:39:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586345849; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=rOB4eIqHBzvfjx1r/DJQtcmeMIlpQOlMIV88Vb8er5WNnj5myzwMeVcXVVOovP3XndRAn4agq72yUOjsuDn+3urEXlBCvweRu/LEssLGGchCigJ49m6Tmw+rcJGpCb8yDSry3/3HR8sMi1AmchkNH7uxZ1aCKhcdl3n6mg6vouk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586345849; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=xfRiY7sN5wTn7Esit9RnU+5Uk6h1t0zgJThoq+Q/xtE=; 
        b=bw9Gmk7NZUcOc4oX5bPsh37NoQWg0Fq7CNWbeQQWNm8KyC2xHoKVZWVDPDrXqfGgYymzYVawf63vhf8m2aoxphRhquyzYnglQ1Dc7uCTo3MwudZPh3V5I41TmOTyEJqQDIbsQCcpwwzyAm+jYECjvR7Gqr5M5wsDUHM072uqCo4=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586345849;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=xfRiY7sN5wTn7Esit9RnU+5Uk6h1t0zgJThoq+Q/xtE=;
        b=OLVRyIHIWLpCVYdms33TIvNnPkbg7Qq8jKfrCeRAVHEalhQggh5YlnE+oY7EwTHe
        Ey1HCvqH8d8tBZ22SaYFOZIVtnjFFQGYu1sD4fgu9sY5S50EIvFdlEl9UZUFgSW7d4a
        BYb6WdD+tQ7Lw9fjJ/5GiU46vvHFPQ6GT4I/lR9Y=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 158634584664433.36732062087788; Wed, 8 Apr 2020 19:37:26 +0800 (CST)
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
        Alexios Zavras <alexios.zavras@intel.com>,
        Steve Winslow <swinslow@gmail.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Peter Xu <peterx@redhat.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408113505.2528103-2-jiaxun.yang@flygoat.com>
Subject: [PATCH 01/12] MIPS: setup: Drop prefill_possible_map
Date:   Wed,  8 Apr 2020 19:34:11 +0800
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

All the plat_smp_setup are setting up possible cpus in their
platform code. So prefill_possible_map is actually overwriting
platform's setup, which seems unreasonable.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/setup.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 10bef8f78e7c..8a418783a6bb 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -761,25 +761,6 @@ static void __init resource_init(void)
 =09}
 }
=20
-#ifdef CONFIG_SMP
-static void __init prefill_possible_map(void)
-{
-=09int i, possible =3D num_possible_cpus();
-
-=09if (possible > nr_cpu_ids)
-=09=09possible =3D nr_cpu_ids;
-
-=09for (i =3D 0; i < possible; i++)
-=09=09set_cpu_possible(i, true);
-=09for (; i < NR_CPUS; i++)
-=09=09set_cpu_possible(i, false);
-
-=09nr_cpu_ids =3D possible;
-}
-#else
-static inline void prefill_possible_map(void) {}
-#endif
-
 void __init setup_arch(char **cmdline_p)
 {
 =09cpu_probe();
@@ -804,7 +785,6 @@ void __init setup_arch(char **cmdline_p)
=20
 =09resource_init();
 =09plat_smp_setup();
-=09prefill_possible_map();
=20
 =09cpu_cache_init();
 =09paging_init();
--=20
2.26.0.rc2


