Return-Path: <linux-mips+bounces-10402-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB7B2F5C3
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 12:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38D3860214C
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 10:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E528A30AAC3;
	Thu, 21 Aug 2025 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ub132h5w"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF92ED17C
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773828; cv=none; b=XAUysTgaghJyivF5MW877m0eZwOam+6Em6RpSGd3U+OS86U4KvwY3BP8zFnRD6NSRamPGGwxN02OxlV0YLY8hvmrtKuEU9Hh8CcOp1cbLK5WA36naU/+i7taRtgGfM6LfAtwky7lMfQYxJ2xQv8V7OQ1pVMoCAJlpPjM+comYgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773828; c=relaxed/simple;
	bh=GKkrz4iTgMP3imRBkVGMq2ugMtvxmgGCSinBgcoSxj0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qcrp9BhecDhwzupqQFvW7Lgu+2SpIjpho0k+EfIEIdfAObikDEp/4rIedTL8nTUydI/DurnDOCPrP0oAp7G/FSwNPCvycFHmq8z/VeiMTZIkBeTY9Suol9G3NzMOT0awPxXhlj2drQr1Xe8QH8nHB+ZYg0tCt9yBHDNTD5ouWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ub132h5w; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24458263458so8116965ad.3
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755773826; x=1756378626; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BXsydsgT+UVZBwSeBHcvaKFCB1p8eK/mNY2QWJNzsz4=;
        b=Ub132h5wLZljsceEqWrqYBoiEsksJnjp9idY//OntJWF+Y3Fbv84Jdwr3ZS2yi8gQb
         OvTgeTa/xhsP1m7hJIWI6HsUkqPEjangqFFXiC/hXNHja9hrkTXW0O4Gw+dBh+3WVh33
         VsIlcN2xx9eE+6xuldQxj+A/SYtFJVe2JMOYgNEEJueTSEgKmmj4mJkDsgZWQlhcn2LG
         JReW2S8/fJtUeCIcVB+V7W2ojXF39AUJdX+U5qMxckgPyaeKT3Cbrq9b8ChozbKMlbOL
         x2I91SFfFevszOZlu5In52jME6bCM+2XJfnGWxVE1XIq1m/RRquPa1XZ7GA58r/vIKdy
         f4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773826; x=1756378626;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXsydsgT+UVZBwSeBHcvaKFCB1p8eK/mNY2QWJNzsz4=;
        b=DTBfyxd90opd0+Ju50kYthTzUGKR2LRLLHLydaSkBYhBG8OyRREkR4rOY/8lOjJflq
         /qhK5gLwpGWBRMOoFptw2ut2FoCq/dRNYN7+WuX8IKvBadRHxBm1bbrqsjoUSW6sSvu9
         aoWzYA+vCgh5KFteRuCAkxfz2nnRpaUkA/s5axR/4gE3mUlFoFh6IF+9ua0cRSw2+0D/
         cm32XbbGJ6J6z9sPHLiYhZHD010itDxjMhnXS9ZZelOaHjPJT9A7sp24NhUebNSnOB1n
         NbzYWhE3E7tZvAiSN/Z22QgFtw0uZQgDJorUZ2xZxvvyLqWqSy56bUXzrut/YYyZIl8K
         1NSg==
X-Forwarded-Encrypted: i=1; AJvYcCUWjXyr4Ceflwl8LmSuisq2YYpWyIwa0hoEOAd8SYGswHvnyD8PDJHtq/oXjbV4Y2OpPATBgR2GtV+x@vger.kernel.org
X-Gm-Message-State: AOJu0Yze+fx6AIpVb9KYv+/nRADG0DE4sF1JuTo8CRqLAbGuFMqQ4pfX
	CE9JVUm6VNx3MRQZi+mG712lvTCi0prX3HCSkBYhisid/XwT9d3S4pr76KlWnzX1mYHFKPqxiOo
	agmICdBY/XudTeaDM8WCdb+rout3WXyZemH10l9f7IQ==
X-Gm-Gg: ASbGncu5qV5lcMfOMkNlXZZXcXozttxe0G5JgL2NYUjJoRrGph4WhRrYOhJSSt5TMbz
	bLfLmALjHq4lFnBWw9pNRUP7WKbF/x3QwNdYPlMwVf/KQO10WciKD9XAPl3N1ynhXHNQbQwuQnF
	RVt6rZ6fyrxbNSCd25a8wxN+sn5Q2/oscqiBpygCAZ+4riS+ywvluGO3gHVzRU1BQ2bN4b9TYD4
	X9b/lQqRaJPAFN1z6tVwDVaXRJCOGKinY7YBQ==
