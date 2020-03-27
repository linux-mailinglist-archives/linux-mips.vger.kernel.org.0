Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC82194EAF
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2020 03:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbgC0CAs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 22:00:48 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17952 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727607AbgC0CAs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 22:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585274429;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=sRlx4FvE7Zyh96ZOX4NGXGy3JtbyLAqS0bJOJWnAYDY=;
        b=MEAxfFOVPBTHG1XuoLwNhN1272/kt3F8sQE8EKHUhl4Fulbn6Bif0idQtD5efJw7
        iqXU15yzo16ixDPvxByAhOZmGpwZV0YNcxVPSmjjs09waG4JKpfMD8aIdx23ZwWXSc3
        mNG9gmuGb/ElmrC+XfIUwrQArMC9A/j4ptPD6gEw=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585274427205166.35780654547034; Fri, 27 Mar 2020 10:00:27 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200327020016.460733-2-jiaxun.yang@flygoat.com>
Subject: [PATCH RESEND v2 2/2] MIPS: Loongson64: Set cluster for cores
Date:   Fri, 27 Mar 2020 10:00:16 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200327020016.460733-1-jiaxun.yang@flygoat.com>
References: <20200326105956.455291-1-jiaxun.yang@flygoat.com>
 <20200327020016.460733-1-jiaxun.yang@flygoat.com>
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
v2: cpu_data should be indexed by logical id

RESEND because the previous mail was messed up too.
I tried to write a script to automation my work flow
but it's quite buggy.
I won't use it any more.
---
 arch/mips/loongson64/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e1fe8bbb377d..35568dec17a4 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -404,6 +404,8 @@ static void __init loongson3_smp_setup(void)
 =09=09=09__cpu_number_map[i] =3D num;
 =09=09=09__cpu_logical_map[num] =3D i;
 =09=09=09set_cpu_possible(num, true);
+=09=09=09/* Loongson processors are always grouped by 4 */
+=09=09=09cpu_set_cluster(&cpu_data[num], i / 4);
 =09=09=09num++;
 =09=09}
 =09=09i++;
--=20
2.26.0.rc2


