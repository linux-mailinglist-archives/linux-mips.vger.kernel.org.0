Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEFF18E6BC
	for <lists+linux-mips@lfdr.de>; Sun, 22 Mar 2020 06:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgCVFkZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Mar 2020 01:40:25 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43429 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgCVFkZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Mar 2020 01:40:25 -0400
Received: by mail-pg1-f195.google.com with SMTP id u12so5359867pgb.10;
        Sat, 21 Mar 2020 22:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=spP+yCGSzPzhe+8wghduZrLrXmzq5c5ZgZYSiNEqLBI=;
        b=qpVJsvU7hkYt3W99PKuoEMfwXr92qpJIkIm8CSZQbserjPIxwrAKcNXjpnPNRLTaxu
         63OYk6p7jtaQHxbxeZLFH5vq/HZSs6i1xJRV/cvQHN64qOrJnaEZFe3GWyoHK/fIHH85
         knFIj/fBu6TKbQD3We08BnpjmvcLUk+mk4kP7TBRObuAb2h+1eq5fWpUtIhlZh+ue3zP
         nlmUyP7eKwBoAKlteRpXBhn3/ddzHsu3o97kdvOmF44p6yznbWvN6AQDjiMV+eMBDgrC
         pLdf0ugcprMtwriWbxr1hPVFUGTuGIKCsWibD5+ElN53wm0RNNIv2l5UBorzSUP+ktTn
         6ZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=spP+yCGSzPzhe+8wghduZrLrXmzq5c5ZgZYSiNEqLBI=;
        b=l+w/hLmDwtbl/EiwYguwJAXi/CrLZVElc7v5afKJVPqnRctrFOz03TP4PaV0bkiepr
         vjWaA6bp7SmK+fCN9numFtYZJppmZ0W0PcJFcRF7rCEw3HDUSLOIa74bCpU+ynhcezcf
         ROu5tCBR6NwPkbAoQqWv+wX81mxQryMjMas/wd1B7KwDHsD6xyXZqO2FifH8TD1ld/OJ
         F4m3fFu9kAR2WZsRFemRKeK2xTJGvA42b4SSgNPQH1AJjjGKoNil6aDfmpECx2WHUkWe
         KJGqbVgIhprpN/jVpEJUCwdXfJXPAjDNGV9+J3cdN/uygzhLsKEUw7GrGaXsam3CFaYi
         Qv7Q==
X-Gm-Message-State: ANhLgQ0nWHd+ChzWPXas7GIwLLyNzNkb4Gk2zxGPpDLw5PzvZwR7kfoM
        4dPw7Gt/L2orazdDhSKBnE8VhitF
X-Google-Smtp-Source: ADFU+vsv5Jyp3yjIOXaxdDtCfInZ7GyXCcd8Cialhv34o12iz3INqzCy+ClrQ9Ah+p+GlO1fg8HXMg==
X-Received: by 2002:a62:868a:: with SMTP id x132mr17147262pfd.208.1584855624030;
        Sat, 21 Mar 2020 22:40:24 -0700 (PDT)
Received: from xps.vpn2.bfsu.edu.cn ([103.125.232.133])
        by smtp.gmail.com with ESMTPSA id b23sm910831pft.116.2020.03.21.22.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 22:40:23 -0700 (PDT)
From:   YunQiang Su <syq@debian.org>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, YunQiang Su <syq@debian.org>
Subject: [PATCH] getauxval.3: MIPS, AT_BASE_PLATFORM passes ISA level
Date:   Sun, 22 Mar 2020 13:39:16 +0800
Message-Id: <20200322053916.391906-1-syq@debian.org>
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

This behaivor is different with PowerPC.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e585b768da111f2c2d413de6214e83bbdfee8f22
Signed-off-by: YunQiang Su <syq@debian.org>
---
 man3/getauxval.3 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/man3/getauxval.3 b/man3/getauxval.3
index 456371c6a..518faf5d3 100644
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
+On PowerPC, this identifys the real platform; may differ from
+.BR AT_PLATFORM "."
+On MIPS, this identifys the ISA level (Since 5.7).
 .TP
 .BR AT_CLKTCK
 The frequency with which
-- 
2.26.0.rc2

