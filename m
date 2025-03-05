Return-Path: <linux-mips+bounces-8086-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64025A4FB61
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 11:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2FE43A7B0C
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 10:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8B72063C1;
	Wed,  5 Mar 2025 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="Qd8524oJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8F13AC1;
	Wed,  5 Mar 2025 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169508; cv=none; b=lONXO2gSPlX1gi5d110+dmZZT0PumYmTjWIey6yTfFjk0rMtFALsXhqdBuIi3GoMNe9qf/YoG0/TyaPAHdFJVo9Clfswq3o21vZQIIpgXnzUGjdWIIjCXwwKofzT2osg2OWUshgPWex97puANgkHNbiCTmISqwQQcfn2cqjn0h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169508; c=relaxed/simple;
	bh=DCfwg8n6Rd6DlSKf/k7fXD3X4GH1VxcfQ3j4yYNkI00=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3XFxmfeLXtVEos38KJkYkg9C4XLbl39P3IOPLlwEadOLadr9o7py0MGTIRmW7RN4kPE8VprBJG4e0rOGAcXjcBXsnjWACXqAcCejk42d2qc0eZaVMqmeq+1eUkT982Q1GI00JYOKgEa3rSxlRGbSQkahk5M1shjE0G/EnvfKXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=Qd8524oJ; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5258qqsa019244;
	Wed, 5 Mar 2025 02:10:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=P
	LDLKL4Yt/5sxQy9ArLCJTWD0J80wY4ItfCHJOLMcoY=; b=Qd8524oJlQz3b9R5a
	u6mNn9qbNbz7OjRUIYKsqHf1VxMyZvy2Njgbd/Q/BtVGIaEBWGY3kayn1M3obh0K
	A+6Ng10Oeg/vG2bjKY5SnfNpk00Vstu3sSBVrJnnrsKcGtho8DYfkTUja3o0ttLa
	77a3Fp3QSbKwi/7zSZCbmhE+IKS2AKPeybGweL2Y+9MvPZmLg7vYFCV3fBWS8iKm
	X/ne+fmKINe1sGjom3D6oKrOtXH7X/HdUu9DRq7PlNUr1/vD0tOuCXNYe1NgD6Jc
	uBn/Z/QDMOmD0n+wvW0UJ3Xyz42Fss7lq0PsUPnhdzsX4a9a3q0NxVUO6lQy6yyZ
	hqm5Q==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 456kg184rh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 02:10:37 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 5 Mar 2025 02:10:36 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 5 Mar 2025 02:10:36 -0800
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id F024D5B6929;
	Wed,  5 Mar 2025 02:10:35 -0800 (PST)
From: George Cherian <george.cherian@marvell.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>, <jwerner@chromium.org>,
        <evanbenn@chromium.org>, <kabel@kernel.org>, <krzk@kernel.org>,
        <mazziesaccount@gmail.com>, <thomas.richard@bootlin.com>,
        <lma@chromium.org>, <bleung@chromium.org>,
        <support.opensource@diasemi.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andy@kernel.org>, <paul@crapouillou.net>,
        <alexander.usyskin@intel.com>, <andreas.werner@men.de>,
        <daniel@thingy.jp>, <romain.perier@gmail.com>,
        <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
        <tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
        <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
        <naveen@kernel.org>, <mwalle@kernel.org>, <xingyu.wu@starfivetech.com>,
        <ziv.xu@starfivetech.com>, <hayashi.kunihiko@socionext.com>,
        <mhiramat@kernel.org>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>, <imx@lists.linux.dev>,
        <linux-mips@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linuxppc-dev@lists.ozlabs.org>, <patches@opensource.cirrus.com>,
        George Cherian <george.cherian@marvell.com>
Subject: [PATCH v4 2/2] drivers: watchdog: Add support for panic notifier callback
Date: Wed, 5 Mar 2025 10:10:25 +0000
Message-ID: <20250305101025.2279951-3-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305101025.2279951-1-george.cherian@marvell.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: hTGQaz5SSlFM3i8596GAtQh984SP-LDu
X-Proofpoint-GUID: hTGQaz5SSlFM3i8596GAtQh984SP-LDu
X-Authority-Analysis: v=2.4 cv=E7k3pbdl c=1 sm=1 tr=0 ts=67c8231d cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=Vs1iUdzkB0EA:10 a=M5GUcnROAAAA:8 a=nrZ1DTJrTwF-UHMnxCAA:9 a=jEgSlwDUfglsTIS4Y9Cu:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01

