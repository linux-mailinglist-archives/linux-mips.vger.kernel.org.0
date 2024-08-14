Return-Path: <linux-mips+bounces-4894-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CAE9518E0
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 12:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE4581C20B3F
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 10:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD5E1684A6;
	Wed, 14 Aug 2024 10:34:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854573D552
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631673; cv=none; b=fCZypgMzuWxlvGvo8qKClg1sPHX3eoq4xO4AYJedXMmovtojun5WDmUgVLY6EonePCH3T6TW4Psuia6IyJVU8v/taaDJZCWsCGKSa4iFwOv84uDV4c2SO066Bo9Hg+avrNt/9bGOIBRNgbpJGfFmt6NgUvtwA8orESEESWqXE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631673; c=relaxed/simple;
	bh=noCSEt5iKpYhRhtjwNDbOVzuTww+Sdhl93PXjJcQVBQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qsmfSmuDTh0GMxh8XNHmyeJiHK4Y2Ir4H8+Ty3AAkT0rdkwWcwW1o9qbwbfoeQ+OWp6qPoTXeU7H7o/bHUow7Ktae0bXvqFZOhD2Mqx/B0dRSzCz5igbEwc60WqZXGCvQQSbrc4GeTOzQGtADMjzlqbbey+Igvd/CWdbxwRm6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WkPgG2ftXz1HG8X
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 18:31:22 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id B35091A0188
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 18:34:26 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 14 Aug 2024 18:34:26 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <tsbogend@alpha.franken.de>, <cuigaosheng1@huawei.com>
CC: <linux-mips@vger.kernel.org>
Subject: [PATCH -next] MIPS: Octeon: Remove unused codes of cvmx_fpa_shutdown_pool()
Date: Wed, 14 Aug 2024 18:34:25 +0800
Message-ID: <20240814103425.2051117-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The cvmx_fpa_shutdown_pool() has been removed since
commit a03822ea5df6 ("MIPS: OCTEON: Remove some unused files."),
the declaration and cvmx_ipd_free_ptr would not be used,so remove
them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/octeon/cvmx-fpa.h |  13 --
 arch/mips/include/asm/octeon/cvmx-ipd.h | 183 ------------------------
 2 files changed, 196 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-fpa.h b/arch/mips/include/asm/octeon/cvmx-fpa.h
index f6dfcca97f19..68736b3f6114 100644
--- a/arch/mips/include/asm/octeon/cvmx-fpa.h
+++ b/arch/mips/include/asm/octeon/cvmx-fpa.h
@@ -263,19 +263,6 @@ static inline void cvmx_fpa_free(void *ptr, uint64_t pool,
 	cvmx_write_io(newptr.u64, num_cache_lines);
 }
 
