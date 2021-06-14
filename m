Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF173A720F
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 00:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbhFNWfu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 18:35:50 -0400
Received: from linux.microsoft.com ([13.77.154.182]:56216 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhFNWfs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Jun 2021 18:35:48 -0400
Received: from sequoia.work.tihix.com (162-237-133-238.lightspeed.rcsntx.sbcglobal.net [162.237.133.238])
        by linux.microsoft.com (Postfix) with ESMTPSA id B5AD820B83C2;
        Mon, 14 Jun 2021 15:33:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B5AD820B83C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1623710024;
        bh=+7MH9Xtj9mskeZwii9V+pPHBx5m8KRDfBlEtbXI2NfY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LU+dtEmdhSdE7Zg7MHVscA5+NoQe8V4BUZD/Y9iXeyJpeVVCTX0gALrM8dhBlFdU/
         f5eOhviyg/TO9xtWvFXupJN0jJqC04QKjBaswY/MAUxmAJIVsSizS+dlBhYaheDu0p
         +EsIr4SMjXeH+kPwWCR3xEImOG7ElFe1lszu9PNE=
From:   Tyler Hicks <tyhicks@linux.microsoft.com>
To:     Jens Wiklander <jens.wiklander@linaro.org>,
        Allen Pais <apais@linux.microsoft.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     Thirupathaiah Annapureddy <thiruan@microsoft.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        op-tee@lists.trustedfirmware.org, linux-integrity@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/8] firmware: tee_bnxt: Release TEE shm, session, and context during kexec
Date:   Mon, 14 Jun 2021 17:33:17 -0500
Message-Id: <20210614223317.999867-9-tyhicks@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614223317.999867-1-tyhicks@linux.microsoft.com>
References: <20210614223317.999867-1-tyhicks@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Allen Pais <apais@linux.microsoft.com>

Implement a .shutdown hook that will be called during a kexec operation
so that the TEE shared memory, session, and context that were set up
during .probe can be properly freed/closed.

Additionally, don't use dma-buf backed shared memory for the
fw_shm_pool. dma-buf backed shared memory cannot be reliably freed and
unregistered during a kexec operation even when tee_shm_free() is called
on the shm from a .shutdown hook. The problem occurs because
dma_buf_put() calls fput() which then uses task_work_add(), with the
TWA_RESUME parameter, to queue tee_shm_release() to be called before the
current task returns to user mode. However, the current task never
returns to user mode before the kexec completes so the memory is never
freed nor unregistered.

Use tee_shm_alloc_kernel_buf() to avoid dma-buf backed shared memory
allocation so that tee_shm_free() can directly call tee_shm_release().
This will ensure that the shm can be freed and unregistered during a
kexec operation.

Fixes: 246880958ac9 ("firmware: broadcom: add OP-TEE based BNXT f/w manager")
Cc: stable@vger.kernel.org
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
Co-developed-by: Tyler Hicks <tyhicks@linux.microsoft.com>
Signed-off-by: Tyler Hicks <tyhicks@linux.microsoft.com>
---
 drivers/firmware/broadcom/tee_bnxt_fw.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
index ed10da5313e8..a5bf4c3f6dc7 100644
--- a/drivers/firmware/broadcom/tee_bnxt_fw.c
+++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
@@ -212,10 +212,9 @@ static int tee_bnxt_fw_probe(struct device *dev)
 
 	pvt_data.dev = dev;
 
-	fw_shm_pool = tee_shm_alloc(pvt_data.ctx, MAX_SHM_MEM_SZ,
-				    TEE_SHM_MAPPED | TEE_SHM_DMA_BUF);
+	fw_shm_pool = tee_shm_alloc_kernel_buf(pvt_data.ctx, MAX_SHM_MEM_SZ);
 	if (IS_ERR(fw_shm_pool)) {
-		dev_err(pvt_data.dev, "tee_shm_alloc failed\n");
+		dev_err(pvt_data.dev, "tee_shm_alloc_kernel_buf failed\n");
 		err = PTR_ERR(fw_shm_pool);
 		goto out_sess;
 	}
@@ -242,6 +241,14 @@ static int tee_bnxt_fw_remove(struct device *dev)
 	return 0;
 }
 
+static void tee_bnxt_fw_shutdown(struct device *dev)
+{
+	tee_shm_free(pvt_data.fw_shm_pool);
+	tee_client_close_session(pvt_data.ctx, pvt_data.session_id);
+	tee_client_close_context(pvt_data.ctx);
+	pvt_data.ctx = NULL;
+}
+
 static const struct tee_client_device_id tee_bnxt_fw_id_table[] = {
 	{UUID_INIT(0x6272636D, 0x2019, 0x0716,
 		    0x42, 0x43, 0x4D, 0x5F, 0x53, 0x43, 0x48, 0x49)},
@@ -257,6 +264,7 @@ static struct tee_client_driver tee_bnxt_fw_driver = {
 		.bus		= &tee_bus_type,
 		.probe		= tee_bnxt_fw_probe,
 		.remove		= tee_bnxt_fw_remove,
+		.shutdown	= tee_bnxt_fw_shutdown,
 	},
 };
 
-- 
2.25.1

