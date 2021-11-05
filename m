Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A80446830
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 18:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbhKESB4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 14:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbhKESBz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 14:01:55 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC7EC061714
        for <linux-mips@vger.kernel.org>; Fri,  5 Nov 2021 10:59:15 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id d3so14942751wrh.8
        for <linux-mips@vger.kernel.org>; Fri, 05 Nov 2021 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tGkFto0SREmSqUA5YI0n/LIXjjGKHRviX7CKssvc+BM=;
        b=H3jiklJ/Y/eada1RvgM3UfPQsPX0by+cBlb6mu+HZpANjjDP2EAco1y7vZs0KY5Z3K
         C8MdQ3+I5NEL9N/8IXXGyNI+uyZ82MNp7mVpaN4cTft5wEm0pU8+BSK0UHCLXzGllUnZ
         noFTpfuPfo5PmpoXi87sKvb6OeEHMYA2hz+qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tGkFto0SREmSqUA5YI0n/LIXjjGKHRviX7CKssvc+BM=;
        b=OnWzizc8gTIOdNOJ+KHd7gRAVB3nErQ6kXRbzcKwxkTw2IcMFeiIQ3hmJaMSQQdeOp
         re+joODaGWoCxuMyhdgR9kR4YVzmch7mb5QWf/STHO8gKno9JpOjYYaapR05rJrdLyU8
         T0aueqOAXUvfCo1dy6z1qElXKSSO+mu0wcC2pCrq8BOt7hVNPEyK4pyvfutCmn1EB+L6
         AchbfDPH4vdEoDy+cr9PGGgpNhrD4+S922GT9L/b/+D8Q8a18wB1d0VLFEyZTrmkMHuk
         EmqqrBf7vbEqr0BjE2r0irVuP2J2+bdqBOjRRJ449vUWfcQEqFx1lbJ4MWos1wgdc8ut
         TZ+Q==
X-Gm-Message-State: AOAM5323YNsGgNREKozKojsKHxACWrWifVQM2oOZUQeacT2lpZ/MmfBZ
        NHX6un4jKIGNaQMK41bIUXogrw==
X-Google-Smtp-Source: ABdhPJwNq7bzeIgDFzjtJqF6GB5todXBINJj4e6J3QfytVexB5YUgQf8SyXm53D1wok8LpIRuN/xuA==
X-Received: by 2002:adf:f98c:: with SMTP id f12mr38342127wrr.184.1636135154166;
        Fri, 05 Nov 2021 10:59:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n7sm8549638wro.68.2021.11.05.10.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 10:59:13 -0700 (PDT)
Date:   Fri, 5 Nov 2021 18:59:11 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     kernel test robot <lkp@intel.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, noralf@tronnes.org,
        marcel@ziswiler.com, naresh.kamboju@linaro.org,
        llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-aspeed@lists.ozlabs.org, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm: Remove CONFIG_DRM_KMS_CMA_HELPER option
Message-ID: <YYVw70934dYhyGVZ@phenom.ffwll.local>
References: <20211101081751.24613-3-tzimmermann@suse.de>
 <202111012344.tYv3YxkG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202111012344.tYv3YxkG-lkp@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 01, 2021 at 11:59:15PM +0800, kernel test robot wrote:
> Hi Thomas,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on next-20211029]
> [cannot apply to drm/drm-next shawnguo/for-next pinchartl-media/drm/du/next v5.15 v5.15-rc7 v5.15-rc6 v5.15]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-Small-CMA-cleanups/20211101-161911
> base:    bdcc9f6a568275aed4cc32fd2312432d2ff1b704
> config: x86_64-randconfig-a004-20211101 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82ed106567063ea269c6d5669278b733e173a42f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/c3c7ec5f9ccd90e78f0f2d3143505db4060bbf17
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Thomas-Zimmermann/drm-Small-CMA-cleanups/20211101-161911
>         git checkout c3c7ec5f9ccd90e78f0f2d3143505db4060bbf17
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vmap from namespace DMA_BUF, but does not import it.
> >> ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap from namespace DMA_BUF, but does not import it.

I guess this is simply because kbuild tests on top of linux-next, where
the namespacing is a bit funny. We might need a fixup when we backmerge.

Either way this looks like a good simplification to me, on the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
