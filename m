Return-Path: <linux-mips+bounces-7829-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB3A3A4CC
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 18:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF61F7A1FAF
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 17:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E320271268;
	Tue, 18 Feb 2025 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPKbgJ9m"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11687270ECC;
	Tue, 18 Feb 2025 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739901483; cv=none; b=uh0iKtoOv22OvLHmQ/qcro+jcjL3g3kSKHSj35LfOl1yCOjdR+YW0nYvvv/L78rpIEZXaRh2ychOyR9DYKCt3hkWTri3PfVvT49O98J5etaZzqyVhz0BqQ1HYd9QdrTjSmDhziApJ5Bq0GIaqrqYizBaVJR0B+aihFe5lStTRTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739901483; c=relaxed/simple;
	bh=cJ4imszoCMKGeyB93XcE2Aj6dhlMiYYoTv2JhP4p0RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ujd0wjfF26FxlTjAJUTskn3esanNh2FBn6/XdnKMKG/w2J2jBZBm+A5W/65XZKc74Bo1wzq0oP/n++I6ad/6K/GYvc6i9xcehVImp87SAN85GKaEerniW+kU2NJ5LIiuasxnCZbf3akBaKPoDh0cykBbbi4biSJxOxmGhHUwl+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPKbgJ9m; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30930b0b420so30885581fa.2;
        Tue, 18 Feb 2025 09:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739901479; x=1740506279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acUkvDOoPzVu8QFyEGbOwTRevnv3q6AoiZvxRlOpwJ0=;
        b=BPKbgJ9mgdkE9QfhSG0RPPykXOldv+vaJvLmUYeH0HhgQLLss+5wKSPONCaQh7hKmK
         8xx++Khjw1OdKYHOnNW4CBTTdM6+EYz7E9QSo6NG8D3du9L1nl3xeCt11wF/GxQfvVRO
         mJF79vtYtk+UhVs13Tax6e46nKTMx6JACCNcJQLuUJAZxWfcQUqwW/58U4v15B3GOyRA
         vaiYqsFD1gVxTw4xIOCX++ooilhaFXFV77cWeYavi2EXrc2rhoposNWzcAUX0i74UHuU
         9s8JGBz6tPn+jKiGsKLS687eLHmNcTzkyGY6vPNJn0yk3FaVHKOfWQiVmI12e9GgnlGT
         Z2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901479; x=1740506279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acUkvDOoPzVu8QFyEGbOwTRevnv3q6AoiZvxRlOpwJ0=;
        b=D0YyEZgyCyVQq2GsREJWYnqRmi/KVHlQe5RFHPkpp3dsM0gzxYf/C/Q1alrl2Snz6S
         zYbb9eC+cFq1zqv17DYkqtkS51w5osaLIoF+6sUMBtLYzIEsKuDYjeKpsSjnlv19u4wx
         1VIJ5opIOZmJvjehHYQ4xGHKFpYuSuyvkfIvAs1u5/S//Zmrk6nONKa4uYFAs4+FbMYQ
         uiZ1U/aASdmtKyPV1bX2KEm09dV+tcVNTXcVCJS6UEbnE9v8OemmXAHwUbBjzY93her4
         4EwWteV9GCrhI01rrjYV/vrVETDHuagSSwulJa/ETkczzAK7qXJf1Ex1aLhAbJsqld/k
         rvoA==
X-Forwarded-Encrypted: i=1; AJvYcCUAjdk0HofreJd8KUjYGPuUwepGgG8LafGPqBFKNaeJF9pBITsBfv4zgMetz9o0RKGDwKfzOb3TTeMe9Q==@vger.kernel.org, AJvYcCUNxzvJTYB8sLLtVZQMhZLmt8DuFZc6yahZKSWdVRGw9VFt2KEF1ebT2vUNgKMQcYbpcO7VkcF8Ftk=@vger.kernel.org, AJvYcCUo5iI5hqQN8Hs2JLsJNAWBNuOLxzavC3XWldA9OaTxUQRwp7XODk2XC/kfUdeqOLJE0cmyI3EE0X4XIg==@vger.kernel.org, AJvYcCV9HyJkaAVhD1cRcaP/Wp7UjiBMABG8yOjAUSdvTIciNmn+x0eYCKyF8R7vxmMvXqDv7wY/jG+oyqCQ6g==@vger.kernel.org, AJvYcCVZrqPUpskq33R0rq76pyDg4mATqPVo0cNzbImRcDkB9eBCaFNOCRSk9ZZJLHMvowFkjqBxrgm3sfr1CA==@vger.kernel.org, AJvYcCVfoHNme5wjPcl70RlD5jjPdcT5pgWI7TyKjElqaDTutZfI2uzC1YIMWnzzUGLzULOOiHky7h0yALjb0lAQpK0=@vger.kernel.org, AJvYcCWFKbYs9M88WuS25g/F7NRAY6rOCKOCAgvPVybB67qCuE3pN7WbGWuBpAcPOB/Dtl41NskuIf94FW3Y78/Y@vger.kernel.org, AJvYcCWVQWBKs2D+//JiRhIhElyjAbGMu5FZ7ReK7Ti61N5dryqrrGD9skG/UsK62GhZ6O0nmgJC9+E9g83bS2Zr@vger.kernel.org, AJvYcCWbtoV2rtNwMZ3U3k0oNw00MZrzVTXmHx51FdJe+cQ0oSJCQGSa/WxMeVWtyNZcwLTDUjOxliEcGKJo0lX/gw==@vger.kernel.org, AJvYcCXTGaDG
 Wi9AgTwQ7IdE6xxvUvPi8VwTdIsyhSAOmebaxe4DhXiPY8fMDJfIwhsAFIaFDkpwRXAmq20y3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwduN8PKL9nNPV371LVow6uLSNnPJLC5KxCVM8dpR1wIs7CXYKH
	rFK6Fcmc3Wzdst9njEJQuvcCScf6kjdcsVgL65xthdpS+bbx5BrZ/PpZ9EYz
