Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C16B35D7E4
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 08:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244490AbhDMGWT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 02:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244468AbhDMGWS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 02:22:18 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFA1C061574;
        Mon, 12 Apr 2021 23:21:59 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id u11so4272606pjr.0;
        Mon, 12 Apr 2021 23:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jp6UOGB4FzE1dJIm8rAul1GaY/+/4jd2+2/ZBgCaBec=;
        b=LJMTj7+T5Vh4zQi5UgM/ctRbpudY9RlRv+MnBAy4OCJwl+ANpzns9iSvBkmBMQe0d4
         u1zJHWF+aZNJfZIzhxMpJToT3kPqqwSEZqLVD9+iCQN6o9iuyhCCYr5k+vT/95OmJBpF
         NtRZck9uZPUJ/JsPbZ+W4apyWseTdN3wy+oaDMBTK5+5wi+RxA/+Q/o1bWlbhCUl4mMi
         M0Tm3zdVV4CYZKb6fz6dbhdItzD8q64SIRkejWe++F7SSIOm7wVK0FSPR+l88voxha0/
         mBRsbr3Grob4ZZw4g40Cql8k0XtllZoYlKhGPdl90aoL96lVh7il3GtZPvBjgcGrpxlZ
         c8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jp6UOGB4FzE1dJIm8rAul1GaY/+/4jd2+2/ZBgCaBec=;
        b=ts7WpRSpn3josEyAn8HpCIPLw4+VfgzZcSOx9WKdt+jWbgMoA1Lm+FM3owTh3vjmoD
         PVsFftG11SrbNkYpGZosIH5o1VVCkxhs8MMzR4Lf+CESMpnpQxURfaOlVDs/nA9RImFT
         rSm6W8r2TNwd0hzlykJmBj1vK/PzdXL3lzu5oURANQbqFrfBmX9Pn4Qiro8GcXxDkjY9
         6wDZVn2UKZAh94XmKt3c4a5sHNcvBHa2immZxPfYmojgiBewFX6Gw9s/oDKlNc0XTgTX
         2nekE1AkS7yGq5csw64/e+nlcmJQc2vmXXROYyo0+yXybZV3HsjGLQNrVP8RiBFvePUy
         XS6g==
X-Gm-Message-State: AOAM531O0WR/p9B/DZ6c08ztV1gt3VlO/YGi6n8Si2CUGpQL2eSepIXE
        B72RO8BdUO6V/aeUlfCwVh5W37rafoQC1g==
X-Google-Smtp-Source: ABdhPJxQ8I+dTzDm7X024wBmqemFWEIYUabsJgkCrAlsqJ7kHZe2DoaKiWmScp/WxSfoqTsngDm0Kw==
X-Received: by 2002:a17:90a:fa0c:: with SMTP id cm12mr3219972pjb.54.1618294919462;
        Mon, 12 Apr 2021 23:21:59 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id e190sm11453326pfe.3.2021.04.12.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:21:58 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH 0/8] MIPS: Fixes for PCI legacy drivers (rt2880, rt3883)
Date:   Mon, 12 Apr 2021 23:21:38 -0700
Message-Id: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

One major fix for rt2880-pci in the first patch - fixes breakage that
existed since v4.14.

Other more minor fixes, cleanups, and improvements that either free up
memory, make dmesg messages clearer, or remove redundant dmesg output.

Ilya Lipnitskiy (8):
  MIPS: pci-rt2880: fix slot 0 configuration
  MIPS: pci-rt2880: remove unneeded locks
  MIPS: pci-rt3883: trivial: remove unused variable
  MIPS: pci-rt3883: more accurate DT error messages
  MIPS: pci-legacy: stop using of_pci_range_to_resource
  MIPS: pci-legacy: remove redundant info messages
  MIPS: pci-legacy: remove busn_resource field
  MIPS: pci-legacy: use generic pci_enable_resources

 arch/mips/include/asm/pci.h |  1 -
 arch/mips/pci/pci-legacy.c  | 57 ++++++---------------------------
 arch/mips/pci/pci-rt2880.c  | 63 +++++++++++++++++++------------------
 arch/mips/pci/pci-rt3883.c  | 10 ++----
 4 files changed, 44 insertions(+), 87 deletions(-)

-- 
2.31.1

