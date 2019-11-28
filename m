Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72DD510CF15
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 21:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfK1ULW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 28 Nov 2019 15:11:22 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:38926 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfK1ULV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 15:11:21 -0500
Received: by mail-yw1-f65.google.com with SMTP id h126so289731ywc.6;
        Thu, 28 Nov 2019 12:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yNRfpRmIiyJSm9sLthzoVOLZgK+LABjfIHw45ZXSmwc=;
        b=aw7330jmXPr3XDY07NNilKHBDmt7aUHMO3Nf6tyXBRwezUEbpHCfoMtompWYkzkRqt
         iB1qQ41OpXR4bZgnQldOT/tVVNBo6d3Bt3Nmr95nGCfe/UsD89loOup53qd1XJjgeh4h
         xSj9riLvO+uvXWprSoM/K1+r/mTfFH5CGcujOTUC/aRgBr8X53B92b1GITyQ04f0ghZj
         Rr83apLnuFreAfQqeHoriBLqwEJQz+qXJwjhdw/Tximy6IbU3GwyV8upg8feQyuan/Gz
         BKTGWbjQSDInKjDlsni7VBpdgXuQRW4FEAN4gYtK9+VINGea8NNUrmcxnxx6DZ7yNdnt
         /Bog==
X-Gm-Message-State: APjAAAW4TUiivAoy7oQRpIRS8UgKJ+M7h1cwjI9Q9KYHQud0xjnv+aoj
        amXyuosapIuCaeTS7aDn1e6BiPArohFcbXqLhiBVgev7
X-Google-Smtp-Source: APXvYqwleB5UVAKoYvZx7B9gdaFmb+MsjV70+ytDAVetTReabxngbyI1mu+7bwHmN8C59MLnuXCZXGgWPcxjEdY8epk=
X-Received: by 2002:a81:32d5:: with SMTP id y204mr8758341ywy.201.1574971880746;
 Thu, 28 Nov 2019 12:11:20 -0800 (PST)
MIME-Version: 1.0
References: <9fcf53ca7372ef421e3b0836e4a7ec8239b380ec.camel@perches.com>
In-Reply-To: <9fcf53ca7372ef421e3b0836e4a7ec8239b380ec.camel@perches.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Thu, 28 Nov 2019 21:11:09 +0100
Message-ID: <CAAdtpL5bg=B6iKWT-QjnWzpW7hxU25PN_xtYq_1jX=2jbGfr=w@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Kconfig: Use correct form for 'depends on'
To:     Joe Perches <joe@perches.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 28, 2019 at 6:23 PM Joe Perches <joe@perches.com> wrote:
>
> Remove the CONFIG_ prefix from "depends on" as it makes the selection
> not possible.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/platform/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/mips/Kconfig b/drivers/platform/mips/Kconfig
> index f4d0a86..5e77b0 100644
> --- a/drivers/platform/mips/Kconfig
> +++ b/drivers/platform/mips/Kconfig
> @@ -18,7 +18,7 @@ if MIPS_PLATFORM_DEVICES
>
>  config CPU_HWMON
>         tristate "Loongson-3 CPU HWMon Driver"
> -       depends on CONFIG_MACH_LOONGSON64
> +       depends on MACH_LOONGSON64
>         select HWMON
>         default y
>         help
>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
