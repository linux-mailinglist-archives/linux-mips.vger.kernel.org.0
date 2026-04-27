Return-Path: <linux-mips+bounces-14340-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFPOK7yL72kPCgEAu9opvQ
	(envelope-from <linux-mips+bounces-14340-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:15:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F23476265
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5325C3450DE2
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 15:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D475C342517;
	Mon, 27 Apr 2026 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keOncsdr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12234E74D
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 15:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305285; cv=none; b=gMLPD3+AhSIfa66o95mmia3T64dJebAoR1Yfn86yOQ0ZAZ9LsDEaMXKiNULcp93MDrSBn6Go/C0gG9Zrmy320EGtM8A0CKO+dzQIrQCfFrlkVYZ11lkpktnII9+BY4A7NivtSeu58umui9ZMLRWpUMI2viSU85amX1sI2NlRFVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305285; c=relaxed/simple;
	bh=Lx+FWdTX4CUROM4Gf843xRsUmieLSZtB1d7xcdZ8S/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6LVptxR4U23utdO6omaMcI/6Z/senq033wN0nR1IK2PwpbOqrLbzpH0h37iVLSOV3gZDZGPi7b/4dbjGTNYLPuXm6ZoIbXbeFq10vVNOjoYspZ09PR45TzCznFhnp9TlnfJzpOizW5gEnikApY1If5eJz04oljqU5QnX5Iehvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keOncsdr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso7003909b3a.2
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305284; x=1777910084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgFqJGxTSWQ0zarrhY26FqAsVAR+FlyVmEuRhaiFjvY=;
        b=keOncsdrilFMMsGJE7Xg/r8PAzzsM1oD3meAoV3c893RCouE64f2CdunqhOg4SudQu
         gia6PKT0wswM9r4BRmLDhAGRyn10vSXER4ZuAYExXCi1P0mMYgICT4cgfA8+BA1N0ynh
         ggcwk/D5WzT9J/IDTMrvXIYtFSlv4RM1lMUA4acosD9jP3Fk3Rq54edNwpRMfuw/mgM9
         tLbGmyC0+ZkpzyoEwPS/YVogUsWJCY+EiaSXmcj5M0Am1+c3CROPJQY6F2rwBrXi8I8p
         jzR2F9I6wvsWLqE7tqKVwXXq7jrwEQ6+fcyNf1QkGOismZLJtphrIq+70f3As8uuj4Sp
         3Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305284; x=1777910084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DgFqJGxTSWQ0zarrhY26FqAsVAR+FlyVmEuRhaiFjvY=;
        b=jDOxomnpzuFTJUF/3dHIUZDycfIQuFx6C0WWy2eH6q40VhYXgBGaeoTLVyZHPhrhd6
         +N6Z4yHVPAbsZ1J0jqeltGonSXll4c4moBsb029/40KElwUKCiXg6FHPWBbU4u5yquXy
         5aSNMJ9RdozuEV3jVaZxuoXR97A+8jKLpKBdGN21bmYaMd/5bojNmn8B8ZyztkEi9Gee
         WPV6BH5X5NvKCMn2Z6iavPUkPRtfo+gp7I2XQ+5oh1pq9b/zo3RaAseDw1t3ucy9GJkB
         OICAOfZUjmIFnpKP58L0S1KvJh4JbIeSa0JoNo4oP7gUrq8Py0a6AtxkQBPMXrJ7pXco
         tBRA==
X-Gm-Message-State: AOJu0YypG7xct3WmV7p756a9FJ1d0YyHkqcVO+s+xUQxMJ+PH1uuLFtp
	uQmNdBNAdDFYdNUDd9iESxbS1KcihccWTcmECxoCfCw62Pskhz3Ui3l3
X-Gm-Gg: AeBDiesCygXixaX03CYp7lnWk47cMDYPolyZV5tPc6M3XVXuLNirDvcqeRrRApSLi/l
	+9mYynXJsMB59AEQQHTCrD7S1h0e88SYligPkTJsWgBK5AXYMGgBTN75nXDTiKuDtknLvK8YITn
	9+9Xq0FAUEYwJxg47a64/KGiMx6YJw0pp24Jq23CHYWfo+RycZ1e6BU0R7G0qIMlslTuzDG3aL1
	MmDYqc7A045mTo9dvqFS6TID/e9mVmLwPmkJdCKuRTXIvLZ1u6Bm34gaANJfLsjH4zxe0DdM3Q2
	RnQ28wxf1bRA6HXnznkiokJTOOSjmYyNJYWahOLlJobLd1jgjvy6XdoMRF+x9pWoVdQPyoXBebR
	667PxMwyhPNgDCDatVIz63F1taXrryHzbfb998WiFd0tS+KtBVqnpHs7/efTyPFWre2QgJnwOrJ
	PX6vc7tzH8y6l7PtwTqBAsme+5oxwQTiZGzrgX0aI9HW7iF8EUqYA=
X-Received: by 2002:a05:6a00:2e15:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-82f8c9024bamr47144381b3a.32.1777305283728;
        Mon, 27 Apr 2026 08:54:43 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm34445786b3a.31.2026.04.27.08.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:43 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 4/7] staging: octeon: convert cvmx_pko_lock_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:24 +0800
Message-ID: <20260427155427.668540-5-kunjinkao.jp@gmail.com>
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
X-Rspamd-Queue-Id: 51F23476265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-14340-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
enums. Convert cvmx_pko_lock_t to a plain 'enum cvmx_pko_lock' and
update all users across the MIPS Octeon architecture code and the
staging driver stubs.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/include/asm/octeon/cvmx-pko.h | 10 +++++-----
 drivers/staging/octeon/octeon-stubs.h   |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index f18a7f24daf8..d8e74a305646 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -93,7 +93,7 @@ typedef enum {
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
@@ -374,7 +374,7 @@ static inline void cvmx_pko_doorbell(uint64_t port, uint64_t queue,
  */
 
 static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 {
 	if (use_locking == CVMX_PKO_LOCK_ATOMIC_TAG) {
 		/*
@@ -419,7 +419,7 @@ static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
 	uint64_t queue,
 	union cvmx_pko_command_word0 pko_command,
 	union cvmx_buf_ptr packet,
-	cvmx_pko_lock_t use_locking)
+	enum cvmx_pko_lock use_locking)
 {
 	cvmx_cmd_queue_result_t result;
 	if (use_locking == CVMX_PKO_LOCK_ATOMIC_TAG)
@@ -463,7 +463,7 @@ static inline cvmx_pko_status_t cvmx_pko_send_packet_finish3(
 	union cvmx_pko_command_word0 pko_command,
 	union cvmx_buf_ptr packet,
 	uint64_t addr,
-	cvmx_pko_lock_t use_locking)
+	enum cvmx_pko_lock use_locking)
 {
 	cvmx_cmd_queue_result_t result;
 	if (use_locking == CVMX_PKO_LOCK_ATOMIC_TAG)
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index df0456417f15..06cb4f15d9d5 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -240,11 +240,11 @@ enum cvmx_pow_wait {
 	CVMX_POW_NO_WAIT = 0,
 };
 
-typedef enum {
+enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_NONE = 0,
 	CVMX_PKO_LOCK_ATOMIC_TAG = 1,
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
-} cvmx_pko_lock_t;
+};
 
 typedef enum {
 	CVMX_PKO_SUCCESS,
@@ -1383,12 +1383,12 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 }
 
 static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 { }
 
 static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
 		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.43.0