X-Gm-Gg: ASbGncv2eTT6572Ncx3s9I/v38/55tJn0BZIg/N29ok7z9WA7haonvVndIxcWjnKsxR
	uuM34LrjshtC8J5fu1D1HK+a0cIYxs0mY+W1JNd+H/VIYpFyR379Ua554VeBgArouYlbZSRstC/
	yK4ONI8qGCy/fhyGkUD2pg1nM59ipt0WHaNWtJ4KNh+jL8ely1XTDGp5CHc4FS+ljCI8rkMha9i
	5fCCVav3FY/DS9t/67dtk/kvgj4PW2+bplFDA2urSBbwDd7StOp1cATsVqgSQZyoTCMZF9nHHuN
	Sp6pWd2uw7jV4FLDgYJxQWWjiLAB60Ud5atVJK4NDqIavuikyWl+uJfobHo4yw==
X-Google-Smtp-Source: AGHT+IEGlkLPaex5Nk+m7WgXIuMgOlltIYpcbCZK41uHBEuu20+yIMUmFVs0CaJEx31B2yiq1Zo5ew==
X-Received: by 2002:a05:6512:33cd:b0:540:1b07:e033 with SMTP id 2adb3069b0e04-5462ef2373cmr237152e87.45.1739901478771;
        Tue, 18 Feb 2025 09:57:58 -0800 (PST)
Received: from es40.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545254f7072sm1709286e87.127.2025.02.18.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:57:58 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linmag7@gmail.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ink@unseen.parts,
	kees@kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: chris@zankel.net,
	dinguyen@kernel.org,
	jcmvbkbc@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	monstr@monstr.eu,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
Date: Tue, 18 Feb 2025 18:55:14 +0100
Message-ID: <20250218175735.19882-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218175735.19882-1-linmag7@gmail.com>
References: <20250218175735.19882-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make pte_swp_exclusive return bool instead of int. This will better reflect
how pte_swp_exclusive is actually used in the code. This fixes swap/swapoff
problems on Alpha due pte_swp_exclusive not returning correct values when
_PAGE_SWP_EXCLUSIVE bit resides in upper 32-bits of PTE (like on alpha).

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/pgtable.h             | 2 +-
 arch/arc/include/asm/pgtable-bits-arcv2.h    | 2 +-
 arch/arm/include/asm/pgtable.h               | 2 +-
 arch/arm64/include/asm/pgtable.h             | 2 +-
 arch/csky/include/asm/pgtable.h              | 2 +-
 arch/hexagon/include/asm/pgtable.h           | 2 +-
 arch/loongarch/include/asm/pgtable.h         | 2 +-
 arch/m68k/include/asm/mcf_pgtable.h          | 2 +-
 arch/m68k/include/asm/motorola_pgtable.h     | 2 +-
 arch/m68k/include/asm/sun3_pgtable.h         | 2 +-
 arch/microblaze/include/asm/pgtable.h        | 2 +-
 arch/mips/include/asm/pgtable.h              | 4 ++--
 arch/nios2/include/asm/pgtable.h             | 2 +-
 arch/openrisc/include/asm/pgtable.h          | 2 +-
 arch/parisc/include/asm/pgtable.h            | 2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
 arch/riscv/include/asm/pgtable.h             | 2 +-
 arch/s390/include/asm/pgtable.h              | 2 +-
 arch/sh/include/asm/pgtable_32.h             | 2 +-
 arch/sparc/include/asm/pgtable_32.h          | 2 +-
 arch/sparc/include/asm/pgtable_64.h          | 2 +-
 arch/um/include/asm/pgtable.h                | 2 +-
 arch/x86/include/asm/pgtable.h               | 2 +-
 arch/xtensa/include/asm/pgtable.h            | 2 +-
 26 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 02e8817a8921..b0870de4b5b8 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -334,7 +334,7 @@ extern inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
