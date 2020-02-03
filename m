Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 571A51508B2
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2020 15:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgBCOq2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Feb 2020 09:46:28 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39444 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbgBCOq2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Feb 2020 09:46:28 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so18522150wrt.6;
        Mon, 03 Feb 2020 06:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tMM4CAawPMR8gUufLoNQFgcc2EwWoDOVGHEyUpiGjGI=;
        b=hxMYDcZ4kZYU2upuRV/2llW2C8uf47+n55DRT8mMYfIF/zL5CKn4ISpPHesWDynpvy
         CHSDZuPhKTGEWzgydEKo6nN0wfpx3bBoHDx0Av2KYqNxrK5tx98NLOj6+NJ7ERCMgK6N
         S9TMY9XBiVJyufWrm6gfprVg8JXfNqyyr4mDfDnnR+K2LhkF/5mIOrjxLz7kQ+tSAQUZ
         dZmrN39IioT+QOTS5vzuacxyBphGgEZRQYqp5V2LEF1/p/CWpD/9DKX+Y7gtFEATWqCh
         tnFu42q9Wb6NikCfrzjtuBKdjSW4Lulm19ZAXHodZYHDfvGvbDfrmUvkAH5K9EwjOEwj
         ZTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tMM4CAawPMR8gUufLoNQFgcc2EwWoDOVGHEyUpiGjGI=;
        b=Szc7y3noyj7Pc8QCiVdGIrlkMcKbI268YpdDjmVUgfTnMfOgAITYD2yZJ47XDNme9m
         /pX0PmiEdKDsyFeDwFpom7D4+hUuKpTW/wvGZROxsS09lAcYPY6OAVTnE9l0AykpZ4BO
         nkxNe4gm3of2rH160G/52pe8KVdsLV4r3RimJ6xnEr114uvFk4DNomCdTBZrshTQICIN
         Vl+zSVVKQytk2t8N4+4MO/wrOM4AqxEyn7zhNrRvaixc1FUfzh2xHi4ZOCqTFDia+xGc
         SQ0XocO1hrfSI9OyN/nwmvFQFJyE5w+jA0wrB4q/5rcct2DuPHe7lufX8ZhfGp7FsiNg
         mqOw==
X-Gm-Message-State: APjAAAUQt2Uvdd8L8kWEPxYtg379oiWwNvPnCaLUoukjt9B2brvZglou
        iRHQ4R7FtduABjuBeiVQqjGTxo7N/71J5OilKz8=
X-Google-Smtp-Source: APXvYqy59RG2LpLeid+co/h0YICewTE95xyDO4W08Jab1qQ5XRFDXFtpakqe80Ycz50jrmMRM571xaQtTBO4NA6zFYE=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr16105157wrq.206.1580741185953;
 Mon, 03 Feb 2020 06:46:25 -0800 (PST)
MIME-Version: 1.0
References: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
From:   Jonas Gorski <jonas.gorski@gmail.com>
Date:   Mon, 3 Feb 2020 15:46:59 +0100
Message-ID: <CAOiHx==FfiQoFA9cESSni_izS=m+mm7G+gk_tei5XFnKrgurew@mail.gmail.com>
Subject: Re: [PATCH v2,RESEND] MIPS: Scan the DMI system information
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jean Delvare <jdelvare@suse.com>,
        Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinglu Yang <yangyinglu@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, 16 Jan 2020 at 14:28, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
> (dmi_system_id) for printing it out on task dumps and prepares DIMM entry
> information (dmi_memdev_info) from the SMBIOS table. With this patch, the
> driver can easily match various of mainboards.
>
> In the SMBIOS reference specification, the table anchor string "_SM_" is
> present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
> but there exists a special case for Loongson platform, when call function
> dmi_early_remap, it should specify the start address to 0xFFFE000 due to
> it is reserved for SMBIOS and can be normally access in the BIOS.
>
> This patch works fine on the Loongson 3A3000 platform which belongs to
> MIPS architecture and has no influence on the other architectures such
> as x86 and ARM.
>
> Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
> [jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Reviewed-by: Huacai Chen <chenhc@lemote.com>
> ---
>
> v2:
>   - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
>   - refine definitions and Kconfig by Jiaxun
>
>  arch/mips/Kconfig           | 10 ++++++++++
>  arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
>  arch/mips/kernel/setup.c    |  2 ++
>  drivers/firmware/dmi_scan.c |  6 +++++-
>  4 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/include/asm/dmi.h
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 4b83507..c097f78 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2773,6 +2773,16 @@ config HW_PERF_EVENTS
>           Enable hardware performance counter support for perf events. If
>           disabled, perf events will use software events only.
>
> +config DMI
> +       default y if MACH_LOONGSON64
> +       select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
> +       bool "Enable DMI scanning"

Is this option harmless to enable for other MIPS platforms? What
happens if it is enabled on devices where PHYS_OFFSET isn't 0, so
0xF0000 is likely not backed by anything and accessing it might hang
the system?

This probably should depend on MACH_LOONGSON64.

Regards

Jonas
