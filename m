Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6372B1A200B
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 13:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgDHLmH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 07:42:07 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17823 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728454AbgDHLmG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 07:42:06 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586345987; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=fCtkhLymfD9CHEpnp/e36RIN0jp2eO9Q8YObQQ/hH3SPpeBTRAcB2w0x8PufvgkObUGSuIxOFACGQGHz/d4vPPu3O6PIgtxjEa/NxAkrAqj2LASYI71j/p2L8461Gd/sa9+NW7hG24JS9IsE/uWh0vZLUOXt4rXI11IFyDvIw68=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586345987; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=kAfR+MEcWmH1pn2XtI1ye2XkXpLmPO99yHe8dszIBGg=; 
        b=Rsfiow0S0UN13KV9WUZgibfvDOgZwcEwq5+ATIFJAjfcizvjDCcYKoBQhAtPch4r+k2MHkSiAod3fAfhkMRJ8kaj0b3vHrJUvWWSjEuLMfPa2IjHt1XyZeV/CMRLci4te3vJlZR/t0b/6jxUVNjTK1EAfNzRW4D32EOiCImxh74=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586345987;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=kAfR+MEcWmH1pn2XtI1ye2XkXpLmPO99yHe8dszIBGg=;
        b=OF6Nt3iysk9nvLjDkbzL1V/4j51ZIbNOjrBnD6TQz0lvX8Ni+b2paJOFRYT8DgMy
        fdyXF8NMzzGOFz7jusgTzL2gl3LfGcc7dp0eWeY6oxoAJ+AuOZSrAQWatyBY+cY7noZ
        8MCjqyP5TKgGzhclvzOGUpofOHFHj+D9vGhHqmME=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586345984855887.2159695647649; Wed, 8 Apr 2020 19:39:44 +0800 (CST)
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
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Richard Fontana <rfontana@redhat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Peter Xu <peterx@redhat.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408113505.2528103-5-jiaxun.yang@flygoat.com>
Subject: [PATCH 04/12] arch_topology: Reset all cpus in reset_cpu_topology
Date:   Wed,  8 Apr 2020 19:34:14 +0800
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

For MIPS platform, when topology isn't probed by DeviceTree,
possible_cpu might be empty when calling init_cpu_topology,
that may result cpu_topology not fully reseted for all CPUs.
So here we can reset all cpus instead of possible cpus.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/base/arch_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 9c2405d08dae..3398b7ac7dfb 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -542,7 +542,7 @@ void __init reset_cpu_topology(void)
 {
 =09unsigned int cpu;
=20
-=09for_each_possible_cpu(cpu) {
+=09for (cpu =3D 0; cpu < NR_CPUS; cpu++) {
 =09=09struct cpu_topology *cpu_topo =3D &cpu_topology[cpu];
=20
 =09=09cpu_topo->thread_id =3D -1;
--=20
2.26.0.rc2


