Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0A638289B
	for <lists+linux-mips@lfdr.de>; Mon, 17 May 2021 11:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236079AbhEQJoH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 May 2021 05:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236032AbhEQJoH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 May 2021 05:44:07 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CD9C06174A
        for <linux-mips@vger.kernel.org>; Mon, 17 May 2021 02:42:51 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id p20so6381033ljj.8
        for <linux-mips@vger.kernel.org>; Mon, 17 May 2021 02:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UP+upDmCTGGCkv2e936LXUsatKVc2MHLH3tDuqtJj/M=;
        b=Dqrp6jfbFk3R9kBr5Ll75CW043kOk4QfSQLDAuIfUakNlQ8C4sgDrKJw8LQEu3AM1w
         +u+/9BobbgZIHK9EwBD9phy/kxkflFLJ1hxAHMMZBZRrL2tQ2ZSiwEO/tyCVCiFs9qck
         YDYFDeMl/IoPBpUyUgvqnnHNR/60akKfddwikYAay/HTyECO0dvmXp35Wwy8v4JQFmA/
         M+/brzeagfSoL2rez2taFYhHuDMzYxm8W4qcgWdoAO3+UcFJ00xvEjglCrC7cVvxfxau
         ogatNeDQaW0+NxdQSzC17qbMHKSlw+3GhHcsdkJsHzRicunL7mweD9Tx2l3xM+DnaC1T
         yt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UP+upDmCTGGCkv2e936LXUsatKVc2MHLH3tDuqtJj/M=;
        b=iVg3efDJuxyqPhD343XJGGKP/86+44EjLSVFgW85gik1aEugpH+Dfk6R0RlKrOJ2kg
         93OmFYBqwE425q2TZbxZJfr2h1G4UwY/FBuhkl9hMbSu9V6EtrsH/TE/yJRSUlspqNot
         nOzxVtau4MicaCNgZmgGUEui7RllLmHiZA0FrOmHGFEE6K7AAnNPN+dytTzTrR24qgJ+
         Elludg5pgizhdB1SP4ixh7vGow1IWcBLpluYO1rlu4JQ0xt5CbDp9ztv7HoLsUhjvVDP
         vzqOtwBPsT+wOegj2Pag3y8pCIJb7ZCnECYH3WQNOxKu7HqnNkUxLZJqtY1UywAOj23p
         7KlA==
X-Gm-Message-State: AOAM531oIVJuLF6Pc1BdXYSyNrRvRsW4an54v8Nlokmu9jHhYvFn69QF
        cHDW+6+Wl2R2Y7fSx9iVEMU/uTKrKknlrIKEX1Xmfg==
X-Google-Smtp-Source: ABdhPJybQP1mQr+EEA7PrMERD5Mc5cP/cYS07TFL8gdGCvACGBJu3hS9pEvqnIlAP0pimXhfEg3pQLIODHMUBxFSV+c=
X-Received: by 2002:a2e:2e12:: with SMTP id u18mr48345997lju.200.1621244569712;
 Mon, 17 May 2021 02:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210516190014.25664-1-rdunlap@infradead.org>
In-Reply-To: <20210516190014.25664-1-rdunlap@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 May 2021 11:42:38 +0200
Message-ID: <CACRpkdbcN4d2sdCDjqqW7txDm7--_B2MX10CDA6z8FOq4mQ7=g@mail.gmail.com>
Subject: Re: [PATCH] PCI: ftpci100: rename macro name collision
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-pci <linux-pci@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 16, 2021 at 9:00 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> PCI_IOSIZE is defined in mach-loongson64/spaces.h, so change the name
> of this macro in pci-ftpci100.c.
>
> ../drivers/pci/controller/pci-ftpci100.c:37: warning: "PCI_IOSIZE" redefined
>    37 | #define PCI_IOSIZE 0x00
>       |
> In file included from ../arch/mips/include/asm/addrspace.h:13,
> ...              from ../drivers/pci/controller/pci-ftpci100.c:15:
> arch/mips/include/asm/mach-loongson64/spaces.h:11: note: this is the location of the previous definition
>    11 | #define PCI_IOSIZE SZ_16M
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Though I suspect the real solution is to prefix all macros with FTPCI_*?

Yours,
Linus Walleij
