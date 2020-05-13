Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F211D0AF6
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 10:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732256AbgEMIiv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 04:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgEMIiv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 04:38:51 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127EAC061A0C
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 01:38:51 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id f23so6810562pgj.4
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 01:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cXSZlzFhngCETl8ZVdHLRoXuCSdL65ParpNBlrGS59o=;
        b=q7MlRD+y9ZQ03gLpppm8RakRmeyF/oAx9Yqa/1OjJ38OivLtqmSNn8M930v61JZ8wI
         gHUz1OtAF3lbGoOpuXHYYXtsJvV/dWGP3ZGWG77N2Q+dg+dGjzwrpY8cIysvD8ydRDta
         y+GapnuljqIvzeoULjkc7W+nZplArg2DLuGwgjmoVrKHCAd8sy1mq3ffFILCZa1olAiK
         G20LFUvKVyUl3tg8ScPOvHtl7pF/Xf2yQtS2ox5badohMeQur2HcFJZgGsil1IqHJRwk
         ludAuhM3vl4VefPq39RAWRPau3tg7CdD5htJF6bDGfc4Lo42Iye12efqyeASTKUd6ChZ
         zj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=cXSZlzFhngCETl8ZVdHLRoXuCSdL65ParpNBlrGS59o=;
        b=YKWjeDvvhRfQrZBFLWK8+6z+dsOAIG+A/5dHaiElKRtGz5Cmsvq7ySXTaVja4pJqrB
         vE4WOnPKUFcMIFq/gkmEJ6igczrPLHfDtd8lzS/m2h83EQ8GjIJuEmJtmQfvnfl9ZUAi
         FEJOGTW0GWDx0dRgb8s/97SF/4avVehBF0d+UoXC9GXGny2bHQ3PZwuoLacYRVWxDvnG
         75rBHPOvRCJNkVKilnlmZ3H23y/iNj7ZCIjf48CjTepicTGqQnvQgcAvHsSq84RPCczX
         CNXaX+lWvfTHARQ1cpQfU/KLHVpiE8wK8XGwF6bGL3J6jC8POZr98b3iwVpFtm0kOflm
         FGWw==
X-Gm-Message-State: AGi0PuanFXoTY8KZyT389yByGwooOwOSdQaCVkh5wqNNewvDD9jHn8go
        5QuTxPHf5rZaiDRU70wNYeA=
X-Google-Smtp-Source: APiQypLEQoSqqf5YtizhHhC82UdapTZvsIVYGlSDxQbY1evH0VuxBNXtTZGN/fuohWWvgvWDshfaCQ==
X-Received: by 2002:a62:528e:: with SMTP id g136mr26356062pfb.165.1589359130653;
        Wed, 13 May 2020 01:38:50 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id p8sm15228329pjd.10.2020.05.13.01.38.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 May 2020 01:38:50 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/2] MIPS: Fix "make clean" error due to recent changes
Date:   Wed, 13 May 2020 16:38:41 +0800
Message-Id: <1589359121-1572-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589359121-1572-1-git-send-email-chenhc@lemote.com>
References: <1589359121-1572-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 26bff9eb49201aeb ("MIPS: Only include the platformfile needed")
moves platform-(CONFIG_XYZ) from arch/mips/xyz/Platform to arch/mips/
Kbuild.platforms. This change causes an error when "make clean":

  ./scripts/Makefile.clean:15: arch/mips/vr41xx/Makefile: No such file or directory
  make[3]: *** No rule to make target `arch/mips/vr41xx/Makefile'.  Stop.
  make[2]: *** [arch/mips/vr41xx] Error 2
  make[1]: *** [_clean_arch/mips] Error 2
  make: *** [sub-make] Error 2

Clean-files are defined in arch/mips/Kbuild:

  obj- := $(platform-)

Due to the movement of platform-(CONFIG_XYZ), "make clean" will enter
arch/mips/vr41xx/ whether CONFIG_MACH_VR41XX is defined or not. Because
there is no Makefile in arch/mips/vr41xx/, "make clean" fails. I don't
know what is the best way to fix it, but it seems like we can avoid this
error by changing the obj- definition:

  obj- := $(platform-y)

Fixes: 26bff9eb49201aeb ("MIPS: Only include the platformfile needed")
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/Kbuild | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
index a8d5e4f..d5d6ef9 100644
--- a/arch/mips/Kbuild
+++ b/arch/mips/Kbuild
@@ -12,7 +12,7 @@ obj-y := $(platform-y)
 
 # make clean traverses $(obj-) without having included .config, so
 # everything ends up here
-obj- := $(platform-)
+obj- := $(platform-y)
 
 # mips object files
 # The object files are linked as core-y files would be linked
-- 
2.7.0

