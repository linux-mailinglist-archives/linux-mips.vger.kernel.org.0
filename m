Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F17C193D73
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 12:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgCZLAa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 07:00:30 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17974 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727970AbgCZLAa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 07:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585220408;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=QI3wVMuRSkD9gzBvrIvcjhY18zy6z/1MaKyuMt/1KvM=;
        b=etpTA7S1v1DdWXk4fQmLaWQ/H9cM1xDgE5zEVqAUtWCPZwwvYi2iN+BfV2kGqx9p
        7Vp189ci4VMc/nM2/LQv7t3wwklrh8tzS/d3GUYK04Gbi8Lr4F/rFytYnNm8KLOYSLc
        wJTa/hNypL9tlq1ojCSjFRyeXAqe2nqdh3OowJnQ=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585220407186329.13092327079346; Thu, 26 Mar 2020 19:00:07 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326105956.455291-2-jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] MIPS: Loongson64: Set cluster for cores
Date:   Thu, 26 Mar 2020 18:59:56 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200326105956.455291-1-jiaxun.yang@flygoat.com>
References: <20200326105956.455291-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

cluster is required for cacheinfo to set shared_cpu_map correctly.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e1fe8bbb377d..257cbb3d2656 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -404,6 +404,8 @@ static void __init loongson3_smp_setup(void)
 =09=09=09__cpu_number_map[i] =3D num;
 =09=09=09__cpu_logical_map[num] =3D i;
 =09=09=09set_cpu_possible(num, true);
+=09=09=09/* Loongson processors are always grouped by 4 */
+=09=09=09cpu_set_cluster(&cpu_data[i], i / 4);
 =09=09=09num++;
 =09=09}
 =09=09i++;
--=20
2.26.0.rc2


