Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4F53D0A60
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 10:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234067AbhGUHcC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Jul 2021 03:32:02 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:60387 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235491AbhGUH1N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Jul 2021 03:27:13 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7752E5816C2;
        Wed, 21 Jul 2021 04:07:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 21 Jul 2021 04:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=j
        cTcJFK6RU0wnly1MKmSN+cQxU1sZbkEd7ssG8698Yc=; b=KzormehXExLlrKO+O
        gqVt3aO1w4Lz9Hunt7BCbyj55jNe4j7XUh0cF5Dif9E3hAJjfCSh8HeMO+7o5qH+
        KvTp470rRZvwPAAEVhUr6ahKNmA1UwRCnhQcZ9vP+CLBnn8Xw2XPqdBx+prxplcM
        uOsdRpcBAJwHQcOEogvrL9g+Skz5D9iREnFeNl3OP8bFMOj66jU1lBGxrTmtU547
        rRPLcbJfipo7qJ8iZljY9l3CSQWTSNO2szh1pyTnQXd4nLjA8jlm1S9fHQX/khuN
        0YEUGp+i8p9sQ7Kac1E46PxAih8mRCLRtamwNXB6b7mER/KxewyGoZope65CDs/l
        AbR0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=jcTcJFK6RU0wnly1MKmSN+cQxU1sZbkEd7ssG8698
        Yc=; b=BbRS8LDx6ldKX0qJl3jdMQ/VbvQP/8SXJBX5qZWSTC5hOQIH9mJlNAV+u
        DUKxFb71b9bEpkIuWhecwJ/1r5tZYJdYp4rbioNl9OJ6gO5/M9cs23lVBFyNFLod
        l/BcwOQ9fOp80hDf9MKg3EPpk4zS+CRFVDcfsAc/yPSBqRK3/e8CRggUQ6OnnAkz
        98v1vNZqmZZMLQ6ja4dCXfzsBBwqqkOw28SQzv6D3UQ3f4InALIY7RKRYRw5CPpY
        V1/m2piWAno6+j2ujxNKWxvwTl5YgTxFmMbtAoQfSQK6bkzGxyY2Bb+3RtSXYYE4
        BiAnQVpddEiRMk8EO+AcaG0Lcf8XA==
X-ME-Sender: <xms:1NX3YEGLpbej2wOCUkXWy8OlGamIQkUOPW1aqY_wgg3PO-BC9BJMtA>
    <xme:1NX3YNXMevLE5xaOExLVBtC8F220tODKaNq5Mh8b6BfqU1lX-LventwIvvLACP8mH
    MHUGf6CTgOYl7sM5yU>
X-ME-Received: <xmr:1NX3YOLsDBSfykORa24MZE6NSRs7ogOVOiwqT5-vqw1-5yNlxAh2jzdXwpssbEu8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepieekgefhvdfftedttd
    eugefhtdfhudeitedttddvvdelhfeuhfetueefteefvefgnecuffhomhgrihhnpehgihht
    qdhstghmrdgtohhmpdhgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhgihhthh
    husghushgvrhgtohhnthgvnhhtrdgtohhmpddtuddrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:1NX3YGFUj8cEy0GcQZRq6T4yxA1Cu098uWxI3fTMTFvpg0CEFJ5ijA>
    <xmx:1NX3YKXXheHhwrwRJlKFwKuYOA5C5XffxMWr3lNL3vOx-RbHFMZhZw>
    <xmx:1NX3YJOrvajIWXC3aHUsQQxMFp59fgGcFG_yUMtwaow7ljNTZKqEoA>
    <xmx:1tX3YGRPFoNDCVJ8-oWT3wZWQ6WxkEnOLkaEX8Fc6Tf8u5fjFK6DnQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 04:07:44 -0400 (EDT)
Subject: Re: [PATCH v3 8/9] MIPS: Retire MACH_PISTACHIO
To:     linux-mips@vger.kernel.org
Cc:     kbuild-all@lists.01.org, tsbogend@alpha.franken.de,
        mturquette@baylibre.com, daniel.lezcano@linaro.org,
        linus.walleij@linaro.org, vkoul@kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
References: <20210721030134.10562-9-jiaxun.yang@flygoat.com>
 <202107211525.XDjCm5PW-lkp@intel.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <edb62a45-5071-8fd2-92b8-4c030adaa658@flygoat.com>
Date:   Wed, 21 Jul 2021 16:07:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202107211525.XDjCm5PW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Oops, will fix in v4.

Thanks,

