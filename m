Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0782FF56F
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 21:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbhAUSq6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 13:46:58 -0500
Received: from mga02.intel.com ([134.134.136.20]:10045 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726743AbhAUSjo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Jan 2021 13:39:44 -0500
IronPort-SDR: AIxqz95EN2U5kOkkS/vMfnsXWExb9oZTutgPBRuuXQoDJRNMH2YOXDrKC9mYk6eLWJUvAqAM5n
 Ycp4IxqHLKGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166416984"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166416984"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 10:37:45 -0800
IronPort-SDR: jwE8lm9Rcl721oYDbogZJaYYSo+wte/9O4qqO7wVYjuxFym00Bqq1vkGouRJSYD0kCU2qSMDrV
 AQcPx7y5NIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="356608436"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jan 2021 10:37:43 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4008212A; Thu, 21 Jan 2021 20:37:41 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, Vikas Gupta <vikas.gupta@broadcom.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        tee-dev@lists.linaro.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v1] firmware: tee_bnxt: Use UUID API for exporting the UUID
Date:   Thu, 21 Jan 2021 20:37:41 +0200
Message-Id: <20210121183741.45333-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is export_uuid() function which exports uuid_t to the u8 array.
Use it instead of open coding variant.

This allows to hide the uuid_t internals.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/firmware/broadcom/tee_bnxt_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
index ed10da5313e8..4cf0c2576037 100644
--- a/drivers/firmware/broadcom/tee_bnxt_fw.c
+++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
@@ -197,7 +197,7 @@ static int tee_bnxt_fw_probe(struct device *dev)
 		return -ENODEV;
 
 	/* Open session with Bnxt load Trusted App */
-	memcpy(sess_arg.uuid, bnxt_device->id.uuid.b, TEE_IOCTL_UUID_LEN);
+	export_uuid(sess_arg.uuid, &bnxt_device->id.uuid);
 	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
 	sess_arg.num_params = 0;
 
-- 
2.29.2