-/**
- * Shutdown a Memory pool and validate that it had all of
- * the buffers originally placed in it. This should only be
- * called by one processor after all hardware has finished
- * using the pool.
- *
- * @pool:   Pool to shutdown
- * Returns Zero on success
- *	   - Positive is count of missing buffers
- *	   - Negative is too many buffers or corrupted pointers
- */
-extern uint64_t cvmx_fpa_shutdown_pool(uint64_t pool);
-
 /**
  * Get the size of blocks controlled by the pool
  * This is resolved to a constant at compile time.
diff --git a/arch/mips/include/asm/octeon/cvmx-ipd.h b/arch/mips/include/asm/octeon/cvmx-ipd.h
index adab7b54c3b4..ac720042036e 100644
--- a/arch/mips/include/asm/octeon/cvmx-ipd.h
+++ b/arch/mips/include/asm/octeon/cvmx-ipd.h
@@ -153,187 +153,4 @@ static inline void cvmx_ipd_disable(void)
 	cvmx_write_csr(CVMX_IPD_CTL_STATUS, ipd_reg.u64);
 }
 
-/**
- * Supportive function for cvmx_fpa_shutdown_pool.
- */
-static inline void cvmx_ipd_free_ptr(void)
-{
-	/* Only CN38XXp{1,2} cannot read pointer out of the IPD */
-	if (!OCTEON_IS_MODEL(OCTEON_CN38XX_PASS1)
-	    && !OCTEON_IS_MODEL(OCTEON_CN38XX_PASS2)) {
-		int no_wptr = 0;
-		union cvmx_ipd_ptr_count ipd_ptr_count;
-		ipd_ptr_count.u64 = cvmx_read_csr(CVMX_IPD_PTR_COUNT);
-
-		/* Handle Work Queue Entry in cn56xx and cn52xx */
-		if (octeon_has_feature(OCTEON_FEATURE_NO_WPTR)) {
-			union cvmx_ipd_ctl_status ipd_ctl_status;
-			ipd_ctl_status.u64 = cvmx_read_csr(CVMX_IPD_CTL_STATUS);
-			if (ipd_ctl_status.s.no_wptr)
-				no_wptr = 1;
-		}
-
-		/* Free the prefetched WQE */
-		if (ipd_ptr_count.s.wqev_cnt) {
-			union cvmx_ipd_wqe_ptr_valid ipd_wqe_ptr_valid;
-			ipd_wqe_ptr_valid.u64 =
-			    cvmx_read_csr(CVMX_IPD_WQE_PTR_VALID);
-			if (no_wptr)
-				cvmx_fpa_free(cvmx_phys_to_ptr
-					      ((uint64_t) ipd_wqe_ptr_valid.s.
-					       ptr << 7), CVMX_FPA_PACKET_POOL,
-					      0);
-			else
-				cvmx_fpa_free(cvmx_phys_to_ptr
-					      ((uint64_t) ipd_wqe_ptr_valid.s.
-					       ptr << 7), CVMX_FPA_WQE_POOL, 0);
-		}
-
-		/* Free all WQE in the fifo */
-		if (ipd_ptr_count.s.wqe_pcnt) {
-			int i;
-			union cvmx_ipd_pwp_ptr_fifo_ctl ipd_pwp_ptr_fifo_ctl;
-			ipd_pwp_ptr_fifo_ctl.u64 =
-			    cvmx_read_csr(CVMX_IPD_PWP_PTR_FIFO_CTL);
-			for (i = 0; i < ipd_ptr_count.s.wqe_pcnt; i++) {
-				ipd_pwp_ptr_fifo_ctl.s.cena = 0;
-				ipd_pwp_ptr_fifo_ctl.s.raddr =
-				    ipd_pwp_ptr_fifo_ctl.s.max_cnts +
-				    (ipd_pwp_ptr_fifo_ctl.s.wraddr +
-				     i) % ipd_pwp_ptr_fifo_ctl.s.max_cnts;
-				cvmx_write_csr(CVMX_IPD_PWP_PTR_FIFO_CTL,
-					       ipd_pwp_ptr_fifo_ctl.u64);
-				ipd_pwp_ptr_fifo_ctl.u64 =
-				    cvmx_read_csr(CVMX_IPD_PWP_PTR_FIFO_CTL);
-				if (no_wptr)
-					cvmx_fpa_free(cvmx_phys_to_ptr
-						      ((uint64_t)
-						       ipd_pwp_ptr_fifo_ctl.s.
-						       ptr << 7),
-						      CVMX_FPA_PACKET_POOL, 0);
-				else
-					cvmx_fpa_free(cvmx_phys_to_ptr
-						      ((uint64_t)
-						       ipd_pwp_ptr_fifo_ctl.s.
-						       ptr << 7),
-						      CVMX_FPA_WQE_POOL, 0);
-			}
-			ipd_pwp_ptr_fifo_ctl.s.cena = 1;
-			cvmx_write_csr(CVMX_IPD_PWP_PTR_FIFO_CTL,
-				       ipd_pwp_ptr_fifo_ctl.u64);
-		}
-
-		/* Free the prefetched packet */
-		if (ipd_ptr_count.s.pktv_cnt) {
-			union cvmx_ipd_pkt_ptr_valid ipd_pkt_ptr_valid;
-			ipd_pkt_ptr_valid.u64 =
-			    cvmx_read_csr(CVMX_IPD_PKT_PTR_VALID);
-			cvmx_fpa_free(cvmx_phys_to_ptr
-				      (ipd_pkt_ptr_valid.s.ptr << 7),
-				      CVMX_FPA_PACKET_POOL, 0);
-		}
-
-		/* Free the per port prefetched packets */
-		if (1) {
-			int i;
-			union cvmx_ipd_prc_port_ptr_fifo_ctl
-			    ipd_prc_port_ptr_fifo_ctl;
-			ipd_prc_port_ptr_fifo_ctl.u64 =
-			    cvmx_read_csr(CVMX_IPD_PRC_PORT_PTR_FIFO_CTL);
-
-			for (i = 0; i < ipd_prc_port_ptr_fifo_ctl.s.max_pkt;
-			     i++) {
-				ipd_prc_port_ptr_fifo_ctl.s.cena = 0;
-				ipd_prc_port_ptr_fifo_ctl.s.raddr =
-				    i % ipd_prc_port_ptr_fifo_ctl.s.max_pkt;
-				cvmx_write_csr(CVMX_IPD_PRC_PORT_PTR_FIFO_CTL,
-					       ipd_prc_port_ptr_fifo_ctl.u64);
-				ipd_prc_port_ptr_fifo_ctl.u64 =
-				    cvmx_read_csr
-				    (CVMX_IPD_PRC_PORT_PTR_FIFO_CTL);
-				cvmx_fpa_free(cvmx_phys_to_ptr
-					      ((uint64_t)
-					       ipd_prc_port_ptr_fifo_ctl.s.
-					       ptr << 7), CVMX_FPA_PACKET_POOL,
-					      0);
-			}
-			ipd_prc_port_ptr_fifo_ctl.s.cena = 1;
-			cvmx_write_csr(CVMX_IPD_PRC_PORT_PTR_FIFO_CTL,
-				       ipd_prc_port_ptr_fifo_ctl.u64);
-		}
-
-		/* Free all packets in the holding fifo */
-		if (ipd_ptr_count.s.pfif_cnt) {
-			int i;
-			union cvmx_ipd_prc_hold_ptr_fifo_ctl
-			    ipd_prc_hold_ptr_fifo_ctl;
-
-			ipd_prc_hold_ptr_fifo_ctl.u64 =
-			    cvmx_read_csr(CVMX_IPD_PRC_HOLD_PTR_FIFO_CTL);
-
-			for (i = 0; i < ipd_ptr_count.s.pfif_cnt; i++) {
-				ipd_prc_hold_ptr_fifo_ctl.s.cena = 0;
-				ipd_prc_hold_ptr_fifo_ctl.s.raddr =
-				    (ipd_prc_hold_ptr_fifo_ctl.s.praddr +
-				     i) % ipd_prc_hold_ptr_fifo_ctl.s.max_pkt;
-				cvmx_write_csr(CVMX_IPD_PRC_HOLD_PTR_FIFO_CTL,
-					       ipd_prc_hold_ptr_fifo_ctl.u64);
-				ipd_prc_hold_ptr_fifo_ctl.u64 =
-				    cvmx_read_csr
-				    (CVMX_IPD_PRC_HOLD_PTR_FIFO_CTL);
-				cvmx_fpa_free(cvmx_phys_to_ptr
-					      ((uint64_t)
-					       ipd_prc_hold_ptr_fifo_ctl.s.
-					       ptr << 7), CVMX_FPA_PACKET_POOL,
-					      0);
-			}
-			ipd_prc_hold_ptr_fifo_ctl.s.cena = 1;
-			cvmx_write_csr(CVMX_IPD_PRC_HOLD_PTR_FIFO_CTL,
-				       ipd_prc_hold_ptr_fifo_ctl.u64);
-		}
-
-		/* Free all packets in the fifo */
-		if (ipd_ptr_count.s.pkt_pcnt) {
-			int i;
-			union cvmx_ipd_pwp_ptr_fifo_ctl ipd_pwp_ptr_fifo_ctl;
-			ipd_pwp_ptr_fifo_ctl.u64 =
-			    cvmx_read_csr(CVMX_IPD_PWP_PTR_FIFO_CTL);
-
-			for (i = 0; i < ipd_ptr_count.s.pkt_pcnt; i++) {
-				ipd_pwp_ptr_fifo_ctl.s.cena = 0;
-				ipd_pwp_ptr_fifo_ctl.s.raddr =
-				    (ipd_pwp_ptr_fifo_ctl.s.praddr +
-				     i) % ipd_pwp_ptr_fifo_ctl.s.max_cnts;
-				cvmx_write_csr(CVMX_IPD_PWP_PTR_FIFO_CTL,
-					       ipd_pwp_ptr_fifo_ctl.u64);
-				ipd_pwp_ptr_fifo_ctl.u64 =
-				    cvmx_read_csr(CVMX_IPD_PWP_PTR_FIFO_CTL);
-				cvmx_fpa_free(cvmx_phys_to_ptr
-					      ((uint64_t) ipd_pwp_ptr_fifo_ctl.
-					       s.ptr << 7),
-					      CVMX_FPA_PACKET_POOL, 0);
-			}
-			ipd_pwp_ptr_fifo_ctl.s.cena = 1;
-			cvmx_write_csr(CVMX_IPD_PWP_PTR_FIFO_CTL,
-				       ipd_pwp_ptr_fifo_ctl.u64);
-		}
-
-		/* Reset the IPD to get all buffers out of it */
-		{
-			union cvmx_ipd_ctl_status ipd_ctl_status;
-			ipd_ctl_status.u64 = cvmx_read_csr(CVMX_IPD_CTL_STATUS);
-			ipd_ctl_status.s.reset = 1;
-			cvmx_write_csr(CVMX_IPD_CTL_STATUS, ipd_ctl_status.u64);
-		}
-
-		/* Reset the PIP */
-		{
-			union cvmx_pip_sft_rst pip_sft_rst;
-			pip_sft_rst.u64 = cvmx_read_csr(CVMX_PIP_SFT_RST);
-			pip_sft_rst.s.rst = 1;
-			cvmx_write_csr(CVMX_PIP_SFT_RST, pip_sft_rst.u64);
-		}
-	}
-}
-
 #endif /*  __CVMX_IPD_H__ */
-- 
2.25.1


