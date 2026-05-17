Return-Path: <linux-mips+bounces-14621-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M8FwAzg0CWoyNgQAu9opvQ
	(envelope-from <linux-mips+bounces-14621-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 05:21:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AC155F191
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 05:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D14363007F41
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 03:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C663280A58;
	Sun, 17 May 2026 03:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyp8FK7X"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D1930EF97
	for <linux-mips@vger.kernel.org>; Sun, 17 May 2026 03:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778988085; cv=none; b=TOxoIOumqFRKISn8qAotMTh5bbMiWBcPSbxfbvv8gQOsFV7i6b2meKX2JkTwRXdocf0aG3gX9BimtyHAzmaJ7dIpIUNw04oxoErpec3SD2xUXTDTbdchnMYd2+CtBTdbcj6m4Qz88xB5x7dQXz3RZ67GCeGK5aYDhBRWWY4s1S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778988085; c=relaxed/simple;
	bh=bS7gzSgOira/C5sbFJAKIYmQiAqnWKcfuDov3bfUrU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BGIaxrwG7/lUyhwFcHxQix/IYNOgTMFY4BDNMkZ3zFTW2zMj/g7e7VdyBTyJW+Ea8e9hrz34DE3NKdsrCDiq0w33B39VaG36nab71AHD+QnbwxQ7aAGuKwyqPd8ksCO31qzLcajdmGpvejQQQa82elyKKONDjeedu7qBozFlASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyp8FK7X; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-1357c851a48so138399c88.1
        for <linux-mips@vger.kernel.org>; Sat, 16 May 2026 20:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778988083; x=1779592883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hwh+PfOT0kULc5coYuuwJFV2+WW9k6F0JFqDvwSNOgw=;
        b=iyp8FK7Xv/UexefOdsGqpRoejwOBU8cDjCEHIV1rbLFi40vd52WQhQQCxcdYVnBU2W
         4Na0XaFLwo0eGIu6DiBmnmE6Q5hn8sifiKxDrksZVZjJrD/T2mSiElOfwwg9KVCS26K+
         pEAGj7Ala1iMlUBGkXEhpSxHmLUP/qU8ZK9vr8zZVqK+MfGuGM8k8ORUsPK97uIEH7oz
         /mIS7FbfCsm5aBnxm7s3qQASgLy5hDb6rSBmO/gNwh7vDIP8pOW8OvdrgNXXt56cCaec
         LBCQpdzun14Q0CP9zxx7jzkGOzcDGwVSKp1OoRzywiF+gVKTDp/FsUPwSA1508Krqxmi
         9Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778988083; x=1779592883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hwh+PfOT0kULc5coYuuwJFV2+WW9k6F0JFqDvwSNOgw=;
        b=kIp3ItMvnqswEsmPT7BQnnbQCcnX8zzCfkgInSdOY3KsgmNG70j2zLHDCcfLRE/GqL
         oBoqk7Dam5ke2PhD7dcO7ngtHvdZyaVIDwgwpF4j1QHLUwrNpy19aDaNffa0e8RILWeJ
         jC99QEthR17vP11irpD7Py6aaD/tX2GrMFN2YtozOWUvnmsCoaGeYJezaaDxZamc+7l7
         rFCzESXD9x6xUU0KQzT3XuGrhlZNAP3qswN61v2H22R+p+Mar1sk+TuN/BQ54eR+9RCO
         mU2SYnqcwKdkH4TozJq+MROl3oR3CK0rH8m6vWhPxCXHjqGEY7EYGWyp7cALgl9hnIcL
         h3yQ==
X-Gm-Message-State: AOJu0YzOGguLbR4b4c5vc7H6hKOKALQ8HnUDB+lZ14vYh0Nf5v4Le71I
	w1ycZ7x7tCin3V8JQ6GWZWIWZdJoh0DLo19mpl7OSrxOD8tVAKdAYdMa6tEAE4lDUtQ=
X-Gm-Gg: Acq92OEAR2HqIqSpCRLmMldYal270PNwcnul6gWM25juopOxwN9leQwn4imA6fu9jU5
	9HJQK+zdW+fqdeSebyRRwmorDX9pBl/VzBG3BYYC9pxrVEjxbQ48nwv4pA30vEp6JjvIl5ZUhmM
	LDpd1KHynKbdp0fG3OZdX8973Fw31yhE8zr2iZmaPF2RaLDPvy5vkZkEbn+GOz+xCDPtsDZOB/y
	+OswThl3l4XB7UUHotX0a3j5XWQZkkrx0IP6h6qVCvG/VNl3rSqajDTgXLHMFbWus0252AFwEFA
	moNvKLsm+Q8kqBq4IN4HaZWikBusVQ1ZwaAng5ahkGMRLszEMKlIhwFTOl+mBy0Cr4XTZ4m6Q1m
	oxD/9ELnFJ9imNI1GVFkIigdgVUQL81KcvW3D3YGXgSmGo1t8RbN75xetLvCiAxy2ccGrwOVttx
	deQGeyNX8z5R7zPqPpssAUpC158ILEe5pcgPqMfYB4HesZj16ecjJhH+oMp67sGd1exPNQDw2Uo
	+Svyz5hf3gAxvraakI03X1v1pcCpZ7SNDE6uGRBWlWN4XncmVPF1LGWMZPb5hgeIzLnmkYJuzNN
	T02MlR/9cYbp6vQ5hXG5nvHLcaDl
X-Received: by 2002:a05:7022:688c:b0:12d:ce60:cb52 with SMTP id a92af1059eb24-135045177e8mr4497724c88.18.1778988082694;
        Sat, 16 May 2026 20:21:22 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed531esm15138016c88.8.2026.05.16.20.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 20:21:22 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-mips@vger.kernel.org,
	linux-crypto@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH] MIPS: Remove unused arch/mips/crypto directory
