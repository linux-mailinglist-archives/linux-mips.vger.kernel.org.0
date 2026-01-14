Return-Path: <linux-mips+bounces-12932-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2605AD2063C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 18:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48E56301EFC3
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 17:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB98627F72C;
	Wed, 14 Jan 2026 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdVIeaZx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F09A155C82
	for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768410016; cv=none; b=AUAcgO2Afg0qc0HYHHV7idw7JcOaFT6L2ErLax7Mg8+PPqL0HQmSKHBY9X39Mnv9ozE8K5Uoh1iFeHAN+GNQRywWMur6GZZrEPNtm8OV6CQcjSxe0DjPBM0dRFcV4n6atU00b526k2q7spM6aK/BzAJKGrLZEmO3Z91iZ5PpsBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768410016; c=relaxed/simple;
	bh=TdQ1PxnixZuTqBgDjCx71BraKAPrKTU04PfdZhnHF8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRxKXlzkbXTEC+0gDtl3h8jPGxkpIP9o8Iz9MKx9LX+qTz4Os3QhcQu1x3a9KiJ2SuV/lqNhU7vIE9OUfyn2dbKxm+mAAjag2/Jc8lh1rR+pJ/Q0tvZzJ2wlL4FkJW0wV/jzb15pT+5rcF54B9SZaAJY940sWmReC9YC5GSejqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdVIeaZx; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so4926886a91.2
        for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 09:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768410013; x=1769014813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GagbSgLZicpSoO4nWTcoXi5mvyUj9ai6yjSI7MoALoI=;
        b=cdVIeaZxZUHKN1VeQr+Zx00nbmrlRRwqwP3IOaVM2EosKnBdUIuabZfrdC68jlPKb+
         jjyA5dzIiUU9hYSr26nieu9Ek4re7BTl0DflkC1zm/p095lNKRJddLuXlQcxV95ftBDn
         oKrop6AZ4zGTpMfqPRzwXRENmQltG4oXwp6USF9/7+FDdPrCds36m4+ZB3NwTQg3t4aV
         chI8gtNd4IrWs/jYE5LyHjoskY5ZgH0HiP88UQZt5aL9t/Pc9Jbydkd+d0PWQdDJplrI
         bhcwpLpaKlIUiNinWj0CFHA0EpHJYOXTvMcA4ThGx7x6SSYeS4mnbPs6xPRngkAtHacU
         dSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410013; x=1769014813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GagbSgLZicpSoO4nWTcoXi5mvyUj9ai6yjSI7MoALoI=;
        b=t/dObq2LzglrblV4mDz5klMcSQndqB7LCDdBTQ+QzUw2EhkW+mikjbQEiRuc1iTGSU
         GCZbg/+fDYDEyHddRVc/tfTNUlNFHkrDM0KszeINpW2lvBLPRKuvxIHL6fOJtirU3PFD
         mBLWi6ELfwNNnkumrozO1JNSYqtqz/j5XgSVB6rmst5vZW0frLAdm8kG2hyWwYNSuxad
         +IA5Qf8TxxyscplbkDLPaT+MMXODxKounjI1zDHr6DRPcQSNZazhu1+wI7MVSvBqz2XB
         MegwUGaR0QCb6n49T/uFwZ50Cdq5PoDJHT5v6ZoQVdaHkdEsOhY1N54+sy6SoHoZEzwP
         4PlA==
X-Forwarded-Encrypted: i=1; AJvYcCV4T4FoSnX0Q+qge3EKz7VbI3hFr3VNUQ7kh/+3WLO/puqOQywZtLsj4VAwlzBJ91Fw6T9pgbEcyAli@vger.kernel.org
X-Gm-Message-State: AOJu0YxQMvJwFxk/3hjK0dRUdjnntOAkk4sLPFHyxHmCj0xR8f1Dzmpe
	YcXn9Q8Qo2y3vPOKXI0TLuu22482+6cqnXFC2wceP5zF29Xx/EiHYMcG
