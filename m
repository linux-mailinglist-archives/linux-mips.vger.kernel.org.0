Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B994A2C883E
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 16:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgK3Php (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 10:37:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:43360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728156AbgK3Pho (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Nov 2020 10:37:44 -0500
Received: from mail.kernel.org (ip5f5ad5b3.dynamic.kabel-deutschland.de [95.90.213.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15E11208DB;
        Mon, 30 Nov 2020 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606750605;
        bh=Nq7nieU9NxFApiiKqP1AICqSGy1X7FthNYZ1ce3w7kc=;
        h=From:To:Cc:Subject:Date:From;
        b=uAX1dK/KSSKf4Arojv/EDH+dOAzk9oYTaBF/88x9pGVVKS4rmWxOABF74+EklXubT
         3+gsW9AXa1g6BYYtD5C2JQEufVOJpgzUdCkv/M3UdVc749uXzTGDSzsP8ZCOpFGEQ1
         WwhTpLqH+/ozooez/Vwhu2kwSmK5XfW3EFpaJgKI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kjlEI-00CjvH-B9; Mon, 30 Nov 2020 16:36:42 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
        Jonas Bonn <jonas@southpole.se>,
        Kees Cook <keescook@chromium.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rich Felker <dalias@libc.org>,
        Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Luck <tony.luck@intel.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, x86@kernel.org
Subject: [PATCH 0/6] Add documentation for Documentation/features at the built docs
Date:   Mon, 30 Nov 2020 16:36:29 +0100
Message-Id: <cover.1606748711.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jon,

This series got already submitted last year:

   https://lore.kernel.org/lkml/cover.1561222784.git.mchehab+samsung@kernel.org/

Yet, on that time, there were too many other patches related to ReST
conversion floating around. So, at the end, I guess this one got missed.

So, I did a rebase on the top of upstream, and added a few new changes.

Patch 1 contains the original implementation back then. It adds a
get_feat.pl script that parses the contents of Documentation/features.

Patch 2 is new: it re-implements the output of the full contents of the
features table as a set of per-subsystem tables. 

Patch 3 replaces the existing Documentation/features/list-arch.sh
by a call to the new script, in order to avoid having two scripts
doing the same thing.

Patch 4 is a sphinx extension to allow generating features output
via a meta-tag.

Patch 5 adds a complete feature list covering all archs at the
admin guide.

Patch 6 adds a per-arch feature list on each architecture book.

-

The scripts/get_feat.pl supports several types of output:

- $ scripts/get_feat.pl current

  Outputs the supported feadures by the architecture of the
  running Kernel, as an ASCII table;

- $  scripts/get_feat.pl list

  Outputs the supported features on an easy to be parsed
  format. By default, it uses the current architecture as well;

- $  scripts/get_feat.pl rest --feature jump-labels

  Output what architecture supports a given feature
  (on the above example, "jump-labels" feature)

- $ scripts/get_feat.pl rest --arch um

  Outputs the features support for an specific architecture
  (on the above example, for "um" architecture.

- $ scripts/get_feat.pl rest

  Outputs a text file with ASCII tables (ReST compatible)
  with all features, grouped per subsystem.

  E. g. something like:
	
        ===================================
        Feature status on all architectures
        ===================================
        
        Subsystem: core
        ===============
        
        +---------------------+---------------------------------+-------------------------------------------------------------------------+------------+------+
        |Feature              |Kconfig                          |Description                                                              |Architecture|Status|
        +=====================+=================================+=========================================================================+============+======+
        |cBPF-JIT             |HAVE_CBPF_JIT                    |arch supports cBPF JIT optimizations                                     |alpha       |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |arc         |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |arm         |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |arm64       |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |c6x         |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |csky        |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |h8300       |TODO  |
        |                     |                                 |                                                                         +------------+------+
        |                     |                                 |                                                                         |hexagon     |TODO  |
...

Adding those patchsets will basically place the contents of all
files under Documentation/features (currently, 45 files) at the
Kernel documentation, which is, IMO, a good thing to do.

Regards,
Mauro

Mauro Carvalho Chehab (6):
  scripts: get_feat.pl: add a script to handle Documentation/features
  scripts: get_feat.pl: improve matrix output
  scripts: get_feat.pl: use its implementation for list-arch.sh
  sphinx: kernel_feat.py: add a script to parse feature files
  docs: admin-guide: add a features list
  docs: archis: add a per-architecture features list

 Documentation/admin-guide/features.rst |   3 +
 Documentation/admin-guide/index.rst    |   1 +
 Documentation/arm/features.rst         |   3 +
 Documentation/arm/index.rst            |   2 +
 Documentation/arm64/features.rst       |   3 +
 Documentation/arm64/index.rst          |   2 +
 Documentation/conf.py                  |   2 +-
 Documentation/features/list-arch.sh    |  17 +-
 Documentation/ia64/features.rst        |   3 +
 Documentation/ia64/index.rst           |   2 +
 Documentation/index.rst                |   2 +-
 Documentation/m68k/features.rst        |   3 +
 Documentation/m68k/index.rst           |   2 +
 Documentation/mips/features.rst        |   3 +
 Documentation/mips/index.rst           |   2 +
 Documentation/nios2/index.rst          |  12 +
 Documentation/openrisc/features.rst    |   3 +
 Documentation/openrisc/index.rst       |   2 +
 Documentation/parisc/features.rst      |   3 +
 Documentation/parisc/index.rst         |   2 +
 Documentation/powerpc/features.rst     |   3 +
 Documentation/powerpc/index.rst        |   2 +
 Documentation/riscv/features.rst       |   3 +
 Documentation/riscv/index.rst          |   2 +
 Documentation/s390/features.rst        |   3 +
 Documentation/s390/index.rst           |   2 +
 Documentation/sh/features.rst          |   3 +
 Documentation/sh/index.rst             |   2 +
 Documentation/sparc/features.rst       |   3 +
 Documentation/sparc/index.rst          |   2 +
 Documentation/sphinx/kernel_feat.py    | 169 ++++++++
 Documentation/x86/features.rst         |   3 +
 Documentation/x86/index.rst            |   1 +
 Documentation/xtensa/features.rst      |   3 +
 Documentation/xtensa/index.rst         |   2 +
 scripts/get_feat.pl                    | 552 +++++++++++++++++++++++++
 36 files changed, 810 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/admin-guide/features.rst
 create mode 100644 Documentation/arm/features.rst
 create mode 100644 Documentation/arm64/features.rst
 create mode 100644 Documentation/ia64/features.rst
 create mode 100644 Documentation/m68k/features.rst
 create mode 100644 Documentation/mips/features.rst
 create mode 100644 Documentation/nios2/index.rst
 create mode 100644 Documentation/openrisc/features.rst
 create mode 100644 Documentation/parisc/features.rst
 create mode 100644 Documentation/powerpc/features.rst
 create mode 100644 Documentation/riscv/features.rst
 create mode 100644 Documentation/s390/features.rst
 create mode 100644 Documentation/sh/features.rst
 create mode 100644 Documentation/sparc/features.rst
 create mode 100644 Documentation/sphinx/kernel_feat.py
 create mode 100644 Documentation/x86/features.rst
 create mode 100644 Documentation/xtensa/features.rst
 create mode 100755 scripts/get_feat.pl

-- 
2.28.0


