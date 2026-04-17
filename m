Return-Path: <linux-mips+bounces-14183-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBKiHp+c4WkQvgAAu9opvQ
	(envelope-from <linux-mips+bounces-14183-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 04:36:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA92F416429
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 04:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56D8B301914D
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 02:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B4A26FA6F;
	Fri, 17 Apr 2026 02:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL77VqXY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A954654
	for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2026 02:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776393372; cv=none; b=NBv8pKkyXsW6kKWQbJF+T0JtFabTIpfPi8eksvSUcVWsWgcssNV+VH3DylCjf/tw3kEw+zU05+p7J45+ZOLFEVp0CajoEYVxdP6WrSrpFO6AO26uhwcNSOviOoRTeENUytqonPxZbAMlYb+ZZMws13/3IMpOS0EkyQJQpVZ4yFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776393372; c=relaxed/simple;
	bh=VeKDihqhlOCIhst3RPegrgi+QOHxHhPbR2wfKOfov+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQDACz3NzHxON/oIk1BFyO56iEIBBHc50XtkY7rcthQzn/qnPaI8i2bVEEwZs+9wJzhXCxWeK5L/7ZoZAoYjKOA41cGUN+x/RvhZoPL8lKGKGFJNLCkMmz+ef6UvoZIrKWw4rDLXmYJpzpRS/7Fv9Oke3RO2JKJT5TKOidhcBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WL77VqXY; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7dbd2a0211bso185241a34.0
        for <linux-mips@vger.kernel.org>; Thu, 16 Apr 2026 19:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776393370; x=1776998170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6SHyQChDMp2FfJSL1Jb4vIVb/ftlOjma1SC6BeaD5Lg=;
        b=WL77VqXYvR5btZd6JT81Vb8XLnH/hbZDW37EFyyVA0+QffgjKSZUKV7ENVmoEeh/LK
         5Z5uOSWDjW5T4WFCF/Edhy3lyuLbaZBmcyqLRK1TeGIzIPmjNHGegFYb7yQFH5u4EP/e
         9ByNUSeLZzXEuBIAdOqlJrlBjPsiMWmPsYPpjPBZjZflgQB1KOMgv7Ux/cjY07eDoXNU
         dIdVaWEQEyQlHTmwBECKfmqpWq0bjC87eh2enXFHzyscgkO+tzAH95iOQC30M8Np2TMZ
         5nt9GJKBhWmOnuzgPyxFlqHT2SDo87PKDih2Kx0Vu7uRVFoblkCWYEA05nGmUqcHWp/V
         PobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776393370; x=1776998170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SHyQChDMp2FfJSL1Jb4vIVb/ftlOjma1SC6BeaD5Lg=;
        b=KEGwv1qEXcVhAgT1cnp3BPQpi1XxvozibsE6quYpvgL3OlBH+r78uJyJ23BCPjA86S
         Cmmr5UEbSgDSWQLIj4MlVmwDnVYlmhQh7JWCWFRO1Nx+HKuiEWU4RaePym7BkNvStxXJ
         CF2xwmLeP5TSmfpz7CZkbGBntSHtIfGgGLnrR80vGOynZiJpZTFNK/ra/OynPAUN0HEn
         5KRX81PyDNuG/2zuZSCc7Njm3KD4NpSFH9FdSrUDKbBSGWTBGjVV62Orjcv4BoywVDKP
         o+00jO9XCBjTNHxYH+P3gFOV1B14vKYcHVDbLc8C8wAWYi/IxrO/0/766ZwE1wrJ2N+j
         KcWw==
X-Forwarded-Encrypted: i=1; AFNElJ9dV4OKmbqpsrL14IUoD7gqqBWfHysrZGFX533SdLw+xxeUjcXbQYfktXeNBU6JFyDJbH35lRa6LyiE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9H72C7wx5nsbqrkNPx6eh4k/JaQ9jE2RS1c0KfvHnR67BG/nM
	myTEBZPk8hY5c6kVpwe5uJ75SOix3Qr0dNWzI5z5TXZENA0p+TRvCLZmor2OCA==
X-Gm-Gg: AeBDiesz/UxFDjg4+r7j6ioJc4v1jU2D6VU/sFaQm1kpqsm8LmBD+WLSZ+OAsPSi3fZ
	LGPPy7tM/U7SIWXdiN5tRT156TRbnTiV8Os8WxhImOXutVC6tv+O5TSRCbzQPkJ6XuKRcfGy7st
	/wmc8LsYP/RDVM/s9DVzE7kqk+gLA4G7aZQS5P3WWgJQYtXEUn7hGue7FHQwKYHbmPw0OKe+qHA
	7gxA8mfkcKcm1T/XeVarbeyEzl5TEHZ1jIK1Pm0j4xSDgQ8h1by97PSWhTyfcCbiWuV65eGV9VQ
	qEk5bVXDQuAtHDbtl1eNX2o0hz3VyRBcNbwb3oDJCnudgjVY/U2DSwAWgysQKoddAM7EKsYbXP0
	1UanvJcWaqmrzeO3RvpayRp/sEvgRKyP7sUmmyj5ib70w0l6sNLPtx+AQwNo+PqbOdQfAUx06SN
	0X9OYboNfMMa6qZrU+Wlzw4Yp8YadZdE6GAt1+dG1f0/N+SzLlVIDc4BBzgFnCsKeOAWev
X-Received: by 2002:a05:6830:6d2e:b0:7d7:cde1:5440 with SMTP id 46e09a7af769-7dc951c7541mr742358a34.18.1776393369920;
        Thu, 16 Apr 2026 19:36:09 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc97519090sm142802a34.10.2026.04.16.19.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 19:36:09 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: tsbogend@alpha.franken.de
Cc: gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] mips: cavium-octeon: remove cmd queue state and related typedefs
Date: Thu, 16 Apr 2026 21:36:02 -0500
Message-ID: <20260417023602.112359-1-m32285159@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-14183-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA92F416429
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This change removes the cmd queue state typedefs to work towards the
"code cleanup" task in the staging's TODO, and aligns the codebase further with the
Linux Kernel Code Style.

