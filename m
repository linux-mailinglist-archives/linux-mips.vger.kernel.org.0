Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDE0353623
	for <lists+linux-mips@lfdr.de>; Sun,  4 Apr 2021 04:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236753AbhDDCLg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Apr 2021 22:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236655AbhDDCLf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Apr 2021 22:11:35 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A684DC061756;
        Sat,  3 Apr 2021 19:11:31 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x26so6043202pfn.0;
        Sat, 03 Apr 2021 19:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=58jA9WvbLI4Ls9TTi7H9XgGpKa34L3JODwl6IUDr/eA=;
        b=ZuBSFDGlK1vJIxQNNaMA/wi45QZTuYpF3QGYhgRD9ES9MNTADISQdKIyMouTmTeFj5
         TMzEgMwTSIHUIJt2IGno6E+PTuYjcp3sAp9mwM4O+srGv0pv+tKaqHs9Fl+5GF92Bsxo
         HBQSzn1so1NHiubo4EPagf6FbHsWgPShr3B+iKOZpb31xmfA97419NnCtxlaSBiSpJjZ
         Vg5D71ADFFQPjM3RL6Q/Yc/jAxSQdJ236uo5lNPnYATyso+mHest2fUdrJt9rZqgRj4h
         OEsfN2VTFf6WoIsp5prL1Ik5tnK9C7PeIQcXG3Vt0al8Up6QgCrB1+1g9G77n8NMiay0
         MvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=58jA9WvbLI4Ls9TTi7H9XgGpKa34L3JODwl6IUDr/eA=;
        b=l5/YOeonrdksngkBY32P9GUSvzOkm6S9bU4wrhWQwoYyR+NXvfgbxcimM49+GPPh1V
         YBUsowK3NbVPHEuHkC0XDns3PbaidtQ3TpvmJC4/LZXkFLTFbiR8HKeywbCJSk2pUOVo
         r3SY0A/cv9ZIjKqtt7WxAEOZDTktXYo7gNxHO64QipVxo2TN+HC1hBts2lCNQ5ch3mNW
         AJoAAS9bnCbtOb8ympVZLhBC0njUDylLCSK3/OLV2ie0TOfdE/BUIcjzX2xJlKvLrPoz
         J3lC/d6N+QB69QsCGnavQIIYjD7WKb3JUh40r8NXt08OviORhD3RlG8VtcH69fCjWCc0
         8wzw==
X-Gm-Message-State: AOAM533l9v2k3t6r7HQLtUik5L8knvw62PbQ7MWO4QekMh2NUmZyPKUd
        AH1lEeetVeFvPfUxWw5RB9nNUrrU2Ju3XXPU
X-Google-Smtp-Source: ABdhPJxIOa6DebHP7JWPUkuH9RKugJayvsbTtLXqYUXQ+5S//BAZKeVuK6l8K/VdVbPcdpnUhI1j/Q==
X-Received: by 2002:a63:1820:: with SMTP id y32mr17691794pgl.157.1617502290942;
        Sat, 03 Apr 2021 19:11:30 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id g12sm11765260pjd.57.2021.04.03.19.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 19:11:30 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH] MIPS: ralink: rt288x: select MIPS_AUTO_PFN_OFFSET
Date:   Sat,  3 Apr 2021 19:11:26 -0700
Message-Id: <20210404021126.1399920-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210307194030.8007-1-ilya.lipnitskiy@gmail.com>
References: <20210307194030.8007-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

RT288X systems may have a non-zero ramstart causing problems with memory
reservations and boot hangs, as well as messages like:
  Wasting 1048576 bytes for tracking 32768 unused pages

Both are alleviated by selecting MIPS_AUTO_PFN_OFFSET for such
platforms.

Tested on a Belkin F5D8235 v1 RT2880 device.

Link: https://lore.kernel.org/linux-mips/20180820233111.xww5232dxbuouf4n@pburton-laptop/

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>
---
 arch/mips/ralink/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index c20c44788b62..7c6de7f8484e 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -31,6 +31,7 @@ choice
 
 	config SOC_RT288X
 		bool "RT288x"
+		select MIPS_AUTO_PFN_OFFSET
 		select MIPS_L1_CACHE_SHIFT_4
 		select HAVE_LEGACY_CLK
 		select HAVE_PCI
-- 
2.31.1