Watchdog is not turned off in kernel panic situation.
In certain systems this might prevent the successful loading
of kdump kernel. The kdump kernel might hit a watchdog reset
while it is booting.

To avoid such scenarios add a panic notifier call back function
which can stop the watchdog. This provision can be enabled by
passing watchdog.stop_on_panic=1 via kernel command-line parameter.

Signed-off-by: George Cherian <george.cherian@marvell.com>
---
 drivers/watchdog/watchdog_core.c | 35 ++++++++++++++++++++++++++++++++
 include/linux/watchdog.h         |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index d46d8c8c01f2..f0006d90da92 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -34,6 +34,7 @@
 #include <linux/idr.h>		/* For ida_* macros */
 #include <linux/err.h>		/* For IS_ERR macros */
 #include <linux/of.h>		/* For of_get_timeout_sec */
+#include <linux/panic_notifier.h> /* For panic handler */
 #include <linux/suspend.h>
 
 #include "watchdog_core.h"	/* For watchdog_dev_register/... */
@@ -47,6 +48,9 @@ static int stop_on_reboot = -1;
 module_param(stop_on_reboot, int, 0444);
 MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
 
+static bool stop_on_panic;
+module_param(stop_on_panic, bool, 0444);
+MODULE_PARM_DESC(stop_on_panic, "Stop watchdogs on panic (0=keep watching, 1=stop)");
 /*
  * Deferred Registration infrastructure.
  *
@@ -155,6 +159,23 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
 }
 EXPORT_SYMBOL_GPL(watchdog_init_timeout);
 
+static int watchdog_panic_notify(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct watchdog_device *wdd;
+
+	wdd = container_of(nb, struct watchdog_device, panic_nb);
+	if (watchdog_active(wdd)) {
+		int ret;
+
+		ret = wdd->ops->stop(wdd);
+		if (ret)
+			return NOTIFY_BAD;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int watchdog_reboot_notifier(struct notifier_block *nb,
 				    unsigned long code, void *data)
 {
@@ -334,6 +355,17 @@ static int ___watchdog_register_device(struct watchdog_device *wdd)
 				wdd->id, ret);
 	}
 
+	if (stop_on_panic) {
+		if (wdd->ops->stop && !(wdd->info->options & WDIOF_STOP_MAYSLEEP)) {
+			wdd->panic_nb.notifier_call = watchdog_panic_notify;
+			atomic_notifier_chain_register(&panic_notifier_list,
+						       &wdd->panic_nb);
+			set_bit(WDOG_STOP_ON_PANIC, &wdd->status);
+		} else {
+			pr_warn("watchdog%d: stop_on_panic not supported\n", wdd->id);
+		}
+	}
+
 	return 0;
 }
 
@@ -390,6 +422,9 @@ static void __watchdog_unregister_device(struct watchdog_device *wdd)
 	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
 		unregister_reboot_notifier(&wdd->reboot_nb);
 
+	if (test_bit(WDOG_STOP_ON_PANIC, &wdd->status))
+		atomic_notifier_chain_unregister(&panic_notifier_list,
+						 &wdd->panic_nb);
 	watchdog_dev_unregister(wdd);
 	ida_free(&watchdog_ida, wdd->id);
 }
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 99660197a36c..ef6f1136a4c5 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -108,6 +108,7 @@ struct watchdog_device {
 	struct notifier_block reboot_nb;
 	struct notifier_block restart_nb;
 	struct notifier_block pm_nb;
+	struct notifier_block panic_nb;
 	void *driver_data;
 	struct watchdog_core_data *wd_data;
 	unsigned long status;
@@ -118,6 +119,7 @@ struct watchdog_device {
 #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
 #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
 #define WDOG_NO_PING_ON_SUSPEND	5	/* Ping worker should be stopped on suspend */
+#define WDOG_STOP_ON_PANIC	6	/* Should be stopped on panic for loading kdump kernels */
 	struct list_head deferred;
 };
 
-- 
2.34.1


