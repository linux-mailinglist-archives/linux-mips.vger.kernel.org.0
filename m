Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208CD386DF9
	for <lists+linux-mips@lfdr.de>; Tue, 18 May 2021 01:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239438AbhEQX6w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 May 2021 19:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbhEQX6v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 May 2021 19:58:51 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB48CC061756
        for <linux-mips@vger.kernel.org>; Mon, 17 May 2021 16:57:32 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w15so9317703ljo.10
        for <linux-mips@vger.kernel.org>; Mon, 17 May 2021 16:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z0qUZGfT26ITfIbWe5iIQjL/DVVaqMgfxDEgws9kkSk=;
        b=Ah/L26KR2XPquHyuahWpR873usJ1ASZQo3dbOp0U9G424EAniTpdty05hu28QHrHKO
         hiHx8RdVGCFJ5V3KJeXMh3vVxqiGhov9zN0/X0lk/FhR+jPDqXx/VsrtNUt5/yF2l5ow
         DmVtm33Qk1dra3kupQQaB6J/DR8CtuOkXcA/uQpLsoo2F/mt2cGE6rOcylfudD4hHiaQ
         i24Fg5zOEcVi6qZSCE0Yh9ahdpGP/7AZlNpJ7PXVxjDbwy0xTDhhLrJOjXE6AHDoCNNs
         5HGk0JtSqmPPfkwcuNaLVaWcUNHd33HXSVI+RsNw+9CAGZH2ZVBMY0aAlOTq7pSWPoYf
         bj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z0qUZGfT26ITfIbWe5iIQjL/DVVaqMgfxDEgws9kkSk=;
        b=mWyQHp8UcyuSnaruchhRb2NwwXLY1/kzqSUsgnUza/6WaG6hLy5DjRMGyRIsPybHOi
         7SDhC9BhZ+CxrJMhc1ZCXLuxbfRmilsvo1XTx8vfYne+YLkv1WTR4D0rzF6UZl9svP+3
         YqmE/ZK//qWE/nnCO4adzxaTa5OrelbHlTpTwpn+dKUC8MaZjL0wz2FBvtKwaMHGZL6h
         UGV5h6QS2LSp6C5FfASg905VjnxlPIAIz9t94o02yN/ASp0Dx4xmYeiWUSKOFUNQ1ViW
         ENE4rIKRN7iqCSZaJ+Vy1nCRnjJDnkQEMJndIANLDUYdpac57gdspxFm+NaOBKlXZejU
         x7rg==
X-Gm-Message-State: AOAM532/stQqa8cayp2EAerZ2K+olApSArptohyXc+HekmJXDfJ9Cftx
        1BS08FND9jBJ+piT00DMq7MMj1QQHO2OvxQpwPOsBA==
X-Google-Smtp-Source: ABdhPJy+6bXS2bIIKWnuU1MLzKml8LidyaBLX/xVVZdX+UIT/sHYVGWk2dH/bkRSf45nwwwObsfzXCXzDOUn3cDLOBA=
X-Received: by 2002:a2e:814d:: with SMTP id t13mr1598888ljg.467.1621295851449;
 Mon, 17 May 2021 16:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210517234117.3660-1-rdunlap@infradead.org>
In-Reply-To: <20210517234117.3660-1-rdunlap@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 May 2021 01:57:20 +0200
Message-ID: <CACRpkdaMaNAUTVu9r7dY0=NHUS0KJ-9Hs252iPbACbs6Qnn7Wg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: ftpci100: rename macro name collision
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-pci <linux-pci@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 18, 2021 at 1:41 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> PCI_IOSIZE is defined in mach-loongson64/spaces.h, so change the name
> of the PCI_* macros in pci-ftpci100.c to use FTPCI_* so that they are
> more localized and won't conflict with other drivers or arches.
>
> ../drivers/pci/controller/pci-ftpci100.c:37: warning: "PCI_IOSIZE" redefi=
ned
>    37 | #define PCI_IOSIZE 0x00
>       |
> In file included from ../arch/mips/include/asm/addrspace.h:13,
> ...              from ../drivers/pci/controller/pci-ftpci100.c:15:
> arch/mips/include/asm/mach-loongson64/spaces.h:11: note: this is the loca=
tion of the previous definition
>    11 | #define PCI_IOSIZE SZ_16M
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Krzysztof Wilczy=C5=84ski <kw@linux.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
> v2: prefix PCI_ macro names with "FT", thus use FTPCI_ for these macro na=
mes.
>     (suggested by Linus Walleij)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