X-Google-Smtp-Source: AGHT+IFA9JWo/za7RvCQ3N8qUZg3xh+FzJDUXahmuU7qDSv65XS/0qQKuLW50NG6gdpjZGNKx/9zfTkOGpG5BzWpnok=
X-Received: by 2002:a17:903:b50:b0:240:6fd0:25b7 with SMTP id
 d9443c01a7336-245fede05e2mr27786565ad.38.1755773826455; Thu, 21 Aug 2025
 03:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 Aug 2025 16:26:55 +0530
X-Gm-Features: Ac12FXwxxHIFgYcRpbKhe10fmgTcb2IwuVwDMdkZzGeMc7x8TUDiIvJE5OkVtOk
Message-ID: <CA+G9fYthMAr3w=U_GmbLPgMb7xNdjbqmxYWF0iUEuJzxnw3dxg@mail.gmail.com>
Subject: next-20250821 cacheflush.h:61:3: error: incompatible pointer types
 passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
To: open list <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed with mips defconfig with
clang-20 and gcc-12 toolchains.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250821 cacheflush.h:61:3: error: incompatible
pointer types passing 'memdesc_flags_t *' to parameter of type
'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

* mips, build
  - clang-nightly-allnoconfig
  - clang-nightly-defconfig
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing
  - clang-nightly-tinyconfig
  - gcc-12-allnoconfig
  - gcc-12-ath79_defconfig
  - gcc-12-bcm47xx_defconfig
  - gcc-12-bcm63xx_defconfig
  - gcc-12-cavium_octeon_defconfig
  - gcc-12-defconfig
  - gcc-12-malta_defconfig
  - gcc-12-rt305x_defconfig
  - gcc-12-tinyconfig
  - gcc-13-lkftconfig-hardening
  - gcc-8-allnoconfig
  - gcc-8-ath79_defconfig
  - gcc-8-bcm47xx_defconfig
  - gcc-8-bcm63xx_defconfig
  - gcc-8-cavium_octeon_defconfig
  - gcc-8-defconfig
  - gcc-8-lkftconfig-hardening
  - gcc-8-malta_defconfig
  - gcc-8-rt305x_defconfig
  - gcc-8-tinyconfig


## Build error mips
In file included from include/linux/cacheflush.h:5:
arch/mips/include/asm/cacheflush.h:61:3: error: incompatible pointer
types passing 'memdesc_flags_t *' to parameter of type 'volatile
unsigned long *' [-Werror,-Wincompatible-pointer-types]
   61 |                 folio_set_dcache_dirty(folio);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/include/asm/cacheflush.h:42:27: note: expanded from macro
'folio_set_dcache_dirty'
   42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
      |                                  ^~~~~~~~~~~~~~~
arch/mips/include/asm/bitops.h:89:70: note: passing argument to
parameter 'addr' here
   89 | static inline void set_bit(unsigned long nr, volatile unsigned
long *addr)
      |                                                                      ^

In file included from include/linux/cacheflush.h:5:
arch/mips/include/asm/cacheflush.h:70:3: error: incompatible pointer
types passing 'memdesc_flags_t *' to parameter of type 'volatile
unsigned long *' [-Werror,-Wincompatible-pointer-types]
   70 |                 folio_set_dcache_dirty(page_folio(page));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/include/asm/cacheflush.h:42:27: note: expanded from macro
'folio_set_dcache_dirty'
   42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
      |                                  ^~~~~~~~~~~~~~~
arch/mips/include/asm/bitops.h:89:70: note: passing argument to
parameter 'addr' here
   89 | static inline void set_bit(unsigned long nr, volatile unsigned
long *addr)
      |                                                                      ^
2 errors generated.

## Source
* Kernel version: 6.17.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250821
* Git commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
* Architectures: mips
* Toolchains: clang-20 gcc-12
* Kconfigs: defconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29616797/log_file/
* Build details mips:
https://regressions.linaro.org/lkft/linux-next-master/next-20250821/build/clang-nightly-defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn/config

--
Linaro LKFT
https://lkft.linaro.org

