Return-Path: <linux-mips+bounces-9120-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1FDAC4095
	for <lists+linux-mips@lfdr.de>; Mon, 26 May 2025 15:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65AFF3AC756
	for <lists+linux-mips@lfdr.de>; Mon, 26 May 2025 13:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442D320C01B;
	Mon, 26 May 2025 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="cWcWiC9E"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686C6BA2D;
	Mon, 26 May 2025 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266931; cv=none; b=XpjId334tupsJFktYmPxp61JEyuSjQrBdZRt/ApMXfdxmReMRjjRjVllMB+8aEgNQN6EAaK/S6VxiuV2uIn37KWITUhTIN58NryTrZwnNdX+EJzCKdci9/VHvv+nVcZ2/s7NBFWjlpjBKSeC4v77lpdDcZvj0P5MAoUhm8hIubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266931; c=relaxed/simple;
	bh=XEmNFkIUnC+00NuAw7FuMw1RAsrFOrO1LnNcY9qaIGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVC8eE44FOB+dOK1L9eBhQ/W/yl6iKKcb7+YbI3r9bc2fubUMo2X8yQynJHzubDyzohmTDQ89sZRlthvE/8JtHceuFd9zKMM8pqJmnjdAUoGXL5Fo+PI5SjCvuoJlV/xN5+dMKxELHCNiz5SnxTveN8xEImgoWqXzSC9utVAwJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=cWcWiC9E; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1748266917; x=1748871717;
	i=markus.stockhausen@gmx.de;
	bh=QT9xMJPKD0qzDG3KxS6qE4Kj6L988zZ4YfHF3Bgvm8g=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cWcWiC9EMWHf4zc9ArhZCATg1RcQ2Hy+gnNkeuD0GZU/eIIMPrfLdgv5TnwDVyR0
	 kxxRtBjy8xkLjFAm57UmYI74yFtKCLAGxRuQN+gHPlD1bUL6k7ekLpehRshhzza4b
	 h+tNBgXLg5bkGzKVtp29/cJj/t76DCpeQf8lEJc5CeV2OU+i9lpL4ZaV+t0gqCYXf
	 ZRwYui4IUIKKKhkL9+mzFAglKxT6Z9Gm4l5Yw2rJnlvNZ0gK3l6Dw5wLCH6/LYjdE
	 ulw+fyVMf4hmDz/bs0oGEsbgDJPrUSwtQPoMvWEC6XRp1GvehEnbv6xiTpkp3+5s5
	 tDe98fjuoxYim9+61w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from openwrt.willemsstb.de ([94.31.70.55]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5vW-1uWhG90QC0-00P4H2; Mon, 26
 May 2025 15:41:57 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: tsbogend@alpha.franken.de,
	tglx@linutronix.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s.gottschall@dd-wrt.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v2] irqchip/mips-gic: allow forced affinity
Date: Mon, 26 May 2025 09:41:49 -0400
Message-ID: <20250526134149.3239623-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W7LmLjxY4pwBJWzlx0/TMxgq6SqDgvc9W7jeL/i1X0nJ9DjiSdE
 kJ6P+UuH7ZNxCmsBf5gA1fQ5pFWBe0JtVV4SoJ2solsREtOeH7mVbNJMUf1cL6bylhZhHCt
 VZuF4Vm/bQq00fJGfQ2wiftKTYz6pgMjRu+5uxkfE6yS/nWzxq6a1ZOGU2jIaRUl8Pbo4wI
 ucdVc6qgJSHlIoJVoKbxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RIG9vDBTQGw=;WedP2ko1P4IeE88cknLCrBdGcOB
 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
 IqjFGtLmNKZkVZcPFyq0Zf8kdfHB8ptu4x

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
exactly this purpose like in other drivers. With this patch affinity can
be set as follows:

- force =3D false: allow to set affinity to any online cpu
- force =3D true: allow to set affinity to any cpu

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
=2D--
 drivers/irqchip/irq-mips-gic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic=
.c
index bca8053864b2..1c2284297354 100644
=2D-- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -375,9 +375,13 @@ static int gic_set_affinity(struct irq_data *d, const=
 struct cpumask *cpumask,
 	/*
 	 * The GIC specifies that we can only route an interrupt to one VP(E),
 	 * ie. CPU in Linux parlance, at a time. Therefore we always route to
-	 * the first online CPU in the mask.
+	 * the first forced or online CPU in the mask.
 	 */
-	cpu =3D cpumask_first_and(cpumask, cpu_online_mask);
+	if (force)
+		cpu =3D cpumask_first(cpumask);
+	else
+		cpu =3D cpumask_first_and(cpumask, cpu_online_mask);
+
 	if (cpu >=3D NR_CPUS)
 		return -EINVAL;
=20
=2D-=20
2.47.0


