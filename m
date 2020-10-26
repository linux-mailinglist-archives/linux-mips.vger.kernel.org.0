Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6E5298CE3
	for <lists+linux-mips@lfdr.de>; Mon, 26 Oct 2020 13:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771094AbgJZMaE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Oct 2020 08:30:04 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:52017 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1769973AbgJZMaE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Oct 2020 08:30:04 -0400
Received: by mail-pj1-f68.google.com with SMTP id a17so3173654pju.1;
        Mon, 26 Oct 2020 05:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pcz4v9qNpJpGQqOygE63AfxlkJy8GhDQp2EqnyOnpYI=;
        b=vXi/8+raD5BBJ/yEktEkkIhrN9SsWeDU+1BTPh0lD6PkFV8X4KOB/jq3Ca456Bsjnv
         pwMRn86jqIq6sCgLI14pMVFkxXWhsHAmGd6dl/5TVuxTxCsMb8thfNp1mDsmWAsWUJdv
         U0UDg0jZHJyqfZZUSK0sjSlDdZgppJ56s1QV92sGnTGzYpslmZC3Xd2KNMtn9g4IuVB4
         oaXjoOzlMwJlo8/P4lHC71SecpH01p9PXx0Bno2qnq5wykEK3vBSKqbiMw++CEwzjVv0
         M1Ucd0fCPajxdpT3LTXkljBES3CnbngAYYjuC4h2sNnDAQQWwCL6c83dZ6OvX4Wu1s9f
         dckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pcz4v9qNpJpGQqOygE63AfxlkJy8GhDQp2EqnyOnpYI=;
        b=rk4fqrxnhaBf3jlbLBiWL+uReMeZWTOLn6V63HBf+cqWOCiX3k0oln3YhUOIBvToWk
         IJVHvFvgvhJGf0y+GyWWpFF4rg4TU+zDOVHaAPu67z7OTjzpzRxRknzGQy9hRZAzkxtf
         7cyEXokmzIC61EH7ArkM7KH3aciY3itLYJn8dgKnpv/Y9SsJLYi/y+u2XySOIrr+IyDE
         actD+25KcF4moy1YGG7y+Tf8DIdBvw5I5YBhZS0ghg+oVX7EDBOrISJKBFRpxJWfkwsZ
         F5ZpEOcmfth9dUPJ8rwn21JFwdF/h1wpdmY4C+kWmIziPbvk6nCDp8LRpxxH3/T5dDar
         5w0w==
X-Gm-Message-State: AOAM530D3mdn7o+xJjuwyBqZ2ujcqVs6KUV5sbHsYGqPzrzkwAiL7k8f
        oRC8mZ+Zy1JAPmJK1GLMaZ0vDpN3fyM=
X-Google-Smtp-Source: ABdhPJzDEnxCyv6iz9EVDiNZw2jCJ3A5aZA+tW0dmPvYOc7YR+fSXpHaCGoAet5ydjUK7Akdwyll2Q==
X-Received: by 2002:a17:90a:7c0c:: with SMTP id v12mr16221998pjf.71.1603715403364;
        Mon, 26 Oct 2020 05:30:03 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:3cc2:288c:5ed9:5348:b71b])
        by smtp.gmail.com with ESMTPSA id 5sm919201pfn.83.2020.10.26.05.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 05:30:02 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Chuanhong Guo <gch981213@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: zboot: put appended dtb into a section
Date:   Mon, 26 Oct 2020 20:29:25 +0800
Message-Id: <20201026122926.1774569-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This will make a separated section for dtb appear in ELF, and we can
then use objcopy to patch a dtb into vmlinuz when RAW_APPENDED_DTB
is set in kernel config.

command to patch a dtb:
objcopy --set-section-flags=.appended_dtb=alloc,contents \
        --update-section=.appended_dtb=<target>.dtb vmlinuz

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Note:
This should supersede this patch on linux-mips:
[2/2] mips: boot compressed: add support for vlinuz ELF DTB [0]

[0] https://patchwork.kernel.org/project/linux-mips/patch/20201015201100.4130-2-git@johnthomson.fastmail.com.au/
 
 arch/mips/boot/compressed/ld.script | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/compressed/ld.script b/arch/mips/boot/compressed/ld.script
index 2ed08fbef8e7..0ebb667274d6 100644
--- a/arch/mips/boot/compressed/ld.script
+++ b/arch/mips/boot/compressed/ld.script
@@ -31,9 +31,12 @@ SECTIONS
 		CONSTRUCTORS
 		. = ALIGN(16);
 	}
-	__appended_dtb = .;
-	/* leave space for appended DTB */
-	. += 0x100000;
+
+	.appended_dtb : {
+		__appended_dtb = .;
+		/* leave space for appended DTB */
+		. += 0x100000;
+	}
 
 	_edata = .;
 	/* End of data section */
-- 
2.26.2

