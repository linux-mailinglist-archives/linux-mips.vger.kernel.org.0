Return-Path: <linux-mips+bounces-14341-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM/VDc+L72kPCgEAu9opvQ
	(envelope-from <linux-mips+bounces-14341-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:16:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E0476283
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7F6530AD4E3
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 15:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F8E35028C;
	Mon, 27 Apr 2026 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmnZ8vFu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764234EF07
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305289; cv=none; b=EIFgl7ZRLpG6F8CrX/BtjB2pb0DTXB1SSIkVl39TGD7bS4cjBCpvG8F3O0rnt6KJQBlgJ7ptynFNomHn0Fmym0b2Kxp8cdOK1J5D4sQjxFpqS6KwCD8ZMo93AJPsD9zRwXgiOK6wTYUFXb9qzZe0Cw0tn166LAgu6WPWt69Z7sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305289; c=relaxed/simple;
	bh=Uw+6McxcbR1X0j5mklzKziZGlm8Wj4N2l8z9PIZdiy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NU3GFLYVexmqev6G6YroH32uWmNIb6+Vo1QUsLIUlJmjVosvBv9LcJXPpyYHb2fjFw1OehPo7gFkuXCdxTKvJvG1qwkzdS/GxEQEvcsotTdv2OQDUFvyXUWqWVsCWDKeLIoAblWwSdga1iPV0BNJkoXZnrF1pedSQEt3KXi5uig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmnZ8vFu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b24fdac394so99599255ad.3
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305287; x=1777910087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThV84gm5Y5EtW/yF0FDrADPw1AaaVSJvSYelejtPtaE=;
        b=bmnZ8vFuj0UkQHx9IL7DB4naRu95la1a/S7mbFI5JWlc4hnA5fH9k+eL80DqjVAHZO
         2nb7s169nK4b4b1mKVK+2ff+6kJBIOoJRs4929KU3zFRVuqQwe4MwiEjO8BbKQlfe77Z
         +CuK2FKEXwIiRKDyIyprvOxU2aKz+wNlZz6hC36kPzrzhCisPcq/9xii5MYexEIik1HK
         7W3CgD20R3WMVms2VbtnyXzVOZZ4tGTeKji3YO05dmdaljCugLtM1KwxjtPOm0BEyhCf
         mx69QXnJPD7x9OBAghb/8gUCBpp+lDp/VVfRifvMdHGycMJvLqJjRB3+1Zp1YurTMNzt
         omoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305287; x=1777910087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ThV84gm5Y5EtW/yF0FDrADPw1AaaVSJvSYelejtPtaE=;
        b=XvAfZZ03dSWtI1HzomrsqRiANLvGB0Ci4PK8xUz9g3SnA5rT3Y5Euded/aQaOi9IoT
         t+THQmJ78odjrCBi7DTQ3J6x9L/CcqCi7KmOx9rtGaUuVQoiGi58kJIo4Xv0CUPbT5Ht
         g0N1fCyWXLy3RxO+3vlRtVvAYUzUvALEMRq45d3SiKuxYnYb1hP1txhpzxuEnmrPk57Z
         p1f7FjLjkLNmIfLwy2C8hvuk3req9YC03Tp/Q0WQiU0c2PT/p7y0sbOZ0RWD0KgoB4VH
         eLkMadTPl6jPtz2wKd4K+gtUYw9CgWZtVydvxcb7jHPLvDjjAdWSSo5e5eQnnAHWNrIg
         OYCg==
X-Gm-Message-State: AOJu0Yx12vApLi1n1i22nCFOa1S8VPrDwvcbZgOuiQURsmudUYNnYUjU
	69OIDHQk27q3UT0pIDoubqZKWvwZDHUcop4LmdHrr8QxqxoaAaqeKGO9
X-Gm-Gg: AeBDieskB9TzJaUip1j8pP3AAR3bsadMwHVg0+2zqa/WpWQ4ny+4k3liUPtB290C6CW
	aSebI+x8z9xNKKHlGhf9lS8qxxuP7Jyskc1AEw4wZVR+oM36vnBMqDvtwU3aHgyM5CrOdR4cr/H
	4UlWKqDrlj46y/6rJKeVvhIM1VpDyFi5xL/ETGC82Rcqx04/NGDjeyMIZpMk5Eob5vg3P0JvW9U
	4LlOIAccJOsO15fA91eY3JjoMeth8Qc3JShJUTE58LC3tHpvDFBO89CPKAVrjqDse2y2u31pCD5
	5ZEQpDzDytNPqWuv3BgDE7Jfa3e937DVqZ55fT0qxTJS9kn9jFaP+fW1uk1m74hcoFXHCdBFoIc
	LVhff6jWxPwPNyOkRlQ30SMqMKNxFZjVWXMs1vtmnDMusvGQSbRD4X3Ec0Rc3Kcwh3L2aB6Q6W3
	peDKMMwxNpjGmzkj8t/MdaaN26NjsvsSi1fM0B901V
X-Received: by 2002:a17:902:7c0f:b0:2b2:b117:1e16 with SMTP id d9443c01a7336-2b5f9f7e95fmr332045605ad.20.1777305286937;
        Mon, 27 Apr 2026 08:54:46 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0caa9sm306493235ad.40.2026.04.27.08.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:46 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 5/7] staging: octeon: convert cvmx_pko_status_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:25 +0800
