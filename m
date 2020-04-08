Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2EE1A2285
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 15:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgDHNEN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 09:04:13 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17891 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728890AbgDHNEN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 09:04:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586350933; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=TBes1nXwoj0zlkCQrPxZBJVTTZxUidOXybCr53tQQNtAp5OzWyUj9yaIHeUefNxurJczHBK5/jAHenwJfO6BXQb21uZ07BDHO9ebYft+P+/UrBXCZn2F1O9dePYnT/JA9PX4PGydkGyGuuP+VZGBw1QY1/bqdgFMAY0G9Joc8DI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586350933; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=pvVcRtCqfH3vqqhS/khlj9DqWBnRf2S/d6gBy/uBo9A=; 
        b=VMcIyzmdc6pGrzmyukLutD0E4xjg8gtmszFlaeKO+hgLK/Iar7B/e8IHxyYXI4Mk+EEPMrUZ40uQfMcOXiusAX+mXmNyItdA8DS8KJva1bV8qzHcE+ZSf3KbS+kEB3GA49XXKU3Shh/nggPz+ME5w1gEH5afZgVGlpoYivQgLbE=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586350933;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=pvVcRtCqfH3vqqhS/khlj9DqWBnRf2S/d6gBy/uBo9A=;
        b=MGi8nusrZDH6aWUCxRhrByaRYgtWIrIT5t7vKeTs9jzc6F3EbD23XLosAXfoV4Eq
        kBIF1wyn6XiG/Qef84kVrzDLq0ajXSJZEloA2Vku5ZVoin8nvONSnH9g1G/RjrCDeTs
        m79PD7Kh1dQmCivoM1AszQC3r+FsK2oQ4OtuLF34=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586350931576768.9659616147869; Wed, 8 Apr 2020 21:02:11 +0800 (CST)
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
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Richard Fontana <rfontana@redhat.com>,
        Steve Winslow <swinslow@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Mike Rapoport <rppt@linux.ibm.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408130024.2529220-4-jiaxun.yang@flygoat.com>
Subject: [PATCH 09/12] MIPS: bmips: Switch to new topology interface
Date:   Wed,  8 Apr 2020 20:59:51 +0800
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

Change the parameter of cpu_set_core from cpudata to cpuid.
Also set cluster id for bmips as it have different method to probe
actual hwid of CPU, and smp_store_cpuinfo is using cluster id to
determine if we should probe topology info again.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/smp-bmips.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 9058e9dcf080..c40bb37eab38 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -247,7 +247,8 @@ static void bmips_init_secondary(void)
 =09=09break;
 =09case CPU_BMIPS5000:
 =09=09write_c0_brcm_action(ACTION_CLR_IPI(smp_processor_id(), 0));
-=09=09cpu_set_core(&current_cpu_data, (read_c0_brcm_config() >> 25) & 3);
+=09=09cpu_set_core(smp_processor_id(), (read_c0_brcm_config() >> 25) & 3);
+=09=09cpu_set_cluster(smp_processor_id(), 0);
 =09=09break;
 =09}
 }
--=20
2.26.0.rc2


