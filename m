Return-Path: <linux-mips+bounces-12868-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CAFD159DD
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B00130369BB
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4007F296BCF;
	Mon, 12 Jan 2026 22:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hywu/B5M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c4NrxSxJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5627237180
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258133; cv=none; b=DMlXM3HvBbQFW8/otL0L0oRh/6Rh7dFoNQ+B04UyGkQwPofW+kQDV9bb1VSVxaIVIB9+iaYRuET+NE0hETv7elRdQfY6yvsVjG0fXzl+L1EMArv6ezbhLoMeJkmBW7gndV2EYbNITcIqwZCz1yKHz+ljnvdT0khdZEOutcIR0lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258133; c=relaxed/simple;
	bh=p4l5epzlwiWHjVhIO2/jDLX5n+d8NFRxeH40gmPJkQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=saqSRs2d0CjSM6KSGvm+xaLuJiQyOSPCcsHujEz+qg7nLojdrquzfWjq0wjcB94zN7F/lifqTFGmw7VvQy87fkZU16ha2pbCfxlFwyjb8gUIPrxO8MkcNRHjUliOsJRiR7TbhixD0ikoQ8mR/nJIMsb0vXL72dRvR6NUqbN13zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hywu/B5M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c4NrxSxJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFrVjH1Szr3ritYktj49veV+ip6+M9srwjkzIIMqmsw=;
	b=Hywu/B5MCtgCoPIZVsZu0v1m44h86Rt/OhZjbVLKFhg9y7tKn1yoqkhEh/rZXhh4R84Ywv
	SsJ9avQK4OkCKfqy3mYsb3uTCY8qJjnuXP/U/UXRVJd+ILuBGvM30shnf8eEHFciDVqiZu
	uCehJhJ59CQTwsqjRwTTQ25BOiIpPtU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-rpUDz5RCNPOxmT0lJjJ09Q-1; Mon, 12 Jan 2026 17:48:49 -0500
X-MC-Unique: rpUDz5RCNPOxmT0lJjJ09Q-1
X-Mimecast-MFC-AGG-ID: rpUDz5RCNPOxmT0lJjJ09Q_1768258129
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b8738fb141so1569111585a.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258129; x=1768862929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFrVjH1Szr3ritYktj49veV+ip6+M9srwjkzIIMqmsw=;
        b=c4NrxSxJ2X/Dxy0eJyQqJzwLgxIHRwY6DQxWSLDDbRSFIxzXhGgR965cJltSNBgYDa
         vpLZgp4EqLoqp33ZCcMfTRREoM8KWTalrfgmlZWItE9/0rnuepmaH1CmBd8bmBkXW+Kp
         CcxeWg3ScEj7TjZ0o/6FVpLHQCIlP71zl8NKOB6e0KY/GaaKw3E5IGTBbt2VFC0uFUS6
         NoDRWkLWB4ypasBbqFRLPYIDk4yL5Gb5ePkYOieJMdmnmTfciZpZv+wSzpSDKLtVkNjG
         ukEqxaqMiW7QUBRfBdVTTgQ505iMHzPfHBbKI6dutCSCn4Ic/jvyKnSvX6isgHJjDXhF
         DvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258129; x=1768862929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aFrVjH1Szr3ritYktj49veV+ip6+M9srwjkzIIMqmsw=;
        b=qN4IeLmVD4p9lXb/vQciMw0p7vIRWKnVZhIPgkxUK2+ZuiVAGKGr0zKdvo0O1EUsNu
         upryJRtf9Nai2++kTooPwnkLMxjirUBTWd0Yx+ib5GX2zVnv7VlLbbI3ZTTIZkYBvxSz
         mzPpsh1xiyOmTZygB81Xsy53HKBidCjUmOk3vW+seJGwYtN576g0M70NUHrMOA7d8Rgu
         swIu0/urSYBD8tV83EB9Cl19o8JdrulKbxOehPHpw7f2E/xrieNdgzXKzUa5eGSNJDMp
         0WgSAEHrwZgMqKE8qWqKJV12WWey11wRLN+Pph2TlTuXXBPtbEx9qzNfcZINHvAwWjkW
         kDqw==
X-Gm-Message-State: AOJu0YyNoaIcrH3W4DoWHQdznGdVUO6Ex6rh9KcfW68EQEcUz3JUwjdT
	wJ+hX2gWHavWQbnqEpp0+W7C+jW/rER5SwnilaJLgRY0oOqAaulLjlrmjU5jNGbbBsma23pxxLb
	3XpQa760gSHYX96FAJACLlg4q39tT1nAt7xYsXBuPzoMH3v0n6MEvqIeA11+Aa0ODXuzN3ak=
