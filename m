Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C51D1B45B5
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 15:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgDVNAY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 09:00:24 -0400
Received: from mga04.intel.com ([192.55.52.120]:16985 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726168AbgDVNAY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Apr 2020 09:00:24 -0400
IronPort-SDR: DjKi2CAn2YVcnAu/OcskBQVJmxVs56d0Kno4P90hbd5/67nqgDGkD0rrPc3/jOe7+Iy9hU/Bq1
 OyVVfVYhDnqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 06:00:24 -0700
IronPort-SDR: mrNopApmj+qqPJpgHBUjtQ5hdlXCMTqnJaXk0fwhNJz1G8W6XcnHC2aNOmYA+aFaK/a2aHcbE/
 AkDfQv/XB4tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="457132719"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2020 06:00:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 025FD58F; Wed, 22 Apr 2020 16:00:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] firmware: tee_bnxt: Use UUID API for exporting the UUID
Date:   Wed, 22 Apr 2020 16:00:21 +0300
Message-Id: <20200422130021.38424-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
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
index ed10da5313e86..4cf0c2576037d 100644
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
2.26.1

