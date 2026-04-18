Return-Path: <linux-mips+bounces-14197-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id K3BEHt8N5GnLPwEAu9opvQ
	(envelope-from <linux-mips+bounces-14197-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 01:03:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5026422894
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 01:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A37F3013A54
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2026 23:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C04332610;
	Sat, 18 Apr 2026 23:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+yxuTm6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F1832BF5C
	for <linux-mips@vger.kernel.org>; Sat, 18 Apr 2026 23:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776553434; cv=none; b=UgwBq7/tzbx6KFz7pxNt/C4skrOdyVK+VwhoG/4QPBpR1C6w0JDL9FqdE2NIOAbBSyl8LHrOqaa0Djbr4JDwACjzPSmaA4WsQ/wfpe3gi2pVrwNozudNNGPsNV2gThPOub2/ve51PG64LJkEQQZzW+z64mS426Hy6AuxN8JunNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776553434; c=relaxed/simple;
	bh=hNwt/lAnJjcKZujM3g3QF6ZrY4Vy/IsDFBGZLJjQazk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hg3Cr/dbqAmDUZzj4qaQWDYIZqUp4vFf7ewSX53JHqmPm5yRyiEBB+qv5pZsvSovARzJvobp9c1OkmflSN+SMx+tzd/spmwCjuXNUimVkWtCjIinKkpWtUIp+eSKKLDeOkllySosDlCsuZVzsXhqbfX5l+6nW1RjrqYNXFCLGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+yxuTm6; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40423dbe98bso752136fac.2
        for <linux-mips@vger.kernel.org>; Sat, 18 Apr 2026 16:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776553431; x=1777158231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+YByQIfJdF3fRJQz3Ls7hUKm7XjVmq8cUOlz6sknwYg=;
        b=L+yxuTm6+QQQJw7bnQpF6lJ8RjK39Tl+H4T1axOloWF8ABtQgJmIHY9BC6ai8nMRVe
         kXMTOp2FG37D7hp5kGruyMFyF7dCZJvoghC4CfI9z+/yesdUT/OIezg385KVZEwkoO5s
         1OQHOWYzEUSGth71TzFwRXDGX51MRd+BYwqlEBNihrk7oDbX7lo256JyL97yn4GppTDw
         DXhkGUVAYd6Pz6sZ1AkVaQt8s1ii+h5FKr3iZZc9JbDIIr1aOhtdGm+MCc5ZZCMtm3Fw
         J3ezsjbSIVoUO2ihMtxTeYDXejPCefgc/3n/YM4HEm8dttHB7hjRoRTEhwCdshhnb+uh
         YwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776553431; x=1777158231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YByQIfJdF3fRJQz3Ls7hUKm7XjVmq8cUOlz6sknwYg=;
        b=AwqYaJ73pt1smGeWDrL90NI2+E6sjSN5nUm3ohLfny72PudGi+d854cetJAVW3ecxB
         v6cRkOYMJOv670LCB8lsGD9hoEmnn+BcD5uP37ULMJXCT/pPBbJ3P/eEgrKmZBltKPyH
         3wUgke8I7XGBNyuExtSsqoJ3/TOy2JS2rjYubLH4d5i0LgYpEAnNxdpTyiqqgZY1r6RP
         SxmHnfYFVdzb+MuRtEkdRpxDMFREIXHtZI0Z2x40rfYcXO1R3vG+Vhws4g08IJ5d3scY
         zkcArawdAuShPm5LSxpPPE3npLDo1/va8uPoTmze+Qt/OI+qi43RO4nI62uHwWigtZMH
         RS7A==
X-Forwarded-Encrypted: i=1; AFNElJ9zCbiX1RfXO0/CIUJnd3B+GW/OURYDZz91otK2Vtb3DDf2cWC6uCOHiIhBji7OhRUJsAvjETtus+hh@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgGsutOOUONIVcCn+m2N8DkfpwXJaGrE9/mAUtpnN4KBUB1u6
	No9ZS/WR/gvObCWyDSPmw04aa8rK4Ix2IRjCEZyeYQRRkHCrLgLzMeAu
X-Gm-Gg: AeBDiesjZBDMVSgMz4TmOLSRbhQq/MVOwi9enl1qkNccPmp61wxxxM9lIvnAYE7qKQ6
	B+POvE/TlRjW/+3kS2bCERAUlja9Z3b6VIYqwV4ju/iMzu62REu6frHsCsWjV9juZNG6vDyem1l
	YcN2Y8U7nbKQoYW2JRCiv+0AwP81eIdRixnFJq+VcTflxt20KTFSUDT+YlD2GMtWUqKfGZckjeZ
	gjxXVP6tEOcvDsD2ce7bOo/PQ0gZHxix2Ayndo+Z4Bpm83Nl9dNHiUYRU68Qc4JHyD1ep4ByXI+
	/MziJVdm64PpH3/2SzqYiwzFFzUJXeQyW+WIN+fhhuVyMf74+Q9lBp36JEqL9jhrB3ivMjHYIOo
	5fWQ+pRTCe67irjG7gmxwWbCjnFiU2B/B7fDY2/3B8Xl5MYYTExCzx4Kw9DFewnC6tONJkBKMd4
	qFfIPVmxZnLZO6Qg4wX5YrcswSEVuPRVT7UZp7D0XAvpJNDhs11BbKQNgmnpJEKSXZREbv
X-Received: by 2002:a05:6820:150b:b0:689:8024:5628 with SMTP id 006d021491bc7-69462e48f2emr4656205eaf.13.1776553431103;
        Sat, 18 Apr 2026 16:03:51 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464ea14ddsm3527938eaf.6.2026.04.18.16.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 16:03:50 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: tsbogend@alpha.franken.de,
	gregkh@linuxfoundation.org
Cc: len.bao@gmx.us,
	yoelvisoliveros@gmail.com,
	error27@gmail.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4] staging: octeon: remove SPI, POW, and PKO typedef enums
Date: Sat, 18 Apr 2026 18:03:44 -0500
Message-ID: <20260418230344.44242-1-m32285159@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-14197-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.us,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5026422894
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch removes custom typedef enums and replaces them with standard
enums to address the "General code review and cleanup" task in TODO.

The following enums are affected:

- cvmx_spi_mode_t (now enum cvmx_spi_mode)
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

v3:
 - Fixed function return type in cvmx_helper_interface_get_mode

v4:
 - Dropped cvmx_helper_interface_mode_t change due to namespace issues
   and issues regarding the new name of cvmx_helper_interface_mode_t

 arch/mips/cavium-octeon/executive/cvmx-pko.c |  4 +--
 arch/mips/cavium-octeon/executive/cvmx-spi.c | 16 +++++-----
 arch/mips/include/asm/octeon/cvmx-pko.h      | 20 ++++++------
 arch/mips/include/asm/octeon/cvmx-pow.h      | 12 ++++----
 arch/mips/include/asm/octeon/cvmx-spi.h      | 32 ++++++++++----------
 drivers/staging/octeon/octeon-ethernet.h     |  2 +-
 drivers/staging/octeon/octeon-stubs.h        | 30 +++++++++---------
 7 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/cavium-octeon/executive/cvmx-pko.c
index 6e70b859a0ac..e6cf0d82b452 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-pko.c
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
index 291eaffd2543..f01435d91160 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -215,12 +215,12 @@ enum cvmx_fau_op_size {
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
 
 typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
@@ -235,18 +235,18 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
 } cvmx_helper_interface_mode_t;
 
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


