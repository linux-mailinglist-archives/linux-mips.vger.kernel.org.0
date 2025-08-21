Return-Path: <linux-mips+bounces-10403-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB65DB2FB4C
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 15:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FB6BAE6724
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 13:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29E9343202;
	Thu, 21 Aug 2025 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cpmcPQfb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3FC3431E7
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783812; cv=none; b=JB/UvymSeLw89X/eCuGpRol+arwmbq0gIwF0tHEBJUT3I0NsMNpOr3oSxmJzqwV72P1H0SdzRtlVUSCF1h/0ojWSD3NDM4K0x3IHha2L06Ba6Rf1DxG/D9iECbjcPuvwrm7Y4EjY9vQ1fEV8a4PepjGyUmMR4jCJSgU2LQPlwSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783812; c=relaxed/simple;
	bh=kDR7IcPzIqy9bbYLH2uEiJyNApziIC+MQ80BckAIB5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1CfRRb4GOaEwA0c4S9NtAKuQgm6mvCrkOtZtSTq2rne5UYfZaIu+xt8DvOfW16HHlXte/EJ7qk5wlXbqIfKoEFzdzo5ZyCLZSpnooDxslx487GNsLLY/7lmXZy4aP0xE2y2fdDBvY259KkNWmns4nMcbN4NzZYF7JXESP4yqXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cpmcPQfb; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b477029ea5eso928991a12.3
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783810; x=1756388610; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4TKKxJUqDz6CrlAYZ9i2quMno6mJSPy8hdIxNc2ssT8=;
        b=cpmcPQfbjUlWMhJNPPc7JicgOpKyhLXw1DdQkTh3drNSnOPdLFEjlpdVdNsOUcPZwj
         3I2QDYSrdLYTEA2kYP4yHGsxNkihn4EF2+JecaHUUANhJuGXAF90HdE3qQ/hC96qpnKz
         K6m2/QDiPgIEUEPW/LoUCJGp/pw3qSKOihaFaOIRpmP3UXC49t0FhvavZHW55GdaHwPz
         AU41+5hBmVNCuMloRaYD1Rc1yUiTPFSiZ7PnVwI7UkNlaRBHoyLzFkV1YXbIeWufPxLb
         7yCuZnwEUPTCTHGMme7hQNobEenKwGb7Aqlpw183GNRtU8b2DYtRhx5lVuK+zQ3W6QYj
         /KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783810; x=1756388610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TKKxJUqDz6CrlAYZ9i2quMno6mJSPy8hdIxNc2ssT8=;
        b=CK5X0o3UKYvcysCoqDPZPAQua82zVslFL/tjMEU/dl3y27S6xDxhGmiRCztYaZYhTo
         smPpshjMwfTn8sruhBWUVIhV0xxmxC/EZJBAvA9xggc+dnIxawPfnrpneR6EQVDa5IEd
         1VdoPiQoKS8kXeHQs+oMm38oI1FH15mAjWbEF+PqHZR3Kz53qWbrM8zk3eoIbTXbPGR9
         hAKk5bpQevAlge94V6QCdh1FpnIxzzQaBmFQGObZmjzcrAXu6p6EFw/vVAab9FbyqM7O
         xvJnpyZchEphxA+y5OECNtoog2e8FSOHSVn7pqQgu1FzYPAspZAabd/lnEwEh1EWPvv+
         CT2w==
X-Forwarded-Encrypted: i=1; AJvYcCU+cst9uRy5Rqzerd1DmveDrK1TLnvvBq7VhgyXpeRQe1oNFcmvM1kN8HaDP10s3bt9du5XCKh00/5p@vger.kernel.org
X-Gm-Message-State: AOJu0YyTeF3hel+Mp2cwAoVeJtJsjdgTDcOpbvv6MccqrtElGuKPPFTR
	EAbyNkc1qgZOQYj9R6dQy5Tynycqg9iS0ZxUW7aV15yH/7OlG18S2XTSKPqobIx/NGnC3G0XOBi
	eZWxMI0Ni/4AMdkerLW44LmSv1Gr9X/TzfBAT/PyTkw==
X-Gm-Gg: ASbGnctpyd7PAbrrY836nkhnUuci9fdPRsz4dqYWxLkxf0BVT1O2CUzfFZJ/cnJ2ds+
	arkowKnOBdI+1OOUqVF83jqDBPqzGkLgL0y5dE5GNMJkUxmcSk8t340gFrvGrtFzctiKDlIs3xG
	Fexp7Tp8wXz4RE1KohEtRsD93Y7JR2uuggbDREF83P8OiGxIIg1zEWxBxSxudtdhP+BdqA9RUQj
	qAE7vK6b+hhNTErgBGA+Z9WAMdQJ+Bb6OaX666PsyR3hVtLXAQ=
