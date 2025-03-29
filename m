Return-Path: <linux-mips+bounces-8404-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C44A756F9
	for <lists+linux-mips@lfdr.de>; Sat, 29 Mar 2025 16:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44C173AEAED
	for <lists+linux-mips@lfdr.de>; Sat, 29 Mar 2025 15:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B381C84C3;
	Sat, 29 Mar 2025 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgtQbEF2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8041FC8;
	Sat, 29 Mar 2025 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743262749; cv=none; b=J9XMLt3kSsTQDHflk7ibnGvbcAzYuqRJoaB9a0UtYedC+AqFSUb/jZuYQwrLHoMAenjzBqBVX+dnhiqejmSdh1RWBf+FVI6DTFljp1LZ6dxSvOOPjp43V3PKHhUNx9ynAYowkhqrtK/a731DODWz4KlpsFMWUhfD9PyXzmotSLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743262749; c=relaxed/simple;
	bh=XTZESrPKPGHpFAmnPm89jOBHONMycyklBf6gLShGzrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lnRBRxn4CxiS8VWzqiO3aVocmQSN2BwX7QrhVdXYhVfWU7IUubH7fWBD5nOfW3xkB6DTfpicbAh87LKxbAu+DgDXQzXe0mRtZ4+ULuzRKdpxLJef8G4qR54T00uFT4my5cPys2hilY21jRS68KcdYeKTJMIrSipG0N+oSvqG9hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgtQbEF2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224191d92e4so61922605ad.3;
        Sat, 29 Mar 2025 08:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743262747; x=1743867547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLqnf1fMnS1YGOd6jYlsQdvTvlitqPfts83ENABGWwg=;
        b=PgtQbEF2nhb8g1P6DEOn/mSfSsh77NuRr7oq4r1TlbEtO3gSdBOq13jgLbTEdsyUw1
         6FFJQSm6U9GN6gnZe65fA7xXOorEo60Rs4j0i0Zxs5EbOq6cbJdJDJx+s034TvSkwWgy
         bjA2FLWEsT1LuxJzE1bluOcxFb5gXeIshTWYGkh+J5trsq/C4QB/PIHSXfaK8nNb7aQc
         zbAcjdl9qj/u5Vs3qoJiflyTkAgjweYtbRnLKfEMNQH50/2vFzdwgFJOSNCcFSlbbycG
         8e8vbgn5iTMbAd/jpozwpPkL3WvQfWTVRGaum6hikE1GHIUEBPtaQSfFBNmDysbhlx9p
         /2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743262747; x=1743867547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLqnf1fMnS1YGOd6jYlsQdvTvlitqPfts83ENABGWwg=;
        b=mWNTZ+s41St1qP6ZOJtUSKn72AxCUasZl6KtBQF3CQUMTfHsEqdbQ62ooICSaDvTs1
         nB1lFLXY7fNDuKkOJz37qFOCDTnHX/E+wEg1TGiQTEPiqhetld5XhRwzguZHAMEYoo99
         N6yu14qWXOuc45U3Y3XI3lMNt7o40XMVxZZv+qnsriZcVjV21PTqjl++j5oAXrZKOHpm
         6igNCigS1OY1PpxwnSGD0Csg7eMfFSOoJxtH8k6NHOY01ymawN6Xg6Rlk74d/JAYpzNb
         tu0JrWSgrYs8TpLOo8lZjJDYK6Ub56kMHrUe9t0K9hvxz4z3GGc+8H7iuZ4LGVcsUAIY
         lUaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqtRpiFllZn4RNfktYne/zXlVm3zBDcKK63psDXQr/FUcU4A+ab+VpGuOufjvKiXg1MbRY5ZYXqow5gTQ=@vger.kernel.org, AJvYcCXLXzvoNnGbZq1skmSpz5ec6Hq9BocsrVfwxq8M53E0l5dUHu53ECY1kzlfV3K1DNz/K2WCHvUW@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpwg3Y7k9/+4mPmVE/nZ91CvNboDv3vEQijRpwlciescDk7Ia
	O4DdMc9wBeSQxHUM/PFmhjw6RxZ8j9HJW2ik0xxvesqDQz4IPwiwY1YVd59V
X-Gm-Gg: ASbGnct7y0kjENOk282O6/tqWIrOrHZRA15ukGTNbNKSY0cbQGa27fM7hCmQovGkmDB
	x6KkJ9BQBC2AUm7VBwmCHUfEqq0lkSU9VE88EKoT+mzPeApom+0xF1vUVBSX73SDlSbV3kN1AFY
	m6SDKFpv/UBSlUOE8E8wRyfbL9vbb0YrEn/inJkM50XX+FC5aMNN6+w+BV9EkeU1SmyZu9SHm84
	+FRniM5uZ+kCnzCw41eWCyyW6gw9BDojOmu/C/lxbXPe8g96j/lplNddFfZSbTG+hQMeXEGmk3t
	mBa2TxDHNS1opVnyBPMeARDS8xYpNdh22C3B
X-Google-Smtp-Source: AGHT+IGs1TjjcX4cWeFoms4AWEOhlQe+/EY7vHCtZ0u05EQ4B2o13qDdrvGs4PGSzYZYftHAYkLbjg==
X-Received: by 2002:a05:6a20:3d8f:b0:1f5:8cc8:9cbe with SMTP id adf61e73a8af0-2009f5bd151mr5034802637.5.1743262746951;
        Sat, 29 Mar 2025 08:39:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b6dd5d1sm3459254a12.46.2025.03.29.08.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:39:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Kees Cook <kees@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khem Raj <raj.khem@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] mips: Add -std= flag specified in KBUILD_CFLAGS to vdso CFLAGS
Date: Sat, 29 Mar 2025 08:39:03 -0700
Message-ID: <20250329153903.32963-1-raj.khem@gmail.com>
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

Add -std as specified in KBUILD_CFLAGS to the decompressor and purgatory
CFLAGS to eliminate these errors and make the C standard version of these
areas match the rest of the kernel.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: stable@vger.kernel.org
---
v2: Filter the -std flag from KBUILD_CFLAGS instead of hardcoding
v3: Adjust subject and commit message

 arch/mips/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index fb4c493aaffa..69d4593f64fe 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -27,6 +27,7 @@ endif
 # offsets.
 cflags-vdso := $(ccflags-vdso) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
+	$(filter -std=%,$(KBUILD_CFLAGS)) \
 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
 	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \

