Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C790161CA7
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 22:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgBQVLz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 16:11:55 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39797 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729894AbgBQVLz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Feb 2020 16:11:55 -0500
Received: by mail-oi1-f196.google.com with SMTP id z2so18011728oih.6;
        Mon, 17 Feb 2020 13:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xK3Q/4PcpI8MJ4XOzIXcS+rMbt29+yBpzx5WYzRqjFw=;
        b=C+Y9J3F7hCeKE2UrdmV5oEk9QN3EPirr6aTHNd7poyqXHlPKK0tSfnv8fze2AX1BY2
         TSxFrowQQmKkCsMjI2alVDrL7Z/IicYi+n1DK5INEURwPLEBxOLOFitzwDoYfFqDmk0c
         z+GjPV3fzt+pBQkgMbaxrRVIvP1cRqs85fTSVT5yf/oWkqaGnCLpZTWNXblvcC5V34fX
         Lw/xJV+jl/1q8vgoyvZ91EiSlWMWc97IHzVFvgigvOxSUwsZ0h5co2CCnM5/NeaCKhr/
         7xiW9rcrq6IK7yaqbaydtaoyysWcKutcn5Lzudod/ILf45eQCzMykFBSw4l3p+QkCXUZ
         +WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xK3Q/4PcpI8MJ4XOzIXcS+rMbt29+yBpzx5WYzRqjFw=;
        b=gJdIvMu0k9mrRPVc5B5R084n2oxTk9Kq37vaknPSB+TPYplE4nRAhK+nNA8jHvplvr
         dgZrucF2TeCfmGUxoGHSW2sHXTtt779GPdlcy+2vQa32z7HjHEwwT9i5ZczcYAWfKlOi
         fPSp/LUznjm8nT5wjMvVfrGmWmeZiZt2TU+wHuJQOzgo09GxgtXkHDpUPYn/vvwWvkOh
         JX4pY2wBDZXwNPA2P++cxEBKC5oepQRgh3yjlvBcC4IzkBBWIb8G84VzLdRHNqoZrvCE
         1XYGmC/m/51UcR9RPDAzcGqyAIe3FrYetSy51osA2rsRtM/hA1MdkNL4SPCr8q5vXNkF
         giFQ==
X-Gm-Message-State: APjAAAVNNp43R5zEb4sqmtZKuSv6/jnRd/Vtv6aQZEDMHelPYunGGnzP
        WGoZCn2GN6ZFMk95AcWtCjY=
X-Google-Smtp-Source: APXvYqwq6Q9t2ypTAPDCqs+NdTrtHzXBzQIMBMFV2yKoF+DcfhxGWNYSbM1ZaJwagWH+94hONWTdGQ==
X-Received: by 2002:aca:3354:: with SMTP id z81mr602935oiz.129.1581973914489;
        Mon, 17 Feb 2020 13:11:54 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id v14sm579927oto.16.2020.02.17.13.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 13:11:53 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] MIPS: vdso: Wrap -mexplicit-relocs in cc-option
Date:   Mon, 17 Feb 2020 14:11:49 -0700
Message-Id: <20200217211149.44132-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clang does not support this option and errors out:

clang-11: error: unknown argument: '-mexplicit-relocs'

Clang does not appear to need this flag like GCC does because the jalr
check that was added in commit 976c23af3ee5 ("mips: vdso: add build
time check that no 'jalr t9' calls left") passes just fine with

$ make ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu- malta_defconfig arch/mips/vdso/

even before commit d3f703c4359f ("mips: vdso: fix 'jalr t9' crash in
vdso code").

-mrelax-pic-calls has been supported since clang 9, which is the
earliest version that could build a working MIPS kernel, and it is the
default for clang so just leave it be.

Fixes: d3f703c4359f ("mips: vdso: fix 'jalr t9' crash in vdso code")
Link: https://github.com/ClangBuiltLinux/linux/issues/890
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 77374c1f0c77..d7fe8408603e 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -33,7 +33,7 @@ endif
 cflags-vdso := $(ccflags-vdso) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
-	-mrelax-pic-calls -mexplicit-relocs \
+	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
 	$(call cc-option, -fno-asynchronous-unwind-tables) \
 	$(call cc-option, -fno-stack-protector)
-- 
2.25.1

