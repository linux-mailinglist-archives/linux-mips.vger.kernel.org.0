Return-Path: <linux-mips+bounces-8306-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA79A6C69A
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 01:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE51D7A581F
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 00:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085A4800;
	Sat, 22 Mar 2025 00:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kE5W964+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A162173;
	Sat, 22 Mar 2025 00:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742602190; cv=none; b=lJ0CIxYXR2cX1xuTofXHJG1J1R8udWTvptpdpshWkfwM7vPrWyx4DA8e58P7GznOntW+EJfvtSXwQ5oHz9l9+FOCVsdF/mDfgGSphqhlj03w+h9ouMtC2N/JCs3JUSVTWWDjqu4JKMP9YSRYZcS94SkJrlWmbJ/MnoY8owGjnMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742602190; c=relaxed/simple;
	bh=1Ger/8ipWfTQ2dLT+NxwG72j/YzBfH/+Dx2GDs4+hJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UlJO3zqYIoHHZm0OaAnNbtmRMi9clNouIf9H6EYhtoMef0N1Bw+HnQJX3rVrS5Cffg2tNzJLkOfcpXtqV1C1FObKiSAiiL0d3+IzXq69aDHtJ9CqUTnf5nH6V1c0Q1yDCgAo4bpALSqv/1Sebdu/p3EzgqCqz7YndA9sX+LcFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kE5W964+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224341bbc1dso52050575ad.3;
        Fri, 21 Mar 2025 17:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742602189; x=1743206989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHpkR59C6RKys5u9ygyvaiRu0tqY4gKg18uFdCfjZV4=;
        b=kE5W964+d9gK+7N9qqu8sgUVVkFwMo0yzE3NCaZmsohATZ/hb6RmpEuvfc5pA3CzsX
         OC9xocTZtx1KPyILz5qWN8ETcHpjH9Wi7alIESRdAfJKVBPVEZANPrzLLktJuVXctNu+
         nCbPxikUe6ynb4gEmTbDurM2h3J6CSLYkmjDOtnnIki/+CIqfajJq4G39USLbBDLoBEm
         CfLKjHvMXx6yvgstAFRvTZ0RiBxJNiHtLzOhCNVOKA1l0sYPwgrz346aJ1H53uZvbsMF
         /kdb3jzS2EEwSwuiy9VwKI5SA1ACtpknshlF4RskaJivhZNKnSHxO5TQJJA64H4jYRYp
         Gy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742602189; x=1743206989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHpkR59C6RKys5u9ygyvaiRu0tqY4gKg18uFdCfjZV4=;
        b=dXWTK5u8yOtAIhahDUtVG2U2CU/4+AD1dnsnv4rA3rSQHe516ThNLzsMNYk39wgDeH
         SOU96rKXFpJY1w2sWLf1+KtVXqvV+1oX0ddjAufcK1KCGKhD+L8YHlS0E5xwbNAm7zxE
         I4EouEaNYMR3/H0AJLVxmJloRFSPjwr9gJQbP4MFYR678s/4DdtoCvDddY/jimKfsnjt
         4+3YyHH1Fb/ticrMS4S1JDbg6Ee1BAIVvsnfM3O5TYHxh18LGkDXdVX12A28Cgxeig6r
         8KlYOfyv6lapTEpXAuffc0EF7k6a3E3GmAAUjfrNE37yzc2JPVvvv/1/yjnImN7I8XLV
         pDIA==
X-Forwarded-Encrypted: i=1; AJvYcCVCQpgCWiMJs7XArKKMKaHUL4GRDDUVEeWH8ShB4f4mnsHyZIXuyCPScFjJQFOAKW5jxscp02A9@vger.kernel.org, AJvYcCXeSxSfZxJ6lRxegJcPoOTyk6HHZfXq3oWg+TEs/OhBeTaHlheK+P4qCCYCNG9AdwL0nVppMGKi27H+oBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNBufJBNCjmtt9NZf6nYlAWlQOSfo9PytfK4I8u7K4IXydpxqT
	r3sunHYGnvdBzzQaVpwy47bAzgY6IhJuuHJzoCrxFXX66vp93HI84pACud76
X-Gm-Gg: ASbGncuPYmbB5vm3Hwc+8ZxXAkieXr6OWAzfVpQo1fY6BwWOKUNuBIbdbYh/K8mP58I
	xnunEL2McMRmj6tFaLwcCQDeJ06GQQ/iAXiGeCOax5vKzJyXd8r64o2wyYo9hcF2QIiaaWpDN1j
	YgP5udZjGBsCAYNSnPN4ECxRQX8gq9jzPe+TZhKxurzQ7JwViDgQjETey1Kehopn4liLjLLTaMJ
	7FLJVoXW1Y188nBZBDWSliWumTqDaWQbSiYuxUtE1fTAi2W6/HP49A7E6AgNep7hgPmDDM1D4rs
	dxkEh7NabFoh5jTJuJL8GEttIMmguG1DOw+L8tXgsomk1RM=
X-Google-Smtp-Source: AGHT+IEm0KgQcRX1l3WnbOC3hmSkrET5i49w2ngKlS+vA7nAkpx+VAqPc1ifPVvGl7DOCPUYGfTZsA==
X-Received: by 2002:a17:903:46c3:b0:223:49cb:5eaa with SMTP id d9443c01a7336-22780e0a7dbmr94479655ad.35.1742602188641;
        Fri, 21 Mar 2025 17:09:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da95dsm24022985ad.194.2025.03.21.17.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:09:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Kees Cook <kees@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khem Raj <raj.khem@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mips: Add '-std=gnu11' to vdso CFLAGS
Date: Fri, 21 Mar 2025 17:09:40 -0700
Message-ID: <20250322000940.778730-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC 15 changed the default C standard dialect from gnu17 to gnu23,
which should not have impacted the kernel because it explicitly requests
the gnu11 standard in the main Makefile. However, mips/vdso code uses
its own CFLAGS without a '-std=' value, which break with this dialect
change because of the kernel's own definitions of bool, false, and true
conflicting with the C23 reserved keywords.

  include/linux/stddef.h:11:9: error: cannot use keyword 'false' as enumeration constant
     11 |         false   = 0,
        |         ^~~~~
  include/linux/stddef.h:11:9: note: 'false' is a keyword with '-std=c23' onwards
  include/linux/types.h:35:33: error: 'bool' cannot be defined via 'typedef'
     35 | typedef _Bool                   bool;
        |                                 ^~~~
  include/linux/types.h:35:33: note: 'bool' is a keyword with '-std=c23' onwards

Add '-std=gnu11' to the decompressor and purgatory CFLAGS to eliminate
these errors and make the C standard version of these areas match the
rest of the kernel.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: stable@vger.kernel.org
---
 arch/mips/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index b289b2c1b294..15521004c563 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -30,7 +30,7 @@ cflags-vdso := $(ccflags-vdso) \
 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
 	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
-	$(call cc-option, -fno-asynchronous-unwind-tables)
+	$(call cc-option, -fno-asynchronous-unwind-tables) -std=gnu11
 aflags-vdso := $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
 

