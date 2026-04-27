Return-Path: <linux-mips+bounces-14343-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH8mM+6L72kPCgEAu9opvQ
	(envelope-from <linux-mips+bounces-14343-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:16:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED7E4762AA
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D72B30F66C5
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 15:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8F035AC31;
	Mon, 27 Apr 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6IOcJGP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D70359A9B
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 15:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305295; cv=none; b=b8A416xu7c3456JVFXvfoZfXfu1cWl5aYvggyfV+cXsbyjDAFCYCDQF2tA65upL7ns3C+MxnbZPHVY+BnLPS+xBlwoxP3bT2q/0kgf24QmVSw6sHbLTpjslAFaqrTwxx+ad+Y/RI/IjgJ10YETCgkf/XCDIbogdDAyHxDqZ9JbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305295; c=relaxed/simple;
	bh=23evcU1TdjFjzg2aQNROqzfbxAgSpKxe6AK/+hAaEV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6fJ3E+S1uImpn6Z2q+Pd7c/18k1hVlXECVJkgdU4pWj84TaNIcIpvSVGDkucXLLDP0PyWtgxvj1ElvsEdq3Um219V08H654TTN4p3UrJZe23XQDcMnG1yvHAUG3r/wHqZD0w3zf1WUjb14Me1XKC9aE6RAlI5pTeK1nmCer6SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6IOcJGP; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35fbca04006so5211329a91.1
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305294; x=1777910094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ir1hTXu7IWWfjs4gdRRexBIGEymH3qRIcAM1ZommSVw=;
        b=X6IOcJGPD2bcJe/flgqGXtUVZCmpAaG5c+7EuQW0LV9sr+7stAJdZJ9iIa5OxsLsYE
         0l3TIdnQ00O+h8FSIVkvc2sy3tSOgfVT9LPt8yZWEUnhPKbfGKcjTYMkNuAMAzpBYAxT
         PU04/juUlm2wkUZaBZPguNj/LxSRDYyqObcQwDil2Xj9JENmiKJPEhzvRyYamUvZA7yf
         A8q6iU90hI8Ri/DeTwMmoasxn7Bu0SWKONk8MY2sc7r4vh7iqAXzkLJoT51j8mJuDmWs
         BAUc58A00jweuB+Tr/QTBSMvQ3MdPsDIKW9R9a12L+bXDKgNy7Uv0ZeCaFcO5oa6yPpw
         nTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305294; x=1777910094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ir1hTXu7IWWfjs4gdRRexBIGEymH3qRIcAM1ZommSVw=;
        b=Kw9lX+MLfWujfrigWH0Rq3dfAfyRvYtTY/xgyxAfi7DWyoud/oHCWUQYuKmZan6KWe
         qRy4jVLVFAl4/lb5ANID2fGroC+n7XWlX3Jd2pFoacFXAklCvdAvSxGZSvfMJWOmDa9g
         bMFm2FSovfgZAAEKpU6G/9P+sTYkBCMRo9ff2VuU/o6KdnSZhgENjd4USyO8EUMM8uL7
         JG1LOQhSn0bfYClDPmSyTNwlGYqrtq0xaxjFKyT7nce3et510nClcqxp5ms0zkfK5pK/
         1Ns9k803HxG/Lpd98kmIXgZJHv4a0s7jge13FPtmmbw94xHg8p6haln0D8bBSH4zqE02
         m4wA==
X-Gm-Message-State: AOJu0YwEibFYuPM44sNJyT8SQOnINPtzADVNKjLHqAD0XaSJQqzqH8Lw
	T3kUYxVpK5dh2kTwK0z/2OPtO/0rSwjsUsTcBJ54j26Bc53r4lDe5UV/
X-Gm-Gg: AeBDietVoKtSe+fsggExlzfCPD3b0cNlrenSiDJoznm8J5+n7JUQ8i0UZZCgaQJ1Jyd
	ekaUvVYyshVq7Ec6mxYCAQLeOwpGwaZKwg+ga/ntGnpA6RxZgIEPIu+msX+uLa+q+0SEJUmT3l+
	dIVkIwrZSlal+Ebo7tB98WbqqEoMz95RrgHxjg1OYqfTMLLe4IU7nTDLjI2xD8oxi7w15ll5njn
	EwZinjb4gja9QQaRZoPlfhf+tujRl+VhvHBvvhklgspPRHA/b4Ttfr20SO1X33bHoC9KeAU8Lm6
	QX4AdBCaSrawsXbUJl3Oq/v+bAatL0Nql84DQY8NintB226CFlsec0EH2d4YUh2ZL/rNvSMn8Xk
	aGAty4bJPr0ZNkfFw87XzmT/O03E7EznMCvd+iRe+lRdRSYwTKwZJFKcrz/ZzlrVfxC6rqaAb1l
	rQ+WxnSJAcTb3yoMecCQepOXPiANZY3WaDTWr+gDbmXdpZ8Z496FI=
X-Received: by 2002:a17:90b:3c0c:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-361404a1ef6mr45500096a91.25.1777305293271;
        Mon, 27 Apr 2026 08:54:53 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a8f0sm31413787a91.12.2026.04.27.08.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:52 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 7/7] staging: octeon: convert cvmx_pip_port_status_t from typedef to plain struct