在 2021/7/21 下午3:15, kernel test robot 写道:
> Hi Jiaxun,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on clk/clk-next linus/master v5.14-rc2 next-20210720]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Jiaxun-Yang/MIPS-Migrate-pistachio-to-generic-kernel/20210721-110732
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: mips-randconfig-r026-20210720 (attached as .config)
> compiler: mips64-linux-gcc (GCC) 10.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/0day-ci/linux/commit/7815f6aeaf55e4b6b9de98455f68c185a5ac5916
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Jiaxun-Yang/MIPS-Migrate-pistachio-to-generic-kernel/20210721-110732
>          git checkout 7815f6aeaf55e4b6b9de98455f68c185a5ac5916
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross ARCH=mips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> arch/mips/Kconfig:1062: can't open file "arch/mips/pistachio/Kconfig"
> --
>>> arch/mips/Kconfig:1062: can't open file "arch/mips/pistachio/Kconfig"
>     make[3]: *** [scripts/kconfig/Makefile:77: syncconfig] Error 1
>     make[2]: *** [Makefile:626: syncconfig] Error 2
>     make[1]: *** [Makefile:735: include/config/auto.conf.cmd] Error 2
>     make[1]: Failed to remake makefile 'include/config/auto.conf.cmd'.
>     make[1]: Failed to remake makefile 'include/config/auto.conf'.
>     make[1]: Target 'modules_prepare' not remade because of errors.
>     make: *** [Makefile:220: __sub-make] Error 2
>     make: Target 'modules_prepare' not remade because of errors.
> --
>>> arch/mips/Kconfig:1062: can't open file "arch/mips/pistachio/Kconfig"
>     make[2]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
>     make[1]: *** [Makefile:626: olddefconfig] Error 2
>     make: *** [Makefile:220: __sub-make] Error 2
>     make: Target 'olddefconfig' not remade because of errors.
> --
>>> arch/mips/Kconfig:1062: can't open file "arch/mips/pistachio/Kconfig"
>     make[3]: *** [scripts/kconfig/Makefile:77: syncconfig] Error 1
>     make[2]: *** [Makefile:626: syncconfig] Error 2
>     make[1]: *** [Makefile:735: include/config/auto.conf.cmd] Error 2
>     make[1]: Failed to remake makefile 'include/config/auto.conf.cmd'.
>     make[1]: Failed to remake makefile 'include/config/auto.conf'.
>     make[1]: Target 'prepare' not remade because of errors.
>     make: *** [Makefile:220: __sub-make] Error 2
>     make: Target 'prepare' not remade because of errors.
>
>
> vim +1062 arch/mips/Kconfig
>
> ^1da177e4c3f415 Linus Torvalds   2005-04-16  1050
> e8c7c482347574e Ralf Baechle     2008-09-16  1051  source "arch/mips/alchemy/Kconfig"
> 3b12308f3337c09 Sergey Ryazanov  2014-10-29  1052  source "arch/mips/ath25/Kconfig"
> d4a67d9dc8a5a80 Gabor Juhos      2011-01-04  1053  source "arch/mips/ath79/Kconfig"
> a656ffcbc7a98a8 Hauke Mehrtens   2011-07-23  1054  source "arch/mips/bcm47xx/Kconfig"
> e7300d04bd0809e Maxime Bizon     2009-08-18  1055  source "arch/mips/bcm63xx/Kconfig"
> 8945e37e103b165 Kevin Cernekee   2014-12-25  1056  source "arch/mips/bmips/Kconfig"
> eed0eabd12ef061 Paul Burton      2016-10-05  1057  source "arch/mips/generic/Kconfig"
> a103e9b951f9094 Paul Cercueil    2020-09-06  1058  source "arch/mips/ingenic/Kconfig"
> 5e83d4305467c43 Ralf Baechle     2005-10-29  1059  source "arch/mips/jazz/Kconfig"
> 8ec6d93508f705d John Crispin     2011-03-30  1060  source "arch/mips/lantiq/Kconfig"
> 2572f00db8a68bb Joshua Henderson 2016-01-13  1061  source "arch/mips/pic32/Kconfig"
> af0cfb2c44ee5cd Ezequiel Garcia  2015-08-06 @1062  source "arch/mips/pistachio/Kconfig"
> ae2b5bb6570481b John Crispin     2013-01-20  1063  source "arch/mips/ralink/Kconfig"
> 29c4869946f9182 Ralf Baechle     2005-02-07  1064  source "arch/mips/sgi-ip27/Kconfig"
> 38b18f725874224 Ralf Baechle     2005-02-03  1065  source "arch/mips/sibyte/Kconfig"
> 22b1d707ffc99fa Atsushi Nemoto   2008-07-11  1066  source "arch/mips/txx9/Kconfig"
> 5e83d4305467c43 Ralf Baechle     2005-10-29  1067  source "arch/mips/vr41xx/Kconfig"
> a86c7f72454c4e8 David Daney      2008-12-11  1068  source "arch/mips/cavium-octeon/Kconfig"
> 71e2f4dd5a65bd8 Jiaxun Yang      2019-10-20  1069  source "arch/mips/loongson2ef/Kconfig"
> 30ad29bb48881ee Huacai Chen      2015-04-21  1070  source "arch/mips/loongson32/Kconfig"
> 30ad29bb48881ee Huacai Chen      2015-04-21  1071  source "arch/mips/loongson64/Kconfig"
> 7f058e852b229ec Jayachandran C   2011-05-07  1072  source "arch/mips/netlogic/Kconfig"
> 38b18f725874224 Ralf Baechle     2005-02-03  1073
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
