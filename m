Return-Path: <linux-mips+bounces-14339-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC7PHSiK72kPCgEAu9opvQ
	(envelope-from <linux-mips+bounces-14339-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:09:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD212476034
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FBA930A2DE2
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 15:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D120934D4D6;
	Mon, 27 Apr 2026 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfmUBoSY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB3E34C130
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305282; cv=none; b=fG99sxsbuvzT2wktFyVlxytq+1/OE8VcOYGy0YRC99ufQPCu1LUGX9JS6ucMTMgPdUAbTYiIQ23Z41xdmw4v5xUjzPdx/5I9OGjtimvVRJ0k1qshcIaZE1SmTM0/cSzugvs/dF6ho0XFBSkF3zKusrM1VEVxrw5tUmSvsZHSk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305282; c=relaxed/simple;
	bh=dPVmA4SAKvP8uttiAwiTIqfYjB1yylln+rbXAL0TOHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtUgRjaOo0zX9Xo54CuSsMsg0wENBL8KtlNhPylCyeG7Oa3rW0yMsgHm3uWDtevPvUVn7ZTciiA435GTSjiavx4uBxMsaKLXCUN0HthOUTl02Edo12dkB5RI1mgSErXl56FhDMapMM9+PT9tVNKOEaZEJu8Tyy//YDKDf6SdEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfmUBoSY; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f0884bcfaso7060741b3a.1
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305281; x=1777910081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nEwsx1IE37alek/UbFFJIAS/ZU1TO09DbXxHjDA5/4=;
        b=NfmUBoSYERI8Uk+PjJxdwhNl9UjFP3CjNR/8kIZxilZUuaGybt1owd8knTKwpmp673
         DVKBXgnm/9fJqHLNzWZsfWYWygz9SfKYRmheTeKwGpm+NCY4wTukogGeFq/tBpAcFAEg
         AXRiV8WxD0aT+5gI2mpbLAW25EKgJYty9HWnaO3+2jqhJgV8+QE69ik+T3rQnrgJsANl
         eOoG99gfh+kUdFDhrZAbQh34uHMRrlQEJhgd9iDPw65fyabCoxqCCNb0NbmlGVpu7ufW
         AnS21LiJ4Zpfnd4cme4maw/SgdN6CVRR6B1sXSu5thRt2K2IihdBnoV854PZIAFyVywU
         6Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305281; x=1777910081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/nEwsx1IE37alek/UbFFJIAS/ZU1TO09DbXxHjDA5/4=;
        b=Ymgp8vXtMu25psif3Xmr9OHPuRcvHB3cOyjwQ5FjgGbXgGnhFKv2ksKwQv7+PxqadV
         QA8QlIONsqNeDEQGTQgPNj+sHAxCJUCJsQHSO5Sq98VIRAg8edPxBhMPch9JKZS67z+J
         ZPJfaCCRy+08v65JdHugtG1Pw7h+ukUAo+RExO7nDWBY7FRcCY09pE9xopE32q0RBPt2
         krmtv7qu/b/zgEmI9Dm/noTHb9AK90UFjsdEtv0kzizXM7IeeSHmyAf418HBF8hKTn1X
         lPRVuBZTeJ3ideisUyA36adPHQccW9E8e6q6/WnIxNISX6LiEvRpUjoNeaph6G8vNRkE
         hLoA==
X-Gm-Message-State: AOJu0YyVmO4qMvV7Gx3lzN2XS7o/SrbxKYTFZsTdeb54SfDUELYvlmTm
	xuHOc6550HZumjR38RfftTI6apW7KNL34WXS9JIEikxzkSuZk1hVF6Ij
X-Gm-Gg: AeBDietqsL9Yx544WoNJiNupXEKw0Y9RvfA/GqNyhqB/A5OaTcCeYxmVooKbvx9112I
	hIi/LgRCgRDa2zgumguvx51ZtA4bgpK0kdhSKnaJe4HvoZXW1/lA+ceBJHNNrkftBRLIR3EvNzL
	S/UPm+lml0Q3EvdpKruyYd9wNrPOK1iBLvZ5ssjeJAQrbbNrGpND1YHzF9OZnjn9By9J3rsCrbm
	2jGUUhfn3C4wepnVaIKt9gbd3VNY+iismJmZJJClW8p/EjYSrItUWmBC2kPtXsm6nK8Sxn8YhmH
	YIvojvTOfLBpEeoUpoR45lbKdNEPtetTi/lDzVU4XTYdwyvzbi+JlqS9j4TKtrLVxhRFSdd07Uo
	YoIlQJcULbGy64GHTfYBhgHkENj1wipz2IVTH97szgux1ZTJRpkUXoiXrtrFUxI1GtaKj5RxzBa
	U89KWUWYlvxJ4WjNqmX8P83lLGjG1KRUlx2B86i5yK
X-Received: by 2002:a05:6a00:1acc:b0:82f:4a4d:377e with SMTP id d2e1a72fcca58-82f8c8c2f8fmr48204285b3a.28.1777305280668;
        Mon, 27 Apr 2026 08:54:40 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f932daa68sm34339028b3a.49.2026.04.27.08.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:40 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 3/7] staging: octeon: convert cvmx_pow_wait_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:23 +0800
Message-ID: <20260427155427.668540-4-kunjinkao.jp@gmail.com>
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
X-Rspamd-Queue-Id: CD212476034
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
	TAGGED_FROM(0.00)[bounces-14339-lists,linux-mips=lfdr.de];
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
enums. Convert cvmx_pow_wait_t to a plain 'enum cvmx_pow_wait' and
update all users across the MIPS Octeon architecture code and the
staging driver stubs.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/include/asm/octeon/cvmx-pow.h | 12 ++++++------
 drivers/staging/octeon/octeon-stubs.h   | 10 +++++-----
 2 files changed, 11 insertions(+), 11 deletions(-)

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
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 6c0329270464..df0456417f15 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -235,10 +235,10 @@ enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
 };
 
-typedef enum {
+enum cvmx_pow_wait {
 	CVMX_POW_WAIT = 1,
 	CVMX_POW_NO_WAIT = 0,
-} cvmx_pow_wait_t;
+};
 
 typedef enum {
 	CVMX_PKO_LOCK_NONE = 0,
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
@@ -1358,7 +1358,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
 	return wqe;
 }
 
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait wait)
 {
 	return (void *)(unsigned long)wait;
 }
-- 
2.43.0


