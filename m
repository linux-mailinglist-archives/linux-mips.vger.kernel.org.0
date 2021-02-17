Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A27A31D6FF
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 10:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhBQJ2X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 04:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbhBQJ2S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 04:28:18 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16D4C061574;
        Wed, 17 Feb 2021 01:27:37 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id f8so5515374plg.5;
        Wed, 17 Feb 2021 01:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VdWPwrAfDCtXEesqZ9idEiSC/QAmDiHlDH/oyb/bNfs=;
        b=RrScKORaVIZjQYmG81vxtn/OLVLH6OQ1UqLDfJP/8Hec1m41rmcO+X5kWOVnykVuR3
         eFMwnItIXolcHMwo2XCakLdjwENBD57k9G9dZGFk7oz57Fcva8CKxyvTMtYCvA0RKEVW
         Afe31vvdKmCuv7JoSz8Y+AYh0vS5He1lj9RBPZeFbkdV5TH/hkxWUmszw/bqjESHJhMH
         Oj3zANkxUYIMJzGQVb5ebQ7RLi8O+jgnKX2MEFypcmbEDK/vsj3NVPJ40Ex0YDP4G5Z/
         qf7m/jY85xgx8Ws4kDhuaKKIMcilECk5VDoRAWu2YHfGSIlNJ8i7UK0DBk7VTASUSMFH
         oHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VdWPwrAfDCtXEesqZ9idEiSC/QAmDiHlDH/oyb/bNfs=;
        b=ahHQOCpXOjW9R9MbT1vezLBL0QuyGkoUlGSMcnTvvGktbU9NModlKGdPf4aEGX1ahY
         yoqzdIyaGlxkk42qToY/HdnfagMuVHyyFyWq9KO/9BoWNxSqhmuq+j4YZbk3GY1zrQ9w
         uKS/VlRgnup1JNzQCEfna6tYjlm+Uka9AZ9Sul+YFJdmOtFcARABDaif4UsPmtsHCHg+
         MY4Dy5sTmYWhsWAbZk20mvAZ3gVSc9uI4lzUi29SMYfchSv00FQSZtHObLseBJkLY1vE
         od88BtxsawS2UYNVi1xGKILGKtYPdY4X0NyYkaa74l9Hlas0CmXkkwJKiGij77huxYrY
         nnTA==
X-Gm-Message-State: AOAM5300vnmaikImzg3PKWFMblN3cEnKi9/s9NZrQv+FeL+b5QuafeE6
        baip8lEDy/ervCOUNVYOeG4=
X-Google-Smtp-Source: ABdhPJxX/kUTb7rTB9K7X9aM2sRKRDTBhjTLMwoHG2qj2lUTuWfJgTypb4eNXYADo9uXT3Wn6Ijjfg==
X-Received: by 2002:a17:90a:ab95:: with SMTP id n21mr8462189pjq.92.1613554057497;
        Wed, 17 Feb 2021 01:27:37 -0800 (PST)
Received: from localhost.localdomain ([49.207.204.196])
        by smtp.gmail.com with ESMTPSA id n11sm1571412pjk.38.2021.02.17.01.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 01:27:37 -0800 (PST)
From:   Allen Pais <allen.lkml@gmail.com>
To:     jens.wiklander@linaro.org, zajec5@gmail.com
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        Allen Pais <apais@linux.microsoft.com>
Subject: [PATCH 0/2] optee: fix OOM seen due to tee_shm_free()
Date:   Wed, 17 Feb 2021 14:57:12 +0530
Message-Id: <20210217092714.121297-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Allen Pais <apais@linux.microsoft.com>

The following out of memory errors are seen on kexec reboot
from the optee core.
    
[    0.368428] tee_bnxt_fw optee-clnt0: tee_shm_alloc failed
[    0.368461] tee_bnxt_fw: probe of optee-clnt0 failed with error -22
    
tee_shm_release() is not invoked on dma shm buffer.
    
Implement .shutdown() in optee core as well as bnxt firmware driver
to handle the release of the buffers correctly.
    
More info:
https://github.com/OP-TEE/optee_os/issues/3637

Allen Pais (2):
  optee: fix tee out of memory failure seen during kexec reboot
  firmware: tee_bnxt: implement shutdown method to handle kexec reboots

 drivers/firmware/broadcom/tee_bnxt_fw.c |  9 ++++
 drivers/tee/optee/core.c                | 69 ++++++++++++++++++-------
 2 files changed, 58 insertions(+), 20 deletions(-)

-- 
2.25.1