Message-ID: <20260427155427.668540-6-kunjinkao.jp@gmail.com>
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
X-Rspamd-Queue-Id: A92E0476283
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
	TAGGED_FROM(0.00)[bounces-14341-lists,linux-mips=lfdr.de];
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
enums. Convert cvmx_pko_status_t to a plain 'enum cvmx_pko_status' and
update all users across the MIPS Octeon architecture code and the
staging driver stubs.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/cavium-octeon/executive/cvmx-pko.c |  4 ++--
 arch/mips/include/asm/octeon/cvmx-pko.h      | 10 +++++-----
 drivers/staging/octeon/octeon-stubs.h        |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/cavium-octeon/executive/cvmx-pko.c
index 760abbe12479..b0199d5cb551 100644
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
diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index d8e74a305646..a742c1d61d8f 100644
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
@@ -88,7 +88,7 @@ typedef enum {
 	CVMX_PKO_NO_MEMORY,
 	CVMX_PKO_PORT_ALREADY_SETUP,
 	CVMX_PKO_CMD_QUEUE_INIT_ERROR
-} cvmx_pko_status_t;
+};
 
 /**
  * This enumeration represents the different locking modes supported by PKO.
@@ -306,7 +306,7 @@ extern void cvmx_pko_shutdown(void);
  *		     of a value of 1. There must be num_queues elements in the
  *		     array.
  */
-extern cvmx_pko_status_t cvmx_pko_config_port(uint64_t port,
+extern enum cvmx_pko_status cvmx_pko_config_port(uint64_t port,
 					      uint64_t base_queue,
 					      uint64_t num_queues,
 					      const uint64_t priority[]);
@@ -414,7 +414,7 @@ static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
  * Returns: CVMX_PKO_SUCCESS on success, or error code on
  * failure of output
  */
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(
 	uint64_t port,
 	uint64_t queue,
 	union cvmx_pko_command_word0 pko_command,
@@ -457,7 +457,7 @@ static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
  * Returns: CVMX_PKO_SUCCESS on success, or error code on
  * failure of output
  */
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish3(
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish3(
 	uint64_t port,
 	uint64_t queue,
 	union cvmx_pko_command_word0 pko_command,
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 06cb4f15d9d5..8496c60d647e 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -246,7 +246,7 @@ enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
 };
 
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
@@ -1386,7 +1386,7 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 						enum cvmx_pko_lock use_locking)
 { }
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
 		u64 queue, union cvmx_pko_command_word0 pko_command,
 		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
-- 
2.43.0


