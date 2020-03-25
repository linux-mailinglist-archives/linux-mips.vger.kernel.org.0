Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 695E8191F35
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 03:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgCYCel (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 22:34:41 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17873 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727268AbgCYCel (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 22:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585103520;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=ptczmo4zdH5SitmdgLb31uq0UnwEPiyg4NeT2CVppvU=;
        b=U3fLccN5PpEN49FIfATzRjJH80dFiWVFbyS9eIHRHxNtbZ3rggAtvKp3FwKs8mAG
        q94WljlhqdA05aYmCnLeye4R9VeNNfC8rIUJCz1DVLO3TjEnKUr+4lqC1fmktHctRVd
        uDRtf6qVragd+LeKaRrQvbOMick44tJkpo0Qj5Yk=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585103517027656.9551692102889; Wed, 25 Mar 2020 10:31:57 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Cercueil <paul@crapouillou.net>,
        John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Allison Randal <allison@lohutok.net>,
        Paul Burton <paulburton@kernel.org>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-ide@vger.kernel.org
Message-ID: <20200325022916.106641-4-jiaxun.yang@flygoat.com>
Subject: [PATCH v7 02/12] irqchip: loongson-liointc: Workaround LPC IRQ Errata
Date:   Wed, 25 Mar 2020 10:28:19 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
References: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The 1.0 version of that controller has a bug that status bit
of LPC IRQ sometimes doesn't get set correctly.

So we can always blame LPC IRQ when spurious interrupt happens
at the parent interrupt line which LPC IRQ supposed to route
to.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-loongson-liointc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-l=
oongson-liointc.c
index 18de2c09ece4..7d2339e638db 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -32,6 +32,8 @@
=20
 #define LIOINTC_SHIFT_INTx=094
=20
+#define LIOINTC_ERRATA_IRQ=0910
+
 struct liointc_handler_data {
 =09struct liointc_priv=09*priv;
 =09u32=09=09=09parent_int_map;
@@ -41,6 +43,7 @@ struct liointc_priv {
 =09struct irq_chip_generic=09=09*gc;
 =09struct liointc_handler_data=09handler[LIOINTC_NUM_PARENT];
 =09u8=09=09=09=09map_cache[LIOINTC_CHIP_IRQ];
+=09bool=09=09=09=09have_lpc_irq_errata;
 };
=20
 static void liointc_chained_handle_irq(struct irq_desc *desc)
@@ -54,8 +57,15 @@ static void liointc_chained_handle_irq(struct irq_desc *=
desc)
=20
 =09pending =3D readl(gc->reg_base + LIOINTC_REG_INTC_STATUS);
=20
-=09if (!pending)
-=09=09spurious_interrupt();
+=09if (!pending) {
+=09=09/* Always blame LPC IRQ if we have that bug */
+=09=09if (handler->priv->have_lpc_irq_errata &&
+=09=09=09(handler->parent_int_map & ~gc->mask_cache &
+=09=09=09BIT(LIOINTC_ERRATA_IRQ)))
+=09=09=09pending =3D BIT(LIOINTC_ERRATA_IRQ);
+=09=09else
+=09=09=09spurious_interrupt();
+=09}
=20
 =09while (pending) {
 =09=09int bit =3D __ffs(pending);
--=20
2.26.0.rc2


