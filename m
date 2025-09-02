Return-Path: <linux-mips+bounces-10957-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6367AB402FF
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 15:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A9285422FC
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 13:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62763305E01;
	Tue,  2 Sep 2025 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrZ24BWM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49463009EF;
	Tue,  2 Sep 2025 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819415; cv=none; b=Zg6uqfqdlwEO1q/7cwOXOtQ89DDa9skMqFq0BNZdJdSmyBYMsU/vaQKzByxe6DF/XnJDRSuERYJMUunfeBrs/rmoNWq7gBWKDa6e1Y/IGsoVdgLTv9rEzojhbtqHXjvmIWQT2wHRdvINa2/4l42KgL2eMUw2GV2yfHFUB5ieguY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819415; c=relaxed/simple;
	bh=Iu2ZUA1owfkZE2TbpLbzBVFl4/pubaw013aAab0rbac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KqWbMN55EKxf+pC8G2XjPFiIrtN/vmqRibzhBX+/HNOgkHWWzuTA7TxvFqOYZrnXpjasID/WSi4xNqSopZDZPCqkxPFY94Tta7PEm0n3B2F48Kx16KjFQw9cU3A8GmOnE7dZNu1c+OIkwzz4xDkstdLSGONs/MKN8zp2RgPvoII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrZ24BWM; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61ebe2ce888so1035541a12.1;
        Tue, 02 Sep 2025 06:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819412; x=1757424212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=poZ2nT7UtwpL4m9esHTGjRx9cHfxaHESfkCNN9Nbo6A=;
        b=DrZ24BWMTOzs+gQ3hvqtVXj6n7x9/7Phsy9fguTXy4LmEopnr7+ffCkRHqTNsdEj+N
         rxOaIx78xFIEPS3aX/L0o3YXbp6fANCaAKZedSIb860o8R72eHjAi1nf19NDvQUwC2sB
         gRTpEbRbuUKGPPvFvnqUKBYyZJhnaqkpSm7eBGTqXjJfHP8O4YWLAguzpQAXwVXkFjh3
         PcjQtELFxmzsW6Ciav+f3KQdkmMGwgiS/icI2pQcWcbgFlj+rZovFg3zppHC54Aw62OC
         PB7waaef5ub9exXkp8w1xxK8gOG1gNXHuoOA/oGBCY+Qh/UnsLFfdViTnaXfvSDrgFzE
         EB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819412; x=1757424212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poZ2nT7UtwpL4m9esHTGjRx9cHfxaHESfkCNN9Nbo6A=;
        b=kXj6hAAL6S4O2IgJz+tOEmCka0P4QYaoTGRBt+gUVrUG8yj6x1p43DlnJ/MCQtWfW1
         oLf3Nse9qmZUQpfoJcrc8hMb9emQq9Dd0N/cA0sq4WTZwXp6YfMSiaOTCGVY2zyHlUW8
         WT4DIrbIiDvknU97+rnOQcrR6ycKNBmBdMf7A+ZLj/MZpuFA9m4iB+bOtpDQ2TZUWZHL
         4aY4oM8AWQPI1zzulMSBVk3d+zS8oX4nUY4LYwWxLhYPYF6szx/xeOrfk4I7yGvJjQgD
         xDVdMnbRbmle4hhs7erFh+OqxtU6uEFQSiGNCla7w4XkJUd7y3o6FRIqz5UkcejVRU2N
         +pEA==
X-Forwarded-Encrypted: i=1; AJvYcCWJUTHxHmtNNbKCPTeZYwaqyu6Nb/BauWfCLscDZ0T0qApMOoOpe+OIMB+W2B3qnooyXVYwwEK5szgJsq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhbk4rXCBKkJOejAUSPDoEhBeGIcNcvxewyJHT6NGMIPOM4Z1X
	TLEMAroDhUwgEGiQzuM1JnylGuxjgQ6HBaeegeXjxYASus3xmPlVw6uq
X-Gm-Gg: ASbGncu1Gl3kHmoaY/cG05s1j/pZ0VjWxPbKpP9b0RdBnlwHZj0XxHuVDxV5T9TZ8ct
	tbrDv8QSidUxWOqsTCJnAXxrt9g+yTTZzCu9x32/2O8wNoVQ3zl856krlQ+9F3XLHXokfjT7tIN
	oeqDavq9mt9AbSRUaU0N2sBpjWqWFClWgAiNBOHZWoTgrE2VMVcd3ETVbP/mL817QWnR1nMwUJO
	ddIP2XcoelphFHBXcYS1NG4FRLvztXj8/L9uEMR6iGuBybG/VM+A8efTWyd2hPXFXNPZv1Tv9QO
	ZR7KbCxAf9Kn+g9rBU65Yp6SbB73apD+cOBaB7TrrHCPnQS5LdJpfrAEcJ4eF6uFIpYTAfOktr6
	dwtQx5D14RZRRmc8DuC9OsMKFmQkxK6YZhOnRsqPtQJJls4x18zU58uTcoYIlGfIyBwvRV2Qh29
	HEvak=
X-Google-Smtp-Source: AGHT+IGBHPQ9QC3UL0N3OUtKoMUMJFFQ8lZkHT+ofuXkeDJBZKczhiX8gGjnRAoBLJyZzWo6xA+28A==
X-Received: by 2002:a05:6402:23d4:b0:618:528b:7f9b with SMTP id 4fb4d7f45d1cf-61d26ebc064mr9508721a12.31.1756819411656;
        Tue, 02 Sep 2025 06:23:31 -0700 (PDT)
Received: from XPS.. ([2a02:908:1b0:afe0:a26d:192:8cf5:7a0d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7a27sm9668715a12.10.2025.09.02.06.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:31 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2] mips: math-emu: replace deprecated strcpy() in me-debugfs
Date: Tue,  2 Sep 2025 15:23:14 +0200
Message-ID: <20250902132314.49374-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use strscpy() instead of deprecated strcpy().

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
change function signature to get len and the caller.
---
 arch/mips/math-emu/me-debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/math-emu/me-debugfs.c b/arch/mips/math-emu/me-debugfs.c
index d5ad76b2bb67..49bf2b827ce2 100644
--- a/arch/mips/math-emu/me-debugfs.c
+++ b/arch/mips/math-emu/me-debugfs.c
@@ -37,11 +37,11 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_fpuemu_stat, fpuemu_stat_get, NULL, "%llu\n");
  * used in debugfs item names to be clearly associated to corresponding
  * MIPS FPU instructions.
  */
-static void adjust_instruction_counter_name(char *out_name, char *in_name)
+static void adjust_instruction_counter_name(char *out_name, size_t len, char *in_name)
 {
 	int i = 0;
 
-	strcpy(out_name, in_name);
+	strscpy(out_name, in_name, len);
 	while (in_name[i] != '\0') {
 		if (out_name[i] == '_')
 			out_name[i] = '.';
@@ -226,7 +226,7 @@ do {									\
 
 #define FPU_STAT_CREATE_EX(m)						\
 do {									\
-	adjust_instruction_counter_name(name, #m);			\
+	adjust_instruction_counter_name(name, sizeof(name), #m);			\
 									\
 	debugfs_create_file(name, 0444, fpuemu_debugfs_inst_dir,	\
 				(void *)FPU_EMU_STAT_OFFSET(m),		\
-- 
2.43.0