X-Google-Smtp-Source: AGHT+IELgByc3NnsMiO4ohlSNnw7P3I9l1WOk61YcazCJ1eLTSo0Jd6s6qKsge3KcqTIkNDOkvcx67/Y6od2fhS10yk=
X-Received: by 2002:a17:902:d584:b0:23f:c760:fdf0 with SMTP id
 d9443c01a7336-245fedc8c92mr33954055ad.45.1755783810391; Thu, 21 Aug 2025
 06:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYthMAr3w=U_GmbLPgMb7xNdjbqmxYWF0iUEuJzxnw3dxg@mail.gmail.com>
In-Reply-To: <CA+G9fYthMAr3w=U_GmbLPgMb7xNdjbqmxYWF0iUEuJzxnw3dxg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 Aug 2025 19:13:18 +0530
X-Gm-Features: Ac12FXweVlItcIxXxm0jYGOpeOdEH-mXExl8DfwFQGTW8B_Dt-4zHZjVzLsg8Gc
Message-ID: <CA+G9fYvkpmqGr6wjBNHY=dRp71PLCoi2341JxOudi60yqaeUdg@mail.gmail.com>
Subject: Re: next-20250821 cacheflush.h:61:3: error: incompatible pointer
 types passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned
 long *' [-Werror,-Wincompatible-pointer-types]
To: open list <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Aug 2025 at 16:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following build warnings / errors noticed with mips defconfig with
> clang-20 and gcc-12 toolchains.
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: next-20250821 cacheflush.h:61:3: error: incompatible
> pointer types passing 'memdesc_flags_t *' to parameter of type
> 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]

Anders bisected and found this,

# first bad commit:
   [30f45bf18d55a411f576afe48d50e78a2eef7e23]
    mm: introduce memdesc_flags_t

>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> * mips, build
>   - clang-nightly-allnoconfig
>   - clang-nightly-defconfig
>   - clang-nightly-lkftconfig-hardening
>   - clang-nightly-lkftconfig-lto-full
>   - clang-nightly-lkftconfig-lto-thing
>   - clang-nightly-tinyconfig
>   - gcc-12-allnoconfig
>   - gcc-12-ath79_defconfig
>   - gcc-12-bcm47xx_defconfig
>   - gcc-12-bcm63xx_defconfig
>   - gcc-12-cavium_octeon_defconfig
>   - gcc-12-defconfig
>   - gcc-12-malta_defconfig
>   - gcc-12-rt305x_defconfig
>   - gcc-12-tinyconfig
>   - gcc-13-lkftconfig-hardening
>   - gcc-8-allnoconfig
>   - gcc-8-ath79_defconfig
>   - gcc-8-bcm47xx_defconfig
>   - gcc-8-bcm63xx_defconfig
>   - gcc-8-cavium_octeon_defconfig
>   - gcc-8-defconfig
>   - gcc-8-lkftconfig-hardening
>   - gcc-8-malta_defconfig
>   - gcc-8-rt305x_defconfig
>   - gcc-8-tinyconfig
>
>
> ## Build error mips
> In file included from include/linux/cacheflush.h:5:
> arch/mips/include/asm/cacheflush.h:61:3: error: incompatible pointer
> types passing 'memdesc_flags_t *' to parameter of type 'volatile
> unsigned long *' [-Werror,-Wincompatible-pointer-types]
>    61 |                 folio_set_dcache_dirty(folio);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/mips/include/asm/cacheflush.h:42:27: note: expanded from macro
> 'folio_set_dcache_dirty'
>    42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
>       |                                  ^~~~~~~~~~~~~~~
> arch/mips/include/asm/bitops.h:89:70: note: passing argument to
> parameter 'addr' here
>    89 | static inline void set_bit(unsigned long nr, volatile unsigned
> long *addr)
>       |                                                                      ^
>
> In file included from include/linux/cacheflush.h:5:
> arch/mips/include/asm/cacheflush.h:70:3: error: incompatible pointer
> types passing 'memdesc_flags_t *' to parameter of type 'volatile
> unsigned long *' [-Werror,-Wincompatible-pointer-types]
>    70 |                 folio_set_dcache_dirty(page_folio(page));
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/mips/include/asm/cacheflush.h:42:27: note: expanded from macro
> 'folio_set_dcache_dirty'
>    42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
>       |                                  ^~~~~~~~~~~~~~~
> arch/mips/include/asm/bitops.h:89:70: note: passing argument to
> parameter 'addr' here
>    89 | static inline void set_bit(unsigned long nr, volatile unsigned
> long *addr)
>       |                                                                      ^
> 2 errors generated.
>
> ## Source
> * Kernel version: 6.17.0-rc2
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20250821
> * Git commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
> * Architectures: mips
> * Toolchains: clang-20 gcc-12
> * Kconfigs: defconfig
>
> ## Build
> * Build log: https://qa-reports.linaro.org/api/testruns/29616797/log_file/
> * Build details mips:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250821/build/clang-nightly-defconfig/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org

- Naresh

