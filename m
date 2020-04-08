Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCBB71A2288
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 15:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgDHNEh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 09:04:37 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17897 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728294AbgDHNEh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 09:04:37 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586350964; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=bOJbxhTRmbAJiIY0YfvBkBJ3s4s3+dE0pR6CmZrWAx2BdDyljE6FvJ5uAXS7Cet9FXbJEpob1jcFMuQ4kIfeWlWNB2ZnHEg746nb0XVAAKAcWdg58ZvsWozMgcVA5F4cXu93m2mFQK2MLy6Ig6O/+MkfdQCKt8i2N+9bnON+Juk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586350964; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=aw5fv1+FHKbDSfG1HhhiLI2xBtjZelF5Lqomgzhxync=; 
        b=JfjkIb3oCd+ZOGz+mLWCRo+dkKkUDYW13jLLcMRfggZwCvqX/LkPQVHYyNMkltJP0fI5ItW73S4qvNB1VyqiGgnvVIQH6SJWgskC8fBL9xxZMaT3xXQdm3VN/B5tHOVv0fmg58N2I5SShbOkRKPMCRXzsJ2VpBR2iAuFKvkhJ2E=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586350964;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=aw5fv1+FHKbDSfG1HhhiLI2xBtjZelF5Lqomgzhxync=;
        b=WLY/VTOlfZ1H69+4UJe1udiEyf0/w2p42G7i3Dc56zNwi62Qo/aPwg/upb9QqCMA
        LMZd5ajwAFdvIUHeaqs4MjOvIRduoMWKuA+BVgu2m3zv3b0CqZAgHWuM/Ziu2rCIxw0
        KEaEYIm6ipcExu2Td8xNgm0TdWp0/H0V/zBFiCCg=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586350963330259.880124634165; Wed, 8 Apr 2020 21:02:43 +0800 (CST)
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
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408130024.2529220-5-jiaxun.yang@flygoat.com>
Subject: [PATCH 10/12] MIPS: nlm: Switch to new topology interface
Date:   Wed,  8 Apr 2020 20:59:52 +0800
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

Use new functions to set core_id & cluster_id.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/netlogic/common/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/netlogic/common/smp.c b/arch/mips/netlogic/common/sm=
p.c
index 39a300bd6cc2..14bfa8a099cc 100644
--- a/arch/mips/netlogic/common/smp.c
+++ b/arch/mips/netlogic/common/smp.c
@@ -122,8 +122,8 @@ static void nlm_init_secondary(void)
 =09int hwtid;
=20
 =09hwtid =3D hard_smp_processor_id();
-=09cpu_set_core(&current_cpu_data, hwtid / NLM_THREADS_PER_CORE);
-=09current_cpu_data.package =3D nlm_nodeid();
+=09cpu_set_core(smp_processor_id(), hwtid / NLM_THREADS_PER_CORE);
+=09cpu_set_cluster(smp_processor_id(), nlm_nodeid());
 =09nlm_percpu_init(hwtid);
 =09nlm_smp_irq_init(hwtid);
 }
--=20
2.26.0.rc2


