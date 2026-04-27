Return-Path: <linux-mips+bounces-14342-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDiAF02K72kPCgEAu9opvQ
	(envelope-from <linux-mips+bounces-14342-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:09:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5710476075
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65EE030E7F13
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 15:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC716355F57;
	Mon, 27 Apr 2026 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOvXxPjH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B3F352C2C
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305292; cv=none; b=vFR7SeKBRuvb7tOmBioX20PKhTklxwOJi2zxWFXom65rWeWcp/Qh3mudH2BIVPug6KS4YJ4XEMwJ8mGIUvbHkcoQr86fMKsyhurWqjNesSuALnZv7zJMwwuYRE/bIDnuwh+ChRvj8pYvtMLfeq6hR7drM5c5Hxgd8o1LpCtQ1j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305292; c=relaxed/simple;
	bh=3lMBDTmGVSzQWPgjOUuDoQlBGhvTrtUqoyElVhNjLfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uq3EVsEa1DexsrAKhG81V9IEa6np51APxtSYbXnUv+xTzsG7x7QrC3ztsMk82FiDBaihEBz3HU4VCQaIN7YOA5naZUNMZCWeQloqktkKiFJZAohASV3VsRojAe2N6Hlk7YyhkLv3pKCZXgHyCn6Wh2++mCdEszdaFn/vpoHwoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOvXxPjH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so88541585ad.2
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305290; x=1777910090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thNCQIJeEhwAIcXi2kXr3H7Q3kP3X1CPFM6RiVR/dT4=;
        b=fOvXxPjHKrM8c3Vpr634sd7SFCE/Q1bWfZdVFDUuSE2BwOCMvrwRt0y2SXDQtnIPPq
         Oyd9sxH6oyK2nTUspIADvAnWE7FSGBG5vOE8uMdyU9X3Gs1S6Sf8af/BT521vsjBRXCw
         QPVX+o429w2Xp7Zkca9GQwsrgxmjkRkrcx/b1uVd0HATWrY7KDvmiRTrCSqwvV4UQBSN
         +jVZZDQJcFVkVG0wcP55Ckk5TcnLZw7rx7tZ3r1w8fyHJVxre1FrsJYusTfSi2N7mjvu
         Jdf+dY/rdaYC03+xHi1AT+CXEmiq0UMmsejJRn+QYEFmvFlGMqO7fYxDOpIX2gqiLfkx
         b7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305290; x=1777910090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thNCQIJeEhwAIcXi2kXr3H7Q3kP3X1CPFM6RiVR/dT4=;
        b=EyySmhnHgHJF7DQqU+HgzjBtGkVWkencow8D7d5+5e/i2bB6LPDbsmYovOKk801UHQ
         IKYCFxVQQXXzIpyyWsg+dhQ2bVCOmUyt/XTtITdI81sa+95Z9g4RRdR63Gz4LoZZpXJk
         KWF1TLxSHZvCEbJxlMj+Sj9/GYOBJhR/6D+G3tLq6LEyGLkfHssUjo0xB2klXA3uuJXq
         zt2htmFzISsiPQLTx4xQR4w7Ft3FegN8aFovSvuY1MhPM48y/rE5qxvJxAs1UJbtO3MN
         RhLNUkPrWW5VE41rshXAnrgXXqkpGUBatwzfwUzAJWsw0Za3G7MclK/E6qbBBeJqslIM
         suDg==
X-Gm-Message-State: AOJu0YwRRV1kB+LlBk48GfteJrFCjW88kA1B4jyKK/wjwwc+78q7XUty
	/PhtWk6jc8sRMxBPU/H89lYO01Ax/TbXEP8Mil6WbDmxwhJve0avQiq/
X-Gm-Gg: AeBDiesyuArxld4Te0Fp9sMAUhD1UA0rQUD0Hk5HS9+5X9SufQCIQk10DjdCWhAuSAr
	DDQqnKSceZ3wfSGmau/cM5xCRvZTLW+idtCU3PaG4zT9J11xBewyFEzmVuVLEwHCtYkk9AoTm8G
	R9r1gqbLV4YEc/J1szTDbgMA0fonDjuLbZ+dfDuFgYnyXIew6zDNt7Z4hLP6v2u924Keg2d6UNT
	OabXiMjTE/IGe2VTbcypT96AgqoWI3ok2dpNzPh0ZJErbug2YgcPgm8LF4Myl94oVT+dDofPLMT
	Jtjp9ltVF17z0tINARpnV57ABvrEP8d3dv4OOtw9Fc3EtMW+734xmRuCSUj+IBOWbb7bzI25rfA
	jG6EJvxYsSmioj4AsuVpo1uWRo2Br0zZNxVu3m/Uw48zI0AxIf4LTcz3uhMxsGOCmcHTdJrG/bT
	qbe3q7PpcFNANljoDnLjTr825Bzz6VYCB+3V2sW0vL
X-Received: by 2002:a17:902:efc1:b0:2b4:5dff:30fd with SMTP id d9443c01a7336-2b5f9eb0501mr315369565ad.4.1777305290006;
        Mon, 27 Apr 2026 08:54:50 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa30047sm320483735ad.28.2026.04.27.08.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:49 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 6/7] staging: octeon: convert cvmx_pko_port_status_t from typedef to plain struct
Date: Mon, 27 Apr 2026 23:54:26 +0800
Message-ID: <20260427155427.668540-7-kunjinkao.jp@gmail.com>
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
X-Rspamd-Queue-Id: B5710476075
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
	TAGGED_FROM(0.00)[bounces-14342-lists,linux-mips=lfdr.de];
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
structs. Convert cvmx_pko_port_status_t to a plain 'struct
cvmx_pko_port_status' and update all users across the MIPS Octeon
architecture code and the staging driver.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/include/asm/octeon/cvmx-pko.h | 6 +++---
 drivers/staging/octeon/ethernet.c       | 2 +-
 drivers/staging/octeon/octeon-stubs.h   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index a742c1d61d8f..26cb26a7ff2b 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -114,11 +114,11 @@ enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
 };
 
-typedef struct {
+struct cvmx_pko_port_status {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
-} cvmx_pko_port_status_t;
+};
 
 /**
  * This structure defines the address to use on a packet enqueue
@@ -574,7 +574,7 @@ static inline int cvmx_pko_get_num_queues(int port)
  * @status:   Where to put the results.
  */
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status *status)
 {
 	union cvmx_pko_reg_read_idx pko_reg_read_idx;
 	union cvmx_pko_mem_count0 pko_mem_count0;
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 5f9c29071fab..448a4ec42d0b 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -202,7 +202,7 @@ EXPORT_SYMBOL(cvm_oct_free_work);
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
 	cvmx_pip_port_status_t rx_status;
-	cvmx_pko_port_status_t tx_status;
+	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 8496c60d647e..7bb72e152f08 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -411,11 +411,11 @@ typedef struct {
 	u16 inb_errors;
 } cvmx_pip_port_status_t;
 
-typedef struct {
+struct cvmx_pko_port_status {
 	u32 packets;
 	u64 octets;
 	u64 doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	u64 u64;
@@ -1264,7 +1264,7 @@ static inline void cvmx_pip_get_port_status(u64 port_num, u64 clear,
 { }
 
 static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status *status)
 { }
 
 static inline enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
-- 
2.43.0


