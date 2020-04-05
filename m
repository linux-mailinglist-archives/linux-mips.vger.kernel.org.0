Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF75A19E8A0
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 04:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgDECvr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Apr 2020 22:51:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:44818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbgDECv2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 4 Apr 2020 22:51:28 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EEEC2078C;
        Sun,  5 Apr 2020 02:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586055088;
        bh=+NLgm5b3eyOP1I2k6jVeL7oY8jKap22YLdwxpklTebg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VNJx4hFJzKo1DXvVLN4Bx/zjmOG92oiqLIUR3e2dgco9nfigqtElpzoitvV/4cj2c
         Dd9c79OwbDJ0YHO1MnAFNWK/87XPdHN5renzrZI7DZiNl6MTyF/B4PSbciCLwYOroc
         pWE6k6NYWcXxD0tlJFaj151E8OhaxP/whOclAjoY=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, chenhc@lemote.com
Subject: [PATCH 8/9] MIPS: Loongson64: Drop asm/clock.h include
Date:   Sat,  4 Apr 2020 19:51:22 -0700
Message-Id: <20200405025123.154688-9-sboyd@kernel.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200405025123.154688-1-sboyd@kernel.org>
References: <20200405025123.154688-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This include isn't used by this file, so just remove it.

Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: <linux-mips@vger.kernel.org>
Cc: <chenhc@lemote.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 arch/mips/loongson64/smp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index de8e0741ce2d..b48d9c566c5a 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -14,7 +14,6 @@
 #include <linux/kexec.h>
 #include <asm/processor.h>
 #include <asm/time.h>
-#include <asm/clock.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <loongson.h>
-- 
Sent by a computer, using git, on the internet

