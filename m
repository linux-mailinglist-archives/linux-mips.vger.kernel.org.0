Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05F3E463B47
	for <lists+linux-mips@lfdr.de>; Tue, 30 Nov 2021 17:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244006AbhK3QNv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Nov 2021 11:13:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244036AbhK3QMP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Nov 2021 11:12:15 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B34C06175D
        for <linux-mips@vger.kernel.org>; Tue, 30 Nov 2021 08:08:34 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id e3so88958197edu.4
        for <linux-mips@vger.kernel.org>; Tue, 30 Nov 2021 08:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NV4WFdl9vBrhP2G53aXnoMRhF2dXodBjxt5U+Ip4rB8=;
        b=3xXPyB7Aiqx8xLJUoSqpNUON61nAzQudWtkcNRdkzXXAkALyBAGFebMzRqkXDIcjZV
         uXv/m6Ky/8SGSgypXscEVH2EvLeOazslUCWDoJcUcjW7L4RrV5k8ItPGUgHwRbHSyi53
         09vLub7QE+lfu8d83rp77Jh+P+sY7baLryo+WxDOtgBVgb6QW7jJYCvfrY2HW4zLt6X2
         lsvxX6G5JMkWwmDrXVSa5+Hcs0szuWiTf1llLI6z9sKrUt/26j3IViKxI+ltDaCaMCsO
         fGa37Ng7yD34YgBj3faMz1nQ4hh5uvmBWNy7DEWsXmq2mw4X2ag40bsPBhmEsZEBXCZy
         X8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NV4WFdl9vBrhP2G53aXnoMRhF2dXodBjxt5U+Ip4rB8=;
        b=p2Ymt87/HZ8R3cgkEOC02guchhgwttId5WSKZnpTI5+hnxm6DsJV6emGNRDdzDwo47
         prkG5GmBkNQ7nG7wOYj7pliu40BsxBGLC03zmP6/HlDt6kRTCdgO0KAhTsgtyADN8PTV
         GpqoTZRsDwCT5K8rM/riQQcDg5JkI5BWvr+1jrhKfeBmLEX1uWkClAlpNM7ykkseugAi
         QUNbHMCgOfZCQOWpM0Fhppx0A+mOZqkJASD/GowJgw5MAr28gp8Nn9ifkuXqGgTjEmrr
         bTffW2KNxmEChi69zsJMdTMfGP4SlEO0ctxo+24bmBgdbXIrsCUrJBQyIX5NW5MMsqZK
         2z4g==
X-Gm-Message-State: AOAM533rO/+v8N6HZH1VTpEjRnk409LqTe53A/LVMEwvrE8Xq4nfpGfS
        wYwevr2susWkjKP4Dx0r9UCFig==
X-Google-Smtp-Source: ABdhPJxwwpemHUMHlxQMBA2L2tu2lgif0I249zRDyuDD08yGDvZYidCZDnnksXYGSN6B9KPfkl4fEQ==
X-Received: by 2002:aa7:db8f:: with SMTP id u15mr84418812edt.47.1638288513259;
        Tue, 30 Nov 2021 08:08:33 -0800 (PST)
Received: from anpc2.lan ([62.119.107.74])
        by smtp.gmail.com with ESMTPSA id sa3sm9301336ejc.113.2021.11.30.08.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 08:08:32 -0800 (PST)
From:   Johan Almbladh <johan.almbladh@anyfinetworks.com>
To:     ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        paulburton@kernel.org
Cc:     kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
        john.fastabend@gmail.com, kpsingh@kernel.org,
        tsbogend@alpha.franken.de, bpf@vger.kernel.org,
        linux-mips@vger.kernel.org, netdev@vger.kernel.org,
        Johan Almbladh <johan.almbladh@anyfinetworks.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH bpf] mips, bpf: Fix reference to non-existing Kconfig symbol
Date:   Tue, 30 Nov 2021 17:08:24 +0100
Message-Id: <20211130160824.3781635-1-johan.almbladh@anyfinetworks.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Kconfig symbol for R10000 ll/sc errata workaround in the MIPS JIT was
misspelled, causing the workaround to not take effect when enabled.

Fixes: 72570224bb8f ("mips, bpf: Add JIT workarounds for CPU errata")
Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
---
 arch/mips/net/bpf_jit_comp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/net/bpf_jit_comp.h b/arch/mips/net/bpf_jit_comp.h
index 6f3a7b07294b..a37fe20818eb 100644
--- a/arch/mips/net/bpf_jit_comp.h
+++ b/arch/mips/net/bpf_jit_comp.h
@@ -98,7 +98,7 @@ do {								\
 #define emit(...) __emit(__VA_ARGS__)
 
 /* Workaround for R10000 ll/sc errata */
-#ifdef CONFIG_WAR_R10000
+#ifdef CONFIG_WAR_R10000_LLSC
 #define LLSC_beqz	beqzl
 #else
 #define LLSC_beqz	beqz
-- 
2.30.2

