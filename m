Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD5818E7EE
	for <lists+linux-mips@lfdr.de>; Sun, 22 Mar 2020 10:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgCVJzi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Mar 2020 05:55:38 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44330 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgCVJzi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Mar 2020 05:55:38 -0400
Received: by mail-pl1-f195.google.com with SMTP id h11so4528243plr.11;
        Sun, 22 Mar 2020 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2MzkSElXxPR2YxyIoEkVcfa13iFyx9aLxRmU5HJX8k=;
        b=pqI0/sUylZqVpvTeukqO0MzSGLGwLVzv687iis5NqUEJLloAtRMa2uReoeRAoSoOXl
         oI6RBN9HGFt8mkmepYg/DAn7nd1uaabCpTukKQN9ejdclf447xWqf2bEUrfieAn31ahG
         VALfXlGCcWmEL+M0sTYxXJg6V3xTKAda5OZ1qcmfnPtOoV2rnScCd32Tl383fqtmZRlP
         PmrlVPYXv0T+VHymnjBH9b4P7Vch5pIlmpegQmivHi5DSoerHGZsKVDE3zcdsJtQ1aiy
         ptvmBG0E1MHra4CnVFIND/pI4CNPVMQZrUAYfbPFfQcggSgRNSM14oBg2/770GOk4A5v
         z8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=/2MzkSElXxPR2YxyIoEkVcfa13iFyx9aLxRmU5HJX8k=;
        b=qGUCgw/uu70TsOAz04GS5kP5/M4SkvRyPORx+Tsd2RDA3pCIpNFU/S/OW8O+5PWY4g
         n9EHXJifMiDXVWYv2WkrMERC2YkbL/xJwvjBTBYrd/YW5nLEY+62AVzdkB9zROIVqjiL
         xeslPhVj/O7PGeSY9bhlkmwNQ2Qcy51XiOQBlujUXykfp39JozP34cI1RLX3nLMarMnc
         aWf8fb1BoeiUiEIiuhsMTaZhavubdimLeIKbAOf0SVA2I6D8776/cXeiJpHRJyka99Pi
         8h8t5UG+CeNivnAa2lr5XbcVmxdAP90Je294tl69sqnfmOg57N4fI+bO9lvDLz6WdRVZ
         Kv2A==
X-Gm-Message-State: ANhLgQ3gP5QvSf6Kh4ZV0JVZLsPpGE5XLr10BJ8ip4R7VCjrwxsI1AD7
        5IM7gqnzuWLV1fXmhpVZ02k=
X-Google-Smtp-Source: ADFU+vsDvnqFFrCKd23CR7w6aEcbIIYEkQgr2wGogrhdgAHGqQr3/iW0p0pGdWv6MEAc0U9JBji8DQ==
X-Received: by 2002:a17:90b:300c:: with SMTP id hg12mr17559132pjb.96.1584870936422;
        Sun, 22 Mar 2020 02:55:36 -0700 (PDT)
Received: from xps.vpn2.bfsu.edu.cn ([103.125.232.133])
        by smtp.gmail.com with ESMTPSA id h64sm9963548pfg.191.2020.03.22.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 02:55:35 -0700 (PDT)
From:   YunQiang Su <syq@debian.org>
To:     mtk.manpages@gmail.com
Cc:     linux-mips@vger.kernel.org, linux-man@vger.kernel.org,
        linux-kernel@vger.kernel.org, YunQiang Su <syq@debian.org>
Subject: [PATCH v2] getauxval.3: MIPS, AT_BASE_PLATFORM passes ISA level
Date:   Sun, 22 Mar 2020 17:55:27 +0800
Message-Id: <20200322095527.397716-1-syq@debian.org>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since Linux 5.7, on MIPS, we use AT_BASE_PLATFORM to pass ISA level.
The values may be:
  mips2, mips3, mips4, mips5,
  mips32, mips32r2, mips32r6,
  mips64, mips64r2, mips64r6.

This behavior is different with PowerPC.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e585b768da111f2c2d413de6214e83bbdfee8f22
Signed-off-by: YunQiang Su <syq@debian.org>

----
v1 -> v2: fix typo
---
 man3/getauxval.3 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/man3/getauxval.3 b/man3/getauxval.3
index 456371c6a..bcc116dd2 100644
--- a/man3/getauxval.3
+++ b/man3/getauxval.3
@@ -60,9 +60,10 @@ values are present on all architectures.
 The base address of the program interpreter (usually, the dynamic linker).
 .TP
 .BR AT_BASE_PLATFORM
-A pointer to a string identifying the real platform; may differ from
-.BR AT_PLATFORM
-(PowerPC only).
+A pointer to a string (PowerPC and MIPS only).
+On PowerPC, this identifies the real platform; may differ from
+.BR AT_PLATFORM "."
+On MIPS, this identifies the ISA level (Since 5.7).
 .TP
 .BR AT_CLKTCK
 The frequency with which
-- 
2.26.0.rc2

