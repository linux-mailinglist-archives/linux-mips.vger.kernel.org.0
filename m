Return-Path: <linux-mips+bounces-12724-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36520CEFCEA
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 09:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF0C830213DD
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 08:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB3717A316;
	Sat,  3 Jan 2026 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrZts75H"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531C1A08BC
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 08:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430070; cv=none; b=AtfQM7aJ7Zb+Ag+6R9yiU1riZRK8HO0SbmYU61Db05Hiq6SFoNdXtrbSRl7XXh8gxsT8ZRujwB2Eqam4tRVI5S1qsUT4KPPIPkRAqwbJT3orWheheKWdPVOfL4OMdvQKoijg2ARBTRLhHYE2N9C+yj3wpMceBaK7G4eW02wdrDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430070; c=relaxed/simple;
	bh=e5hoLtxYWSBKCaXnzyOlvdkNn/9oqCrmBamB2u6C5RI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XL2HlLCCqPrbtRPeIekJWMOmt39gGseL4DKj4DH9/6AHMTJvSDcnkPi52nae47TqNOs1kEFTLx3q9PXmsj2v7LOzCQ2H7F/Kr9zwYWTfZIbf2zqMf8XlP4qJ3J04qbkXNau8rRpTYPNvRxw3WE3w3LNFc60eLY/mZDfo9sxkoVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrZts75H; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7f651586be1so232605b3a.1
        for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 00:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430067; x=1768034867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LLfzaNCKblQsWrgVFWjAAIDp8UyGda/a68IUZKqrEfs=;
        b=KrZts75HRzouzgG+XYA3TsuMuTGd957/RdLxYB6+BJjO4MuoooVt5TmExf57G/aFgb
         fBfNCBHsoTliQNgUSQiOjm3xt3DxZd4LrF5UEqgP3cscxq8ooI/fkIDCJzZbLCh3QyNW
         BY/l29Bch6zhxtS2DRajxc2TxZ8OOnjz8k7fNhPZpY6UnAEPggwBlrezeNF256xuWaXS
         1RWR4GX8ealUR2bdhWUHkgMPYKGNX8Puja/NLu8Upf7ElL2gSsLL3tV1I4zpMOxEkmEU
         UXTgBfJDWLAWXJNw8tZtG5TachYD2WRZaJ+2AIVxSHaCdCSyNlr0LlTRedca5buS0Lxl
         ziGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430067; x=1768034867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLfzaNCKblQsWrgVFWjAAIDp8UyGda/a68IUZKqrEfs=;
        b=ZRJDwbf4e5PKuIjWkAX3KmdnIhnjYAHhU5H3SrTJsn7A2HKnmMwFqtkRA0R5kvBEcr
         rf+tUmv5bSm8AntthLs/Q/GrMnqkJ60G+4Gw/pcgLQo2A0uY64Ug9cDwmRiyCuQnQiLr
         s8Y/+JR57ShtEXHQQqZbjeRMW05d1+tfGAq9hhLhTHWCpXQytysRhfnU4BE58qUUgZVG
         992u1oGZMHJexpPR+ZUo1Q4+XmHi0z1bcQEvhXqqzMhHt/HTIlUGanTj6xpYlMVOfshX
         updUkU5R3dmm7Z6opSHF9Xm4Ebg68r/MxnSulyB5c3W00TIARB5OGFv7IN5sCd0v8q6D
         yZqw==
X-Forwarded-Encrypted: i=1; AJvYcCWhf2RzngbXPtqJjH1SwqZrApqP3Fi5QSUfpJV3OoXOA6eCqS7NQmwqKJPlCA2t480/0kOdCkctGsuy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wvwK23odPnfhv7Hh4YF/hZxg6TjDo7rqsjHDhN5hU5YoQDeS
	EloETYIJaeQdVzgiIaXJbVofXwDe4hL2XRVlI3D4URQ22wSP7ljdZa3a
X-Gm-Gg: AY/fxX6g1UlhiKMJc3VNuOY8GnX3oHT3PCle34391wAPzDKe1Cw2fklff7k3ybWKAVl
	Xmf7oLNSx+bPSMXKybLpOnB6teLJQAWTpE2pCuMRLnFz6P+zncOvjP2lNGbk5W139Iot27LJpwU
	gOJDl/dXyzdqFOBSZYPLia2yBel9V1qGHZjxl8sgGoHmS3Ajobp/0bCPryP/gACDhdvoaI6ZM2K
	wOCNtxFCdF5fEZzNOLzMNBF+EcIh/OX16A6O9MJCbPok4JDNdpnRVH38DIGx8qC/bWbluuENE7u
	QnCW0YTcyDMBKsdJlhYt9YdZkOJiQKT78xc0Txwdsd7hDDHojBMAksZqpPWHQ22qPQEs2Y2AU+E
	ge42Y4slJ6sXUycILjLieWY1mm69e6nN+2A5aIrXisRbkMZ/hn3X3U7oAMIqh3o95LdOocrPD9p
	FoOtRARzWqwtsHC8ZqmGHv+ofSSNZDn6JXNTs=
X-Google-Smtp-Source: AGHT+IFlp8qcq2QazAOf3KnrJVHQQLc5fUVTVkMNEtXBSYaNUnUycb5/s395woDebt+kaXn7KmVKuQ==
X-Received: by 2002:a05:6a00:4ace:b0:7e8:3fcb:9afb with SMTP id d2e1a72fcca58-8148ba19ccdmr1341264b3a.17.1767430067508;
        Sat, 03 Jan 2026 00:47:47 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:47:47 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 0/5] uprobes: transition from kmap_atomic to kmap_local_page
Date: Sat,  3 Jan 2026 16:42:38 +0800
Message-ID: <20260103084243.195125-1-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of kmap_atomic/kunmap_atomic is deprecated. The purpose of
kmap-like functions is to create temporary mappings.

kmap_atomic() typically disables preemption, while kmap_local_page()
allows preemption.

According to the documentation, kmap_atomic() is primarily necessary
for contexts that cannot sleep.

> kmap_atomic() may also be used by interrupt contexts, since it does
> not sleep and the callers too may not sleep until after
> kunmap_atomic() is called.

> kunmap_atomic() may implicitly depend on the side effects of atomic
> mappings, i.e. disabling page faults or preemption, or both. In that
> case, explicit calls to pagefault_disable() or preempt_disable() or
> both must be made in conjunction with the use of kmap_local_page().

Link: https://docs.kernel.org/mm/highmem.html#temporary-virtual-mappings
Link: https://lwn.net/Articles/836144/

Keke Ming (5):
  riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  uprobes: use kmap_local_page() for temporary page mappings

 arch/arm/probes/uprobes/core.c     |  4 ++--
 arch/arm64/kernel/probes/uprobes.c |  4 ++--
 arch/mips/kernel/uprobes.c         |  4 ++--
 arch/riscv/kernel/probes/uprobes.c |  4 ++--
 kernel/events/uprobes.c            | 12 ++++++------
 5 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.43.0


