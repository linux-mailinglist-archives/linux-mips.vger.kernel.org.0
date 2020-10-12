Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1395828BB71
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 16:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbgJLO7Q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 12 Oct 2020 10:59:16 -0400
Received: from aposti.net ([89.234.176.197]:42934 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729021AbgJLO7Q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 10:59:16 -0400
Date:   Mon, 12 Oct 2020 16:59:01 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 11/15] MIPS: generic: Add support for Ingenic SoCs
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Message-Id: <DAG3IQ.ZKOH2Y112U5U@crapouillou.net>
In-Reply-To: <20201012143319.GA24291@roeck-us.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
        <20200906192935.107086-12-paul@crapouillou.net>
        <20201012143319.GA24291@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Guenter,

Le lun. 12 oct. 2020 à 7:33, Guenter Roeck <linux@roeck-us.net> a 
écrit :
> On Sun, Sep 06, 2020 at 09:29:31PM +0200, Paul Cercueil wrote:
>>  Add support for Ingenic SoCs in arch/mips/generic/.
>> 
>>  The Kconfig changes are here to ensure that it is possible to 
>> compile
>>  either a generic kernel that supports Ingenic SoCs, or a 
>> Ingenic-only
>>  kernel, both using the same code base, to avoid duplicated code.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> This patch results in the following build error (mips:allmodconfig).
> 
> In file included from <command-line>:
> arch/mips/mm/init.c: In function 'mem_init':
> include/linux/compiler_types.h:319:38: error: call to 
> '__compiletime_assert_331'
> 	declared with attribute error: BUILD_BUG_ON failed:
> 		IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
> 
> Bisect log attached.

This doesn't seem to be something that was added with this patch. This 
COMPILE_BUG_ON() has been here for quite some time... I'm not sure why 
it triggers now.

The mips:allmodconfig works here as long as I switch to 
CPU_LITTLE_ENDIAN (no big-endian compiler). But I'm at a different 
HEAD, and I can't find commit d67bc7812221606e1886620a357b13f906814af7 
anywhere, in which repo is that found?

Cheers,
-Paul

> ---
> # bad: [d67bc7812221606e1886620a357b13f906814af7] Add linux-next 
> specific files for 20201009
> # good: [549738f15da0e5a00275977623be199fbbf7df50] Linux 5.9-rc8
> git bisect start 'HEAD' 'v5.9-rc8'
> # bad: [b71be15b496cc71a3434a198fc1a1b9e08af6c57] Merge 
> remote-tracking branch 'bpf-next/master' into master
> git bisect bad b71be15b496cc71a3434a198fc1a1b9e08af6c57
> # bad: [6be11f939f380ef14bc94242cb0262197ce2a054] Merge 
> remote-tracking branch 'i2c/i2c/for-next' into master
> git bisect bad 6be11f939f380ef14bc94242cb0262197ce2a054
> # good: [c03a115d8ad8a87b6d275c3c91c13bc111217bf6] Merge 
> remote-tracking branch 'samsung-krzk/for-next' into master
> git bisect good c03a115d8ad8a87b6d275c3c91c13bc111217bf6
> # bad: [bdd0ef71b0d7d6a8f1d59af57dc73d19ddc26ad0] Merge 
> remote-tracking branch 'f2fs/dev' into master
> git bisect bad bdd0ef71b0d7d6a8f1d59af57dc73d19ddc26ad0
> # bad: [0c4bd40a7ccd06122c1942f525b714abcd9efe36] Merge 
> remote-tracking branch 'powerpc/next' into master
> git bisect bad 0c4bd40a7ccd06122c1942f525b714abcd9efe36
> # bad: [744d2c114d58c11fd76d572021d7ef3c55a1a225] Merge 
> remote-tracking branch 'nds32/next' into master
> git bisect bad 744d2c114d58c11fd76d572021d7ef3c55a1a225
> # good: [1e9f9330cea616f9f2baf8144f049e4b405715dd] Merge 
> remote-tracking branch 'csky/linux-next' into master
> git bisect good 1e9f9330cea616f9f2baf8144f049e4b405715dd
> # bad: [b350041e6f23a71f63f1eee6d939c846838e7e25] MIPS: alchemy: 
> remove unused ALCHEMY_GPIOINT_AU1000
> git bisect bad b350041e6f23a71f63f1eee6d939c846838e7e25
> # good: [43df4eb2fc9511e09c66252c3fec4f8933a77c73] MIPS: Replace 
> SIBYTE_1956_WAR by CONFIG_SB1_PASS_2_WORKAROUNDS
> git bisect good 43df4eb2fc9511e09c66252c3fec4f8933a77c73
> # good: [13a0ea28e8c698cc0d600fdeed8da3e4d478b97e] MIPS: generic: 
> Init command line with fw_init_cmdline()
> git bisect good 13a0ea28e8c698cc0d600fdeed8da3e4d478b97e
> # bad: [d41afc398fbc9dfb8c40b951e97a7f0283346c6a] MAINTAINERS: Update 
> paths to Ingenic platform code
> git bisect bad d41afc398fbc9dfb8c40b951e97a7f0283346c6a
> # bad: [f0f4a753079c636d5d43a102edbde0dad1e7de51] MIPS: generic: Add 
> support for Ingenic SoCs
> git bisect bad f0f4a753079c636d5d43a102edbde0dad1e7de51
> # good: [c3e2ee657418f4f2bff1269c0550f8135ed0c927] MIPS: generic: Add 
> support for zboot
> git bisect good c3e2ee657418f4f2bff1269c0550f8135ed0c927
> # good: [02bd530f888c6d6ba4995c3afcd10f87c136f173] MIPS: generic: 
> Increase NR_IRQS to 256
> git bisect good 02bd530f888c6d6ba4995c3afcd10f87c136f173
> # first bad commit: [f0f4a753079c636d5d43a102edbde0dad1e7de51] MIPS: 
> generic: Add support for Ingenic SoCs


