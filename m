Return-Path: <linux-mips+bounces-10333-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB777B282A5
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 17:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B4EF189A5C4
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 15:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB5F232386;
	Fri, 15 Aug 2025 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="lUThUIem"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3741B220F2A
	for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270455; cv=none; b=k7Z5ucsgfsFSPPsIs6Ryag28vAXsfTVbl2KJChQm/2eFwdMY7By4I+nJXEBX+3g6bc+wRtxz1e9rSIAT6xVpDE+4uxkglk6vHMHkIYQG1M5imJMRF69t479WFa8ZNQP8Z8SUPucqOWOetVfvlN5cHc4gjxUo+mA1vlCdGyziyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270455; c=relaxed/simple;
	bh=HPdnoqfMTW5K8PpSXd0uxj2ktrGo1NLLAxniXY1kt3g=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=hkJ+LjICmItQpUVeJRLOc9+uA/gM+f9wa64gWVizIil36EUNfEAUyQmd8J0WfeQ3RtiP86xf6OWpG0/v+HNDnv9WC2XLURRqTp4HDyVCI8yO6ImWuUiX4Oh62N3GiPLBl89RlnC2leMkIijQoEUOtEmLMCbeEoUVMOmUtrF58JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=lUThUIem; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so16286b3a.2
        for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270452; x=1755875252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHLPRMwsFUXklJ+HOrV/DsMAdiggx2WSG2UfKCJiulY=;
        b=lUThUIem/GAn1juJ789DpBzJqqOXtenJ8ovp+k0VW42tuXVED2iih61YudRRfo/koR
         6XDQTwc0FvhEA8C+CGQIN7lv5nO0yaggRtbbI4fIbxVqIaklYdKSTivQb5gRgHtPuM6z
         vQ++YMoCCotkEYF1eJPj+P/U4AvDX5UwDYrRHniU7nsHpONJGYJU5lssxyX4g6NYHApM
         dpLdZHs7Y5L6mu/+7oT4WOSVm/SyJOMkwW7ZMqYbNRsgArNjotlaz28QE78DTskOmRuH
         qglEE5IRztkbiqSHK1axpi1ik5vE7Z+Tu+l6kj7lNJ3QmiiL1viFjCCcfDfMnqTBBtKa
         qFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270452; x=1755875252;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHLPRMwsFUXklJ+HOrV/DsMAdiggx2WSG2UfKCJiulY=;
        b=HbuMQeMOXRjqc4npLROs+QSF2Pg294aMDdFB4RiONEmJjCqvKzqY8yZhAn9bPYGJUr
         eUMlbQoaFP5pBFO+ea9VWo1G3GxF2qE+HWuTMpeJanJTsBelgmvvvrzg07p7qzJW6Rgh
         iPzQUxw3ETvudwK2c+INAG8/Puq2wUdxI76+ysapKCFeFIiZ1e8UUJbj1tDNNDhtdLvp
         a5qlWSAMOTEUeoMmWfAPtCTs2y5An+vmlzjEoPcADDjOeRLjk+fvQkwsiPffVuxP7Nhj
         kYSLV/Qt2vYT7YnNlZgjgL6VufotDhTGb2otaSiMuWZ6HiyyPo1UX3sHiYwdCeZKQk80
         Av/g==
X-Forwarded-Encrypted: i=1; AJvYcCWLC1nd+9qWj8ymapN742Lm1Csoy+Y6c3dHbMHoRIhz/GCUWB8ytkJbOmvOQwCRiECOpy0SotGOBGIc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2dNdojccrT7tTnee8nI11wFB3me4Y9MQyfLDkrLJ4RC69QOwR
	9eU9HSy/JGWn5A4zTDjjQJrg1dmByrWFD60VFyJRbgom3kQgFlGKZAgZmO6oYCBN8gw=
X-Gm-Gg: ASbGncvoZeaLYeGOOmyvHPy5qNnAaPmlxKWMutE3Yq/RmldO4wsak1T/kG0kCLrHhxk
	Xsp+QBEY2dEJiDGOzEvD3pIAlC4RV+yqNZMDinyMEJjwMMjf/ydN/AX4ZPDA8nbzJrtO8TNK4W3
	in2JwrQfNBI0QtPZe4QywgQXryR/qM5qPWUAzTNTVT25J97Znwr7xx8YNzgkY1yypYwjvk6uqgM
	CgCbUpP+arCEJAcfydzeNiQ15CKo6XQyoxkZoNRVdS4nbdx/f6oC6OMkLqIB/52C4FZawv/ctZl
	q5icg1/I5ndB6qtVm+nMBM7q6N81LvT7AwCL+qW+wwQAzNTEwpCjnc8jOeVpz7p0rZpFmvuV/G1
	GBaOqqKzyBUJ0TjTZxxjvwmyKyhDYVGgcSXg=
X-Google-Smtp-Source: AGHT+IHmxnV+YR9cR/LeaPBJErhvHjNkppxMDemXEcOX3MCe4Sp9OWex1hLOxvkMk2wkz7dST8S4eg==
X-Received: by 2002:a05:6a00:4f96:b0:769:a6a2:fe1e with SMTP id d2e1a72fcca58-76e447e3389mr3104455b3a.11.1755270452302;
        Fri, 15 Aug 2025 08:07:32 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e4558bf19sm1309791b3a.99.2025.08.15.08.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:07:31 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:07:31 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:06:56 PDT (-0700)
Subject:     Re: [PATCH v4 17/24] riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
In-Reply-To: <20250812-vdso-absolute-reloc-v4-17-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-540E0EE0-A9CF-4EE3-9E71-969B40D29C50@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 11 Aug 2025 22:44:30 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> All vDSO objects need the same treatment.
> To make changes to both the list of objects and the list of removed flags
> easier, introduce a helper variable.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Jan Stancek <jstancek@redhat.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 9ebb5e590f93a3228c451dca58e6d5cfbbc03ff7..c19c3c76f7c9f6b2f7523a59269de3b683656323 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,9 +49,10 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
>  endif
>
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_getrandom.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_hwprobe.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
> +CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
> +CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)
>
>  # Force dependency
>  $(obj)/vdso.o: $(obj)/vdso.so

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Also assuming you want to take this with the others.

