Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D464193D72
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 12:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgCZLA3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 07:00:29 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17952 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727590AbgCZLA3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 07:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585220408;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=6yTOr+NoNqyMnCyVznXZ2842mE94M2GsCG3fR38Jwlc=;
        b=V1Mv0b94HQmAORm/ulNmujLjaOnGQQblYspf1Lbs1T9NNLEqmvOk2BPPrfIEsW/r
        Zt4Rv6Uzuq/SLpZmuf4kqz1b+Rau8OemgBi9xir5dyVoJVLyFOaITt1oV0IiPeT7s8F
        QOuZ4sb06f+1Gww2FrmEqsrzSOoMJRs5bVYYfcYU=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585220405368229.6558544233627; Thu, 26 Mar 2020 19:00:05 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326105956.455291-1-jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: cacheinfo: Add missing VCache
Date:   Thu, 26 Mar 2020 18:59:55 +0800
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Victim Cache is defined by Loongson as per-core unified
private Cache.
Add this into cacheinfo and make cache levels selfincrement
instead of hardcode levels.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cacheinfo.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
index 47312c529410..c56b038aaad8 100644
--- a/arch/mips/kernel/cacheinfo.c
+++ b/arch/mips/kernel/cacheinfo.c
@@ -35,6 +35,11 @@ static int __init_cache_level(unsigned int cpu)
=20
 =09leaves +=3D (c->icache.waysize) ? 2 : 1;
=20
+=09if (c->vcache.waysize) {
+=09=09levels++;
+=09=09leaves++;
+=09}
+
 =09if (c->scache.waysize) {
 =09=09levels++;
 =09=09leaves++;
@@ -74,25 +79,38 @@ static int __populate_cache_leaves(unsigned int cpu)
 =09struct cpuinfo_mips *c =3D &current_cpu_data;
 =09struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
 =09struct cacheinfo *this_leaf =3D this_cpu_ci->info_list;
+=09int level =3D 1;
=20
 =09if (c->icache.waysize) {
-=09=09/* L1 caches are per core */
+=09=09/* D/I caches are per core */
 =09=09fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
-=09=09populate_cache(dcache, this_leaf, 1, CACHE_TYPE_DATA);
+=09=09populate_cache(dcache, this_leaf, level, CACHE_TYPE_DATA);
 =09=09fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
-=09=09populate_cache(icache, this_leaf, 1, CACHE_TYPE_INST);
+=09=09populate_cache(icache, this_leaf, level, CACHE_TYPE_INST);
+=09=09level++;
 =09} else {
-=09=09populate_cache(dcache, this_leaf, 1, CACHE_TYPE_UNIFIED);
+=09=09populate_cache(dcache, this_leaf, level, CACHE_TYPE_UNIFIED);
+=09=09level++;
+=09}
+
+=09if (c->vcache.waysize) {
+=09=09/* Vcache is per core as well */
+=09=09fill_cpumask_cluster(cpu, &this_leaf->shared_cpu_map);
+=09=09populate_cache(vcache, this_leaf, level, CACHE_TYPE_UNIFIED);
+=09=09level++;
 =09}
=20
 =09if (c->scache.waysize) {
-=09=09/* L2 cache is per cluster */
+=09=09/* Scache is per cluster */
 =09=09fill_cpumask_cluster(cpu, &this_leaf->shared_cpu_map);
-=09=09populate_cache(scache, this_leaf, 2, CACHE_TYPE_UNIFIED);
+=09=09populate_cache(scache, this_leaf, level, CACHE_TYPE_UNIFIED);
+=09=09level++;
 =09}
=20
-=09if (c->tcache.waysize)
-=09=09populate_cache(tcache, this_leaf, 3, CACHE_TYPE_UNIFIED);
+=09if (c->tcache.waysize) {
+=09=09populate_cache(tcache, this_leaf, level, CACHE_TYPE_UNIFIED);
+=09=09level++;
+=09}
=20
 =09this_cpu_ci->cpu_map_populated =3D true;
=20
--=20
2.26.0.rc2


