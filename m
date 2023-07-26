Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D52763DEB
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jul 2023 19:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbjGZRsW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Jul 2023 13:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGZRsV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Jul 2023 13:48:21 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DE3121;
        Wed, 26 Jul 2023 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690393699; x=1721929699;
  h=date:from:to:cc:subject:message-id;
  bh=xhavr5FZiRpQL6qhQbQYPyFLqY3Dnb4k4DgVSlgkNog=;
  b=BIR0UE2ecvBU/MAGLg0h5YygppzWGKQahaaMvstFLDicR8cnjDx5N5nl
   IWfWh3aeU/D5/7CBBobMcpFHP/dOMoar7FBJbPNUapLl1qGSzRL6kTP7p
   027z7HDdWuPg1ryqkKdTkEsTKeEMb+QcwNmyUya7I1OUltdj3rlcuHBO0
   sQcuT7+eUt3rWoQWxF/pP6ILEyOEXqaeZflEhg4SRJo5/2tBj65ov+3nn
   dfuvv41fiFl333yWZHQyPreahfaDd01sbZrjzS3OMYntPDXVfnEw78wgE
   YM4fdNy6dS04bRhpqpq/ivQLQvRbqGYg+67i20dj4PfkKJwa8dTsTrYn9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="434357145"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="434357145"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 10:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816775144"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="816775144"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 10:48:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOic4-00019n-2i;
        Wed, 26 Jul 2023 17:48:01 +0000
Date:   Thu, 27 Jul 2023 01:47:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 0ba5d07205771c50789fd9063950aa75e7f1183f
Message-ID: <202307270140.uClzsYnD-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 0ba5d07205771c50789fd9063950aa75e7f1183f  Add linux-next specific files for 20230726

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307181450.sfbuvMf5-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307251531.p8ZLFTMZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307262218.hpvyrXrf-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307270116.Xf7g8Lne-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
arch/mips/lantiq/xway/gptu.c:140:13: error: implicit declaration of function 'of_irq_to_resource_table' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-ge.c:103:1: error: type defaults to 'int' in declaration of 'module_platform_driver_probe' [-Werror=implicit-int]
drivers/gpio/gpio-ge.c:103:1: warning: data definition has no type or storage class
drivers/gpio/gpio-ge.c:103:1: warning: parameter names (without types) in function declaration
drivers/gpio/gpio-ge.c:53:41: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
drivers/gpio/gpio-ge.c:59:32: error: invalid use of undefined type 'struct platform_device'
drivers/gpio/gpio-ge.c:97:15: error: variable 'gef_gpio_driver' has initializer but incomplete type
drivers/gpio/gpio-ge.c:97:31: error: storage size of 'gef_gpio_driver' isn't known
drivers/gpio/gpio-ge.c:98:10: error: 'struct platform_driver' has no member named 'driver'
drivers/gpio/gpio-ge.c:98:19: error: extra brace group at end of initializer
drivers/gpio/gpio-ge.c:98:19: warning: excess elements in struct initializer
drivers/regulator/max77857-regulator.c:312:16: error: initializer element is not a compile-time constant
drivers/regulator/max77857-regulator.c:56:24: warning: cast to smaller integer type 'enum max77857_id' from 'void *' [-Wvoid-pointer-to-enum-cast]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- mips-xway_defconfig
|   `-- arch-mips-lantiq-xway-gptu.c:error:implicit-declaration-of-function-of_irq_to_resource_table
`-- powerpc-randconfig-r036-20230726
    |-- drivers-gpio-gpio-ge.c:error:extra-brace-group-at-end-of-initializer
    |-- drivers-gpio-gpio-ge.c:error:invalid-use-of-undefined-type-struct-platform_device
    |-- drivers-gpio-gpio-ge.c:error:storage-size-of-gef_gpio_driver-isn-t-known
    |-- drivers-gpio-gpio-ge.c:error:struct-platform_driver-has-no-member-named-driver
    |-- drivers-gpio-gpio-ge.c:error:type-defaults-to-int-in-declaration-of-module_platform_driver_probe
    |-- drivers-gpio-gpio-ge.c:error:variable-gef_gpio_driver-has-initializer-but-incomplete-type
    |-- drivers-gpio-gpio-ge.c:warning:data-definition-has-no-type-or-storage-class
    |-- drivers-gpio-gpio-ge.c:warning:excess-elements-in-struct-initializer
    |-- drivers-gpio-gpio-ge.c:warning:parameter-names-(without-types)-in-function-declaration
    `-- drivers-gpio-gpio-ge.c:warning:struct-platform_device-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
clang_recent_errors
|-- mips-randconfig-r034-20230726
|   `-- clang:error:unknown-argument:msym32
|-- mips-randconfig-r035-20230726
|   `-- clang:error:unknown-argument:msym32
`-- x86_64-randconfig-r011-20230726
    |-- drivers-regulator-max77857-regulator.c:error:initializer-element-is-not-a-compile-time-constant
    `-- drivers-regulator-max77857-regulator.c:warning:cast-to-smaller-integer-type-enum-max77857_id-from-void

elapsed time: 724m

configs tested: 114
configs skipped: 4

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230726   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                  randconfig-r032-20230726   gcc  
arc                  randconfig-r043-20230726   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230726   clang
arm                  randconfig-r026-20230726   gcc  
arm                  randconfig-r046-20230726   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r025-20230726   clang
csky                                defconfig   gcc  
csky                 randconfig-r034-20230726   gcc  
hexagon              randconfig-r003-20230726   clang
hexagon              randconfig-r006-20230726   clang
hexagon              randconfig-r016-20230726   clang
hexagon              randconfig-r041-20230726   clang
hexagon              randconfig-r045-20230726   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230726   gcc  
i386         buildonly-randconfig-r005-20230726   gcc  
i386         buildonly-randconfig-r006-20230726   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i003-20230726   gcc  
i386                 randconfig-i004-20230726   gcc  
i386                 randconfig-i011-20230726   clang
i386                 randconfig-i012-20230726   clang
i386                 randconfig-i013-20230726   clang
i386                 randconfig-i014-20230726   clang
i386                 randconfig-r004-20230726   gcc  
i386                 randconfig-r031-20230726   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r033-20230726   gcc  
loongarch            randconfig-r036-20230726   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                     cu1000-neo_defconfig   clang
mips                 randconfig-r013-20230726   gcc  
mips                 randconfig-r022-20230726   gcc  
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230726   clang
riscv                randconfig-r042-20230726   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230726   clang
sh                               allmodconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                   randconfig-r024-20230726   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230726   gcc  
sparc                randconfig-r035-20230726   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r012-20230726   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230726   gcc  
x86_64       buildonly-randconfig-r002-20230726   gcc  
x86_64       buildonly-randconfig-r003-20230726   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r011-20230726   clang
x86_64               randconfig-x001-20230726   clang
x86_64               randconfig-x002-20230726   clang
x86_64               randconfig-x003-20230726   clang
x86_64               randconfig-x004-20230726   clang
x86_64               randconfig-x005-20230726   clang
x86_64               randconfig-x011-20230726   gcc  
x86_64               randconfig-x012-20230726   gcc  
x86_64               randconfig-x013-20230726   gcc  
x86_64               randconfig-x014-20230726   gcc  
x86_64               randconfig-x015-20230726   gcc  
x86_64               randconfig-x016-20230726   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r005-20230726   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
