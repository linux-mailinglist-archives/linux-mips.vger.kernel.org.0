Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86EC434F1C
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 17:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhJTPfO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 11:35:14 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:43602 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhJTPfN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 11:35:13 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 2B81921A9E;
        Wed, 20 Oct 2021 15:32:58 +0000 (UTC)
Received: from adalid.arch.suse.de (adalid.arch.suse.de [10.161.8.13])
        by relay2.suse.de (Postfix) with ESMTP id 23925A3B83;
        Wed, 20 Oct 2021 15:32:58 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: octeon: Remove unused functions
Date:   Wed, 20 Oct 2021 17:32:51 +0200
Message-Id: <20211020153252.131281-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

cvmx_helper_initialize_packet_io_local() is unused and after removing
it cvmx_pko_initialize_local() is also unused.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/cavium-octeon/executive/cvmx-helper.c | 10 ----------
 arch/mips/cavium-octeon/executive/cvmx-pko.c    | 14 --------------
 arch/mips/include/asm/octeon/cvmx-helper.h      |  7 -------
 arch/mips/include/asm/octeon/cvmx-pko.h         |  1 -
 4 files changed, 32 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 6044ff471002..b22f664e2d29 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -1055,16 +1055,6 @@ int cvmx_helper_initialize_packet_io_global(void)
 }
 EXPORT_SYMBOL_GPL(cvmx_helper_initialize_packet_io_global);
 
-/**
- * Does core local initialization for packet io
- *
- * Returns Zero on success, non-zero on failure
- */
-int cvmx_helper_initialize_packet_io_local(void)
-{
-	return cvmx_pko_initialize_local();
-}
-
 /**
  * Return the link state of an IPD/PKO port as returned by
  * auto negotiation. The result of this function may not match
diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/cavium-octeon/executive/cvmx-pko.c
index 7c4879e74318..ae8806e7bce2 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-pko.c
@@ -229,20 +229,6 @@ void cvmx_pko_initialize_global(void)
 	}
 }
 
-/*
- * This function does per-core initialization required by the PKO routines.
- * This must be called on all cores that will do packet output, and must
- * be called after the FPA has been initialized and filled with pages.
- *
- * Returns 0 on success
- *	   !0 on failure
- */
-int cvmx_pko_initialize_local(void)
-{
-	/* Nothing to do */
-	return 0;
-}
-
 /*
  * Enables the packet output hardware. It must already be
  * configured.
diff --git a/arch/mips/include/asm/octeon/cvmx-helper.h b/arch/mips/include/asm/octeon/cvmx-helper.h
index c6c99e28eefb..0cddce35291b 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper.h
@@ -93,13 +93,6 @@ extern int cvmx_helper_ipd_and_packet_input_enable(void);
  */
 extern int cvmx_helper_initialize_packet_io_global(void);
 
-/**
- * Does core local initialization for packet io
- *
- * Returns Zero on success, non-zero on failure
- */
-extern int cvmx_helper_initialize_packet_io_local(void);
-
 /**
  * Returns the number of ports on the given interface.
  * The interface must be initialized before the port count
diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index 03fb64b13fba..5fec8476e421 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -277,7 +277,6 @@ typedef struct {
  * output system.
  */
 extern void cvmx_pko_initialize_global(void);
-extern int cvmx_pko_initialize_local(void);
 
 /**
  * Enables the packet output hardware. It must already be
-- 
2.29.2

