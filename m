Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0DB4C1327
	for <lists+linux-mips@lfdr.de>; Wed, 23 Feb 2022 13:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240640AbiBWMtR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Feb 2022 07:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240606AbiBWMtF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Feb 2022 07:49:05 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40047A8891;
        Wed, 23 Feb 2022 04:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645620517; x=1677156517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SeCtxrXr47ee1ECiebJOHKwJcw5JwFiRtxOV0liAsAM=;
  b=bCZmVIckcTvorv5HlejCowrneY4kG6IossE8NkrXzu1UfiNhi1cA4a+Q
   xPHYYCEbKURyOrZaMo3zeQIwMFRKNfKoMwxJSx8BoKShuYC9DC4Jecz/e
   Jso9hce7via17zitv2xXH9QYsZrW1xuEkvHe+CoirgmfNQZhw7nZ17JIM
   d3Gm0iIc3FzEKwqdA5ni+euCQKDtXxIx/j8h9UmKYywfTihHlmVGWpLzr
   f6FNNeftd0lBN8bo/fVglligjUFAll5+5OHzKUk711INN3ILKRUXvkBis
   ZRbwAD3CXx2uqZDEG7W4PII8PtR2bOSSPrIsusa7210EAVN0eexwyzLjW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="249537081"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="249537081"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:48:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="683884207"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2022 04:48:30 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMr4I-0001Q5-6I; Wed, 23 Feb 2022 12:48:30 +0000
Date:   Wed, 23 Feb 2022 20:47:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sui Jingfeng <15330273260@189.cn>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dan Carpenter <error27@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Qing Zhang <zhangqing@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v10 3/4] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <202202231909.8x2nM3si-lkp@intel.com>
References: <20220220145554.117854-4-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220220145554.117854-4-15330273260@189.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sui,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on robh/for-next v5.17-rc5 next-20220222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Jingfeng/drm-lsdc-add-drm-driver-for-loongson-display-controller/20220220-225801
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-randconfig-r012-20220221 (https://download.01.org/0day-ci/archive/20220223/202202231909.8x2nM3si-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/3891cda03ed77e66fafaf7cfe075042e13f20173
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sui-Jingfeng/drm-lsdc-add-drm-driver-for-loongson-display-controller/20220220-225801
        git checkout 3891cda03ed77e66fafaf7cfe075042e13f20173
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ttm_bo_init
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(drm_gem_vram_create) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ttm_bo_put
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(drm_gem_vram_put) in archive drivers/built-in.a
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(drm_gem_vram_object_free) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ttm_tt_init
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(bo_driver_ttm_tt_create) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ttm_tt_fini
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(bo_driver_ttm_tt_destroy) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ttm_bo_move_memcpy
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(bo_driver_move) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ttm_bo_vunmap
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(drm_gem_vram_bo_driver_move_notify) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_gem_ttm_print_info
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(drm_gem_vram_object_funcs) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_gem_ttm_mmap
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(drm_gem_vram_object_funcs) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ttm_bo_eviction_valuable
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(bo_driver) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_gem_ttm_dumb_map_offset
   >>> referenced by lsdc_drv.c
   >>> gpu/drm/lsdc/lsdc_drv.o:(lsdc_vram_driver_stub) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ttm_bo_move_to_lru_tail
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(drm_gem_vram_pin) in archive drivers/built-in.a
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(drm_gem_vram_unpin) in archive drivers/built-in.a
   >>> referenced by drm_gem_vram_helper.c
   >>> gpu/drm/drm_gem_vram_helper.o:(drm_gem_vram_vmap) in archive drivers/built-in.a
   >>> referenced 1 more times
..

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
