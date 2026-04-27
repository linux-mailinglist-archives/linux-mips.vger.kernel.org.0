Return-Path: <linux-mips+bounces-14337-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD06L/aI72kNCgEAu9opvQ
	(envelope-from <linux-mips+bounces-14337-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:04:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 886DA475EF7
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0E863056F17
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 15:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D15E349B19;
	Mon, 27 Apr 2026 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjFkGfbk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBB9346FC4
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305277; cv=none; b=N572IpMVecgPlgBKAHSA/BVPvaBBCubH6pPnh8by4mgKaahOgJx1W9ZVPHc60G1otJQfuAl/SRZEGgQ7lZ2TaKB4ZGec8UgNobpJhoK8Fm5V2397XhGtoquC96jkdLUQudWFQr2CsPuhB21UV3Zhq+kRnUnDCgsUAGmI19yf82w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305277; c=relaxed/simple;
	bh=I1nJbv81E72QLR9rTJJeT2/s+/pNz9TbaKu14lB08PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQc02TQ0mtHimuUrbk0aRWp73Dga00r4IwOsW4y0ujK4W7gsHbzKldErK7ENjmVNrgJw9onTRLJ/V+Wwq/Nbmv5Ji/evxFSz/ajXk3cGymdRLhJLTreeh+aaa7B/TyPMi30oBI545OldtPE/HUPIENRDtGeSEq3+Th5789qx1LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjFkGfbk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so4126923b3a.1
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305275; x=1777910075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD4HSmg94+zoUy1wxNVzZHgBZRTgsbG2xCqBMkaVIkA=;
        b=jjFkGfbkCoXwlLCOCOHQGuZQHdT6WPKvifdwOxXaigUrfr7g46FyFG20fMJudZH4yN
         cTd8/J+gyEwl7j27ZO9xYub3mSUvgdWyZCY0o6pW2BTaYrI2IVNZdDdDsapGnd5wTW3L
         JtIFXd0H3lGr4xl+rHh4/T4qNw6EtrzLAYotpoNeJ4sxwuykcFF6X+Rjx6CO/OGVtm6e
         1HgSaGppLqtopXiWDERk9+TaXJ3Rbr8qhXp0BxjOvslf1r+UM7exbuT2ZioD7YYELC8e
         hwNAfMB+pCSGC1ErsGdk+9ZLSaF9WWa1A2sjl9yBnRZG5S1wcWRvT0HF28NoKn8rqm9d
         epBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305275; x=1777910075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wD4HSmg94+zoUy1wxNVzZHgBZRTgsbG2xCqBMkaVIkA=;
        b=V57zb9HgxLj3rYCMA6mmQgLeb+kDO5Mqk3w2FNWNNcRUh52CofCV5Y9mrrOCifigb9
         Zndynyg0cUpFlOjEP+i+4Cn+GXhl96sh/wuqfqfnXWEXcoJF1SZItOjYcHD7W1UXp4yM
         mTHdC8/UaOdPLI74H6o2/U2EQGeZwr19L95xl2HLjWup3oTZF34JTqLKHW3t3jsuAGdE
         jf1xoXfAgOLjIZT9jLo6aW3tFGLSYPvFnF7pZJZKUz+BdF0Kr5fONTeYKwtRlg9k4XyD
         f7bIold8/F3bbjzhBTVeKkys/VzJ6bVxFfgrEaB6rONZlVkjB3Gz23KsL3lvNsY98KbQ
         CSQA==
X-Gm-Message-State: AOJu0YyhKz0FHFT5XAQ6MxMooByT+kQ+WJ7S5rXOA6Rzq69d93deyAQn
	x5QnL3C+4t+cS8/ijfGfco5waie2XaBIJLTSeLmSgaAs1107/nLFrKab
X-Gm-Gg: AeBDiesQgwVRqIPGgcBNKX06MW+3VDZ+OIBeedCnA7hWJe/r5Fwh8foUKMnYTCDYi2V
	ZEvPCGD3cnk4CIEDjraqj/CGFOHCbPtwhJt9m1BvOBuV1ZmoKPcjQ1lI7ahJ6emHy9tBd/cKPib
	ij9ullV4meU0wBjxOgGDIpJIQAvRY28EwDlqEn5ItZFRk9IWyynphiYw2JOqYyfPK73aliEOsPS
	op9hGKgPmsBt3guvzeM91P9GxllT2HrPSb16Dt1pDfuKmsgQUrIaKZAgA8aTCgMXt7ASO/IFJTl
	kDtOCconBZIlcF5SVTIp1XKyO1zb8Nnqh779brUaP4ZO9YJCw7208Vilf9RK6uD5BQhpDUsJot6
	K+OZNusX+zZO/SpT5+K38n6FRlFEqJlv5y4Vu9O4YkiHFRAnxLvl3xKChyq8JYpJ22RqxOT2Ix4
	00mozesW67IKMfjDcnQfEDMgJD/t+eCFt1QcoSx8dV
X-Received: by 2002:a05:6a00:4186:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f8c89e97fmr44338437b3a.11.1777305274625;
        Mon, 27 Apr 2026 08:54:34 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d6adbsm40999484b3a.18.2026.04.27.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:34 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 1/7] staging: octeon: convert cvmx_spi_mode_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:21 +0800
Message-ID: <20260427155427.668540-2-kunjinkao.jp@gmail.com>
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
X-Rspamd-Queue-Id: 886DA475EF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-14337-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The Linux kernel coding style discourages the use of typedefs for
enums. Convert cvmx_spi_mode_t to a plain 'enum cvmx_spi_mode' and
update all users across the MIPS Octeon architecture code and the
staging driver stubs.

This is part of a series converting all remaining enum typedefs in
the octeon subsystem to plain enums, improving compliance with the
kernel coding style.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/cavium-octeon/executive/cvmx-spi.c | 16 ++++-----
 arch/mips/include/asm/octeon/cvmx-spi.h      | 38 ++++++++++----------
 drivers/staging/octeon/octeon-stubs.h        |  6 ++--
 3 files changed, 30 insertions(+), 30 deletions(-)

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
diff --git a/arch/mips/include/asm/octeon/cvmx-spi.h b/arch/mips/include/asm/octeon/cvmx-spi.h
index d5038cc4b475..88f7e59a396b 100644
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
+	int (*reset_cb)(int interface, enum cvmx_spi_mode mode);
 
     /** Called to setup calendar */
-	int (*calendar_setup_cb) (int interface, cvmx_spi_mode_t mode,
-				  int num_ports);
+	int (*calendar_setup_cb)(int interface, enum cvmx_spi_mode mode,
+				 int num_ports);
 
     /** Called for Tx and Rx clock detection */
-	int (*clock_detect_cb) (int interface, cvmx_spi_mode_t mode,
-				int timeout);
+	int (*clock_detect_cb)(int interface, enum cvmx_spi_mode mode,
+			       int timeout);
 
     /** Called to perform link training */
-	int (*training_cb) (int interface, cvmx_spi_mode_t mode, int timeout);
+	int (*training_cb)(int interface, enum cvmx_spi_mode mode, int timeout);
 
     /** Called for calendar data synchronization */
-	int (*calendar_sync_cb) (int interface, cvmx_spi_mode_t mode,
-				 int timeout);
+	int (*calendar_sync_cb)(int interface, enum cvmx_spi_mode mode,
+				int timeout);
 
     /** Called when interface is up */
-	int (*interface_up_cb) (int interface, cvmx_spi_mode_t mode);
+	int (*interface_up_cb)(int interface, enum cvmx_spi_mode mode);
 
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
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 291eaffd2543..289a2d41fdc5 100644
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
@@ -1364,7 +1364,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					     cvmx_spi_mode_t mode, int timeout)
+					     enum cvmx_spi_mode mode, int timeout)
 {
 	return 0;
 }
-- 
2.43.0


