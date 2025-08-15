Return-Path: <linux-mips+bounces-10334-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94348B282AF
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 17:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEB7660399C
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 15:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D7226C3B0;
	Fri, 15 Aug 2025 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="V1V8vZLL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4822616C
	for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270457; cv=none; b=f3gTxNqd13q4v2MaGZq4waIK0fQE2qtawOcJSplS87T2A/8b+pkYRmRt+X3NsF/zIBPgNA7it0EkwL1VcjyAPtEzm2rD7y/YsKwEg+7r+y+Q8+FkitwhEBOYO4tyflngFy8pLrXf7PAjOLZa4zVBipr8w8RhoMb4OZa+b0gudxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270457; c=relaxed/simple;
	bh=k91CyiH72FbwUJJuYjdfRL6Li8iR2YI2J5hUcfGbFcw=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=LJWFchTCocDHyCiBFROjrN0YZ6AGb5bqK0VsBUUIyG/NDMUJ0gC73r1fWzwAQCJXH5JNDXGm4X4xVs4nangx3SO1YspGgJKeaXKhEIzZd0VMpSve4UkdLZix/pdFhliU58YegHqdcd+6UbSDtaDu1vHLIT4UM4lLt5fIfDcQ/oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=V1V8vZLL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e2ea887f6so1610964b3a.2
        for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270454; x=1755875254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=V1V8vZLLC3XqTr5BY3aRTEy/7FEkb4phsfSv2eD/3zEGMqChM2sM7tvO/hNvReJWav
         J25J7BRcBMcU9omfdYApgtZxoVi+oPHI7vD7eHOmwQfBl3+cnheLfl8QeBN9odBm0gqW
         sOjtA+pqXn3sgT8EjL5rCARFhCb5jnRNt9MLf80mP4luYaAGPLBMGUAcWzYrIOq/Ht3+
         v/o/W2zseX6QrVKidYWLJjMHZvfqo2Zb6kBqiZzDsX4W6fWwHzTrK9iWknEzPqsw/x7J
         7EXxmC6H68/kce/RywkOZYliG3qecHFSg0ly51rydhuOi4rIBIuER5UrDqihzZozUJS0
         761w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270454; x=1755875254;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=NlBWai2LqI8hvmtwFPXLZ5SSyTxthIFxUJNhu1sYL/1FHQaUByDtaarSjLqjZfYno+
         81n2JlwKTDBSuJ1UirsBHodynMGGd+Vt1/uRrAB49LCBVo+VUGHByABYOO/7WWFtL0PT
         f59nd+DHXekHoScFzZgjo0fkc1+bVVSfrHe5AlBQSXe351gqf60O6++yKZyCC2bc/pVd
         0hGQO8Yv1MvtuGLLHUSsl/uLg748EDUWG0FoVvnBvvbU+DItZ6bWZGqu+/IIkpnw5Z35
         sgweNrc8d1HB7XKiGCl3ZugJJdwU4ak0SH57sBxvjOj8DKuSSfbWGbnWr6eM+2VZm3Kv
         HZCA==
X-Forwarded-Encrypted: i=1; AJvYcCWVhyiHt+zhzZRRQCkh3WHXant786lp6WnWv8BSQ2SIwIlwHRA/gGqNToqiftTjcHy1KQrvkv+E16rn@vger.kernel.org
X-Gm-Message-State: AOJu0YwrcFOaPUPmCS/hstwO/3yiOKFB8ZJ+jB3qt5GZAdeUSF4YNibI
	aBC1iwzd6SdFGUBmT/cAhD+DjnEv4yJ5OidvAl4JvSC721AONTR9PFCGSZi3DYd6mCw=
X-Gm-Gg: ASbGncvrS9j8+XcEzOf2tQ6QEipENIgVGKcaTbyZsiHCVEpSmqSRwX+hxo2geWxv4ej
	ooM29ZWmqYczdwTPuk40BzuZrHfHE+ia3CweUn9OC+DJMYIYI+qxBbcJy36tdzuEJ8CuCeE3E0u
	yPyBQwOjzSQ5j8bAGvdKZcWlzXMuybo1r1qErciGC8hO187YuCUL/T2ow3u23aPJP+0euGTIHML
	JgG3mviXf7BENqMAVdioOaWuEfxdNC0bnjI5VtA+KUBFx6dTcm5OyaB+uR1rWWcZOetTy/cwBf2
	XtWvJ7AGBxpf0klxTxPb8KQVmrInSkystTiomTntRfMxuaheC3r308p8cpuGElKxQXcxpdGIJ/8
	wakmoO261zgaglEGmJiRiyEh80ChtVOrqv0A=
X-Google-Smtp-Source: AGHT+IGQbGMaqUCBVjgHpE03NJ6lUtJGuN0cfMPLFV18k27l43zYHixLrnt22lRnZXhrjts5z9io5w==
X-Received: by 2002:a05:6a20:1611:b0:23f:f5bf:35d7 with SMTP id adf61e73a8af0-240d3039205mr3462386637.45.1755270453673;
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b472d5e58d0sm1499710a12.23.2025.08.15.08.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:07:29 PDT (-0700)
Subject:     Re: [PATCH v4 18/24] riscv: vdso: Disable LTO for the vDSO
In-Reply-To: <20250812-vdso-absolute-reloc-v4-18-61a8b615e5ec@linutronix.de>
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
Message-ID: <mhng-146EE95D-951E-41BB-898C-033437B27EA3@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 11 Aug 2025 22:44:31 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> All the other architectures supporting LTO (x86, arm64, loongarch) do not
> use it for the vDSO.
>
> Its is problematic for some upcoming compile-time validation of the
> generated object code.
> The LTO object files do not contain the necessary relocation information
> and -flto-fat-objects is not compatible with clang < 16.
>
> For consistency and to enable the mentioned compile-time checks,
> disable LTO for the vDSO.
> The vDSO heavily uses __always_inline anyways.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Jan Stancek <jstancek@redhat.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index c19c3c76f7c9f6b2f7523a59269de3b683656323..9f1bf5bae9bd473e43d9fd3022e9e1a185128b73 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,7 +49,7 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
>  endif
>
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAGS_LTO)
>  CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Also assuming this goes with the others.  Thanks!

