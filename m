Return-Path: <linux-mips+bounces-14155-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPwwDEeF32nSUgAAu9opvQ
	(envelope-from <linux-mips+bounces-14155-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 14:32:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C840443D
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 14:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28FD0303AF1F
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 12:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B2817BEBF;
	Wed, 15 Apr 2026 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GM/pCIMY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F0340DFA5
	for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256203; cv=none; b=Qu5WXd+f6Y1l7v7Fuol0qdZ8ruun/jRTPppZ/lVhf4H8qL7M6EMh+ng/MS6f1CLgM5C9aRkcNdegGsZXIIDzgfye7KPuGLARctn3RhRYPX5J+BQG/m89j7i9LnoXBHr7Rv2Mu319/iWAmS2u2S78MvzDSaimM5PlvR8i+FcOXZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256203; c=relaxed/simple;
	bh=nqFzq1HsbBtP7YnBRYkDrhBxkYVxccuRKN9K9yv+VWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZSLbCIaXWrcSMcXw3VdDR8PPBLkYXzOc6ldKwno1UK3JFPmWq71pdRBJceiudbAfB5BL+aq/Tcm0erXOw2QmHwtaW3w5fsr1ny9xR/Rm8dcUAbudTBVlVB10GT+xJFH2U76p7WFup/Yqq7u3m4qOJqWB1YaIEc8NMesYudCbf2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GM/pCIMY; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d9b21d1461so6540638a34.1
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 05:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776256200; x=1776861000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zopY3+xFSTU6CYi5+bW2fvDBwpwwr/JSXXkaSsNtuSo=;
        b=GM/pCIMYI8QuIAyMH7EAJGQRQZMQCAsmxi4sCqMXeoHxuEinE+x7EeV+KlagvnLq+m
         aDAJdCFC6+tjIx86oSyCUGURigTb9Tn6WKtVkmhn1Z76YAIZLEpWqlb1x30qzDrwvN+T
         R4Mmc+O9hZFCDcoFd0jUiUBGLZ9LGjpvcNCuQHFoZb2uP/Peev8mXpjAp6P6rOr/f9oj
         KRIVu8llKFuQJqs71Tb59Elbv08QRYjQ4lbXcJha5MIA18c4Qsbr1w1/tjX96suZFVpE
         Z3Ukjb38Bf3MxyrCzKQcdHB6YwfDA5rYFk94Q3AphZjPxhRCrDR98x8IZT7pyjZlbBrs
         cERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256200; x=1776861000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zopY3+xFSTU6CYi5+bW2fvDBwpwwr/JSXXkaSsNtuSo=;
        b=ElyCKDx1uUC2yeMDs7CAD8HHnIXa0vMTBiJ84rZcrhXkGv3vrYVCq0e7kRr03fINf5
         J5fIG3fngHCa1xbcy5dwLl0SgY1ATFKPM7scVdF3Y3MLISqss5Q+o7kNtVIMqXuifh5D
         16Dk3zhGSLflruhCg6spe5uKGdxY+1oCkFAqouzXRcoP8MQEllHdGeN4lGCo3bFD1SBS
         1PVwlQ9FcnmdAhr+5ofcSjp0adGoQ1gzJUv9v3F/tzHY6PACcKbKelsTVSxVGmaYuOFV
         ivz1b3cz7WiD0EVt3uR+zYD4ULAMUMwuJwTYnluUcTbk39VDbUyU2K3tsFpWZZgIWROb
         jQPg==
X-Forwarded-Encrypted: i=1; AFNElJ/g5vAIF1qElhjoskNvTrWfuV+706J14wkKNQCLpkfxg8nTlHTSTs+v7DHC2gtoN7GBptJZFT+tlETD@vger.kernel.org
X-Gm-Message-State: AOJu0YzHINECXLzpnbDmpgO6fa5SynaWIp2r9zBGSqVhYoaQ+VZPnbcv
	ufpmusExI2tCtnnnRuHM2KJg4ow66nQAcvji7d2oXGU2iE5EpsPf0BXI
X-Gm-Gg: AeBDiet14UXEF5rUgQ36a7ebjpA1fkvQN+K5ZUP3/6g/c23XSVrAtpewUdVj5grtru/
	Z0Yt0ou5JeUqgHq8SP2qc/wudh5W46PEu7WUUUYVGtInqs9WBtC5jddigbfcow17Wgxqko19YsL
	Gy8BpeNcNMDFoc0nwPu15kEr/5PT8Wz3MJ4vMCWa0oK11NJuGaq1fHA6zE/ueKXmOkjPYEsZhWU
	0A8zU9zXqIyJ7Emwo82nGVJbyjQSx6WXsfwfqWPNg0Yq9U57242b5gTnQraZC/wxI3go6oAmbJl
	HBvehpfFJyIIuWjDhNtxqh2XZzt7GbZix4Md7d12mHt8RCOqR7S0koFTkRtacU1fhR+qfqA8cLv
	6IFHANrXxP67W/5fHPth1qGvSpIbM/pSZmeOVljD1ZyW20tDSXeb9h3gC6k4lA0VT3dnGTPIzk4
	k6DGl6Ew4as4yoaaHrRZoelvjptkgt/hst8bX0LN/lURMhXcP2ow3OHAQ24NlEOjHUNbMR
X-Received: by 2002:a05:6830:6a94:b0:7dc:1bcd:43be with SMTP id 46e09a7af769-7dc28ce472amr10706389a34.5.1776256199525;
        Wed, 15 Apr 2026 05:29:59 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc7746b5a8sm1018744a34.6.2026.04.15.05.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:29:59 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: len.bao@gmx.us,
	yoelvisoliveros@gmail.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper typedef enums
Date: Wed, 15 Apr 2026 07:29:39 -0500
Message-ID: <20260415122939.77847-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14155-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[gmx.us,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-mips];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 783C840443D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch removes custom typedef enums and replaces them with standard
enums to address the "General code review and cleanup" task in TODO.

The following enums are affected:

- cvmx_spi_mode_t (now enum cvmx_spi_mode)
- cvmx_helper_interface_mode_t (now enum cvmx_helper_interface_mode_e)
- cvmx_pow_wait_t (now enum cvmx_pow_wait)
- cvmx_pko_lock_t (now enum cvmx_pko_lock)
- cvmx_pko_status_t (now enum cvmx_pko_status)

This patch aligns the octeon codebase more closely with the Linux kernel
code style, and will address the "cleanup" task in TODO.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>

---
v2:
 - Appended "_e" to enum cvmx_helper_interface_mode to prevent namespace
   collisions with a struct of the same name
 - Fixed errors that were indirect results of the namespace collisions

 .../executive/cvmx-helper-util.c              |  2 +-
 .../cavium-octeon/executive/cvmx-helper.c     |  8 ++---
 arch/mips/cavium-octeon/executive/cvmx-pko.c  |  6 ++--
 arch/mips/cavium-octeon/executive/cvmx-spi.c  | 16 ++++-----
 .../include/asm/octeon/cvmx-helper-util.h     |  2 +-
 arch/mips/include/asm/octeon/cvmx-helper.h    |  6 ++--
 arch/mips/include/asm/octeon/cvmx-pko.h       | 20 +++++------
 arch/mips/include/asm/octeon/cvmx-pow.h       | 12 +++----
 arch/mips/include/asm/octeon/cvmx-spi.h       | 32 ++++++++---------
 drivers/staging/octeon/ethernet.c             |  2 +-
 drivers/staging/octeon/octeon-ethernet.h      |  2 +-
 drivers/staging/octeon/octeon-stubs.h         | 36 +++++++++----------
 12 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-util.c b/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
index 53b912745dbd..af09e2744e36 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
@@ -52,7 +52,7 @@
  *
  * Returns String
  */
-const char *cvmx_helper_interface_mode_to_string(cvmx_helper_interface_mode_t
+const char *cvmx_helper_interface_mode_to_string(enum cvmx_helper_interface_mode_e
 						 mode)
 {
 	switch (mode) {
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 9abfc4bf9bd8..b7d037a94769 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -95,7 +95,7 @@ EXPORT_SYMBOL_GPL(cvmx_helper_ports_on_interface);
  * @INTERNAL
  * Return interface mode for CN68xx.
  */
-static cvmx_helper_interface_mode_t __cvmx_get_mode_cn68xx(int interface)
+static enum cvmx_helper_interface_mode_e __cvmx_get_mode_cn68xx(int interface)
 {
 	union cvmx_mio_qlmx_cfg qlm_cfg;
 	switch (interface) {
@@ -147,7 +147,7 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_cn68xx(int interface)
  * @INTERNAL
  * Return interface mode for an Octeon II
  */
-static cvmx_helper_interface_mode_t __cvmx_get_mode_octeon2(int interface)
+static enum cvmx_helper_interface_mode_e __cvmx_get_mode_octeon2(int interface)
 {
 	union cvmx_gmxx_inf_mode mode;
 
@@ -247,7 +247,7 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_octeon2(int interface)
  * @INTERNAL
  * Return interface mode for CN7XXX.
  */
-static cvmx_helper_interface_mode_t __cvmx_get_mode_cn7xxx(int interface)
+static enum cvmx_helper_interface_mode_e __cvmx_get_mode_cn7xxx(int interface)
 {
 	union cvmx_gmxx_inf_mode mode;
 
@@ -289,7 +289,7 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_cn7xxx(int interface)
  * Returns Mode of the interface. Unknown or unsupported interfaces return
  *	   DISABLED.
  */
-cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int interface)
+enum cvmx_helper_interface_mode_e cvmx_helper_interface_get_mode(int interface)
 {
 	union cvmx_gmxx_inf_mode mode;
 
diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/cavium-octeon/executive/cvmx-pko.c
index 6e70b859a0ac..199746bc40de 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-pko.c
@@ -120,7 +120,7 @@ static void __cvmx_pko_port_map_o68(void)
 {
 	int port;
 	int interface, index;
-	cvmx_helper_interface_mode_t mode;
+	enum cvmx_helper_interface_mode_e mode;
 	union cvmx_pko_mem_iport_ptrs config;
 
 	/*
@@ -323,11 +323,11 @@ EXPORT_SYMBOL_GPL(cvmx_pko_shutdown);
  *		     queues have higher priority than higher numbered queues.
  *		     There must be num_queues elements in the array.
  */
-cvmx_pko_status_t cvmx_pko_config_port(uint64_t port, uint64_t base_queue,
+enum cvmx_pko_status cvmx_pko_config_port(uint64_t port, uint64_t base_queue,
 				       uint64_t num_queues,
 				       const uint64_t priority[])
 {
-	cvmx_pko_status_t result_code;
+	enum cvmx_pko_status result_code;
 	uint64_t queue;
 	union cvmx_pko_mem_queue_ptrs config;
 	union cvmx_pko_reg_queue_ptrs1 config1;
diff --git a/arch/mips/cavium-octeon/executive/cvmx-spi.c b/arch/mips/cavium-octeon/executive/cvmx-spi.c
index eb9333e84a6b..b6c0b3fa73ad 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-spi.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-spi.c
@@ -102,7 +102,7 @@ void cvmx_spi_set_callbacks(cvmx_spi_callbacks_t *new_callbacks)
  *
  * Returns Zero on success, negative of failure.
  */
-int cvmx_spi_start_interface(int interface, cvmx_spi_mode_t mode, int timeout,
+int cvmx_spi_start_interface(int interface, enum cvmx_spi_mode mode, int timeout,
 			     int num_ports)
 {
 	int res = -1;
@@ -147,7 +147,7 @@ int cvmx_spi_start_interface(int interface, cvmx_spi_mode_t mode, int timeout,
  *
  * Returns Zero on success, negative of failure.
  */
-int cvmx_spi_restart_interface(int interface, cvmx_spi_mode_t mode, int timeout)
+int cvmx_spi_restart_interface(int interface, enum cvmx_spi_mode mode, int timeout)
 {
 	int res = -1;
 
@@ -192,7 +192,7 @@ EXPORT_SYMBOL_GPL(cvmx_spi_restart_interface);
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_reset_cb(int interface, cvmx_spi_mode_t mode)
+int cvmx_spi_reset_cb(int interface, enum cvmx_spi_mode mode)
 {
 	union cvmx_spxx_dbg_deskew_ctl spxx_dbg_deskew_ctl;
 	union cvmx_spxx_clk_ctl spxx_clk_ctl;
@@ -308,7 +308,7 @@ int cvmx_spi_reset_cb(int interface, cvmx_spi_mode_t mode)
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_calendar_setup_cb(int interface, cvmx_spi_mode_t mode,
+int cvmx_spi_calendar_setup_cb(int interface, enum cvmx_spi_mode mode,
 			       int num_ports)
 {
 	int port;
@@ -427,7 +427,7 @@ int cvmx_spi_calendar_setup_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_clock_detect_cb(int interface, cvmx_spi_mode_t mode, int timeout)
+int cvmx_spi_clock_detect_cb(int interface, enum cvmx_spi_mode mode, int timeout)
 {
 	int clock_transitions;
 	union cvmx_spxx_clk_stat stat;
@@ -505,7 +505,7 @@ int cvmx_spi_clock_detect_cb(int interface, cvmx_spi_mode_t mode, int timeout)
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_training_cb(int interface, cvmx_spi_mode_t mode, int timeout)
+int cvmx_spi_training_cb(int interface, enum cvmx_spi_mode mode, int timeout)
 {
 	union cvmx_spxx_trn4_ctl spxx_trn4_ctl;
 	union cvmx_spxx_clk_stat stat;
@@ -574,7 +574,7 @@ int cvmx_spi_training_cb(int interface, cvmx_spi_mode_t mode, int timeout)
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_calendar_sync_cb(int interface, cvmx_spi_mode_t mode, int timeout)
+int cvmx_spi_calendar_sync_cb(int interface, enum cvmx_spi_mode mode, int timeout)
 {
 	uint64_t MS = cvmx_sysinfo_get()->cpu_clock_hz / 1000;
 	if (mode & CVMX_SPI_MODE_RX_HALFPLEX) {
@@ -630,7 +630,7 @@ int cvmx_spi_calendar_sync_cb(int interface, cvmx_spi_mode_t mode, int timeout)
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-int cvmx_spi_interface_up_cb(int interface, cvmx_spi_mode_t mode)
+int cvmx_spi_interface_up_cb(int interface, enum cvmx_spi_mode mode)
 {
 	union cvmx_gmxx_rxx_frm_min gmxx_rxx_frm_min;
 	union cvmx_gmxx_rxx_frm_max gmxx_rxx_frm_max;
diff --git a/arch/mips/include/asm/octeon/cvmx-helper-util.h b/arch/mips/include/asm/octeon/cvmx-helper-util.h
index 97b27a07cfb0..239819102283 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper-util.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper-util.h
@@ -42,7 +42,7 @@
  * Returns String
  */
 extern const char
-    *cvmx_helper_interface_mode_to_string(cvmx_helper_interface_mode_t mode);
+    *cvmx_helper_interface_mode_to_string(enum cvmx_helper_interface_mode_e mode);
 
 /**
  * Setup Random Early Drop to automatically begin dropping packets.
diff --git a/arch/mips/include/asm/octeon/cvmx-helper.h b/arch/mips/include/asm/octeon/cvmx-helper.h
index 0cddce35291b..2aa391a7b059 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper.h
@@ -38,7 +38,7 @@
 #include <asm/octeon/cvmx-fpa.h>
 #include <asm/octeon/cvmx-wqe.h>
 
-typedef enum {
+enum cvmx_helper_interface_mode_e {
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
+extern enum cvmx_helper_interface_mode_e cvmx_helper_interface_get_mode(int
 								   interface);
 
 /**
diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index f18a7f24daf8..a742c1d61d8f 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -80,7 +80,7 @@
 #define CVMX_PKO_ILLEGAL_QUEUE	0xFFFF
 #define CVMX_PKO_MAX_QUEUE_DEPTH 0
 
-typedef enum {
+enum cvmx_pko_status {
 	CVMX_PKO_SUCCESS,
 	CVMX_PKO_INVALID_PORT,
 	CVMX_PKO_INVALID_QUEUE,
@@ -88,12 +88,12 @@ typedef enum {
 	CVMX_PKO_NO_MEMORY,
 	CVMX_PKO_PORT_ALREADY_SETUP,
 	CVMX_PKO_CMD_QUEUE_INIT_ERROR
-} cvmx_pko_status_t;
+};
 
 /**
  * This enumeration represents the different locking modes supported by PKO.
  */
-typedef enum {
+enum cvmx_pko_lock {
 	/*
 	 * PKO doesn't do any locking. It is the responsibility of the
 	 * application to make sure that no other core is accessing
@@ -112,7 +112,7 @@ typedef enum {
 	 * ll/sc. This is the most portable locking mechanism.
 	 */
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
-} cvmx_pko_lock_t;
+};
 
 typedef struct {
 	uint32_t packets;
@@ -306,7 +306,7 @@ extern void cvmx_pko_shutdown(void);
  *		     of a value of 1. There must be num_queues elements in the
  *		     array.
  */
-extern cvmx_pko_status_t cvmx_pko_config_port(uint64_t port,
+extern enum cvmx_pko_status cvmx_pko_config_port(uint64_t port,
 					      uint64_t base_queue,
 					      uint64_t num_queues,
 					      const uint64_t priority[]);
@@ -374,7 +374,7 @@ static inline void cvmx_pko_doorbell(uint64_t port, uint64_t queue,
  */
 
 static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 {
 	if (use_locking == CVMX_PKO_LOCK_ATOMIC_TAG) {
 		/*
@@ -414,12 +414,12 @@ static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
  * Returns: CVMX_PKO_SUCCESS on success, or error code on
  * failure of output
  */
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(
 	uint64_t port,
 	uint64_t queue,
 	union cvmx_pko_command_word0 pko_command,
 	union cvmx_buf_ptr packet,
-	cvmx_pko_lock_t use_locking)
+	enum cvmx_pko_lock use_locking)
 {
 	cvmx_cmd_queue_result_t result;
 	if (use_locking == CVMX_PKO_LOCK_ATOMIC_TAG)
@@ -457,13 +457,13 @@ static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
  * Returns: CVMX_PKO_SUCCESS on success, or error code on
  * failure of output
  */
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish3(
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish3(
 	uint64_t port,
 	uint64_t queue,
 	union cvmx_pko_command_word0 pko_command,
 	union cvmx_buf_ptr packet,
 	uint64_t addr,
-	cvmx_pko_lock_t use_locking)
+	enum cvmx_pko_lock use_locking)
 {
 	cvmx_cmd_queue_result_t result;
 	if (use_locking == CVMX_PKO_LOCK_ATOMIC_TAG)
diff --git a/arch/mips/include/asm/octeon/cvmx-pow.h b/arch/mips/include/asm/octeon/cvmx-pow.h
index 21b4378244fa..409029809639 100644
--- a/arch/mips/include/asm/octeon/cvmx-pow.h
+++ b/arch/mips/include/asm/octeon/cvmx-pow.h
@@ -84,10 +84,10 @@ enum cvmx_pow_tag_type {
 /**
  * Wait flag values for pow functions.
  */
-typedef enum {
+enum cvmx_pow_wait {
 	CVMX_POW_WAIT = 1,
 	CVMX_POW_NO_WAIT = 0,
-} cvmx_pow_wait_t;
+};
 
 /**
  *  POW tag operations.	 These are used in the data stored to the POW.
@@ -1348,7 +1348,7 @@ static inline void cvmx_pow_tag_sw_wait(void)
  * Returns: the WQE pointer from POW. Returns NULL if no work
  * was available.
  */
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync_nocheck(cvmx_pow_wait_t
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync_nocheck(enum cvmx_pow_wait
 							     wait)
 {
 	cvmx_pow_load_addr_t ptr;
@@ -1382,7 +1382,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync_nocheck(cvmx_pow_wait_
  * Returns: the WQE pointer from POW. Returns NULL if no work
  * was available.
  */
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait wait)
 {
 	if (CVMX_ENABLE_POW_CHECKS)
 		__cvmx_pow_warn_if_pending_switch(__func__);
@@ -1436,7 +1436,7 @@ static inline enum cvmx_pow_tag_type cvmx_pow_work_request_null_rd(void)
  *	  timeout), 0 to cause response to return immediately
  */
 static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
-						       cvmx_pow_wait_t wait)
+						       enum cvmx_pow_wait wait)
 {
 	cvmx_pow_iobdma_store_t data;
 
@@ -1465,7 +1465,7 @@ static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
  *		    timeout), 0 to cause response to return immediately
  */
 static inline void cvmx_pow_work_request_async(int scr_addr,
-					       cvmx_pow_wait_t wait)
+					       enum cvmx_pow_wait wait)
 {
 	if (CVMX_ENABLE_POW_CHECKS)
 		__cvmx_pow_warn_if_pending_switch(__func__);
diff --git a/arch/mips/include/asm/octeon/cvmx-spi.h b/arch/mips/include/asm/octeon/cvmx-spi.h
index d5038cc4b475..c9c8590e0a9a 100644
--- a/arch/mips/include/asm/octeon/cvmx-spi.h
+++ b/arch/mips/include/asm/octeon/cvmx-spi.h
@@ -36,35 +36,35 @@
 
 /* CSR typedefs have been moved to cvmx-csr-*.h */
 
-typedef enum {
+enum cvmx_spi_mode {
 	CVMX_SPI_MODE_UNKNOWN = 0,
 	CVMX_SPI_MODE_TX_HALFPLEX = 1,
 	CVMX_SPI_MODE_RX_HALFPLEX = 2,
 	CVMX_SPI_MODE_DUPLEX = 3
-} cvmx_spi_mode_t;
+};
 
 /** Callbacks structure to customize SPI4 initialization sequence */
 typedef struct {
     /** Called to reset SPI4 DLL */
-	int (*reset_cb) (int interface, cvmx_spi_mode_t mode);
+	int (*reset_cb) (int interface, enum cvmx_spi_mode mode);
 
     /** Called to setup calendar */
-	int (*calendar_setup_cb) (int interface, cvmx_spi_mode_t mode,
+	int (*calendar_setup_cb) (int interface, enum cvmx_spi_mode mode,
 				  int num_ports);
 
     /** Called for Tx and Rx clock detection */
-	int (*clock_detect_cb) (int interface, cvmx_spi_mode_t mode,
+	int (*clock_detect_cb) (int interface, enum cvmx_spi_mode mode,
 				int timeout);
 
     /** Called to perform link training */
-	int (*training_cb) (int interface, cvmx_spi_mode_t mode, int timeout);
+	int (*training_cb) (int interface, enum cvmx_spi_mode mode, int timeout);
 
     /** Called for calendar data synchronization */
-	int (*calendar_sync_cb) (int interface, cvmx_spi_mode_t mode,
+	int (*calendar_sync_cb) (int interface, enum cvmx_spi_mode mode,
 				 int timeout);
 
     /** Called when interface is up */
-	int (*interface_up_cb) (int interface, cvmx_spi_mode_t mode);
+	int (*interface_up_cb) (int interface, enum cvmx_spi_mode mode);
 
 } cvmx_spi_callbacks_t;
 
@@ -94,7 +94,7 @@ static inline int cvmx_spi_is_spi_interface(int interface)
  *
  * Returns Zero on success, negative of failure.
  */
-extern int cvmx_spi_start_interface(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_start_interface(int interface, enum cvmx_spi_mode mode,
 				    int timeout, int num_ports);
 
 /**
@@ -110,7 +110,7 @@ extern int cvmx_spi_start_interface(int interface, cvmx_spi_mode_t mode,
  * @timeout:   Timeout to wait for clock synchronization in seconds
  * Returns Zero on success, negative of failure.
  */
-extern int cvmx_spi_restart_interface(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_restart_interface(int interface, enum cvmx_spi_mode mode,
 				      int timeout);
 
 /**
@@ -180,7 +180,7 @@ extern void cvmx_spi_set_callbacks(cvmx_spi_callbacks_t *new_callbacks);
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_reset_cb(int interface, cvmx_spi_mode_t mode);
+extern int cvmx_spi_reset_cb(int interface, enum cvmx_spi_mode mode);
 
 /**
  * Callback to setup calendar and miscellaneous settings before clock
@@ -197,7 +197,7 @@ extern int cvmx_spi_reset_cb(int interface, cvmx_spi_mode_t mode);
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_calendar_setup_cb(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_calendar_setup_cb(int interface, enum cvmx_spi_mode mode,
 				      int num_ports);
 
 /**
@@ -214,7 +214,7 @@ extern int cvmx_spi_calendar_setup_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_clock_detect_cb(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_clock_detect_cb(int interface, enum cvmx_spi_mode mode,
 				    int timeout);
 
 /**
@@ -231,7 +231,7 @@ extern int cvmx_spi_clock_detect_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_training_cb(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_training_cb(int interface, enum cvmx_spi_mode mode,
 				int timeout);
 
 /**
@@ -248,7 +248,7 @@ extern int cvmx_spi_training_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_calendar_sync_cb(int interface, cvmx_spi_mode_t mode,
+extern int cvmx_spi_calendar_sync_cb(int interface, enum cvmx_spi_mode mode,
 				     int timeout);
 
 /**
@@ -264,6 +264,6 @@ extern int cvmx_spi_calendar_sync_cb(int interface, cvmx_spi_mode_t mode,
  * Returns Zero on success, non-zero error code on failure (will cause
  * SPI initialization to abort)
  */
-extern int cvmx_spi_interface_up_cb(int interface, cvmx_spi_mode_t mode);
+extern int cvmx_spi_interface_up_cb(int interface, enum cvmx_spi_mode mode);
 
 #endif /* __CVMX_SPI_H__ */
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc14c8..5a3fe651bc48 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -798,7 +798,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
-		cvmx_helper_interface_mode_t imode =
+		enum cvmx_helper_interface_mode_e imode =
 		    cvmx_helper_interface_get_mode(interface);
 		int num_ports = cvmx_helper_ports_on_interface(interface);
 		int port;
diff --git a/drivers/staging/octeon/octeon-ethernet.h b/drivers/staging/octeon/octeon-ethernet.h
index a6140705706f..d369c97c1332 100644
--- a/drivers/staging/octeon/octeon-ethernet.h
+++ b/drivers/staging/octeon/octeon-ethernet.h
@@ -57,7 +57,7 @@ struct octeon_ethernet {
 	struct net_device *netdev;
 	/*
 	 * Type of port. This is one of the enums in
-	 * cvmx_helper_interface_mode_t
+	 * cvmx_helper_interface_mode
 	 */
 	int imode;
 	/* PHY mode */
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 291eaffd2543..e621cc6fcce4 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -215,14 +215,14 @@ enum cvmx_fau_op_size {
 	CVMX_FAU_OP_SIZE_64 = 3
 };
 
-typedef enum {
+enum cvmx_spi_mode {
 	CVMX_SPI_MODE_UNKNOWN = 0,
 	CVMX_SPI_MODE_TX_HALFPLEX = 1,
 	CVMX_SPI_MODE_RX_HALFPLEX = 2,
 	CVMX_SPI_MODE_DUPLEX = 3
-} cvmx_spi_mode_t;
+};
 
-typedef enum {
+enum cvmx_helper_interface_mode_e {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
 	CVMX_HELPER_INTERFACE_MODE_RGMII,
 	CVMX_HELPER_INTERFACE_MODE_GMII,
@@ -233,20 +233,20 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_PICMG,
 	CVMX_HELPER_INTERFACE_MODE_NPI,
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
-} cvmx_helper_interface_mode_t;
+};
 
-typedef enum {
+enum cvmx_pow_wait {
 	CVMX_POW_WAIT = 1,
 	CVMX_POW_NO_WAIT = 0,
-} cvmx_pow_wait_t;
+};
 
-typedef enum {
+enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_NONE = 0,
 	CVMX_PKO_LOCK_ATOMIC_TAG = 1,
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
-} cvmx_pko_lock_t;
+};
 
-typedef enum {
+enum cvmx_pko_status {
 	CVMX_PKO_SUCCESS,
 	CVMX_PKO_INVALID_PORT,
 	CVMX_PKO_INVALID_QUEUE,
@@ -254,7 +254,7 @@ typedef enum {
 	CVMX_PKO_NO_MEMORY,
 	CVMX_PKO_PORT_ALREADY_SETUP,
 	CVMX_PKO_CMD_QUEUE_INIT_ERROR
-} cvmx_pko_status_t;
+};
 
 enum cvmx_pow_tag_type {
 	CVMX_POW_TAG_TYPE_ORDERED   = 0L,
@@ -1267,7 +1267,7 @@ static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
 					    cvmx_pko_port_status_t *status)
 { }
 
-static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
+static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
 								   interface)
 {
 	return 0;
@@ -1344,11 +1344,11 @@ static inline unsigned int cvmx_get_core_num(void)
 }
 
 static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
-						       cvmx_pow_wait_t wait)
+						       enum cvmx_pow_wait wait)
 { }
 
 static inline void cvmx_pow_work_request_async(int scr_addr,
-					       cvmx_pow_wait_t wait)
+					       enum cvmx_pow_wait wait)
 { }
 
 static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
@@ -1358,13 +1358,13 @@ static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
 	return wqe;
 }
 
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait wait)
 {
 	return (void *)(unsigned long)wait;
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					     cvmx_spi_mode_t mode, int timeout)
+					     enum cvmx_spi_mode mode, int timeout)
 {
 	return 0;
 }
@@ -1383,12 +1383,12 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 }
 
 static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 { }
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
 		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.53.0


