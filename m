Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A7533CC95
	for <lists+linux-mips@lfdr.de>; Tue, 16 Mar 2021 05:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbhCPEeY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 00:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhCPEeA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Mar 2021 00:34:00 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20446C06174A;
        Mon, 15 Mar 2021 21:34:00 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id t5so8930918qvs.5;
        Mon, 15 Mar 2021 21:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w0Bfui3x4cji1SdDQ5EUFSFBuVIeiVm2qa2G/zeSAcs=;
        b=nly6FPHRzCjBUbGtrWIE3/THQUjtf+WXbrkWzpqSTZb2dlLAFIK+Tx4ILqiJEUrHvt
         CB2VvVngqZNWbaOUnSRoBRd3jx1atWgeNE6a91z5V41kZ68+dPXTSZG67/AR68V+eVhZ
         AptoplDXC0iDOQ7mqHzIV9F4L4IWkG5F+XFBlN5h0gzxYNgEN0BNpUhzM5ysP+sme47+
         xVU9fJ8svkKjrgLm5P+tgrT1Xex0qkzSHlvmb8mK0UmSX87zYBlhWkc5syUcoSgNAuXT
         dMgtLK4rW/qiyWG+OO2RVaUv0NMuPgLG/vL+kDIhqXSPQqUUvZ6Qzsne2e61KYJC91uP
         r2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w0Bfui3x4cji1SdDQ5EUFSFBuVIeiVm2qa2G/zeSAcs=;
        b=FWuoX30J5MQJRbndE+wHCa82de1+Ib76fMoTuA20ned7+A51dpNaTyzWaDThlCBzoN
         5dN47zYLKBJ3Mi2j9QzXS4OWeuI4hU65CPfYSvtOChFpEr6ZqvC7H3BZIyIsAafl64zw
         6Zj7i9N5uk+InNRJjgLhcPQ79sUoo6NVz8KGue0UXX3JPrUi55as+LhzzA9iEo5P5GGm
         yl1uTvB+wH4e5UXIgCL8Z+TI7sjSkoavXqsVBb4yrWaPJcCfa6RmpqrN66fC/TweWAKt
         kBQ1Q1QyCkWRoNKsJfXwXuchtHIfIBLr+X+tQ7zFgNlnKhaWj63nHs3KlF9ogSqN/SDT
         8+ww==
X-Gm-Message-State: AOAM532Der6eivv+vbuaI34jiSKC8aL5C/RPVHrD4x4Sod/SGAOZpvZ8
        ijYwg5Zv2CcZhNn9/hwittg=
X-Google-Smtp-Source: ABdhPJzeF6WhV94ZCkxjETPSpSupCUyBo7aGFYiJvLPSdazO7ErOvav8yV2KbjwsyDqmGGefXplr7Q==
X-Received: by 2002:a05:6214:f65:: with SMTP id iy5mr14108780qvb.32.1615869239461;
        Mon, 15 Mar 2021 21:33:59 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.45])
        by smtp.gmail.com with ESMTPSA id g74sm14313931qke.3.2021.03.15.21.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 21:33:59 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     tsbogend@alpha.franken.de, unixbhaskar@gmail.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH V2] mips: asm: octeon: A typo fix in the file cvmx-address.h
Date:   Tue, 16 Mar 2021 10:03:34 +0530
Message-Id: <20210316043334.2770025-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


s/techically/technically/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V1:
 Meh, missed the changelog text, so added :)

 arch/mips/include/asm/octeon/cvmx-address.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-address.h b/arch/mips/include/asm/octeon/cvmx-address.h
index e4444f8c4a61..5df5c90f6a5d 100644
--- a/arch/mips/include/asm/octeon/cvmx-address.h
+++ b/arch/mips/include/asm/octeon/cvmx-address.h
@@ -152,7 +152,7 @@ typedef union {

 	/* physical mem address */
 	struct {
-		/* techically, <47:40> are dont-cares */
+		/* technically, <47:40> are dont-cares */
 		uint64_t zeroes:24;
 		/* the hardware ignores <39:36> in Octeon I */
 		uint64_t unaddr:4;
--
2.30.2

