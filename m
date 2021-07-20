Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A05E3CF360
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jul 2021 06:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhGTDyr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jul 2021 23:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbhGTDyB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jul 2021 23:54:01 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF361C061574;
        Mon, 19 Jul 2021 21:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=oJRAxrYs7RTt5lB7rIWFTEQlzeyXDUjCRcvLy4VcFz8=; b=VwF80pOG0We5K68BTjf8UT0qm1
        OVXf7dYgS2OHZlKZ5EEyDErpf4zJy9CeqljknbuDR3peRB+97Iq9hoFJVZG/nzAZUljl5VzXcB2aL
        lPO17ZCqyqCh4QGdLzN8dBUqp2tUWROKTT9EDOfNkscycEXHOqlRBzjgbxI3AfpeX3yK+gFxfSo/q
        L3ynzUcFjs/PKHz59YiurQL3vksMBKgRhroSHFijNdmpjTckb7PJ6dhs3w7Wc1jVe/ar7j+89PlN7
        0+f+6Nwmr3dxeWr/y4n0oQXc8B4Goo4Jc+ME9m6g86fEyWuKFwqamEBgJEABZ2udE37v4fqNvQtAr
        dSrLGMvQ==;
Received: from [2601:1c0:6280:3f0::a22f] (helo=smtpauth.infradead.org)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m5hSm-001Mf5-EW; Tue, 20 Jul 2021 04:34:36 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Ganesan Ramalingam <ganesanr@broadcom.com>,
        John Crispin <blogic@openwrt.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH] mips: netlogic: fix kernel-doc complaints in fmn-config.c
Date:   Mon, 19 Jul 2021 21:34:32 -0700
Message-Id: <20210720043432.1684-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clean up kernel-doc warnings in netlogic/xlr/fmn-config.c by using
correct kernel-doc format. Fixes these warnings:

arch/mips/netlogic/xlr/fmn-config.c:106: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Configure bucket size and credits for a device. 'size' is the size of
arch/mips/netlogic/xlr/fmn-config.c:181: warning: expecting prototype for Setup the FMN details for each devices according to the device available(). Prototype was for xlr_board_info_setup() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Ganesan Ramalingam <ganesanr@broadcom.com>
Cc: John Crispin <blogic@openwrt.org>
Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/netlogic/xlr/fmn-config.c |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

--- linux-next-20210719.orig/arch/mips/netlogic/xlr/fmn-config.c
+++ linux-next-20210719/arch/mips/netlogic/xlr/fmn-config.c
@@ -103,18 +103,19 @@ static void check_credit_distribution(vo
 }
 
 /**
- * Configure bucket size and credits for a device. 'size' is the size of
- * the buckets for the device. This size is distributed among all the CPUs
- * so that all of them can send messages to the device.
- *
- * The device is also given 'cpu_credits' to send messages to the CPUs
- *
+ * setup_fmn_cc -  Configure bucket size and credits for a device.
  * @dev_info: FMN information structure for each devices
  * @start_stn_id: Starting station id of dev_info
  * @end_stn_id: End station id of dev_info
  * @num_buckets: Total number of buckets for den_info
  * @cpu_credits: Allowed credits to cpu for each devices pointing by dev_info
  * @size: Size of the each buckets in the device station
+ *
+ * 'size' is the size of the buckets for the device. This size is
+ * distributed among all the CPUs
+ * so that all of them can send messages to the device.
+ *
+ * The device is also given 'cpu_credits' to send messages to the CPUs
  */
 static void setup_fmn_cc(struct xlr_fmn_info *dev_info, int start_stn_id,
 		int end_stn_id, int num_buckets, int cpu_credits, int size)
@@ -174,6 +175,8 @@ static void setup_cpu_fmninfo(struct xlr
 }
 
 /**
+ * xlr_board_info_setup - Setup FMN details
+ *
  * Setup the FMN details for each devices according to the device available
  * in each variant of XLR/XLS processor
  */
