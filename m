Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB00494E77
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jan 2022 13:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbiATM6P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jan 2022 07:58:15 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:33709 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244379AbiATM6O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jan 2022 07:58:14 -0500
Received: from mail-ed1-f47.google.com ([209.85.208.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MsaeR-1mHsEQ0Pcp-00u0hF; Thu, 20 Jan 2022 13:58:13 +0100
Received: by mail-ed1-f47.google.com with SMTP id cx27so28497566edb.1;
        Thu, 20 Jan 2022 04:58:13 -0800 (PST)
X-Gm-Message-State: AOAM5301uksg7TvFh+VWCE1x6ceAOW91G+NgQB/SvMLVSp6Sq4diDYHK
        WFEyPfLaMpcoDKzUtRglB9/M9GGCioKNCx8c6hQ=
X-Google-Smtp-Source: ABdhPJym7KyRCSRXKMerVMcQ/VMRiOiyKpoCP7tEcDc9DhkSEEWwSJxd9o5Jl5QZLGZ5wnpG9DwFk+lKhhVFjaoKItk=
X-Received: by 2002:a5d:6488:: with SMTP id o8mr12004975wri.219.1642671600998;
 Thu, 20 Jan 2022 01:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-16-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-16-guoren@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 20 Jan 2022 10:39:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
Message-ID: <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
Subject: Re: [PATCH V3 15/17] riscv: compat: Add UXL_32 support in start_thread
To:     Guo Ren <guoren@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
        Anup Patel <anup@brainfault.org>,
        gregkh <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        Christoph Hellwig <hch@lst.de>,
        Christoph Hellwig <hch@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        inux-parisc@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dpW6Fbqjl6ZS4eKdq8acW2JadLRdiVSLpiQdXlZcl5BUjvgmsSb
 SfabhnKZbCB8U6mcMGoCuesHdI+MUn/3J3AMGETqH3MHKfuGc9fDoboNjRF9+dzkmNkCSNX
 Oi326vdHylqPVfxjquN++P7/iwOAy22rUBElz5LuZqu6gFfZUWgRzHHvHnDUNIgcDZH5hkw
 MkIJfvEy/KT8GILk3gLew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WkGT38WSpT8=:cL1OVO+HViKy9NUOUpRjrB
 ILX2+sT5+xycPzvd3sv7HYafmHXY+V2kiGwMu2HmPl3HtKVz8jlvd2EjV3qUKiFgV9Az9IRmz
 Dgwk1R8sG0bvhFntMWQBzwZA4hk5cG99m6fZ95Eor7dVE6ySHvK/jdaz6/cmijchLxzQJ5aNl
 RuUXK1950LX/F9KxdiDVQMtg8mjnq5p/QCunPWXYszgGhBmmR0xVCcKMNQO/0pcW6ui6oCYyp
 v8RkjOmUTOcHT1ptEz66+tVhF1u/CzBqyF4inMzss3fTHV3yg3Ahn1bu8uZ7OHFuAeiEOm/ug
 SzYRS7eYVu1H+lXTe+4KcYhfFQv+Q5ih7SeyQzWq/Dpvai2ABYYE3lNRt9Ovo+gRIa3O5t/jJ
 bSCAh7Vl02KlZklvYwacna4zqTQq/I4MlpN5GaRLbisu+8zzIvi4mAftgI0YGAEzJXTUGDPC+
 /AojXxscxFSD+tBvUPOvujqxUuNTfx1S2Yfwu9mMxzW9Y+S46g6ZyeYBJOvoBwkfpTay2Z7ET
 0EYtsxK92drwh1angsmYuoCOrejUgqP0EpNSEmKO7cyUGx5Tm7zfYr6FlD4ovGqim6s0LVgSX
 VO9zVC3AFHxE3KjnLpYCnwsxa6qN9x6/vGaetrpJYa+HQC6ghUiPfCx2yvjWWuQ3g34acQMhE
 TvPUyLrHJLEexdMewCBXG4vNTbCVgGiqhZU2X8++kzX7kpuHnmtqFK80EP5d1hgM657MVBFb5
 k+ZCQJHw+1C11NraNgX61jhJ95gkrhWRwEdc3BN2muHO3cwWbUWTtW7g7RLWk8G+X3rifVRwp
 BMWq8ymx2jj4PIUr6fIhrEsdqVIYPwwVv8poi2PCCdeZ2MEp98=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> +
> +#ifdef CONFIG_COMPAT
> +       if (is_compat_task())
> +               regs->status |= SR_UXL_32;
> +#endif


You should not need that #ifdef, as the is_compat_task() definition is
meant to drop the code at compile time, unless the SR_UXL_32
definition is not visible here.

         Arnd
