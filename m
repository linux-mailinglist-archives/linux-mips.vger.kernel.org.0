Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA1C2F6994
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 19:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbhANSbR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jan 2021 13:31:17 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:16689 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbhANSbR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jan 2021 13:31:17 -0500
Date:   Thu, 14 Jan 2021 18:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1610649035; bh=mtGxhBW9kZewFGijq4Pblr/ZA2c7IVmLAnYQsxxFV2Y=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=SR8vYtE3ZYYxfHE5apF50UU3aFxvNYKJ7LyJPHHKljRWgAiWXBYJEN4emtTg4VZ4x
         5fiaafFYGh5zCyn/vWTOT/VNotcG+YHhTcWYPQ8P7olNGCAdrmg9KedPNbkGTaKoDK
         tPWWkuiw6QpLiCh1UzPQbz7d21BmLo83ETJu/rv4p0jOWciALIWr09BZIVb//8qK1F
         Wnh+2WwnduVIqi+cWX2awSv+oZjBvkl/zJoEY84Exdqjchv8EDH5FerVLokZmlSIZM
         zx7zzsTOMq5NqRbYGBJ8lvqT0rhR8z6pOs37RbH4zLiKFu04yZ8PGfJEclSBRFe5n4
         YPc5jr2BlUwNg==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bibo Mao <maobibo@loongson.cn>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Paul Burton <paulburton@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Guoyun Sun <sunguoyun@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 2/2] MIPS: pgtable: fix -Wshadow in asm/pgtable.h
Message-ID: <20210114183001.110729-2-alobakin@pm.me>
In-Reply-To: <20210114183001.110729-1-alobakin@pm.me>
References: <20210114182905.110574-1-alobakin@pm.me> <20210114183001.110729-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Solves the following repetitive warning when building with -Wshadow:

In file included from ./include/linux/pgtable.h:6,
                 from ./include/linux/mm.h:33,
                 from ./include/linux/dax.h:6,
                 from ./include/linux/mempolicy.h:11,
                 from kernel/fork.c:34:
./arch/mips/include/asm/mmu_context.h: In function =E2=80=98switch_mm=
=E2=80=99:
./arch/mips/include/asm/pgtable.h:97:16: warning: declaration of =E2=80=
=98flags=E2=80=99 shadows a previous local [-Wshadow]
   97 |  unsigned long flags;      \
      |                ^~~~~
./arch/mips/include/asm/mmu_context.h:162:2: note: in expansion of macro =
=E2=80=98htw_stop=E2=80=99
  162 |  htw_stop();
      |  ^~~~~~~~
In file included from kernel/fork.c:102:
./arch/mips/include/asm/mmu_context.h:159:16: note: shadowed declaration is=
 here
  159 |  unsigned long flags;
      |                ^~~~~

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/include/asm/pgtable.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtabl=
e.h
index 4f9c37616d42..4d3ab682d093 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -94,31 +94,31 @@ extern void paging_init(void);
=20
 #define htw_stop()=09=09=09=09=09=09=09\
 do {=09=09=09=09=09=09=09=09=09\
-=09unsigned long flags;=09=09=09=09=09=09\
+=09unsigned long __flags;=09=09=09=09=09=09\
 =09=09=09=09=09=09=09=09=09\
 =09if (cpu_has_htw) {=09=09=09=09=09=09\
-=09=09local_irq_save(flags);=09=09=09=09=09\
+=09=09local_irq_save(__flags);=09=09=09=09\
 =09=09if(!raw_current_cpu_data.htw_seq++) {=09=09=09\
 =09=09=09write_c0_pwctl(read_c0_pwctl() &=09=09\
 =09=09=09=09       ~(1 << MIPS_PWCTL_PWEN_SHIFT));=09\
 =09=09=09back_to_back_c0_hazard();=09=09=09\
 =09=09}=09=09=09=09=09=09=09\
-=09=09local_irq_restore(flags);=09=09=09=09\
+=09=09local_irq_restore(__flags);=09=09=09=09\
 =09}=09=09=09=09=09=09=09=09\
 } while(0)
=20
 #define htw_start()=09=09=09=09=09=09=09\
 do {=09=09=09=09=09=09=09=09=09\
-=09unsigned long flags;=09=09=09=09=09=09\
+=09unsigned long __flags;=09=09=09=09=09=09\
 =09=09=09=09=09=09=09=09=09\
 =09if (cpu_has_htw) {=09=09=09=09=09=09\
-=09=09local_irq_save(flags);=09=09=09=09=09\
+=09=09local_irq_save(__flags);=09=09=09=09\
 =09=09if (!--raw_current_cpu_data.htw_seq) {=09=09=09\
 =09=09=09write_c0_pwctl(read_c0_pwctl() |=09=09\
 =09=09=09=09       (1 << MIPS_PWCTL_PWEN_SHIFT));=09\
 =09=09=09back_to_back_c0_hazard();=09=09=09\
 =09=09}=09=09=09=09=09=09=09\
-=09=09local_irq_restore(flags);=09=09=09=09\
+=09=09local_irq_restore(__flags);=09=09=09=09\
 =09}=09=09=09=09=09=09=09=09\
 } while(0)
=20
--=20
2.30.0


