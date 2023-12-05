Return-Path: <linux-mips+bounces-527-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB3E8049A8
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 07:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C649281557
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 06:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22702D50C;
	Tue,  5 Dec 2023 06:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pu2Sbgpn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E175191
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 22:02:08 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4648495a842so611956137.2
        for <linux-mips@vger.kernel.org>; Mon, 04 Dec 2023 22:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701756127; x=1702360927; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MbGfZIumAG8MWScd3jekKM1BGoJdVx+w4q+lDBLye5g=;
        b=Pu2SbgpnyNVzzPnrCbjLloxNzTTniFbyyDofYAA4429NuRPFd7TKlosMiMjuB8gvf8
         C4Mvq9CwpNmEI4G1GGD5v4dMBPKaPWF8FMsV/wwtJZ0rmeMOM9is7mJBw4RS4qqoa3Yq
         KcRGhKkSAbDidNM/3CTBItlgqFKsnmxLgE6wfXHAuRKJ+RHD9ODctZTlVW61KsUj1Zng
         Fp0PC1CDgf4UH4x/6B6HzZmvocMuEmeayBhJ6qbNpe0YnUzMdmB2oIaTZKOQ/1Hy4VuN
         K/cjgwonafbKCLwHGPTUMo2WR/PafDC+6dUrTNkO0FoDy7lxpL92m/v0s5izhV9MCizh
         CFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701756127; x=1702360927;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbGfZIumAG8MWScd3jekKM1BGoJdVx+w4q+lDBLye5g=;
        b=TCSjHffjhllnBhW9V1KUCXnywwI32iVV+1y1M7mTdyacElEvphJtQVhqsG6rt+Rudy
         yf3jh2shmSfDZDWI+qr661sv4undUdH3xg/S98aKbHbs4nlhnFFkWti9LDXWo+YeijQg
         dLa7BT0EhOetrYYd0r7OOfhkYZbUW8S+7jtSyBlkR5M42+fJ8Vf34o5DQKbzgLZUOmBJ
         zX3VJZ6T6XoLvqKtL9dzzuf3B8/82GG/fIZqSP50n4IL3yyBHLbcAGQSnS5X8SP1qVua
         lvqZl3eGA30BwHTnAXSLUdz0WARSQTc+ufZoeGE4oTfRPggOSFSkzWEzeuvicnxMuFHQ
         DFXg==
X-Gm-Message-State: AOJu0YzfD1ChjRjoY+UojnAs4C+a1BlySKdzJ8+bLEBnx41jgja0iETJ
	MYjpwaXbu1MUy8nPX9KoRDkVTaYT/Z5bCNIrmXwxZKbIw8JcU0B6VeE=
X-Google-Smtp-Source: AGHT+IHvKqnSwS1BLyzX1vMS4LTuVHrCtdDTFnS9dO+gsy1r9yKxz3zYlHv4rNjFqNOjx1gZc4Nxs2/fOzhwS4SJDXA=
X-Received: by 2002:a67:af18:0:b0:464:3c0a:fdd4 with SMTP id
 v24-20020a67af18000000b004643c0afdd4mr3333612vsl.2.1701756127145; Mon, 04 Dec
 2023 22:02:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 5 Dec 2023 11:31:55 +0530
Message-ID: <CA+G9fYvAUt8GyeGrb5UK8HZDVru6Ucu3BJyMQv0vkO3jYwOHHQ@mail.gmail.com>
Subject: mips-linux-gnu-ld: arch/mips/mm/cache.o: in function
 `cpu_cache_init': cache.c:(.text+0x4f8): undefined reference to `octeon_cache_init'
To: linux-mips@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	linux-mm <linux-mm@kvack.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Zi Yan <ziy@nvidia.com>, Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Following build errors reported on MIPS with gcc-8 while building
Linux next-20231205 tag.
But gcc-12 builds pass.

mips-linux-gnu-ld: arch/mips/mm/cache.o: in function `cpu_cache_init':
cache.c:(.text+0x4f8): undefined reference to `octeon_cache_init'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231205/testrun/21486880/suite/build/test/gcc-8-malta_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231205/testrun/21486880/suite/build/test/gcc-8-malta_defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org

