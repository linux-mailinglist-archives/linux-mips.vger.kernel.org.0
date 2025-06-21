Return-Path: <linux-mips+bounces-9450-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9301CAE2787
	for <lists+linux-mips@lfdr.de>; Sat, 21 Jun 2025 07:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8BF17CD7A
	for <lists+linux-mips@lfdr.de>; Sat, 21 Jun 2025 05:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0F118B47C;
	Sat, 21 Jun 2025 05:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="iSiYv3n2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40914A23;
	Sat, 21 Jun 2025 05:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750485017; cv=none; b=NmkHFMpcJqtPCerXxYh19F4vK2GL0Kk5VwXk6EqnQX7UBuCzB/vlHi8wBNP74xWOJOTVccgN8ClT2S1H51f7uvv916D/GKunmpJYgmuM4mIh0gp8xVwuO3yeGTQAzsB+G8YE+5CPcxmzUWY6GhJA+WYcygoEG57otFz2PdSMrKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750485017; c=relaxed/simple;
	bh=Lcr+i3rWI4p9OEA9sI3nyijlU/z3uHQM8QMAaNeBLfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YkiAyEDbvyaueEiCubO6WwK7SAtIYjJE/y4Ami1UArikDV7DMkEU+6ol72qh4OXuf8RCxDOszdTRexfv2FVfSBMdkXRNUW17GyKSm9otji/akTmqxylXgUYWRCXL33IYueD2sdk8wHS0ZfTNrEnADqWXlWb+1fkIfIXkZeLQawk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=iSiYv3n2; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750485011; x=1751089811;
	i=markus.stockhausen@gmx.de;
	bh=RT8JT+qpbvXJIk8NZJrHDXUHQpc7EOuAc02Q6zYaxf0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iSiYv3n2XH2zOgOFOIS402ZM5WxJx7qrbmmG2Btr9YiiZ6eh+J/A4yiXWCX0+2gX
	 5gVunHQ6MktTY8kWH2xa43i4CaST03CetsQCqP+b8sMrMM9Hqxp1amXgVwfJtSIbW
	 514NCZ+LyD30LhzlFQspwJDZWH1+1iS760h64Fwc+JlB9LLSEKET8aF6AqbpOl0Mt
	 s8GiiP/o7dil57nex48nWDB46J45bFGGWIhP6HUYNlRvg318B2+zs9/f+EpKlzOxx
	 ZqyXOlmM//2NgvsYPaL4zATgCP9T4IzKM+BL6PpMN8TGin5gzinKh2Qe3saFFcmyw
	 VEv2sX9zYXAv6mZKIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from openwrt ([94.31.70.55]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95iR-1unblN4AWl-00w6kU; Sat, 21
 Jun 2025 07:50:11 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: tsbogend@alpha.franken.de,
	tglx@linutronix.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s.gottschall@dd-wrt.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v3] irqchip/mips-gic: allow forced affinity
Date: Sat, 21 Jun 2025 01:49:51 -0400
Message-ID: <20250621054952.380374-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2WUfsjsdwLmaYTLXA7lOqBCCjYxPpfY/UtXMi8pA8jYWTF66P7d
 3dPHewLadmyznGdYhX4dCAx/Bxratbs72HOQw84l6CQsl5KxFa84gwievqxPQooQi5thkm3
 2x5BOzPoU3rzzvmlrSAQj+iaZhYuK6rWbEo4EwH1o4yjqRzXbZtxzLCCOWriLI1R+Pgu+bc
 8wyjwM5us2ReaQPV5t0Sw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z9Ty9Te/pHg=;Y3ODNalVYkX9XvnU9ah/zmYYmu3
 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

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

Co-developed-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--

v3: fixed Signed-off-by chain
v2: simplified condition

=2D--
 drivers/irqchip/irq-mips-gic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic=
.c
index 34e8d09c12a0..19a57c5e2b2e 100644
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


