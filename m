Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199B844AFFB
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 16:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237227AbhKIPFK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 10:05:10 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:49574 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236541AbhKIPFJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 10:05:09 -0500
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1A9F1mTu012230;
        Wed, 10 Nov 2021 00:01:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1A9F1mTu012230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636470109;
        bh=HQBhKd+2a9EYQ4Edzp8nwK+DQW3sKO64V/FEVyFYgC8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HyZcgokZUex3iKnQios/fLqzYxndqNBAKvOt/n9mE/PnNuy36ZRr00KJaAKD8cgyL
         DMnJCZUsSrw0Csu0zWDrZN+v0Q1J76lQWnPt5wFyHLv3S9yMqMjTRgxBK5lEAFoagQ
         ujBgPa1ksSI/kHZIcZFp9fEd0KgekkWlTgk4Zdl/oL5INLgeuarXih/GVODrn+8Ra+
         NQi9HVmzDD4bbGPRk5MvbnrLs8bheYnd80U1ARXRv6W5XkecSQ7j0ejWVAjZ+7dstM
         Z1sOpUGTCHu84mvF/jJsVhd3Aif2j5GR2aofJiXwWM4VpLEACyhaTneqFZjNDr8YnJ
         g8ANAPCA8qrEQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: fix duplicated slashes for Platform file path
Date:   Wed, 10 Nov 2021 00:01:46 +0900
Message-Id: <20211109150146.529428-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211109150146.529428-1-masahiroy@kernel.org>
References: <20211109150146.529428-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

platform-y accumulates platform names with a slash appended.
The current $(patsubst ...) ends up with doubling slashes.

GNU Make still include Platform files, but in case of an error,
a clumsy file path is displayed:

  arch/mips/loongson2ef//Platform:36: *** only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop.  Stop.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/Kbuild.platforms | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 2c57994b5217..30193bcf9caa 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -37,4 +37,4 @@ platform-$(CONFIG_MACH_TX49XX)		+= txx9/
 platform-$(CONFIG_MACH_VR41XX)		+= vr41xx/
 
 # include the platform specific files
-include $(patsubst %, $(srctree)/arch/mips/%/Platform, $(platform-y))
+include $(patsubst %/, $(srctree)/arch/mips/%/Platform, $(platform-y))
-- 
2.30.2

