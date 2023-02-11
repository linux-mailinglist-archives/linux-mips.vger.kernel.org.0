Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82709692D4A
	for <lists+linux-mips@lfdr.de>; Sat, 11 Feb 2023 03:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjBKCPA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Feb 2023 21:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjBKCO7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Feb 2023 21:14:59 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D0674990;
        Fri, 10 Feb 2023 18:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676081698; x=1707617698;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AFH7pAzH8z3MkAsbKr3xo6FcBDF2BLc1KAFzqHwB5bs=;
  b=iaOyw950XhTEXZnHQmzPxwxShOGfoqYKmq1odEQ1fz6PdXhIo5I+AH71
   WlbWu7O6CEAi9aCg9ljAD7mwcDpu2WusYoug7T+9bkpWsu15+ZuWmx7Ew
   k1n62CFi+dsVid0s5iS3+1TA64rQB84mJPAtWllHBWuFIuJ64l0YR1avf
   QFnOSVLUcEaJLzFB5FWrvkboUPsaxtiBWMGkYkYyr0avBG97Hi3snBzaH
   y3DBTaUYaJiCJ1fRctAqAQ/QOtcodYGOwyeikXJHNS/sgC1u5rf0iQ9YA
   8UsepKmaangeYUOJEAxLUJTW4ohQi9WvNxThBD9+WZmKbBt9oGKED/1ep
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="330582016"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="330582016"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 18:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="842213075"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="842213075"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Feb 2023 18:14:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pQfPg-0006B7-2O;
        Sat, 11 Feb 2023 02:14:52 +0000
Date:   Sat, 11 Feb 2023 10:14:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-usb@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-media@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        intel-gfx@lists.freedesktop.org, fsverity@lists.linux.dev,
        asahi@lists.linux.dev, amd-gfx@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 6ba8a227fd19d19779005fb66ad7562608e1df83
Message-ID: <63e6fa07.0LOPaAs7kdy2KqZw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 6ba8a227fd19d19779005fb66ad7562608e1df83  Add linux-next specific files for 20230210

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301302110.mEtNwkBD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301310939.TAgCOEZb-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302061911.C7xvHX9v-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302062224.ByzeTXh1-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302092211.54EYDhYH-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/sphinx/templates/kernel-toc.html: 1:36 Invalid token: #}
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.c:1011:6: warning: no previous prototype for 'hubbub31_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:948:6: warning: no previous prototype for 'hubbub32_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubp.c:158:6: warning: no previous prototype for 'hubp32_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:62:18: warning: variable 'cursor_bpp' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:1296:32: warning: variable 'result_write_min_hblank' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:280:42: warning: variable 'ds_port' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:1586:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
ftrace-ops.c:(.init.text+0x2c3): undefined reference to `__udivdi3'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/clk/ingenic/jz4760-cgu.c:80 jz4760_cgu_calc_m_n_od() error: uninitialized symbol 'od'.
drivers/iommu/apple-dart.c:1281:1: sparse: sparse: symbol 'apple_dart_pm_ops' was not declared. Should it be static?
drivers/media/i2c/max9286.c:802 max9286_s_stream() error: buffer overflow 'priv->fmt' 4 <= 32
drivers/thermal/qcom/tsens-v0_1.c:106:40: sparse: sparse: symbol 'tsens_9607_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:26:40: sparse: sparse: symbol 'tsens_8916_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:42:40: sparse: sparse: symbol 'tsens_8939_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:62:40: sparse: sparse: symbol 'tsens_8974_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:84:40: sparse: sparse: symbol 'tsens_8974_backup_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v1.c:24:40: sparse: sparse: symbol 'tsens_qcs404_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v1.c:45:40: sparse: sparse: symbol 'tsens_8976_nvmem' was not declared. Should it be static?
drivers/usb/gadget/composite.c:2082:33: sparse: sparse: restricted __le16 degrades to integer
fs/verity/enable.c:29:2: warning: Null pointer passed as 1st argument to memory set function [clang-analyzer-unix.cstring.NullArg]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- alpha-buildonly-randconfig-r006-20230210
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubbub.c:warning:no-previous-prototype-for-hubbub31_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubbub.c:warning:no-previous-prototype-for-hubbub32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubp.c:warning:no-previous-prototype-for-hubp32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-randconfig-m041-20230210
|   |-- drivers-clk-ingenic-jz4760-cgu.c-jz4760_cgu_calc_m_n_od()-error:uninitialized-symbol-od-.
|   `-- drivers-media-i2c-max9286.c-max9286_s_stream()-error:buffer-overflow-priv-fmt
|-- arm64-randconfig-s042-20230210
|   `-- drivers-iommu-apple-dart.c:sparse:sparse:symbol-apple_dart_pm_ops-was-not-declared.-Should-it-be-static
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubbub.c:warning:no-previous-prototype-for-hubbub31_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubbub.c:warning:no-previous-prototype-for-hubbub32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubp.c:warning:no-previous-prototype-for-hubp32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|   `-- ftrace-ops.c:(.init.text):undefined-reference-to-__udivdi3
|-- i386-randconfig-m021
|   `-- kernel-trace-trace_events_synth.c-trace_event_raw_event_synth()-warn:inconsistent-indenting
|-- i386-randconfig-s001
|   |-- drivers-gpu-drm-i915-gem-i915_gem_ttm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-assigned-usertype-ret-got-int
|   `-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- i386-randconfig-s002
|   `-- drivers-gpu-drm-i915-gem-i915_gem_ttm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-assigned-usertype-ret-got-int
|-- i386-randconfig-s003
clang_recent_errors
`-- s390-randconfig-c005-20230210
    `-- fs-verity-enable.c:warning:Null-pointer-passed-as-1st-argument-to-memory-set-function-clang-analyzer-unix.cstring.NullArg

elapsed time: 1238m

configs tested: 71
configs skipped: 8

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                        nsimosci_defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                      footbridge_defconfig
arm                            qcom_defconfig
arm                           sunxi_defconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                          randconfig-a016
i386                          randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                        m5272c3_defconfig
m68k                       m5275evb_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                       bmips_be_defconfig
mips                         db1xxx_defconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allmodconfig
riscv                               defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
sh                        edosk7760_defconfig
sh                          sdk7786_defconfig
sh                           se7343_defconfig
sh                     sh7710voipgw_defconfig
sparc                             allnoconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                        randconfig-a006
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
i386                              allnoconfig
i386                          randconfig-a006
mips                        qi_lb60_defconfig
powerpc                     mpc5200_defconfig
powerpc                    mvme5100_defconfig
powerpc                      ppc64e_defconfig
powerpc              randconfig-c003-20230210
riscv                randconfig-c006-20230210
s390                 randconfig-c005-20230210
s390                 randconfig-r044-20230210
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
