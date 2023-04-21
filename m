Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B61766EA5E5
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 10:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjDUIcA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 04:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjDUIb7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 04:31:59 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E384C9031
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 01:31:55 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 1BF0D320046F;
        Fri, 21 Apr 2023 04:31:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 21 Apr 2023 04:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1682065914; x=1682152314; bh=PgFo8ZxvoeLKAcrmjSwWWgEH/LN7ejGA41J
        5jZcfKaM=; b=INVUkz0n3Gw5BHdqGhP0+Ac711C/7x3zBHgbhZs+EYpN5z1oC14
        FvZmW8cmYX+MkUkr2t5ZHFP63cnJ6SZI6ekNjleg5fnu0VGShyyzlmqI+b71HSZf
        KCW8WYnm693+NrMvYAC7+oLu2/srQCJ3HThxFU+7mKUEf12vmOzS63eu/rYFCFAT
        AJCs/a8U33/hv18e/gwYo/Fuk74ySx1xuuvCfqW4W7N1J4PhzmEUZzcv6mjKQFAv
        0d1BAmLEmp8+Pdkj48Afl00hYxNndhBvGrbKUX1Wwlm+t6YO6XWTtrDTLeTDk0po
        DjyxyVahGIeeywgKpuXu/q7lK5YKQ8CTvZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682065914; x=1682152314; bh=PgFo8ZxvoeLKAcrmjSwWWgEH/LN7ejGA41J
        5jZcfKaM=; b=R5iPkFlqQXBU50Xi+00NVJfzKNa7QbNnSfY6dWdblm2Jzl13mav
        TxQJmc3dTfliFGGN9CTq55mgiMzJfJhK43YyQwZWxeK4mE/4EX4Zw5x8WuVd/RZ+
        EPOE6lH+m0gop4TmyScbWPUYX1DFBaVnpViR6tYnlCk20BPrLJ3Pcs/QCG13Hknb
        8wi5Aox1zh8155u/x/bafGpzSbAGRZnwULJFIFaImWEG8VyG23CAB2/Ut2pZMHBG
        hzvok24gPbE/8r7ljILJSW43oLzulJ2vQB5/cKIC+wigIVpVjZzhopgeIW0omupG
        fXgliA8C3M4XuR/VWdIiTlxJ4eozuDFTScg==
X-ME-Sender: <xms:-klCZHd7paV83D2OmkcoMKhg2u9qrIdBGEyG7MQV-KVTs4vrf0CHDw>
    <xme:-klCZNOXDIBk9ypUEPmy7TlZdhqUBTCMS3A8YY6OouLg0hERl2PhAm_tq8R-ryBZZ
    V-ljgy-9HVyL5Rl9aQ>
X-ME-Received: <xmr:-klCZAiPqL2jz7J5pAMj4zq477euJsnsacKZxn8wFJ12al42OpN2fNFfubX95BZzIVJm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepgeejffefgfefudehfefftefhffdvteeuveeifeetiefffeeg
    keehvdeggfejheejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    jhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:-klCZI-CiUFJu0GHX0CncqQf0vYLs9MUMzH-n1_1YSyALErq0rTVQA>
    <xmx:-klCZDvV8AwDN9Jj86jMCAeV0Vb0_3xmQ2MgWsFAasZVARDSLr4DOA>
    <xmx:-klCZHFoaB9J8nXR5RMO5Jm1_VU4-qgmfbVPkJlgrEq_FWDSLxsKiA>
    <xmx:-klCZDILURL7clgTEIBEVqQHkA7RzVODUxEodTV8x0CRc4_QmaCCjA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Apr 2023 04:31:53 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 0/7] MIPS: LLVM build fixes
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
Date:   Fri, 21 Apr 2023 09:31:42 +0100
Cc:     llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1CABB0D2-A034-4BC8-AF5F-C6E2B5F0E86F@flygoat.com>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=889=E6=97=A5 11:43=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi all,
>=20
> This series fixes some build errors when building with LLVM.
> Some of them was discorved by inspecting the tree.

Hi Thomas,

