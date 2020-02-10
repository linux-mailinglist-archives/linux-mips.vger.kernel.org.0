Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5D0157CF8
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2020 15:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbgBJOBU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 10 Feb 2020 09:01:20 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43421 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgBJOBU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Feb 2020 09:01:20 -0500
Received: by mail-oi1-f195.google.com with SMTP id p125so9228923oif.10;
        Mon, 10 Feb 2020 06:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SGRLtFuPjCxX/c1sdYAK1nzg8ffA4fOAQeYngOgj4Ro=;
        b=mBsp2ZWxSnLuNaXyJt4XCNBOI0LgsWyierCk3vTTo2iPmPslxJOiDLLqTpPnVQKmvR
         5APYrFJVTPkGNwu+dTuNMsAwCdJ/ClhfHFYlKK4qmsLkLsTJwvGXiYCTm6YHegea27hu
         /GPYNKqT33RpgNxczW85NHxt6SgDMpw4UKWd2VWyzJ7ecPC7vG+PurhCcwWurRdh6RHs
         s54a4bG/Av3j334paK6Hl+ARkQbXcPbrixZ7OwUeg077B+ma9vjymCBIZwx7kz2MG8x2
         rKhiwMxEsT9J9QJJ9oum/5ua62SKJqE/sF/5PJ8YYUabQBj32Y6Rk5mU+i+lf5n1zd6S
         fjxw==
X-Gm-Message-State: APjAAAU1SvolhIhmSSdQn/TAPOM0MJfglQSlvi7S1fqBzkXQ25FaUKyd
        6JYtJ6+WteqFwoTaLNJLUk5zBfMgfVVmJT6DjusZD98Z
X-Google-Smtp-Source: APXvYqw2qLR/NreZ2Aikg5+XVkxHG1PCX4MjvkHhS/4sPjkPtwOwX4ZyWe812VPLL/N4mjbPtSB+j+qK+HdAuTuQMno=
X-Received: by 2002:a54:4707:: with SMTP id k7mr843431oik.153.1581343279510;
 Mon, 10 Feb 2020 06:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20200210135506.11536-1-geert@linux-m68k.org>
In-Reply-To: <20200210135506.11536-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 15:01:08 +0100
Message-ID: <CAMuHMdXM9S1VkFMZ8eDAyZR6EE4WkJY215Lcn2qdOaPeadF+EQ@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.6-rc1
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Timothy Pearson <tpearson@raptorengineering.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 10, 2020 at 2:55 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.6-rc1[1] compared to v5.5[2].

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9/ (all 324 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/d5226fa6dbae0569ee43ecfc08bdcd6770fc4755/ (232 out of 324 configs)

> 6 error regressions:
>   + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: error: implicit declaration of function 'cpu_has_feature' [-Werror=implicit-function-declaration]:  => 626:2
>   + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: error: implicit declaration of function 'disable_kernel_vsx' [-Werror=implicit-function-declaration]:  => 662:2
>   + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: error: implicit declaration of function 'enable_kernel_vsx' [-Werror=implicit-function-declaration]:  => 626:2

powerpc-gcc4.6/ppc64_book3e_allmodconfig (but not
powerpc-gcc8/ppc64_book3e_allmodconfig? compiler too old?)

>   + /kisskb/src/drivers/gpu/drm/drm_edid.c: error: call to '__compiletime_assert_3282' declared with attribute error: BUILD_BUG_ON failed: cea_mode_for_vic(8)->vtotal != 262 || cea_mode_for_vic(9)->vtotal != 262 || cea_mode_for_vic(12)->vtotal != 262 || cea_mode_for_vic(13)->vtotal != 262 || cea_mode_for_vic(23)->vtotal != 312 || cea_mode_for_vic(24)->vtotal != 312 || cea_mode_for_vic(27)->vtotal != 312 || cea_mode_for_vic(28)->vtotal != 312:  => 3275:2

All over the place (fix available)

>   + error: "__udivdi3" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!:  => N/A
>   + error: "__umoddi3" [drivers/pci/controller/pcie-brcmstb.ko] undefined!:  => N/A

mips-allmodconfig

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
