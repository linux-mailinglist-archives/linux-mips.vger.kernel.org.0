Return-Path: <linux-mips+bounces-12946-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE8D2ECFD
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 10:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 226353007EC3
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 09:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE5B357729;
	Fri, 16 Jan 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RmD3dzY/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8843570BA
	for <linux-mips@vger.kernel.org>; Fri, 16 Jan 2026 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556064; cv=none; b=FEf9rYOAZr8hoD0qAQ0Obha0RN+sMw/SrEAs6jagBADqQs2feY8F+YJSYJPr5BAsZ4gV88S9aOXcRTbU2LccOVCfyYzpgX20fr3+9EyjfIA4jzn2ulMCXzTr2retnuBUuvv/q764cNMeahM49LxC4YZxugg4hVRzqQ235Zv5HPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556064; c=relaxed/simple;
	bh=Y/JLcurrP7hYPL4AV5l4OWDyDh1zMqiBUjyu5CelejU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lFKh+uhh1zDBhKuEfIB6FFr1q1n8lAcH1wkbRGo/yUkNiUK5mh+AkT+znkNxElP4fKVkpO79yq6TGlDKXk+QcDzJLLLTFSScupFhEwCeiiOLpFaM5FtmrJozWCpXI3Tq23ha3O6RHpL4Rndsaup/K3jC4EjsO99Lk9qdlcGrsig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RmD3dzY/; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4801e3aab32so3554105e9.3
        for <linux-mips@vger.kernel.org>; Fri, 16 Jan 2026 01:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768556060; x=1769160860; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dobnQlzcQXndjhDiBs5Er5oWRxsPFXQMWQBLT95H/Xg=;
        b=RmD3dzY/W8C3I6tJGDoFsy5rUuH/R1aAelNstbe8H2DptFvQvGPksFgYGBv4+H25w2
         AEtP6o2EZEXce9dC6Fknkuq3Tmx2xZXymyJBPrCNW1wr8MFDZuuypGZkz7Xvc3U+TBAn
         4m7v/c9c+PtFjRqpaXA62RmuNBfnnQaPO+t7Hz8VkmevoXbsChDYyD5UDvA8XqiiI//3
         viN0iF/VAft7ymznWtNYQXhGLhnT6mTIfYUHuEe0YR704HT8M9d7ZV0ker+Wjd0AKu81
         9TPPcBhnL8eGgiBTP9+C81X01I9P4dGeCjjnIFC2Je8k4yA4nFo9hACiZD9Hgw8837DG
         eg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556061; x=1769160861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dobnQlzcQXndjhDiBs5Er5oWRxsPFXQMWQBLT95H/Xg=;
        b=qFmgeDlu1UrwPv2HiZ8t9w+DY50puOkRM5regfZfbdZ6h9H3W4zD+rIarMgg2LDjlb
         aMdFZkIf0q62amD+9GmPU7h7Q8F/f67cewHaxCOHrQG5YYr7rrABj1HLmqz+Qqy+TbYx
         zOze+ovyGtozD9PNBsaqsIjzpK4Oa6H0G+d74vIPfsjcdKBbJon19lMcFw6h7JttRMqz
         LVrjg+Gsra7XYeCD1E28PZIDDEKJoBTX/n20hyia6bNFBDRlitR7FeTuFcJyeJoT2n76
         5eMxOJAjGAQ/h/yjCUOTx2fdcwUJHt82U9IbP3RA/Nw2TDr6UPFE2HaUZMZtcRMMMcdL
         MXnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCSErMgp6nEOtRczZjgj9eodZrzu2xb7BkTpFOlFOa8YR8Z2TNY4czvfL9Qk4OQZ56xjiM7y9FJsaS@vger.kernel.org
X-Gm-Message-State: AOJu0Yytt5cAzx5f/4iEkNx3ZAYG4Xy7b5spBEGlQt5JVmzlk2i9v1ec
	pNEc2681Ae61IVPOBl1fvhLWGn2AZ4Gh1ExqmpvSNj9U9S87zKNu2feevzJPsrT5t0q6gLaTTg=
	=
X-Received: from wmco13.prod.google.com ([2002:a05:600c:a30d:b0:475:decb:4c4d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5248:b0:477:b642:9dc9
 with SMTP id 5b1f17b1804b1-4801e3459d3mr25659335e9.28.1768556060718; Fri, 16
 Jan 2026 01:34:20 -0800 (PST)
Date: Fri, 16 Jan 2026 10:34:01 +0100
In-Reply-To: <20260116093359.2442297-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260116093359.2442297-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=ardb@kernel.org;
 h=from:subject; bh=DUkB/GIoROOowZ3yMGbRxpDeWaywIuqMepfO7ycB2TA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JITOLjeO/9crlrv6HHGMT1oTLXg3eZzZ7nocCV6f7nuPX/
 H9kFH/pKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOZvJThn2Lwjg8vrmw/smH9
 xV9lbhIhKZINZ+5MZ7adumSKbY3FIyeG/3WHvRslAtJvO5p8KszUeGCoFxvEUeDP7nDx6+0uS5W J3AA=
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260116093359.2442297-5-ardb+git@google.com>
Subject: [PATCH v2 1/2] mips: Add support for PC32 relocations in vmlinux
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Kees Cook <kees@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

MIPS supports PC32 relocations like most other architectures, which will
be used by kallsyms to make its symbol references visible to the linker.

Given that these are place-relative, they can be ignored by the 'relocs'
tool, just like other PC type relocations.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/mips/boot/tools/relocs.c | 2 ++
 arch/mips/include/asm/elf.h   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/boot/tools/relocs.c b/arch/mips/boot/tools/relocs.c
index 9863e1d5c62e..30809f47415a 100644
--- a/arch/mips/boot/tools/relocs.c
+++ b/arch/mips/boot/tools/relocs.c
@@ -79,6 +79,7 @@ static const char *rel_type(unsigned type)
 		REL_TYPE(R_MIPS_HIGHEST),
 		REL_TYPE(R_MIPS_PC21_S2),
 		REL_TYPE(R_MIPS_PC26_S2),
+		REL_TYPE(R_MIPS_PC32),
 #undef REL_TYPE
 	};
 	const char *name = "unknown type rel type name";
@@ -522,6 +523,7 @@ static int do_reloc(struct section *sec, Elf_Rel *rel, Elf_Sym *sym,
 	case R_MIPS_PC16:
 	case R_MIPS_PC21_S2:
 	case R_MIPS_PC26_S2:
+	case R_MIPS_PC32:
 		/*
 		 * NONE can be ignored and PC relative relocations don't
 		 * need to be adjusted.
diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index dc8d2863752c..aaef0eaa68d5 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -123,6 +123,8 @@
 #define R_MIPS_LOVENDOR		100
 #define R_MIPS_HIVENDOR		127
 
+#define R_MIPS_PC32		248
+
 #define SHN_MIPS_ACCOMON	0xff00		/* Allocated common symbols */
 #define SHN_MIPS_TEXT		0xff01		/* Allocated test symbols.  */
 #define SHN_MIPS_DATA		0xff02		/* Allocated data symbols.  */
-- 
2.52.0.457.g6b5491de43-goog


