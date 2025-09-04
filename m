Return-Path: <linux-mips+bounces-11022-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BFFB44654
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 21:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF0BA480A22
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 19:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FD8272803;
	Thu,  4 Sep 2025 19:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTfuf2+g"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869EB271475;
	Thu,  4 Sep 2025 19:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757013936; cv=none; b=eOzQctcy1gu0H45Zn1Wbo1l05wTaSL4GVWyrrL5nlcVnfX8tUvvPwHgepICl5/WsW0hKCRj03EpOKXsX8Ur4bVfwlhPiKKkWQM06ozI61Ou/24NqUpVA7unpzatZIJRo/BM+R0LpFyfeWM5gwCPbKQO25prVW8rrAGY9tgr/0wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757013936; c=relaxed/simple;
	bh=WFTDRJlgt2y7MkVfOwUowbeWYPD9Cj1n/7htyMVpgaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=byr3QsiId0hMHIsW+KH88C/Yhm0C/xtin+ol88fMvlO6BwKf6d99UMVGc4/2GodzaJx4Wqtg0J5FYY+V1GD9+8ADRZXiQW/y/jgr2UN3VO7rnDzPi8z9SNyFW+rWTMoUMoKYMUujp9872OEr0ZuHZkk1WMQDgY0/Qi23OvSKiFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTfuf2+g; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61e8fe26614so2557741a12.1;
        Thu, 04 Sep 2025 12:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757013931; x=1757618731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RyVqQnJKQdNZxLJ9itE9DWrgXd+hnVDHHwYCFnyfOQA=;
        b=VTfuf2+g9W9wkGoaF7w8bipmshmEsxRIUr1NFsGSqhKbW5BuCdYXOMmf0+GvXoSr4X
         PrUygcH3Rw5fUa8BONjeJYCXR22FiyxHPK05fzA3Ri/+rDz/c3hD1VXSj96bbyvYIY1K
         Cnyl/FphUadDfDs/5K0kY7af+TWf/VzgGCeQfmEcY3d6gsL2zTaPkBmv168Gu2P4NMiX
         YKdlywpF7y8Sud2cL25dm2TChRpoYNN2VKyrhih1TS73OOd3bWSFYwCfyHqb/hf7ZLQm
         p+c854VkklYsf+E2Fp4Qm8kep+M+6h/LKvtVKPajwzl7ScjpgbzcAbvA210s+N+a/VIl
         /pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757013931; x=1757618731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyVqQnJKQdNZxLJ9itE9DWrgXd+hnVDHHwYCFnyfOQA=;
        b=v/HJlyAYckhdlQ+Vk8fRqw7TG6mK8Xad08d/F8mLdoEkE0Buvao3SjclsP9Y4owF1D
         T66je2idR4Kb2ZmI9WtPKHEZw7XvenAHrvmGL+xavAr5xhh5+wk8dGsEOd/nuozTXll5
         IuxQYsFN1gPt9R87U6vUzOGw2FRJoL89ak/CuZ1CrTpCcD0EAo/10Rb8WwM8kbtKERMP
         u70+XhhEx0lSk7k0+Pf9wJhFs7JbxphO4/cgUdr7V0afGQ+yKCDMu2Whij1ENuRd8bHK
         yeQd8ndF5CXQO/z7IfqyfT+zdAVpQfirL/sRep50lHAdFnL5YXEwA5KO8wi8CqXIGoed
         Xelw==
X-Forwarded-Encrypted: i=1; AJvYcCUfur8cbasg5ZlW+atFO7utZjR5hujwnyb5uLVMVygLjNz2rF0I+G7BmGBwFB5MOPaHKJx2Nl1FOxwMYvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywlMU60zXQuCX/Cfvqu2NaIVJZFJwcfIAW8a6ZL99VSQuyP2Qe
	oGZ+mGlCmrzBmPMtIyYlhgDc861nH8cazEMTwRth1BobqBpuYtift9gN
X-Gm-Gg: ASbGnct+LMefoz7EHIdIPkxH3ztz0BX6a8Sl4qiA299fzU93GcTzIql5BYuIGSKUQ+d
	0Bv7zyh2yq1WNyB0gbv+5hZmzSWVuJN8gBGjR8DhyY81eH3auGim2rGvEkxJ0+0Gj0cHtSdOiNI
	bSHNM3KjCpc0ATGPdVB0sosyAaPmeoKHtyK6sgYc1OqGkmBT92KPAtaerZjEZR69JthvMcUdlbr
	/uI6FN4JxM5D757wtLMTwScKRrRIlyBgQYTaNYkLzm3Uc46YoM+XB2va0f7rG8aiOpHjxn3QKas
	UukMfs4t5Q5IsBSnghuNLDyt6KXGCLs/IHasReJy6kZXOat6570gJ0eDPJqlRoJH67VVTGRoAAr
	YmpMEvgTzNfEFvfOPNhGs0zekvzf9AAJ/j3XfY/Eq3x+KN+Bt+LAEqFHyVpzqH6WfR53nhVDvAJ
	hNQemCGGLWVXiQ8PE=
X-Google-Smtp-Source: AGHT+IGfuHthfXoTF/mLOHQy9KLR2aH/GiyiC921vGHckJ2DRkf9WZi723JdW/S0MUDp+nITTXm0sQ==
X-Received: by 2002:a05:6402:40cf:b0:61d:2405:b4a5 with SMTP id 4fb4d7f45d1cf-61d26d9c302mr18548906a12.33.1757013930652;
        Thu, 04 Sep 2025 12:25:30 -0700 (PDT)
Received: from XPS.. ([2a02:908:1b0:afe0:7cda:f91c:9398:4c62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc214bb7sm14188524a12.13.2025.09.04.12.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 12:25:30 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: tsbogend@alpha.franken.de,
	macro@orcam.me.uk
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v3] mips: math-emu: replace deprecated strcpy() in me-debugfs
Date: Thu,  4 Sep 2025 21:25:25 +0200
Message-ID: <20250904192525.39830-1-osama.abdelkader@gmail.com>
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
v3:
use same parameters and arguments order
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
+static void adjust_instruction_counter_name(char *out_name, char *in_name, size_t len)
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
+	adjust_instruction_counter_name(name, #m, sizeof(name));			\
 									\
 	debugfs_create_file(name, 0444, fpuemu_debugfs_inst_dir,	\
 				(void *)FPU_EMU_STAT_OFFSET(m),		\
-- 
2.43.0


