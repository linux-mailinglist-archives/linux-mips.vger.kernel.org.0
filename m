Return-Path: <linux-mips+bounces-6925-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC3A9EA5DD
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 03:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0A37284D66
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 02:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C827B228376;
	Tue, 10 Dec 2024 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zt/AJBNT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120A1DDC08
	for <linux-mips@vger.kernel.org>; Tue, 10 Dec 2024 02:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798516; cv=none; b=jZxvBmUYDwzSTS1Amja2U6yWgbEkwuGRPdJf5/AInlKXyXXVXfiLO+e0zvvoBe3rf7GAB/dVtGtCleLQFbznQ1sviYsQd/crRmvyagBTzpZQQ5Svcpm9PwVmgA4JyNN3QnZUs8pouqrz5mkXwPLPEbxmnngC2M/AjiM272UxZdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798516; c=relaxed/simple;
	bh=6Jv3RrScO5w/EgDCugSyRpOSSLAIZEKRuKvKOtAXhc4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hNNUXpUfRExXxfR/MG3qRI+EEiSDP68eLeCFp71EsTDpoLkb52HgO4aR4iHxHavtUH/lxtYRbfX16XJgMwj4OtSoi/e6JVx6hDKuQ6TClMqrL1d2Q3IVuZPEY7ofaNOvMphJUEuGprlQG6VcplxnaGEK0+ebPantQjNobSsNnVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zt/AJBNT; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-725e4bee252so1842770b3a.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Dec 2024 18:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798512; x=1734403312; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=zt/AJBNTWE7S0YkQ89Ai+Cr+bI7/Vtl66s2tVTb1jo1Q8OXaNed+nZEzX/wjE9YxrX
         Qn5CH5DU2NqmxF2XnPpJdinveGr3qcpyTIdtVrbBvgcs5XBHqjhrrAA880o7Qseu/NTX
         WipFrylGDp2d8wF1+O/Vx5ZoSDaF8LCjFyxSG0PkoB0lrMkTWeg66H4kNmqo3EM1Yhjd
         ZElKPdKafEJ1YJJGbf8mriqE2PI8wTP+pHvFOdPPg9i58ggM1W4fkjask0VIGJZiu5x8
         ym3cuJmsk03eHhbJPVqQoLLdpfS3fC3rKNoJ9F0Dn4fVXY889iqh5QbHCWuXoK05GWD6
         Ll3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798512; x=1734403312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=DXjDoXMwdEnP/BlUoE2zQ26XjKWfGTE0YlK19iKG4crO/LLAhPh2CNGBOgR5qlbrE8
         FFAkvOqK5VboFuLbewFj9gLp9XMYb/xJxyGRLhbPyRQ5DrhSx3DNtOSiLNjcw3Y3WECY
         nRYsZxLsd9fmLYAXiyyXs5o2F3OYiYAf7tN+yxNBtlSJaXOEfiShP2RnyckLu47lON2u
         hX7xZAsRj6CMgrUCvlKconNMnbGmV7nHJ2u2Pf2IpRU8xifxZp6a2GKZ74bYC6VY+3AV
         Gij3ocqgff8OKprd+p/N12sHRsY7ct/61q0eGw7cMxDcga7UGIAaH95UnyZV4D8muB67
         0xIw==
X-Forwarded-Encrypted: i=1; AJvYcCXTv613AFfNVqiVybCrEH1bTSkMDdrOkeQRqKN9xfCLFxiIuyva8eTc5aipHoJne5JCen37N6Vwbp3c@vger.kernel.org
X-Gm-Message-State: AOJu0YzKT/nlFkYFMzLI3iCpSN4titFJqOzFeH1jepSWBFaewXtl0Vbq
	YDeWhPvr7S2gMqDqurou0IgosrHn52PEM+GZ1Uyl+xA2MNEBjCG3JuvYlzXxQUyAilkiPvpz+kv
	YOhR8EL3GPROp3A00qzSZrQ==
X-Google-Smtp-Source: AGHT+IH+U5NNduIwURg0BoDlPsKnnOIwfCnZdS3eRXACF/uPNRGoE141bvOCCDVesMcVlUE6OG1mnMpg0Q9mT2r6sg==
X-Received: from pfu5.prod.google.com ([2002:a05:6a00:a385:b0:725:f376:f548])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3016:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-725c8eab756mr18454838b3a.14.1733798512543;
 Mon, 09 Dec 2024 18:41:52 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:18 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-17-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 16/17] mm: Fallback to generic_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

If an architecture doesn't provide arch_mmap_hint() fallback to
generic_mmap_hint().

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index e97eb8bf4889..59bf7d127aa1 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -691,6 +691,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 }
 #endif
 
+#ifndef HAVE_ARCH_MMAP_HINT
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+#endif
+
 /*
  * This mmap-allocator allocates new areas top-down from below the
  * stack's low limit (the base):
-- 
2.47.0.338.g60cca15819-goog