Do you mind to look into patch 5 and 8 of this series?
While others are mostly fixing problem introduced for =E2=80=9CGeneric =
Platform=E2=80=9D,
5 and 8 are fixing problems in tree that got frequent reports from CI =
bots[1] [2].

[1]: https://lore.kernel.org/all/202210180436.ruWBhXRe-lkp@intel.com/
[2]: =
https://lore.kernel.org/all/alpine.DEB.2.22.394.2210171653540.9136@ramsan.=
of.borg/

Thanks
Jiaxun

>=20
> Tested with LLVM + LLVM_IAS=3D{0, 1} and GCC against:
>=20
> allnoconfig, allmodconfig, 32r2_defconfig, 32r2el_defconfig, =
64r2_defconfig,
> 64r2el_defconfig, micro32r2el_defconfig, 32r6el_defconfig, =
64r6el_defconfig,
> loongson3_defconfig, lemote2f_defconfig, ip22_defconfig, =
cavium_octeon_defconfig,
> malta_defconfig
>=20
> With other patchsets [1] [2] [3] I sent before, on my CI [4], with =
tree [5].
>=20
> allmodconfig is still failing but it's not related to MIPS.
>=20
> [1]: =
https://patchwork.kernel.org/project/linux-mips/patch/20230407102721.14814=
-2-jiaxun.yang@flygoat.com/
> [2]: =
https://patchwork.kernel.org/project/linux-mips/patch/20230408115936.6631-=
1-jiaxun.yang@flygoat.com/
> [3]: =
https://patchwork.kernel.org/project/linux-mips/patch/20230407102721.14814=
-2-jiaxun.yang@flygoat.com/
> [4]: =
https://github.com/FlyGoat/kernel-action-ci/actions/runs/4649898964/jobs/8=
228560848
> [5]: =
https://github.com/FlyGoat/kernel-action-ci/tree/71d3f53e9c44cebf62cfa4ed7=
ec3b0ce6452555f
>=20
> Thanks
> Jiaxun
>=20
> Jiaxun Yang (8):
>  MIPS: Replace assembly isa level directives with macros
>  MIPS: Set ISA level for MSA control reg helpers
>  MIPS: loongson2ef: Add missing break in cs5536_isa
>  MIPS: asmmacro: Restore fp macro after undef
>  MIPS: mipsregs: Parse fp and sp register by name in parse_r
>  MIPS: c-r4k: Use cache_op function for rm7k_erratum31
>  MIPS: octeon_switch: Remove duplicated labels
>  MIPS: Implement microMIPS MT ASE helpers
>=20
> arch/mips/alchemy/common/sleeper.S            |   6 +-
> arch/mips/include/asm/asmmacro.h              |  57 ++--
> arch/mips/include/asm/futex.h                 |   8 +-
> arch/mips/include/asm/hazards.h               |   2 +-
> arch/mips/include/asm/io.h                    |   4 +-
> arch/mips/include/asm/mipsmtregs.h            | 256 +++++++++++-------
> arch/mips/include/asm/mipsregs.h              |  63 +++--
> arch/mips/include/asm/msa.h                   |   2 +
> arch/mips/include/asm/stackframe.h            |   2 +-
> arch/mips/kernel/bmips_vec.S                  |   4 +-
> arch/mips/kernel/csrc-r4k.c                   |   2 +-
> arch/mips/kernel/genex.S                      |   8 +-
> arch/mips/kernel/idle.c                       |   6 +-
> arch/mips/kernel/octeon_switch.S              |   6 -
> arch/mips/kernel/r4k_fpu.S                    |   4 +-
> arch/mips/kernel/syscall.c                    |   2 +-
> arch/mips/lantiq/clk.c                        |   2 +-
> arch/mips/lib/csum_partial.S                  |   5 +-
> .../loongson2ef/common/cs5536/cs5536_isa.c    |   2 +-
> arch/mips/mm/c-r4k.c                          |  33 +--
> arch/mips/mm/cex-oct.S                        |   2 +-
> arch/mips/mm/sc-ip22.c                        |   6 +-
> 22 files changed, 277 insertions(+), 205 deletions(-)
>=20
> --=20
> 2.39.2 (Apple Git-143)
>=20

