Return-Path: <linux-mips+bounces-8319-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3427DA6D0B3
	for <lists+linux-mips@lfdr.de>; Sun, 23 Mar 2025 20:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F4913A62ED
	for <lists+linux-mips@lfdr.de>; Sun, 23 Mar 2025 19:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2933078C9C;
	Sun, 23 Mar 2025 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLMpK4am"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF532E3399
	for <linux-mips@vger.kernel.org>; Sun, 23 Mar 2025 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742756871; cv=none; b=dsULT/u+rHwOKTDfM66frz1dxjj00iM+DEnENcki6VXK2rN4hSO7lX/E2PJNX3OPSu81fItKS+zdn0Yi1+FLGB3oP8zQCBWMznaOGhflpuCbCcHRf7uXP6JWFKAwPS4QWps0YNwjJy3RSp4uxMpIQLli5GoSaJsoavup/BO6cWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742756871; c=relaxed/simple;
	bh=BEIic7V3IbJFVfdKgVHWODnsPjLjd4ys3WKIRdzw04Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RukUyc5s7ytyjE+N6lICIEtnoOIL6hMOCws7T77x4GqmNw/dRybmZ/fshOMHcmuoi58THA958Vz+55ecNvXAJCFm6C/4bRRJT66zNljEUCeEofpPVeoqyT0R/Sua3/ABurYtNnN35BhjmwsqJHn+gpf2WesApYV8+1Rjg3S0bo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLMpK4am; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499614d3d2so4205565e87.3
        for <linux-mips@vger.kernel.org>; Sun, 23 Mar 2025 12:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742756867; x=1743361667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0awTdPceABBAf2g7yCTzQQMJhua2KB1IW8GCaITec1w=;
        b=MLMpK4am8zJ3r7fOMQVU9Xu73L+hQSJrFJEZnI0fXbY48fES9BdMRlDhwF9nVX3FC8
         e5gpSxXwDfSPO1i7y/fx6LGDTX0Fo6P8NPTTyWOD/B3e/VyjurqsdjywYu/0R3Q6yxiE
         1Il99Y6xmPF3IKyEkh6Xu6XmHaDXxm70ZSvdhIXbmexS62CsemcgYjX9tFqrhrdmVio3
         Ru+wl+Mg6IH/noWOTpbO+FIWOKqxiC+inCBHYTR3NXXVJMWj9oLfj/kNFAak3OmW8oFw
         sVqAbjRHC9a5IWpsfR5x8uwU/rKuTL7ZaWTBsN2Dw7NpC7sArXJbEDKmAnHfGdTKchum
         Q38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742756867; x=1743361667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0awTdPceABBAf2g7yCTzQQMJhua2KB1IW8GCaITec1w=;
        b=FLOtIqkf2egw/hGIPQKJ25jcAUI4UFxMTZGJI0iAr/NEcrYtYRL8F4q419BNHaIyaq
         vetxYsCkTeQQd6C9Nau39Bv60IyjwX9lVwJ5JATiBhyZVKTCiTjaPWN6+tCc/LZvXdsk
         G8dD4IRV/cPPz3CX7euZlarzfhiKSd2y0JQ+auBjbVwg/sURMGVHAWRnna5Js+eIDK8k
         oJCTc3j6aKvClZ6aUCActNxOroGYHbDaGDL0MBxizO49Fvqk1ZOhMqfdmGPIuWPPePLi
         lJ272i26wqXeB6KdHuHs1Nd2QwL8QK1wGSadEYTE+E51zJ/jjGqyZxjvZcxTSwiDZxWw
         1q3w==
X-Gm-Message-State: AOJu0Yygw7J9loofVuGigIjxNBrWCV7hJ4es7JizcOzwk3tACj+d+mcJ
	ar7V19ZgfAS230zi2487j3SFpG9J+w5SCYwvHNdVgVDqPt9Jr7yIjb1sI02aEww=
X-Gm-Gg: ASbGnctxbimIVhC4qVPNEyN1biCkavYowsrbyVvcNlMEmY337P2Grze90Q+viAOLRXp
	wyXkpdvHlvXZQUv1G3TwW6XZTsRIxxorssk8xop7Du6ho+FiZmCZmlXl53Is1HjuQUrs7NWiVjX
	jP7BKu6rlFB/rIa3YaNSkmzI6pXMMhpTZW6qAnz176KUQ3f5SY5C1YlTjMVY9L7A6rk+wjuWO4V
	cv89lnpGc9j+leZPr53MPuvsN7f+Gki8Dtbmv4S9uAAxupO9N4zEY3yTtqS4n50Hw2oYMuOUorO
	SsfKrF/fUgBkjeFEaxtJUoE8XikgyMxe0I/+6fJ4WkdjuZ6WwOELOH22i6PWC2jGTnI2uJJ/Mz7
	f2mRs/qO80kJWgUPOQGJqDqZPW5cR3ZAfKlHmcNAjQwaIGIjJJu/9no+17imEohpqSQ==