X-Gm-Gg: AY/fxX7spMqxcXtFx33JmsEIUIBP4tZyx0RIhchyabcLx6SD5heM6WVb4CDRscpfmCs
	7FnHxb4fcTT2AR2Qehf5rfAKm9nzLdK7VpeOrpuRKceI469BqMHWDlbO2xDu13nkW0rjQO/iscg
	R7n6sIhu531W6Oc38SucPYWI7QwX+/wN2vHKJ/xU3T+ReysjFoa+YHNdeSBsDmx6F/7zUfSHgv2
	V4y2osdeGnxUBj3BxUryCD8rNq75No8UZ3S4Q63/sBFgUOIDA+bjTYsNIT8AckyPyPJ4pxJBRzU
	yRSapDuQsMzpqIbSfvvufnGEXl6QVc2VFEugh95MTs/AZyXi3l6mI5uKZWOVneIb9PWGakqst/s
	iczuSy2NbVxAJFqebFFh31qmxxcAAOQMihE9yOSAPDOrRZnsgqg==
X-Received: by 2002:a05:620a:1729:b0:8b2:e5da:d312 with SMTP id af79cd13be357-8c5208b0c33mr160327685a.39.1768258128856;
        Mon, 12 Jan 2026 14:48:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXqxT7UbsSaldVieYdVK98/L88XnIBt/eDge4cuC41YUUMAR+ewpSGD25efcOA/JHJxPMkFw==
X-Received: by 2002:a05:620a:1729:b0:8b2:e5da:d312 with SMTP id af79cd13be357-8c5208b0c33mr160325585a.39.1768258128476;
        Mon, 12 Jan 2026 14:48:48 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:47:55 -0500
Subject: [PATCH v2 01/16] MIPS: pic32: include linux/io.h header on several
 files
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-1-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=p4l5epzlwiWHjVhIO2/jDLX5n+d8NFRxeH40gmPJkQ4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTqzyl1TNe6WTqPGf7Mc/0Vc+eyPd2qRutux5tY37N6
 Ctc/5Gxo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlcvMnwV6K9sKE5PW6/4dzS
 P6aND+U467aUX67T+2360rbnmOnaBoZ/erzt/54HtCkf3Du38dp/DZGa/qcXYnkal27bkX8l2SS
 XCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The pic32.h header includes linux/io.h, however nothing from that
include file is directly used by pic32.h. Several C files that
include pic32.h indirectly depend on linux/io.h, so let's go ahead
and add the missing include so that linux/io.h can be dropped from
pic32.h.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/pic32/common/reset.c            | 1 +
 arch/mips/pic32/pic32mzda/early_clk.c     | 1 +
 arch/mips/pic32/pic32mzda/early_console.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/mips/pic32/common/reset.c b/arch/mips/pic32/common/reset.c
index a5fd7a8e2800ff06cfe8c0ed91c8ff6f5996750f..19db57bfffbd314b6e75d2eb9237540c4139dd83 100644
--- a/arch/mips/pic32/common/reset.c
+++ b/arch/mips/pic32/common/reset.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/pm.h>
 #include <asm/reboot.h>
 #include <asm/mach-pic32/pic32.h>
diff --git a/arch/mips/pic32/pic32mzda/early_clk.c b/arch/mips/pic32/pic32mzda/early_clk.c
index 6001e507d8e398dee77eed071f0e53f708b57a61..63727799d49a963d3b0d47d39ec5770c283047dc 100644
--- a/arch/mips/pic32/pic32mzda/early_clk.c
+++ b/arch/mips/pic32/pic32mzda/early_clk.c
@@ -3,6 +3,7 @@
  * Joshua Henderson <joshua.henderson@microchip.com>
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
+#include <linux/io.h>
 #include <asm/mach-pic32/pic32.h>
 
 #include "pic32mzda.h"
diff --git a/arch/mips/pic32/pic32mzda/early_console.c b/arch/mips/pic32/pic32mzda/early_console.c
index 3cd1b408fa1cb039f917f2d92e82fd00d8a44574..8afe4e636ace20b1e4269a6172fa5763afebc980 100644
--- a/arch/mips/pic32/pic32mzda/early_console.c
+++ b/arch/mips/pic32/pic32mzda/early_console.c
@@ -3,6 +3,7 @@
  * Joshua Henderson <joshua.henderson@microchip.com>
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
+#include <linux/io.h>
 #include <asm/mach-pic32/pic32.h>
 #include <asm/fw/fw.h>
 #include <asm/setup.h>

-- 
2.52.0