Date: Sat, 16 May 2026 20:20:56 -0700
Message-ID: <20260517032100.105696-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 58AC155F191
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,alpha.franken.de,gondor.apana.org.au,davemloft.net];
	TAGGED_FROM(0.00)[bounces-14621-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The last MIPS crypto code was moved to lib/crypto/mips in
commit c9e5ac0ab9d1 ("lib/crypto: mips/md5: Migrate optimized code into
library"). However, arch/mips/crypto still contains stub Kconfig,
Makefile, and .gitignore files. Remove these unnecessary files.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/mips/Makefile          | 2 --
 arch/mips/crypto/.gitignore | 2 --
 arch/mips/crypto/Kconfig    | 5 -----
 arch/mips/crypto/Makefile   | 5 -----
 crypto/Kconfig              | 3 ---
 5 files changed, 17 deletions(-)
 delete mode 100644 arch/mips/crypto/.gitignore
 delete mode 100644 arch/mips/crypto/Kconfig
 delete mode 100644 arch/mips/crypto/Makefile

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 6705fa5d9211..cff1a9a43b89 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -350,8 +350,6 @@ OBJCOPYFLAGS		+= --remove-section=.reginfo
 libs-y			+= arch/mips/lib/
 libs-$(CONFIG_MIPS_FP_SUPPORT) += arch/mips/math-emu/
 
-drivers-y			+= arch/mips/crypto/
-
 # suspend and hibernation support
 drivers-$(CONFIG_PM)	+= arch/mips/power/
 
diff --git a/arch/mips/crypto/.gitignore b/arch/mips/crypto/.gitignore
deleted file mode 100644
index 0d47d4f21c6d..000000000000
--- a/arch/mips/crypto/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-poly1305-core.S
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
deleted file mode 100644
index 6a5bd5074867..000000000000
--- a/arch/mips/crypto/Kconfig
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-menu "Accelerated Cryptographic Algorithms for CPU (mips)"
-
-endmenu
diff --git a/arch/mips/crypto/Makefile b/arch/mips/crypto/Makefile
deleted file mode 100644
index 5adb631a69c1..000000000000
--- a/arch/mips/crypto/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for MIPS crypto files..
-#
-
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 62221507f2b9..5203aa8f06f3 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1361,9 +1361,6 @@ endif
 if ARM64
 source "arch/arm64/crypto/Kconfig"
 endif
-if MIPS
-source "arch/mips/crypto/Kconfig"
-endif
 if PPC
 source "arch/powerpc/crypto/Kconfig"
 endif
-- 
2.43.0


