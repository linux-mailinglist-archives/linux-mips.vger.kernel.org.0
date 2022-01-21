Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095DE495B86
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jan 2022 09:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349370AbiAUICd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jan 2022 03:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235200AbiAUICb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jan 2022 03:02:31 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AEA6C06173F
        for <linux-mips@vger.kernel.org>; Fri, 21 Jan 2022 00:02:31 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id o80so25287592yba.6
        for <linux-mips@vger.kernel.org>; Fri, 21 Jan 2022 00:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=8eAbY9ESXpy1tWEm1ucKW/quoE20o1cXtY1MXERpUFg=;
        b=LkYHOVNcq3jRonNMS/pBXZ+pg0J8ShfaMFVp0USzQCYZaz8De1fwRbSlAwZtAZ3VEV
         9cIv0Kj2tutO333jjA4NIst5Q2naydPqdXLOoZpat4tMaJQoP+O6/wZohKotJJ4MaGJe
         ZjOJrS7eTR6KEWXLkEp80oJ5V994BGF9lrK3BBNI3jWzbs2qviv48yG8dzKKpej3SBPh
         /CzhuHukdyhmNc3vwITOhsrHKfTXZlAsKpfEpY84gtG3affogdaOdfHkocHRqQsg5FOM
         d5boP+jdJW2pevcTl1mbs1cmGaoznLvuhbyM3SmvzHoh37vEr7hE35j4Eh82S6bY1Oq/
         kuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=8eAbY9ESXpy1tWEm1ucKW/quoE20o1cXtY1MXERpUFg=;
        b=u9LTGDXOElpEcluC8/k7oNIBM1DeE1G6N81MskouIk7mGO9JksnlwuES8Q9yyKXHTB
         Q4FZ9O1AuQ20GhSdOygO8S1IDvsvcorVbxAp/NzUY77IHc6uaWCc3gG6JLt6tOsikZ9w
         DesqtKWw5YcOKS7wmwg2LmJ76uDljHERBWhp5GtEZJ/v8F+BB/fQOzmCVeqRI8K43CVO
         EV53SeBQs80hnhnrH/C7ewoEq5mKt2fwEm1e/LQCI1t94R6sA2PxDXDqjMz9NJBuhSim
         0j8i84iekOIUI81cEeAmwZF9LJnbxdAP8r9/OnkkVt4AM0DNotpO+UWQner+083o2nlz
         +t3w==
X-Gm-Message-State: AOAM532FdoDiNGxwXKldMe0VBnegrqgKcU08H2J5ZDo/3S8RAFSstGsc
        Jb8Gp4ZAkBxyQlGZwprOIMdxyR1cBNANogXk2UcISg==
X-Google-Smtp-Source: ABdhPJzo0aPT+cevuAp8IgTaHWcxV/LmH8ev7zl4LJwrjRuwL0xMdQAGfBpvmudWajtB5cu2GNdVcFcLyHofDKdaqYk=
X-Received: by 2002:a25:9082:: with SMTP id t2mr4230805ybl.684.1642752150679;
 Fri, 21 Jan 2022 00:02:30 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 21 Jan 2022 13:32:19 +0530
Message-ID: <CA+G9fYtq0wzSeG8YG-a+=KrbdWqHJMXk1hvq0FKeAvj9sZAK2g@mail.gmail.com>
Subject: [next] mips: cavium_octeon_defconfig: pata_octeon_cf.c:598:23: error:
 passing argument 1 of 'trace_ata_bmdma_stop' from incompatible pointer type
To:     "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org
Cc:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Zeal Robot <zealci@zte.com.cn>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        CGEL ZTE <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Linux next-20220106..next-20220121 mips build failing with gcc-10.

drivers/ata/pata_octeon_cf.c: In function 'octeon_cf_dma_finished':
drivers/ata/pata_octeon_cf.c:598:23: error: passing argument 1 of
'trace_ata_bmdma_stop' from incompatible pointer type
[-Werror=incompatible-pointer-types]
  598 |  trace_ata_bmdma_stop(qc, &qc->tf, qc->tag);
      |                       ^~
      |                       |
      |                       struct ata_queued_cmd *
In file included from include/trace/events/libata.h:10,
                 from drivers/ata/pata_octeon_cf.c:22:
include/trace/events/libata.h:414:33: note: expected 'struct ata_port
*' but argument is of type 'struct ata_queued_cmd *'
  414 |       TP_PROTO(struct ata_port *ap, const struct ata_taskfile
*tf, unsigned int tag),
      |                ~~~~~~~~~~~~~~~~~^~
include/linux/tracepoint.h:342:34: note: in definition of macro
'__DECLARE_TRACE'
  342 |  static inline void trace_##name(proto)    \
      |                                  ^~~~~
include/linux/tracepoint.h:419:24: note: in expansion of macro 'PARAMS'
  419 |  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
      |                        ^~~~~~
include/linux/tracepoint.h:542:2: note: in expansion of macro 'DECLARE_TRACE'
  542 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
      |  ^~~~~~~~~~~~~
include/linux/tracepoint.h:542:22: note: in expansion of macro 'PARAMS'
  542 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
      |                      ^~~~~~
include/trace/events/libata.h:413:1: note: in expansion of macro 'DEFINE_EVENT'
  413 | DEFINE_EVENT(ata_exec_command_template, ata_bmdma_stop,
      | ^~~~~~~~~~~~
include/trace/events/libata.h:414:7: note: in expansion of macro 'TP_PROTO'
  414 |       TP_PROTO(struct ata_port *ap, const struct ata_taskfile
*tf, unsigned int tag),
      |       ^~~~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:289: drivers/ata/pata_octeon_cf.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:572: drivers/ata] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20220121
  kernel-config: https://builds.tuxbuild.com/23zIBGjQZgIYW8OnGcYjwWlj40X/config
  build: https://builds.tuxbuild.com/23zIBGjQZgIYW8OnGcYjwWlj40X/

# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch mips --toolchain gcc-10
--kconfig cavium_octeon_defconfig

--
Linaro LKFT
https://lkft.linaro.org