The following structs are affected:

- __cvmx_cmd_queue_state_t (now struct __cvmx_cmd_queue_state)
- __cvmx_cmd_queue_all_state_t (now struct __cvmx_cmd_queue_all_state)

In addition, the global exported pointer __cvmx_cmd_queue_state_ptr has
also been updated to use the new names, and its extern statement in
cvmx-cmd-queue.h has been moved to the top of the file to satisfy the
requirements for EXPORT_SYMBOL_GPL.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 note: This patch is a part of a continued effort to remove abiguous
 typedefs across the cavium-octeon/octeon codebase.
 .../cavium-octeon/executive/cvmx-cmd-queue.c  |  8 ++---
 arch/mips/include/asm/octeon/cvmx-cmd-queue.h | 32 +++++++++++--------
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c b/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
index 042a6bc44b5c..4cf4060df48c 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
@@ -46,7 +46,7 @@
  * This application uses this pointer to access the global queue
  * state. It points to a bootmem named block.
  */
-__cvmx_cmd_queue_all_state_t *__cvmx_cmd_queue_state_ptr;
+struct __cvmx_cmd_queue_all_state *__cvmx_cmd_queue_state_ptr;
 EXPORT_SYMBOL_GPL(__cvmx_cmd_queue_state_ptr);
 
 /*
@@ -109,7 +109,7 @@ cvmx_cmd_queue_result_t cvmx_cmd_queue_initialize(cvmx_cmd_queue_id_t queue_id,
 						  int max_depth, int fpa_pool,
 						  int pool_size)
 {
-	__cvmx_cmd_queue_state_t *qstate;
+	struct __cvmx_cmd_queue_state *qstate;
 	cvmx_cmd_queue_result_t result = __cvmx_cmd_queue_init_state_ptr();
 	if (result != CVMX_CMD_QUEUE_SUCCESS)
 		return result;
@@ -202,7 +202,7 @@ cvmx_cmd_queue_result_t cvmx_cmd_queue_initialize(cvmx_cmd_queue_id_t queue_id,
  */
 cvmx_cmd_queue_result_t cvmx_cmd_queue_shutdown(cvmx_cmd_queue_id_t queue_id)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 	if (qptr == NULL) {
 		cvmx_dprintf("ERROR: cvmx_cmd_queue_shutdown: Unable to "
 			     "get queue information.\n");
@@ -295,7 +295,7 @@ int cvmx_cmd_queue_length(cvmx_cmd_queue_id_t queue_id)
  */
 void *cvmx_cmd_queue_buffer(cvmx_cmd_queue_id_t queue_id)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 	if (qptr && qptr->base_ptr_div128)
 		return cvmx_phys_to_ptr((uint64_t) qptr->base_ptr_div128 << 7);
 	else
diff --git a/arch/mips/include/asm/octeon/cvmx-cmd-queue.h b/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
index 67e1b2162b19..faef98173a4f 100644
--- a/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
+++ b/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
@@ -71,6 +71,12 @@
  *
  */
 
+/* Global pointer to the state of command the queues
+ * Moved here to satisfy requirements in cvmx-cmd-queue.c for EXPORT_SYMBOL_GPL
+ */
+extern struct __cvmx_cmd_queue_all_state
+	    *__cvmx_cmd_queue_state_ptr;
+
 #ifndef __CVMX_CMD_QUEUE_H__
 #define __CVMX_CMD_QUEUE_H__
 
@@ -125,7 +131,7 @@ typedef enum {
 	CVMX_CMD_QUEUE_ALREADY_SETUP = -4,
 } cvmx_cmd_queue_result_t;
 
-typedef struct {
+struct  __cvmx_cmd_queue_state {
 	/* You have lock when this is your ticket */
 	uint8_t now_serving;
 	uint64_t unused1:24;
@@ -140,7 +146,7 @@ typedef struct {
 	uint64_t pool_size_m1:13;
 	/* Number of commands already used in buffer */
 	uint64_t index:13;
-} __cvmx_cmd_queue_state_t;
+};
 
 /**
  * This structure contains the global state of all command queues.
@@ -150,10 +156,10 @@ typedef struct {
  * ll/sc used to get a ticket. If this is not the case, the update
  * of queue state causes the ll/sc to fail quite often.
  */
-typedef struct {
+struct __cvmx_cmd_queue_all_state {
 	uint64_t ticket[(CVMX_CMD_QUEUE_END >> 16) * 256];
-	__cvmx_cmd_queue_state_t state[(CVMX_CMD_QUEUE_END >> 16) * 256];
-} __cvmx_cmd_queue_all_state_t;
+	struct __cvmx_cmd_queue_state state[(CVMX_CMD_QUEUE_END >> 16) * 256];
+};
 
 /**
  * Initialize a command queue for use. The initial FPA buffer is
@@ -234,10 +240,8 @@ static inline int __cvmx_cmd_queue_get_index(cvmx_cmd_queue_id_t queue_id)
  * @qptr:     Pointer to the queue's global state
  */
 static inline void __cvmx_cmd_queue_lock(cvmx_cmd_queue_id_t queue_id,
-					 __cvmx_cmd_queue_state_t *qptr)
+					 struct __cvmx_cmd_queue_state *qptr)
 {
-	extern __cvmx_cmd_queue_all_state_t
-	    *__cvmx_cmd_queue_state_ptr;
 	int tmp;
 	int my_ticket;
 	prefetch(qptr);
@@ -286,7 +290,7 @@ static inline void __cvmx_cmd_queue_lock(cvmx_cmd_queue_id_t queue_id,
  *
  * @qptr:   Queue to unlock
  */
-static inline void __cvmx_cmd_queue_unlock(__cvmx_cmd_queue_state_t *qptr)
+static inline void __cvmx_cmd_queue_unlock(struct __cvmx_cmd_queue_state *qptr)
 {
 	qptr->now_serving++;
 	CVMX_SYNCWS;
@@ -299,10 +303,10 @@ static inline void __cvmx_cmd_queue_unlock(__cvmx_cmd_queue_state_t *qptr)
  *
  * Returns Queue structure or NULL on failure
  */
-static inline __cvmx_cmd_queue_state_t
+static inline struct __cvmx_cmd_queue_state
     *__cvmx_cmd_queue_get_state(cvmx_cmd_queue_id_t queue_id)
 {
-	extern __cvmx_cmd_queue_all_state_t
+	extern struct __cvmx_cmd_queue_all_state
 	    *__cvmx_cmd_queue_state_ptr;
 	return &__cvmx_cmd_queue_state_ptr->
 	    state[__cvmx_cmd_queue_get_index(queue_id)];
@@ -329,7 +333,7 @@ static inline cvmx_cmd_queue_result_t cvmx_cmd_queue_write(cvmx_cmd_queue_id_t
 							   int cmd_count,
 							   uint64_t *cmds)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 
 	/* Make sure nobody else is updating the same queue */
 	if (likely(use_locking))
@@ -427,7 +431,7 @@ static inline cvmx_cmd_queue_result_t cvmx_cmd_queue_write2(cvmx_cmd_queue_id_t
 							    uint64_t cmd1,
 							    uint64_t cmd2)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 
 	/* Make sure nobody else is updating the same queue */
 	if (likely(use_locking))
@@ -528,7 +532,7 @@ static inline cvmx_cmd_queue_result_t cvmx_cmd_queue_write3(cvmx_cmd_queue_id_t
 							    uint64_t cmd2,
 							    uint64_t cmd3)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 
 	/* Make sure nobody else is updating the same queue */
 	if (likely(use_locking))
-- 
2.53.0


