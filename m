Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7882310B461
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 18:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfK0RZ7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 27 Nov 2019 12:25:59 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:37376 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfK0RZ7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Nov 2019 12:25:59 -0500
Received: by mail-yw1-f65.google.com with SMTP id 4so8239113ywx.4;
        Wed, 27 Nov 2019 09:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JRvuKyuIOQvF9AQSNTrj3uSPTaDg8FtRv0pACDML4ic=;
        b=Ue553OTEDOmSKdKj13BlQ3Z69lqQ2WBe8thKchHE/+AwSLE3G+5Yz55kzDOX4tZ+dm
         fKOOBIeCAuBX88pZXzmIfX0++hc/8qyAxkpZISKb65SpxEeDr7bO4MgNherMmlRooIoB
         +95Die/3SWUGyaPPAs1wEboSw6k4ahBBuHx6JXCDD/D84l/2d8AT3oOvsxv2e15M/rGy
         9C+CtpsD8VuSkQHFAmYbVDePS+AuofnV907BvJrdfOel0pAFC2QGGpUvWfs7HklYfxIM
         2DNcS8JVbsspnA4Fq6+LGVGtyy2UpxbIwN2bwU02zQ3MgaTk1TjpzMCCkXb+nhwPpYDR
         SMrw==
X-Gm-Message-State: APjAAAV0CNh2TpBdxSSUdkucz/U2EQHl9pHFP3/SgjUpXhdSMTz+gPGS
        w4ws/eCuk5U+nCMhsSP+o1GtgjgdvA4883tRISrbff72
X-Google-Smtp-Source: APXvYqwmBHGxI5HEzDr+oN8T1Z4DLvRjLlJfDPqNUvL4LMPBhAs+G2Kng5SnQHBaBpEa8Ye8EpeV+KjxhxoJE1ANwZc=
X-Received: by 2002:a81:c609:: with SMTP id l9mr3661232ywi.37.1574875558029;
 Wed, 27 Nov 2019 09:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20191127152612.21945-1-linux@roeck-us.net>
In-Reply-To: <20191127152612.21945-1-linux@roeck-us.net>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Wed, 27 Nov 2019 18:25:47 +0100
Message-ID: <CAAdtpL7UVqY6LSbCBeB9FXGDt499xUV072ndXxZuiahTN6UU+A@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix boot on Fuloong2 systems
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 27, 2019 at 4:28 PM Guenter Roeck <linux@roeck-us.net> wrote:
> Commit 268a2d60013049 ("MIPS: Loongson64: Rename CPU TYPES") changed
> Kconfig symbols as follows:
>         CPU_LOONGSON2 to CPU_LOONGSON2EF
>         CPU_LOONGSON3 to CPU_LOONGSON64
>         SYS_HAS_CPU_LOONGSON3 to SYS_HAS_CPU_LOONGSON64
>
> It did not touch SYS_HAS_CPU_LOONGSON2E or SYS_HAS_CPU_LOONGSON2F.
> However, the patch changed a conditional from
>
>  #if defined(CONFIG_SYS_HAS_CPU_LOONGSON2E) || \
>      defined(CONFIG_SYS_HAS_CPU_LOONGSON2F)
>
> to
>
>  #if defined(CONFIG_SYS_HAS_CPU_LOONGSON2EF)
>
> SYS_HAS_CPU_LOONGSON2EF does not exist, resulting in boot failures
> with the qemu fulong2e emulation. Revert to the original code.

Thanks Guenter for running your test suite and catching this!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Fixes: 268a2d60013049 ("MIPS: Loongson64: Rename CPU TYPES")
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/mips/include/asm/cpu-type.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
> index c46c59b0f1b4..49f0061a6051 100644
> --- a/arch/mips/include/asm/cpu-type.h
> +++ b/arch/mips/include/asm/cpu-type.h
> @@ -15,7 +15,8 @@
>  static inline int __pure __get_cpu_type(const int cpu_type)
>  {
>         switch (cpu_type) {
> -#if defined(CONFIG_SYS_HAS_CPU_LOONGSON2EF)
> +#if defined(CONFIG_SYS_HAS_CPU_LOONGSON2E) || \
> +    defined(CONFIG_SYS_HAS_CPU_LOONGSON2F)
>         case CPU_LOONGSON2EF:
>  #endif
>
> --
> 2.17.1
>
