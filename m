Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E55571BF2
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2019 17:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfGWPjw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jul 2019 11:39:52 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35852 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfGWPjw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jul 2019 11:39:52 -0400
Received: by mail-oi1-f194.google.com with SMTP id q4so3457696oij.3;
        Tue, 23 Jul 2019 08:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3LRI5UFjq44LBBsGkyZn0c1iwjTBwJ4UTljGvj/dw6Y=;
        b=h8vwLnbBPQsGxc9Dxgi6cnp+tWZL66OzaUK0LLg5lps8jOzDiMNzLQP4DlBgNNqcAX
         pveKI/1u+uoctBKef0HfBbHjGns8cK0kmus8RoLprdo0cXf34n7ItPeGGlRWProrTMHp
         iopk176bO0r4d9tql6rtiF7xEOc+bDCxHTUzBEyrCRr+CpiP0ez6XcsXHjB0OKuMibeq
         JPUgfrjUIf3VdKwoaPBGllX3HYgu9ScN+K20RkQj3BcLJOuEDJ+ltghRg7m6Nnek+b5K
         HVHgb3yxBjcAU+PHJ81JyaCbwy4rJ+YlX3pPQJYTZWMwd9xZE1eIAqS/wDi+c+yrXnFz
         AGAA==
X-Gm-Message-State: APjAAAVGpZj2loLCqwtzl5KfRYetKi2RpIKSQpIHmKCRWlP7opJsQVEt
        h9nFnaSEDZzz7qKrs6C9rX0We25AOqI3D2p81WlCZw==
X-Google-Smtp-Source: APXvYqwCaeRX0/ukewQLWY9NtFhKzlFerKVFsRpBXybOEA8aU+bcGmK/xxtuS8ZeOR85kl+PHrPdml7b97UouubKPrk=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr34013805oif.148.1563896390666;
 Tue, 23 Jul 2019 08:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190723080441.19110-1-geert@linux-m68k.org>
In-Reply-To: <20190723080441.19110-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Jul 2019 17:39:39 +0200
Message-ID: <CAMuHMdVuVqXnW8SEnpcbvh8agYvPh775rv9tmV9kGUa6Q2wcwA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.3-rc1
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     linux-um@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-mips@vger.kernel.org,
        Parisc List <linux-parisc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 23, 2019 at 5:22 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.3-rc1[1] compared to v5.2[2].

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/5f9e832c137075045d15cd6899ab0505cfb2ca4b/ (241 out of 242 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/0ecfebd2b52404ae0c54a878c872bb93363ada36/ (all 242 configs)
>
>
> *** ERRORS ***
>
> 11 error regressions:
>   + /kisskb/src/drivers/misc/lkdtm/bugs.c: error: 'X86_CR4_SMEP' undeclared (first use in this function):  => 281:13
>   + /kisskb/src/drivers/misc/lkdtm/bugs.c: error: implicit declaration of function 'native_read_cr4' [-Werror=implicit-function-declaration]:  => 279:8
>   + /kisskb/src/drivers/misc/lkdtm/bugs.c: error: implicit declaration of function 'native_write_cr4' [-Werror=implicit-function-declaration]:  => 288:2

um-all{mod,yes}config

>   + /kisskb/src/drivers/net/wireless/intel/iwlwifi/fw/dbg.c: error: call to '__compiletime_assert_2446' declared with attribute error: BUILD_BUG_ON failed: err_str[sizeof(err_str) - 2] != '\n':  => 2445:3
>   + /kisskb/src/drivers/net/wireless/intel/iwlwifi/fw/dbg.c: error: call to '__compiletime_assert_2452' declared with attribute error: BUILD_BUG_ON failed: err_str[sizeof(err_str) - 2] != '\n':  => 2451:3
>   + /kisskb/src/drivers/net/wireless/intel/iwlwifi/fw/dbg.c: error: call to '__compiletime_assert_2790' declared with attribute error: BUILD_BUG_ON failed: invalid_ap_str[sizeof(invalid_ap_str) - 2] != '\n':  => 2789:5
>   + /kisskb/src/drivers/net/wireless/intel/iwlwifi/fw/dbg.c: error: call to '__compiletime_assert_2801' declared with attribute error: BUILD_BUG_ON failed: invalid_ap_str[sizeof(invalid_ap_str) - 2] != '\n':  => 2800:5

powerpc-all{mod,yes}config{,+64K_PAGES}
mips-allmodconfig

>   + /kisskb/src/include/linux/kprobes.h: error: implicit declaration of function 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'? [-Werror=implicit-function-declaration]:  => 477:9

parisc-allmodconfig

>   + /kisskb/src/mm/hmm.c: error: implicit declaration of function 'pud_pfn' [-Werror=implicit-function-declaration]:  => 753:3, 753:9
>   + /kisskb/src/mm/hmm.c: error: implicit declaration of function 'pud_pfn'; did you mean 'pte_pfn'? [-Werror=implicit-function-declaration]:  => 753:9

ppc64_book3e_allmodconfig
um-all{mod,yes}config

>   + error: "vmf_insert_mixed" [drivers/gpu/drm/exynos/exynosdrm.ko] undefined!:  => N/A

sh-all{mod,yes}config (fix available)


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