Date: Mon, 27 Apr 2026 23:54:27 +0800
Message-ID: <20260427155427.668540-8-kunjinkao.jp@gmail.com>
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
X-Rspamd-Queue-Id: 1ED7E4762AA
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
	TAGGED_FROM(0.00)[bounces-14343-lists,linux-mips=lfdr.de];
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
structs. Convert cvmx_pip_port_status_t to a plain 'struct
cvmx_pip_port_status' and update all users across the MIPS Octeon
architecture code and the staging driver.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/include/asm/octeon/cvmx-pip.h | 6 +++---
 drivers/staging/octeon/ethernet.c       | 2 +-
 drivers/staging/octeon/octeon-stubs.h   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pip.h b/arch/mips/include/asm/octeon/cvmx-pip.h
index 01ca7267a2ba..911276ee90c2 100644
--- a/arch/mips/include/asm/octeon/cvmx-pip.h
+++ b/arch/mips/include/asm/octeon/cvmx-pip.h
@@ -180,7 +180,7 @@ typedef union {
 /**
  * Status statistics for a port
  */
-typedef struct {
+struct cvmx_pip_port_status {
 	/* Inbound octets marked to be dropped by the IPD */
 	uint32_t dropped_octets;
 	/* Inbound packets marked to be dropped by the IPD */
@@ -236,7 +236,7 @@ typedef struct {
 	uint64_t inb_octets;
 	/* Number of packets with GMX/SPX/PCI errors received by PIP */
 	uint16_t inb_errors;
-} cvmx_pip_port_status_t;
+};
 
 /**
  * Definition of the PIP custom header that can be prepended
@@ -365,7 +365,7 @@ static inline void cvmx_pip_config_diffserv_qos(uint64_t diffserv, uint64_t qos)
  * @status:   Where to put the results.
  */
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 {
 	union cvmx_pip_stat_ctl pip_stat_ctl;
 	union cvmx_pip_stat0_prtx stat0;
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 448a4ec42d0b..d85a9991faf6 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,7 +201,7 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
+	struct cvmx_pip_port_status rx_status;
 	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 7bb72e152f08..9c1968b7e2d1 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -386,7 +386,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	u32 dropped_octets;
 	u32 dropped_packets;
 	u32 pci_raw_packets;
@@ -409,7 +409,7 @@ typedef struct {
 	u32 inb_packets;
 	u64 inb_octets;
 	u16 inb_errors;
-} cvmx_pip_port_status_t;
+};
 
 struct cvmx_pko_port_status {
 	u32 packets;
@@ -1260,7 +1260,7 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(u64 port_num, u64 clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
 static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
-- 
2.43.0


