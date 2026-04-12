Return-Path: <linux-mips+bounces-14100-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAzLCSHh2mnA6wgAu9opvQ
	(envelope-from <linux-mips+bounces-14100-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 12 Apr 2026 02:02:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB53E2033
	for <lists+linux-mips@lfdr.de>; Sun, 12 Apr 2026 02:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D6EB301A404
	for <lists+linux-mips@lfdr.de>; Sun, 12 Apr 2026 00:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498CB1DF75A;
	Sun, 12 Apr 2026 00:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/z+D3m+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA6F17C21C
	for <linux-mips@vger.kernel.org>; Sun, 12 Apr 2026 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952157; cv=none; b=luW6H/gndvSRIIQ9NSDGPF8BSAUOBsKCUl8rtTv4R77NTaMNRTmDM++j9mXbfXzzVJPZVRYd2QkGuO6nVFgXnkvf4qw85kalkDf6Lr9EC+fxHDpS0lY/IG1iYJMMynk5Jfug+6dvZ9+Zk0RLfNWeEDMVt0jH1kjux3/mqeFMVXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952157; c=relaxed/simple;
	bh=6Y2EhW724wwWw1xZJmeKIGmlTApCFCZE+MENPQZdxLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MAX9olPxZCihSr2ogsZ6fQDXqwYl6fUX40+44g3l6PCw7STyV1qd9TiZsJbxwMlhyFIkL8rITfswmrvF/s0Za7kGXa/lIVvBBOBk2m8mp5bC1huGX4l8BKZjPKp3l2BGskwtrzQi1GU4fAaMruEku+trWmy780egk9XLs9kAuKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/z+D3m+; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dbb6c072f1so3123227a34.2
        for <linux-mips@vger.kernel.org>; Sat, 11 Apr 2026 17:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775952148; x=1776556948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Am5OwoVfzGV0BbFEg8qdv6Yi28Bb6pWH8i7VNjQG/o=;
        b=n/z+D3m+iwBhuUa74/44uecNBD/4UYb4TaKH7nsrULiJ3ltDfae8/Tnltme4LotDbM
         LPv5RJpGuOjbTvtgQ++1NOSHjQ+/9waDNe/EI57oOiKNvH9UYhHOmQBN4m9lE3j7ZFa3
         cxo5U/c1jIm0V+nAwhOk74vOyNfwaESrJMMWs8xsWQF1XBwN5D36M9Du4fcp3MsDWAc8
         TEhIug7RxKnncDP8iRWDxraZAsnoeEAZEGG0ADSJAfvXMGfvi9ENNwguTSLwDjQe4DeF
         n31zJMB5eVzBkByffNNgh3YFW599TALHOcGiaauHLSGE7g0/o0nomXINUpkB6KzwLjhH
         DBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952148; x=1776556948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Am5OwoVfzGV0BbFEg8qdv6Yi28Bb6pWH8i7VNjQG/o=;
        b=IbmQynaGRshSN4POLHfGIItK/VdzwR9mznfBzq+LptjQVtLGNNb6OBCDelQV4i1Sx7
         8RrmBjZpFxoOtGmpWCnKVNlmXDeTDoKzoDV+4WPwaRrW71KIjQW/XzJTZACAZUsmLSIF
         84+EKowcMrfPbxiysYMulrnTwYvt51msFcib6R1e41Gq5wkpjrfXKBkSfdv88zryJtV0
         Vowa9ocIHmbD5xkPq5LWAQnFibA3d+tjROoV2xt0qfodiT15CH8hxTv+ruB9/6R7o58i
         /O+jjuewcZLjqvN8K2F15A4ZpbD/qiD/aYoo5Aer+Fhw/lEDPEupPHXJCCb6wE6JvDl+
         KG+g==
X-Forwarded-Encrypted: i=1; AJvYcCXdudfxEI2NXuaDoKZy2MO050l9K7Dvf+kJY5HxvjaDeSqp8cJ0dS5pxmF2LQ7d2JVxf5TO0J5LkMlt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Q+xJxPYswerqAIEM1psOPah1ub6UhiHCaHxqmH0nBlAZ9uuc
	LEn4m+FSdSL/dRbdI+B9HvRmv7O8UoGjRnWHMF0UwrQORygqnQwZyh34PwUWU93P390=
X-Gm-Gg: AeBDieu1660wB242oqKYJX1rKMHoBSoJ/I4nP056AvpLOqnM+StK/X8psibPUUW2gjk
	R6pHHok4BH5c0RM0FVhqUgbheryBve/rOTo2cK1uCUy/bQvHdyohRJbXzWSQIvLcAfRtjiNcGdO
	NSZiTtUj4ZnCEaTJcX2ssMjfenCku2Tu2N8dPTUoGgwb5GOn+c+vE1pi8RqLkVQR1bZmsc6orOH
	cq5mMRtpVo2ovrUZsxLChE+HzpWcbhdO6PhKWLB5mZrZdTx8HodssFzGqSSHZC/RYM08HZtnrSV
	XBOSbXGu+b63oyVArbcnxFTOzFLAfHBk1ZRQaHRWzCxF9/xkbvObCMT3gNFmswjmQYLmn6EDcjC
	ALQBZJFn7rnX0PMQPv41BFND+YZST66O/J4nac5ipU2H4gUfeG5iCf+iYWsROnmD0D/CluAjF4s
	p4VqzlPyHujsqpRpi5aPNi9ut3/UZ4O8bdRlxG/QbJzv8ZhO8QppKn6q2v1A==
X-Received: by 2002:a05:6830:310b:b0:7d7:48cc:ccdb with SMTP id 46e09a7af769-7dc27db93ddmr4980940a34.19.1775952148148;
        Sat, 11 Apr 2026 17:02:28 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc269d5cfcsm5233213a34.24.2026.04.11.17.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:02:27 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: yoelvisoliveros@gmail.com,
	len.bao@gmx.us,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: octeon: remove SPI, POW, PKO, and Helper typedef enums
Date: Sat, 11 Apr 2026 19:02:26 -0500
Message-ID: <20260412000226.2711800-1-m32285159@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-14100-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,gmx.us,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74DB53E2033
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch removes custom typedef enums and replaces them with standard
enums to address the "General code review and cleanup" task in TODO.

The following enums are affected:

- cvmx_spi_mode_t (now enum cvmx_spi_mode)
- cvmx_helper_interface_mode_t (now enum cvmx_helper_interface_mode)
- cvmx_pow_wait_t (now enum cvmx_pow_wait)
- cvmx_pko_lock_t (now enum cvmx_pko_lock)
- cvmx_pko_status_t (now enum cvmx_pko_status)

This patch aligns the octeon codebase more closely with the Linux kernel
code style, and will address the "cleanup" task in TODO.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
Note: This patch is partially based off of previous patch attempts that
caused build regressions according to the kernel test bot. To ensure
no build regressions, this patch has been cross-compiled with no errors
using mips64-linux-gnu-gcc.

Note: Patches replacing typedef structs will also come in the near future.

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
index 6e70b859a0ac..b0199d5cb551 100644
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
index 291eaffd2543..eafd9037ce6e 100644
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
+enum cvmx_helper_interface_mode {
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


