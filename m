Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31297323FC1
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 16:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbhBXOTs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 09:19:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:33438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234545AbhBXNSk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Feb 2021 08:18:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DB7664E02;
        Wed, 24 Feb 2021 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614172618;
        bh=1OYA70c3B5fW2I4c9I6qukLQFWmQmyDKzf/6xmqd7yw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DunTstwYrC0zZRkwW7RIhvcIx30okzmVYogmvnpPP/VSr7XU3sKC2WtP11a3YXy/9
         ZTG1jfQUzBnt8Fxg6v4tRNhMUVMDtVUWolzKmFTNIJiAmxlnqQDmbeZ/9tgpHSpr0I
         fg0N0iH1yxP7Ye/+UxPaQJDiX7KCTW5f8i5hXFumNjuTRUQv3iIRcWw6SXnYaFQH1e
         BArz1E+Roti2GhLu4psN7VCctp1U8Z3Y/QOERK48TI1PSCirPE/r/e5w91BtuNUI/Z
         glWLBagHjOVswV65v18gWtS+/hdp6EZVaoKaoAT4wuKCkgS3MB6rPQzKtnfhfZ+yeG
         HbGMS1DAHq0Bg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 489B240CD9; Wed, 24 Feb 2021 10:16:55 -0300 (-03)
Date:   Wed, 24 Feb 2021 10:16:55 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: Re: [PATCH v2 0/3] Add some perf support for mips
Message-ID: <YDZRxz1yRwgWc47F@kernel.org>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
 <1d3c4abd-4b14-90e3-6528-457a8248cb52@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d3c4abd-4b14-90e3-6528-457a8248cb52@loongson.cn>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Mon, Feb 22, 2021 at 02:43:39PM +0800, Tiezhu Yang escreveu:
> On 02/04/2021 11:35 AM, Tiezhu Yang wrote:
> > v2: add R26 and R27 to the enum perf_event_mips_regs in patch #1
> > 
> > Tiezhu Yang (3):
> >    MIPS: kernel: Support extracting off-line stack traces from user-space
> >      with perf
> >    perf tools: Support mips unwinding and dwarf-regs
> >    perf tools: Generate mips syscalls_n64.c syscall table
> 
> Hi Arnaldo,
> 
> The kernel part patch #1 has been merged.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ddc96bd42da
> 
> Could the perf tool patches #2 and #3 have a chance to be merged before
> 5.12-rc1?
> If yes, we can use this feature in 5.12-rc1.

Thanks, applied, should make it into 5.12-rc1.

- Arnaldo
 
> https://lore.kernel.org/patchwork/patch/1375476/
> https://lore.kernel.org/patchwork/patch/1375475/
> 
> 
> Thanks,
> Tiezhu
> 
> > 
> >   arch/mips/Kconfig                                  |   2 +
> >   arch/mips/include/uapi/asm/perf_regs.h             |  40 +++
> >   arch/mips/kernel/Makefile                          |   2 +-
> >   arch/mips/kernel/perf_regs.c                       |  68 ++++
> >   tools/perf/Makefile.config                         |   9 +-
> >   tools/perf/arch/mips/Makefile                      |  22 ++
> >   tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  32 ++
> >   .../perf/arch/mips/entry/syscalls/syscall_n64.tbl  | 358 +++++++++++++++++++++
> >   tools/perf/arch/mips/include/dwarf-regs-table.h    |  31 ++
> >   tools/perf/arch/mips/include/perf_regs.h           |  84 +++++
> >   tools/perf/arch/mips/util/Build                    |   3 +
> >   tools/perf/arch/mips/util/dwarf-regs.c             |  38 +++
> >   tools/perf/arch/mips/util/perf_regs.c              |   6 +
> >   tools/perf/arch/mips/util/unwind-libunwind.c       |  22 ++
> >   tools/perf/check-headers.sh                        |   1 +
> >   tools/perf/util/dwarf-regs.c                       |   3 +
> >   tools/perf/util/syscalltbl.c                       |   4 +
> >   17 files changed, 723 insertions(+), 2 deletions(-)
> >   create mode 100644 arch/mips/include/uapi/asm/perf_regs.h
> >   create mode 100644 arch/mips/kernel/perf_regs.c
> >   create mode 100644 tools/perf/arch/mips/Makefile
> >   create mode 100644 tools/perf/arch/mips/entry/syscalls/mksyscalltbl
> >   create mode 100644 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
> >   create mode 100644 tools/perf/arch/mips/include/dwarf-regs-table.h
> >   create mode 100644 tools/perf/arch/mips/include/perf_regs.h
> >   create mode 100644 tools/perf/arch/mips/util/Build
> >   create mode 100644 tools/perf/arch/mips/util/dwarf-regs.c
> >   create mode 100644 tools/perf/arch/mips/util/perf_regs.c
> >   create mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
> > 
> 

-- 

- Arnaldo
