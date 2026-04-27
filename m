Return-Path: <linux-mips+bounces-14338-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBJbLJ6L72kPCgEAu9opvQ
	(envelope-from <linux-mips+bounces-14338-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:15:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC0647623E
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2403633214F0
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 15:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF17A34B1A4;
	Mon, 27 Apr 2026 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAjRY3Up"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B008346A15
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305279; cv=none; b=ZyPnyVstMfkcHStYjpxvUkNi+nsDbHX4sTE3q0OIZE0QrAAzsJaaZ9zwNb8HhdHNkPyEhZuc58PRVn6zAqC3nFb1hVSgNe2CJlYoB0l5ZHiZJ6i5lIVcIZOHgoLWbYbVi4g8hjWe01PpNdLz0dLybGFxva5CpJqIa0Lhamy8YVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305279; c=relaxed/simple;
	bh=RFwtc+DWnFArVH3yDlpvTx4fUm7z+0DYCBQcxeZkztg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgFQKATolKhPbkILdqni+xvvdE8Ywfb+Ybc/Lb2LVqemfCG9mGDorohJmc+KSipQqQd9UjfLbolltiEGfHA2KsRQvFHymzgDhXmsrFEWx1g4OpoBmJObm52hw5peqK7BPvMBblSsPVf8Wd6Zh5aDU/aKH7TaYtLClqa/JbyytJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAjRY3Up; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ab232cc803so49764255ad.3
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305278; x=1777910078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AM2ciHe3IZQx3bTbi2nzxHzfQ0F42LMlFGioqZ6RPhA=;
        b=jAjRY3UpFLLPzqYxi0LjtNkDVl0VQOyUqzRQMWBNmSI84wBf549v5RLd99LxXafJDd
         vdALHIfPINb8Fl/wKX5079TS32+QZoHBZDMKrPRHDhhmQTn0N9pKnov37lTtbMSGZ28B
         cV+K/0XQ6JFC9iosVJvqpWgUugnm33DOlWxGhUC03o31j0xf/XKGrb7bt0KF3+ABUTPe
         M0GsFQm+ZLLg/bsZfmKEYEZUjLoPDdOehO30LcHZcCv3b7iNnvPTCF33PI4R8YI5bLcR
         eYhpXN5ngp/bvewOi6+pDo4XXnuDX5n85lzrceIjyyqvrpBs00HUiwHwX6lazvTbhE4V
         qhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305278; x=1777910078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AM2ciHe3IZQx3bTbi2nzxHzfQ0F42LMlFGioqZ6RPhA=;
        b=kN68/GbWAwh8OWR2M43gm0JM2TsKMuEqOZ5UecrQ/D75jOj2Q50CSiS4WsBsYuY9pI
         umEaX2ZeE9SW9qV5tWde4rQViee0iCYNX8flhvXLm6UcMni9E9yKZz/p/hJKTwMA7pa+
         ttkELVS9xqe/InRy2VXcriefbk/MRFTVeiW2aYrhnVvc0F0al2DBykOxti1NgERsWZU6
         Q0PUvM7EbyKd8i9t6t5ydCQDoEgiO5gu42iz+CzrtIaXzMSb52ltszK/NQiwfnQie4Mz
         u37uyFlQh3fH0OFjUdXqBv1FLbbN5jG681o28ZwwAMPULzNL0UkXoxhIBEEzyCVHm7/I
         ch+Q==
X-Gm-Message-State: AOJu0YxE8F92p1kcEK+sIpJrQRhCYYYwl1Fn8yZ7/k0zQP7pMJ2kVddq
	S/g6WikaPIQ9gmLVlLENY4DNK6ImhY59en0VXv20SflW1B/1cnjJvsTVK9WcD+Nv/+QNhw==
X-Gm-Gg: AeBDieta7GqQc0QBi4QK6tgVPLEmrmednR0+76geZNfNnyOJZMoLxGeInj9ODi5Lfuo
	Bi467BMkt12LnFBbDFEGqrldOZ+rP+6yvCtGEeNXsO9iU9Px25AQE/N6qzwZ8tUzKtmdh+IWMuo
	x5aKOaQkcTKXsNqTUhSKcZ7kE3vMX0DnkwZxMqiOsbMFidUIJLNzhNCpRUp4yu7Kwu36TINAclN
	OSW9ZxG8Zq7t76BlXSsVgDO5OgZtlnAZGBy3RL2siIWml9dAad5Z7WDfyZnNlnNAIHakuxjUZhX
	jB2sMqQ3Z3oQI16oNr1hXo0srX/Xvt7IjUIbwIfSPG1NQ48P7LS0gdTxYbdOoZQl6BxQtCtkmui
	MRMz7xjxIb91A5ruwPxigCuE0OSjtVltsYutOuzZMlmJLYHEn0O5JCsBlTiCHnIDsNvKh1UQio0
	OQfkRhaLceoDWGRhyL7ezs55jPQTc33WEGqDnYssLWnJg3vHqDLkc=
X-Received: by 2002:a17:903:2acb:b0:2ae:450c:951e with SMTP id d9443c01a7336-2b5f9f08968mr469184115ad.17.1777305277630;
        Mon, 27 Apr 2026 08:54:37 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2df0asm309250075ad.26.2026.04.27.08.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:37 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 2/7] staging: octeon: convert cvmx_helper_interface_mode_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:22 +0800
