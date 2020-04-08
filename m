Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D1F1A2280
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 15:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgDHNDi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 09:03:38 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17871 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728280AbgDHNDh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 09:03:37 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586350900; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=TaXGFSpYXyuuJSm3U8C/zKL8TGBOgJF5LxoQwHZT2PzjIN94ENJUr+osNf3w570MRHtdNoOgW48bwiJruaiW8Ob8zS3qleqZLvmJ6dbaN2ChI04TAWgrglLvYIMusNS0Zqr6gSQRd21PaDM0jf4A4GoMnK2dYyAgorb2ClK9a8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586350900; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=kpT3Sx2KtSOShM1hd/8JsXKK/dHnee+iUIp6sZjfLes=; 
        b=evEAXbOiTc4PrZ9WASM24WJtBXE/rtdNezFIWbkoE0PwSgKZTXaqawc/ucnyNLCXXG9vJHO9mllvlm2OIY/rIx9W7aY0qLR7DvTa/0tdOQKe/+KDDVsySiD9ywoMFLbn4U+krQcP7zg2YXjZ9JI5qtrBrMgc6HWCB17coPK60w8=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586350900;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=kpT3Sx2KtSOShM1hd/8JsXKK/dHnee+iUIp6sZjfLes=;
        b=M4E3W43cO8oW+eV1OO4dyXbsE0pM/+a1tK+IvEAjD5VX+rGDNdDtaGmXTSe4jnF4
        ROJNHGyBFcGtRcqUZ1KH/Fbm7DnYbecoMhIGXNPorF9melzhFbqjojo2qrQ2St6XaU5
        0d9Pq4vDoAxygfLbKJ5DlYG0CkeeNR2kazsdS1Pw=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586350899485242.73492025223356; Wed, 8 Apr 2020 21:01:39 +0800 (CST)
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
        Richard Fontana <rfontana@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408130024.2529220-3-jiaxun.yang@flygoat.com>
Subject: [PATCH 08/12] irqchip: mips-cpu: Switch to new topology interface
Date:   Wed,  8 Apr 2020 20:59:50 +0800
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

Change the parameter of cpu_vpe_id from cpu_data to cpuid.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-mips-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.=
c
index 95d4fd8f7a96..eed3edf8480b 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -100,7 +100,7 @@ static void mips_mt_send_ipi(struct irq_data *d, unsign=
ed int cpu)
 =09WARN_ON(!cpus_are_siblings(smp_processor_id(), cpu));
=20
 =09vpflags =3D dvpe();
-=09settc(cpu_vpe_id(&cpu_data[cpu]));
+=09settc(cpu_vpe_id(cpu));
 =09write_vpe_c0_cause(read_vpe_c0_cause() | (C_SW0 << hwirq));
 =09evpe(vpflags);
=20
--=20
2.26.0.rc2


