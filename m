Return-Path: <linux-mips+bounces-7874-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D17A3C824
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 19:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A64193B5030
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 18:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E2A217F34;
	Wed, 19 Feb 2025 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DFLC7nez"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CF1217670
	for <linux-mips@vger.kernel.org>; Wed, 19 Feb 2025 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739991450; cv=none; b=WQMjWNJlnPInexJ3YL8+DoMS7PrHkpGESNIbIpxf4o0Ydyg2lIp8nRXKmcOwynG9NWuntvpIBoHOQruV1l+kAzfMPQ9HlfjF2g1L0HbYohJu0A7Nak2NMrnWYG2f1HnkfU1c78+rt8vY13Ts29qnmJYhuqzMEUHG+UfHWNcfHnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739991450; c=relaxed/simple;
	bh=ly9ScmKJMVA6q31ptFJQo64X6QGUOGrxOWC9a86NvwQ=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=gcf7azL3qgRjFckDQ7K2xYXPC2Ag7ZRA/MpMd0MRkwbEixaww0c7U98tOV9MGlmnAvOXtbckPY9fdp47vuerNJPVpmswWuxxlxPTdkAx64FwU61ZNmcWno+cvE2svZ68RygR40G+HVMLMJX4m42rE5phTojZuaLnVNJh1pLqz98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DFLC7nez; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6f27dd44f86so1300327b3.0
        for <linux-mips@vger.kernel.org>; Wed, 19 Feb 2025 10:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739991447; x=1740596247; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIzMGizCa0TqJAjUgJqlPFZGjy2pOOpFJSWoUD2uhWM=;
        b=DFLC7nezGn3GhKf2LE07CrPcbk/Qa4uZRlXc/n8BPlTjTU29o4qEzeQhbDiIdARZ1q
         67+BYUmsWl+OTs1k+GP8N5h4FYmYr67xiPJPd8kWiybPwun8aJVmWPu2cPB8eZ7xQ7ur
         gWsFkD6d/HZCbup1AeLSXOi5zBuvXWUJnBp2edyW5Xr3kwnTHG0G800xPts8yCJ1RKj6
         gKfKXaFnXspTNV6bgHyGx8w3epIFcFylmu+SmyyBNt2e8HLBUkJOA6hVfMDmFYsgKA6e
         7OaXoFroUWGtRGI/fYceCxKDuaoASj6WOUiCMdokfDER3kp2EtatIN4lzdwOrTes7wI9
         6niQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739991447; x=1740596247;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIzMGizCa0TqJAjUgJqlPFZGjy2pOOpFJSWoUD2uhWM=;
        b=fg8viNKnELybCfMXd05lkG4I0c8l1AfkJj44RWxD3IRPiHmWTc3/Wko+ecut5J6wc4
         iSa6UW8Gt/8w0p4JxoM9FVizvg3ly/aX50xwSpR4T6OZXMo36e+tcj3ESkJ16lNMzZJp
         YFJOZWO9M8aNiBqSf9KTgEy94ohdQxwkpyTSedJ1iZC5e81PObXEQw3IHjkKUD3sqatQ
         eV4dJMGMCKxO+DjyFtiDLcXVbQwAg3HCxDuRUseikTskTsy+rOUoqSKT0JG9wh4f98Bj
         NLgYnv2Ye2pYqZA8hkpMIOCuOf0GrpPDO83km6akzKv5F+YsoSNQXgtfmcI/v7gxb2+L
         ygHw==
X-Forwarded-Encrypted: i=1; AJvYcCWvOKxXmCByZVIbAf7Cm3qilb+tVC5SjYOtBpfhZyrxIlWOwI76IggF58YRtAy1q9eW39A0DmgjUv4f@vger.kernel.org
X-Gm-Message-State: AOJu0YwsUGc5AsTq9ob4xuJPR0vVgj3XoqKy15Z5AKWRfttUhinBnBEq
	NZIEOWMiYrAlzHs7orjrMIVCkk9KKNnqtyyVGQA2dYr9GXUalpUg3EIRFpa+waVBvSrof/KB7WY
	zxOwcCQ==
X-Google-Smtp-Source: AGHT+IHBIqCbWM4vcI984nDuEzZSczl9Bby3fcXaZ7gK0bV5Lnp/HxnIbC0vqnoo+ZtzSlf5EYQ7UBrYNZ0b
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:c57b:86f0:c166:3061])
 (user=irogers job=sendgmr) by 2002:a05:690c:2f81:b0:6ea:ecc3:ec61 with SMTP
 id 00721157ae682-6fb582571c3mr2102467b3.1.1739991447284; Wed, 19 Feb 2025
 10:57:27 -0800 (PST)
Date: Wed, 19 Feb 2025 10:56:57 -0800
In-Reply-To: <20250219185657.280286-1-irogers@google.com>
Message-Id: <20250219185657.280286-9-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250219185657.280286-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Subject: [PATCH v3 8/8] perf syscalltbl: Mask off ABI type for MIPS system calls
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Arnd Bergmann described that MIPS system calls don't necessarily start
from 0 as an ABI prefix is applied:
https://lore.kernel.org/lkml/8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com/
When decoding the "id" (aka system call number) for MIPS ignore values
greater-than 1000.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/syscalltbl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index db0d2b81aed1..ace66e69c1bc 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -46,6 +46,14 @@ const char *syscalltbl__name(int e_machine, int id)
 {
 	const struct syscalltbl *table = find_table(e_machine);
 
+	if (e_machine == EM_MIPS && id > 1000) {
+		/*
+		 * MIPS may encode the N32/64/O32 type in the high part of
+		 * syscall number. Mask this off if present. See the values of
+		 * __NR_N32_Linux, __NR_64_Linux, __NR_O32_Linux and __NR_Linux.
+		 */
+		id = id % 1000;
+	}
 	if (table && id >= 0 && id < table->num_to_name_len)
 		return table->num_to_name[id];
 	return NULL;
-- 
2.48.1.601.g30ceb7b040-goog