Message-ID: <20260427155427.668540-3-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
References: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3BC0647623E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-14338-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kunjinkaojp@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The Linux kernel coding style discourages the use of typedefs for
enums. Convert cvmx_helper_interface_mode_t to a plain 'enum
cvmx_helper_interface_mode' and update all users across the MIPS
Octeon architecture code and the staging driver stubs.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/cavium-octeon/executive/cvmx-helper-util.c | 2 +-
 arch/mips/cavium-octeon/executive/cvmx-helper.c      | 8 ++++----
 arch/mips/cavium-octeon/executive/cvmx-pko.c         | 2 +-
 arch/mips/include/asm/octeon/cvmx-helper-util.h      | 2 +-
 arch/mips/include/asm/octeon/cvmx-helper.h           | 6 +++---
 drivers/staging/octeon/ethernet.c                    | 2 +-
 drivers/staging/octeon/octeon-stubs.h                | 6 +++---
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-util.c b/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
index 53b912745dbd..abaf91f6ae7c 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
@@ -52,7 +52,7 @@
  *
  * Returns String
  */
-const char *cvmx_helper_interface_mode_to_string(cvmx_helper_interface_mode_t
+const char *cvmx_helper_interface_mode_to_string(enum cvmx_helper_interface_mode
 						 mode)
 {
 	switch (mode) {
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 9abfc4bf9bd8..1985cd66806a 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -95,7 +95,7 @@ EXPORT_SYMBOL_GPL(cvmx_helper_ports_on_interface);
  * @INTERNAL
  * Return interface mode for CN68xx.
  */
-static cvmx_helper_interface_mode_t __cvmx_get_mode_cn68xx(int interface)
+static enum cvmx_helper_interface_mode __cvmx_get_mode_cn68xx(int interface)
 {
 	union cvmx_mio_qlmx_cfg qlm_cfg;
 	switch (interface) {
@@ -147,7 +147,7 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_cn68xx(int interface)
  * @INTERNAL
  * Return interface mode for an Octeon II
  */
-static cvmx_helper_interface_mode_t __cvmx_get_mode_octeon2(int interface)
+static enum cvmx_helper_interface_mode __cvmx_get_mode_octeon2(int interface)
 {
 	union cvmx_gmxx_inf_mode mode;
 
@@ -247,7 +247,7 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_octeon2(int interface)
  * @INTERNAL
  * Return interface mode for CN7XXX.
  */
-static cvmx_helper_interface_mode_t __cvmx_get_mode_cn7xxx(int interface)
+static enum cvmx_helper_interface_mode __cvmx_get_mode_cn7xxx(int interface)
 {
 	union cvmx_gmxx_inf_mode mode;
 
@@ -289,7 +289,7 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_cn7xxx(int interface)
  * Returns Mode of the interface. Unknown or unsupported interfaces return
  *	   DISABLED.
  */
-cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int interface)
+enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int interface)
 {
 	union cvmx_gmxx_inf_mode mode;
 
diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/cavium-octeon/executive/cvmx-pko.c
index 6e70b859a0ac..760abbe12479 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-pko.c
@@ -120,7 +120,7 @@ static void __cvmx_pko_port_map_o68(void)
 {
 	int port;
 	int interface, index;
-	cvmx_helper_interface_mode_t mode;
+	enum cvmx_helper_interface_mode mode;
 	union cvmx_pko_mem_iport_ptrs config;
 
 	/*
diff --git a/arch/mips/include/asm/octeon/cvmx-helper-util.h b/arch/mips/include/asm/octeon/cvmx-helper-util.h
index 97b27a07cfb0..103bb5b3142b 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper-util.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper-util.h
@@ -42,7 +42,7 @@
  * Returns String
  */
 extern const char
-    *cvmx_helper_interface_mode_to_string(cvmx_helper_interface_mode_t mode);
+    *cvmx_helper_interface_mode_to_string(enum cvmx_helper_interface_mode mode);
 
 /**
  * Setup Random Early Drop to automatically begin dropping packets.
diff --git a/arch/mips/include/asm/octeon/cvmx-helper.h b/arch/mips/include/asm/octeon/cvmx-helper.h
index 0cddce35291b..98824ff6314c 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper.h
@@ -38,7 +38,7 @@
 #include <asm/octeon/cvmx-fpa.h>
 #include <asm/octeon/cvmx-wqe.h>
 
-typedef enum {
+enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
 	CVMX_HELPER_INTERFACE_MODE_RGMII,
 	CVMX_HELPER_INTERFACE_MODE_GMII,
@@ -49,7 +49,7 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_PICMG,
 	CVMX_HELPER_INTERFACE_MODE_NPI,
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
-} cvmx_helper_interface_mode_t;
+};
 
 union cvmx_helper_link_info {
 	uint64_t u64;
@@ -125,7 +125,7 @@ extern int cvmx_helper_get_number_of_interfaces(void);
  * Returns Mode of the interface. Unknown or unsupported interfaces return
  *	   DISABLED.
  */
-extern cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
+extern enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
 								   interface);
 
 /**
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc14c8..5f9c29071fab 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -798,7 +798,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
-		cvmx_helper_interface_mode_t imode =
+		enum cvmx_helper_interface_mode imode =
 		    cvmx_helper_interface_get_mode(interface);
 		int num_ports = cvmx_helper_ports_on_interface(interface);
 		int port;
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 289a2d41fdc5..6c0329270464 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -222,7 +222,7 @@ enum cvmx_spi_mode {
 	CVMX_SPI_MODE_DUPLEX = 3
 };
 
-typedef enum {
+enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
 	CVMX_HELPER_INTERFACE_MODE_RGMII,
 	CVMX_HELPER_INTERFACE_MODE_GMII,
@@ -233,7 +233,7 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_PICMG,
 	CVMX_HELPER_INTERFACE_MODE_NPI,
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
-} cvmx_helper_interface_mode_t;
+};
 
 typedef enum {
 	CVMX_POW_WAIT = 1,
@@ -1267,7 +1267,7 @@ static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
 					    cvmx_pko_port_status_t *status)
 { }
 
-static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
+static inline enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
 								   interface)
 {
 	return 0;
-- 
2.43.0


