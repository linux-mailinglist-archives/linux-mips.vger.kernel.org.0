Return-Path: <linux-mips+bounces-9097-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FB4AC2631
	for <lists+linux-mips@lfdr.de>; Fri, 23 May 2025 17:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E3035425B9
	for <lists+linux-mips@lfdr.de>; Fri, 23 May 2025 15:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DE1205E26;
	Fri, 23 May 2025 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="Xf1NkGDJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7717204C2F;
	Fri, 23 May 2025 15:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748013365; cv=none; b=iebGdjJSUF572xOV+5FCbyxrHWFrHXoKNDSYOlp5bFKPFOyjpCdQJTlVqL0Z8imPPGq7zRG28X3C3yo3QNLhZm2pfmGGLSBB2rg6uWowouPqKrdurKC084bV0YeEeZIYs8o1aiVnQ5wLS0x8GX9gZWIOHd+K4Uo7ltl9/UrBRzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748013365; c=relaxed/simple;
	bh=HfPSFLbOlWzTJ6HAWaXKrp/ZuGojHM8o/fXVDyvPKwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUXYpY9SNrEqG6LuJy8QuQETiUGDUI3Jqy4XoSdqD1pCakM/756xAZWOz0n3GHMaDn729foIPdS1Ywdp0bA4m8JaHkZs7lOsMr8NMcB5Vn8caYEJVzZNjzk7ds5TvodjNxrECwUXA5VBJrg8m/w9Yu+eVqGQtRX/ecEYiMoFoKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=Xf1NkGDJ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1748013361; x=1748618161;
	i=markus.stockhausen@gmx.de;
	bh=00hetodQh9Btp7EHhv8gvMlNueNHg3V3mKZCOHwcKWk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Xf1NkGDJqoyliyC/USS+8VuXWNBKmkdbW2BRkktXlNSDnpQB7AS3w+WCKJ0Qpyes
	 AHQrWx1t53de4xu2RS4lSGfZj6Dh2cIM5fQ8NGUxeka5pB4jif8JzQEyW7lAqCSTX
	 tt66L1ufoQutFkTgreeGbDS4NeMbZ21vaAPrBv4rnHoucbo987OP8qL+KSb+7vSMc
	 2jDqiYm03Z4usYHJChO5GgDyxgRYRWWq8ClILdFO9kady6ruqYQIqe1oanNV4kq9P
	 hWd7hp5nuqNKh48rmC17SjPVJYLKUnrInD4y2fHjeMzG7c6Q4DieSCr2owc0JX4+k
	 Xddlx1Of+7GI0kKNIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from openwrt.willemsstb.de ([94.31.70.55]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6ux-1uhOjz2prf-00iiEi; Fri, 23
 May 2025 17:16:00 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: tsbogend@alpha.franken.de,
	tglx@linutronix.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s.gottschall@dd-wrt.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH] irqchip/mips-gic: allow forced affinity for current cpu during hotplug
Date: Fri, 23 May 2025 11:15:42 -0400
Message-ID: <20250523151542.3903598-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k5zI14p6u2qA8GNp1wbElaNr5qT6Ykm9rvLyNDeaH3bB1HB/vTF
 7bZCsvM7PgMA/cpgEe1kSTB7P0pZCeJ2rtMSuwNduogWUFTheJgsozXAe6XPc170dr/Lcdz
 ojQqcA/f+RyyC1Fb9hBLifkznJu+syx61MGO+f4XYQ3+rD/OYpfrFt8AC8B2IcZxMS+gzdB
 s4IWuicEZzd+oOH4JUoKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h4+3Wz6c1bo=;qb9pfpEOwC8aSgPvAE+AS5TCWcs
 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
 cN9UTeJaqGc17i6M0fo+0wWLi

Devices of the Realtek MIPS Otto platform use the official rtl-otto-timer
as clock event generator and cpu clocksource. It is registered for cpu
startup via cpuhp_setup_state() and forces the affinity of the clockevent
interrupts to the appropriate cpu via irq_force_affinity().

On the "smaller" devices with a vendor specific interrupt controller
(supported by irq-realtek-rtl) the registration works fine. The "larger"
RTL931x series is based on a MIPS interAptiv dual core with a MIPS GIC
controller. Interrupt routing setup is cancelled because gic_set_affinity(=
)
does not accept the current (not yet online) cpu as a target.

Relax the checks by evaluating the force parameter that is provided for
exactly this purpose. With this patch affinity can be set as follows:

- force =3D false: works like before
- force =3D true: allow to set affinity to the current not yet online cpu

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
=2D--
 drivers/irqchip/irq-mips-gic.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic=
.c
index bca8053864b2..0a88f785e114 100644
=2D-- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -378,9 +378,18 @@ static int gic_set_affinity(struct irq_data *d, const=
 struct cpumask *cpumask,
 	 * the first online CPU in the mask.
 	 */
 	cpu =3D cpumask_first_and(cpumask, cpu_online_mask);
-	if (cpu >=3D NR_CPUS)
+
+	if ((cpu >=3D NR_CPUS) && !force)
+		/* In normal mode allow only online CPUs. */
 		return -EINVAL;
=20
+	if (cpu >=3D NR_CPUS) {
+		/* In force mode allow current not yet online CPU for hotplug handlers.=
 */
+		cpu =3D cpumask_first(cpumask);
+		if (cpu !=3D get_cpu())
+			return -EINVAL;
+	}
+
 	old_cpu =3D cpumask_first(irq_data_get_effective_affinity_mask(d));
 	old_cl =3D cpu_cluster(&cpu_data[old_cpu]);
 	cl =3D cpu_cluster(&cpu_data[cpu]);
=2D-=20
2.47.0