X-Google-Smtp-Source: AGHT+IE5Yg8Hp+lOY/yoVroXEQ/cF1jwS/9N70kEyHTo8mHoUl92Ez78KjsFuBg2ilBc1Y4gz+iYhA==
X-Received: by 2002:a05:6512:3e23:b0:549:8fb5:f0ca with SMTP id 2adb3069b0e04-54ad647679cmr3201603e87.2.1742756866470;
        Sun, 23 Mar 2025 12:07:46 -0700 (PDT)
Received: from yocto-build-johan.c.remarkable-codex-builds.internal (122.96.88.34.bc.googleusercontent.com. [34.88.96.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad650925esm855062e87.193.2025.03.23.12.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 12:07:45 -0700 (PDT)
From: Johan Korsnes <johan.korsnes@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Johan Korsnes <johan.korsnes@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] arch: mips: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX
Date: Sun, 23 Mar 2025 20:07:34 +0100
Message-ID: <20250323190734.111670-1-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This option was removed from the Kconfig in commit
8c710f75256b ("net/sched: Retire tcindex classifier") but it was not
removed from the defconfigs.

Fixes: 8c710f75256b ("net/sched: Retire tcindex classifier")
Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/configs/gpr_defconfig             | 1 -
 arch/mips/configs/ip22_defconfig            | 1 -
 arch/mips/configs/ip27_defconfig            | 1 -
 arch/mips/configs/malta_defconfig           | 1 -
 arch/mips/configs/malta_kvm_defconfig       | 1 -
 arch/mips/configs/malta_qemu_32r6_defconfig | 1 -
 arch/mips/configs/maltaaprp_defconfig       | 1 -
 arch/mips/configs/maltasmvp_defconfig       | 1 -
 arch/mips/configs/maltasmvp_eva_defconfig   | 1 -
 arch/mips/configs/maltaup_defconfig         | 1 -
 arch/mips/configs/maltaup_xpa_defconfig     | 1 -
 arch/mips/configs/mtx1_defconfig            | 1 -
 arch/mips/configs/rb532_defconfig           | 1 -
 arch/mips/configs/rm200_defconfig           | 1 -
 14 files changed, 14 deletions(-)

diff --git a/arch/mips/configs/gpr_defconfig b/arch/mips/configs/gpr_defconfig
index 92fc0edbac47..12f3eed8a946 100644
--- a/arch/mips/configs/gpr_defconfig
+++ b/arch/mips/configs/gpr_defconfig
@@ -116,7 +116,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
index e22e8b825903..31ca93d3acc5 100644
--- a/arch/mips/configs/ip22_defconfig
+++ b/arch/mips/configs/ip22_defconfig
@@ -161,7 +161,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index b08a199767d1..829d731713a9 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -63,7 +63,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 4390d30206d9..ae59a90969f8 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -190,7 +190,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index d63d8be8cb50..9e16092261da 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -194,7 +194,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/malta_qemu_32r6_defconfig b/arch/mips/configs/malta_qemu_32r6_defconfig
index b21f48863d81..1b98f6945c2d 100644
--- a/arch/mips/configs/malta_qemu_32r6_defconfig
+++ b/arch/mips/configs/malta_qemu_32r6_defconfig
@@ -64,7 +64,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/maltaaprp_defconfig b/arch/mips/configs/maltaaprp_defconfig
index ecfa8a396c33..7b8905cb3400 100644
--- a/arch/mips/configs/maltaaprp_defconfig
+++ b/arch/mips/configs/maltaaprp_defconfig
@@ -66,7 +66,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
index 5cb4f262a4ea..8249f6a51895 100644
--- a/arch/mips/configs/maltasmvp_defconfig
+++ b/arch/mips/configs/maltasmvp_defconfig
@@ -67,7 +67,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
index 5e1498296782..21cb37668763 100644
--- a/arch/mips/configs/maltasmvp_eva_defconfig
+++ b/arch/mips/configs/maltasmvp_eva_defconfig
@@ -68,7 +68,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/maltaup_defconfig b/arch/mips/configs/maltaup_defconfig
index c8594505d676..3df9cd669683 100644
--- a/arch/mips/configs/maltaup_defconfig
+++ b/arch/mips/configs/maltaup_defconfig
@@ -65,7 +65,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 338bb6544a93..bb44b0e07f12 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -191,7 +191,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
index 8e98c0796437..06b7a0b97eca 100644
--- a/arch/mips/configs/mtx1_defconfig
+++ b/arch/mips/configs/mtx1_defconfig
@@ -162,7 +162,6 @@ CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/rb532_defconfig b/arch/mips/configs/rb532_defconfig
index 517f1b060bf4..0261969a6e45 100644
--- a/arch/mips/configs/rb532_defconfig
+++ b/arch/mips/configs/rb532_defconfig
@@ -77,7 +77,6 @@ CONFIG_NET_SCH_CBQ=m
 CONFIG_NET_SCH_PRIO=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_defconfig
index 08e1c1f2f4de..c757742c1f50 100644
--- a/arch/mips/configs/rm200_defconfig
+++ b/arch/mips/configs/rm200_defconfig
@@ -143,7 +143,6 @@ CONFIG_NET_SCH_GRED=m
 CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
-- 
2.49.0


