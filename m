Return-Path: <linux-mips+bounces-8381-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082FA72942
	for <lists+linux-mips@lfdr.de>; Thu, 27 Mar 2025 04:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE57A188ED20
	for <lists+linux-mips@lfdr.de>; Thu, 27 Mar 2025 03:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C19C1C1F12;
	Thu, 27 Mar 2025 03:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPmU6itZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6E1F8729;
	Thu, 27 Mar 2025 03:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045882; cv=none; b=QoS6MWgJEwFUIwOPY0pOpzjxUY08lYg/EcIC04sniC01aq+gUY9bfrmK6nf82JnSz6JcnfkckQadAqrZi8yd53btfMErHRtQ32JtjLwaGRw4LWQHVnPkmJRbNSsyZ5bNJ93sxbhpJ8tMz5QgGHnL9i13xeEExAw34qSEmIQtCZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045882; c=relaxed/simple;
	bh=D1y5O7GHFPafWCaRwvfdCQY7Fye/a1hcOZ95f7+lWic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPrQXqRzSIo2EpOBcnc3UobqoU3fPNGCMvdxxFt+lQxI3AFePgQuI/2vI+GKQeEwEQ69TCCUcrLoaNvG6a6JXe0JOncSUv87TEGYMDxmRYtLPvy09g0VAABVtslWP949d/It0LhfPAg06r7/p8o5mcnC58dbYz8CpnfKi+CZAEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPmU6itZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2264aefc45dso15029655ad.0;
        Wed, 26 Mar 2025 20:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743045880; x=1743650680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BvDZBbhZMPX6erlds9jOpeJO2KealfqA0C2o57c54Qg=;
        b=ZPmU6itZvQPhTatzP1N0banKJX7D5xkspNtg0Mit1knMqgfKbeKvPijgAEajvW+33A
         tzzBOMlq2jq3SBpZN/CbAQmSFSj4/c4sdBa04c4CNIr9qu6BPlBIGPkvrgte6YW96NYb
         bqwqJezXEkCfOMGaPD9pT+rnBr+uKa4KvnBMwEF0hR7FUXl+b8xrriMHMmYHNIEYXbLs
         L8zFHcaWKLsWakNgd7sysN2OKVmngLWbrE7KdkgGwcqSLyDanVv1jtg2+LHFJEmOANhm
         X/5RP7xSH9Ql7Ghs4K9YljgININI7LYPPX5ajXh2wYjRbmXsx28HLKkTVNUyfZj4diFp
         bzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743045880; x=1743650680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvDZBbhZMPX6erlds9jOpeJO2KealfqA0C2o57c54Qg=;
        b=HGY4qQDFfg+PsZBhxo+1KhyR7+vDZIh5bEofYyEHKk6sPgeD4U+3vJKWFEXCqZoQgM
         /uVIZ/OE/Qd9V2Omu/+eS1t9PWhNW9BdLHZ6jPDWRriOrtJoZDJcODhDdvZAvRIrx355
         vadN248f1ocUhfCYMJLY2QxTk+sHOT+Hmkt3RszbDWarjYLIirrK6IbuCjCs9FBg14HA
         oF2nstA/1Mq/GVCw9veFoIghZjbzy3dLxJGSVMB6HF+ZHBMw5Cjre10OK/W0r1WvjDZW
         eA/GiitkyU0ZU2SoU+YOQn2qJFn2kj98RgXD+SYHjjPlKMNExz+Yaq4yQSogTsVVQZZu
         T7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUwa6OgL2V2yH4LChMfq8Q7R5NBuh8lqtC1ILdWfQ+IOivixIgJkKdclll/RRgj6LdALuQC4PkX@vger.kernel.org, AJvYcCWTq5H5sDWYAqXqxstWjH4T4DO4qZ82y8XvfnQ7uVNrAFytny9m9732fUafmRa2YfuHq+lqD0MHgd0gqvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZat4c4Tup/yy/hTiWCthC0KLBM+Kw8E+IahMkD8zCk05T3noY
	6yymq+iZchq9lnuSp4vMoPBs1s0/ibl4BdAfQXuPvKNxRkmi1nDS
X-Gm-Gg: ASbGncuH4683+z7VajeBt9wYTZYqgxwLsMXcSb8zvVKS9tUSY2RyE58gZO3Ko2fP0WY
	5OWwlE1499MEGDnTR0U95mSAoJAzfU/L8A5FaknzUCwtcLk6yCX4rSnk+xkjSGu2fzMLbwCPL0L
	eSaQzxIVuYp0g3b46qPUPA/yXtPiBlM82dfYhXxXlFxIy9gmBn3LE1rOxi0UAn0LOsTNaxPp+xZ
	mJZAjh898P1WyBmKdQHg1JWD8kIs52VjZyyo/XG/AvtgPC5CUtzN68mjXWPH+RpT6bi8hDb3wFS
	QSyX/FalXemMO/SmBhYkP95AKSJ2mzi2TdV7
X-Google-Smtp-Source: AGHT+IHd6OOeyDgumFlrKIkvH53qKhq7ryWom5Dv+FjCyOIRYvw1a98qVpzr0bR6HZjcMQv3+tTIlQ==
X-Received: by 2002:a05:6a21:58b:b0:1f5:86f2:ba57 with SMTP id adf61e73a8af0-1fea2ef626cmr4947090637.30.1743045879679;
        Wed, 26 Mar 2025 20:24:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27dec60sm11911927a12.4.2025.03.26.20.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 20:24:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Kees Cook <kees@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khem Raj <raj.khem@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mips: Add '-std=gnu11' to vdso CFLAGS
Date: Wed, 26 Mar 2025 20:24:36 -0700
Message-ID: <20250327032436.3600578-1-raj.khem@gmail.com>
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
v2: Filter the -std flag from KBUILD_CFLAGS instead of hardcoding

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