X-Gm-Gg: AY/fxX72HRnP4zfZYo3UCSwfOhxnK5D47e4BgSUyckCqq1uttLCaLhiVDaY8NXjZwSh
	um6DpGsxWeKP1IPomWePEVPicMHW47JY0tPhpJO5PsK1UdWEyZZCYzyXi3a5d3HtTRcvEvLycj4
	DOGG6Ktc6qbQHbIYpL3+DxkAjrEYChkOGhEuNv0sO+fghYYfToQHHR3tmnsqorTFm7OVmPHVZKy
	AsdLZ8JBUCXVQAKn4e5FgUe22IaFPZoCITWynIG6MxAYlu3wJ5B+Go25MqtAkaAmZ65jBoGCitj
	KKqY/NKhfvZuNkqqHUJin9IvlPJBPFt18j0Vn+9ZAJpve1vlkLaq9mFEGvuK297yTOfw3msvnBx
	bSBnEomq/nChoRTuDA6ySKnlzIZJQGRClPULIyCe9sm8SCMULcaVhNojQhYvtmNbYk4eYmROO9j
	xY3YwiEiK9IiYHpvclcaYVGyg=
X-Received: by 2002:a17:90b:4a52:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-351090da00fmr3612320a91.11.1768410013265;
        Wed, 14 Jan 2026 09:00:13 -0800 (PST)
Received: from karthik.bbrouter ([103.215.237.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677c9315sm32098a91.2.2026.01.14.09.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:00:12 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: linux-staging@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	karthikey3608@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] staging: octeon: Remove port status typedefs
Date: Wed, 14 Jan 2026 22:28:34 +0530
Message-ID: <20260114165834.33387-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove cvmx_pip_port_status_t and cvmx_pko_port_status_t typedefs and
replace them with struct cvmx_pip_port_status and struct cvmx_pko_port_status
to match Linux kernel coding style.

This also updates the MIPS architecture headers to name the anonymous
structs so they can be referenced by the staging driver.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601131108.A90iCRFi-lkp@intel.com/
Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
v3:
  - Fix build failure by naming anonymous structs in MIPS headers
    (Reported by kernel test robot).
  - Add Reported-by and Closes tags.
v2:
  - Remove invalid "Unix Antigravity" Signed-off-by.
  - Submit as standalone patch (detached from unrelated series).

 arch/mips/include/asm/octeon/cvmx-pip.h |  2 +-
 arch/mips/include/asm/octeon/cvmx-pko.h |  2 +-
 drivers/staging/octeon/ethernet.c       |  4 ++--
 drivers/staging/octeon/octeon-stubs.h   | 12 ++++++------
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pip.h b/arch/mips/include/asm/octeon/cvmx-pip.h
index 01ca7267a..cb3342313 100644
--- a/arch/mips/include/asm/octeon/cvmx-pip.h
+++ b/arch/mips/include/asm/octeon/cvmx-pip.h
@@ -180,7 +180,7 @@ typedef union {
 /**
  * Status statistics for a port
  */
-typedef struct {
+typedef struct cvmx_pip_port_status {
 	/* Inbound octets marked to be dropped by the IPD */
 	uint32_t dropped_octets;
 	/* Inbound packets marked to be dropped by the IPD */
diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index f18a7f24d..46bb5ddcb 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -114,7 +114,7 @@ typedef enum {
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
 } cvmx_pko_lock_t;
 
-typedef struct {
+typedef struct cvmx_pko_port_status {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc1..6d03d2346 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,8 +201,8 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
-	cvmx_pko_port_status_t tx_status;
+	struct cvmx_pip_port_status rx_status;
+	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 35b5078ba..f6d502193 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -386,7 +386,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	uint32_t dropped_octets;
 	uint32_t dropped_packets;
 	uint32_t pci_raw_packets;
@@ -409,13 +409,13 @@ typedef struct {
 	uint32_t inb_packets;
 	uint64_t inb_octets;
 	uint16_t inb_errors;
-} cvmx_pip_port_status_t;
+};
 
-typedef struct {
+struct cvmx_pko_port_status {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	uint64_t u64;
@@ -1260,11 +1260,11 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status *status)
 { }
 
 static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
-- 
2.43.0