index 8ebec1b21d24..3084c53f402d 100644
--- a/arch/arc/include/asm/pgtable-bits-arcv2.h
+++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
@@ -130,7 +130,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index be91e376df79..aa4f3f71789c 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -303,7 +303,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(swp)	__pte((swp).val)
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_isset(pte, L_PTE_SWP_EXCLUSIVE);
 }
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0b2a2ad1b9e8..b48b70d8d12d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -496,7 +496,7 @@ static inline pte_t pte_swp_mkexclusive(pte_t pte)
 	return set_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & PTE_SWP_EXCLUSIVE;
 }
diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index a397e1718ab6..e68722eb33d9 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -200,7 +200,7 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return pte;
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/asm/pgtable.h
index 8c5b7a1c3d90..fa007eb9aad3 100644
--- a/arch/hexagon/include/asm/pgtable.h
+++ b/arch/hexagon/include/asm/pgtable.h
@@ -390,7 +390,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 		(((type & 0x1f) << 1) | \
 		 ((offset & 0x3ffff8) << 10) | ((offset & 0x7) << 7)) })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index da346733a1da..bac946693d87 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -302,7 +302,7 @@ static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
 #define __swp_entry_to_pmd(x)	((pmd_t) { (x).val | _PAGE_HUGE })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
index 48f87a8a8832..7e9748b29c44 100644
--- a/arch/m68k/include/asm/mcf_pgtable.h
+++ b/arch/m68k/include/asm/mcf_pgtable.h
@@ -274,7 +274,7 @@ extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	(__pte((x).val))
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index 9866c7acdabe..26da9b985c5f 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -191,7 +191,7 @@ extern pgd_t kernel_pg_dir[128];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
index 30081aee8164..ac0793f57f31 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -175,7 +175,7 @@ extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
index e4ea2ec3642f..b281c2bbd6c0 100644
--- a/arch/microblaze/include/asm/pgtable.h
+++ b/arch/microblaze/include/asm/pgtable.h
@@ -406,7 +406,7 @@ extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) >> 2 })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val << 2 })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index c29a551eb0ca..c19da4ab7552 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -540,7 +540,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #endif
 
 #if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
 }
@@ -557,7 +557,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return pte;
 }
 #else
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index eab87c6beacb..64ce06bae8ac 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -265,7 +265,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define __swp_entry_to_pte(swp)	((pte_t) { (swp).val })
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index 60c6ce7ff2dc..34cad9177a48 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -413,7 +413,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index babf65751e81..dfeba45b6d6f 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -431,7 +431,7 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 42c3af90d1f0..92d21c6faf1e 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -365,7 +365,7 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) >> 3 })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val << 3 })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 6d98e6f08d4d..dbf772bef20d 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -693,7 +693,7 @@ static inline pte_t pte_swp_mkexclusive(pte_t pte)
 	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return !!(pte_raw(pte) & cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
 }
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 8d1f0b7062eb..7d6b9e5b286e 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -286,7 +286,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 050fdc49b5ad..433c78c44e02 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -880,7 +880,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 3ca5af4cfe43..cb86dbf7126a 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -913,7 +913,7 @@ static inline int pmd_protnone(pmd_t pmd)
 }
 #endif
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/sh/include/asm/pgtable_32.h b/arch/sh/include/asm/pgtable_32.h
index f939f1215232..5f221f3269e3 100644
--- a/arch/sh/include/asm/pgtable_32.h
+++ b/arch/sh/include/asm/pgtable_32.h
@@ -478,7 +478,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 /* In both cases, we borrow bit 6 to store the exclusive marker in swap PTEs. */
 #define _PAGE_SWP_EXCLUSIVE	_PAGE_USER
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 62bcafe38b1f..0362f8357371 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -353,7 +353,7 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & SRMMU_SWP_EXCLUSIVE;
 }
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..65e53491fe07 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1027,7 +1027,7 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index 5601ca98e8a6..c32309614a15 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -316,7 +316,7 @@ extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
 	((swp_entry_t) { pte_val(pte_mkuptodate(pte)) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_get_bits(pte, _PAGE_SWP_EXCLUSIVE);
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 593f10aabd45..4c7ce40023d3 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1586,7 +1586,7 @@ static inline pte_t pte_swp_mkexclusive(pte_t pte)
 	return pte_set_flags(pte, _PAGE_SWP_EXCLUSIVE);
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_flags(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 1647a7cc3fbf..6da0aa0604f1 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -355,7 +355,7 @@ ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
-- 
2.48.1


