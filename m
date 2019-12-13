Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1722611E062
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2019 10:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfLMJMs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Dec 2019 04:12:48 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:58847 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfLMJMs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Dec 2019 04:12:48 -0500
Received: from mail-qv1-f53.google.com ([209.85.219.53]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MzQbw-1hkY503oH2-00vNe9; Fri, 13 Dec 2019 10:12:47 +0100
Received: by mail-qv1-f53.google.com with SMTP id z3so572126qvn.0;
        Fri, 13 Dec 2019 01:12:46 -0800 (PST)
X-Gm-Message-State: APjAAAVdjH0AM8OalO420MJ9FsonYzOw7ARt4hV8ClWhQNe/3zsT85CZ
        jhDXXQcHOj6FyiMtjTuPQXWyXl3G3KFO6lzW2t0=
X-Google-Smtp-Source: APXvYqy/KOGEPMwdh4FoH/jyBuQcNsHmp5vzih7Ry8TS0OjC6q423kVxL+t8K+Md+55WWC+0cI3NaG9Z2+AmfTzLsdw=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr12468089qvg.197.1576228365743;
 Fri, 13 Dec 2019 01:12:45 -0800 (PST)
MIME-Version: 1.0
References: <1576225834-16389-1-git-send-email-sunguoyun@loongson.cn>
In-Reply-To: <1576225834-16389-1-git-send-email-sunguoyun@loongson.cn>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 13 Dec 2019 10:12:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nLz2FDxw28DBXVma9E2saWpGtt+y6tYm4jros6TUF6w@mail.gmail.com>
Message-ID: <CAK8P3a1nLz2FDxw28DBXVma9E2saWpGtt+y6tYm4jros6TUF6w@mail.gmail.com>
Subject: Re: [PATCH V2] MIPS: Add get_thread_area syscall
To:     Guoyun Sun <sunguoyun@loongson.cn>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:R7d2KjzKhAJPtKeDSv8HU1uxOAiuqRUm+tslKIJMlNfBnfaP/06
 Wc8wWq65uFcILTaFbdT7pedB99ynSOhtL9boFpHxbPhbXz3pcieG7JG4s1C7smgX/fA3swK
 YUo7u3RjvHpV5R8MBuiXPT11eYXAQCBjctuNcr8A92WfuKcM3htxlwZQzdcsguY+lkJPgI0
 OkTBGa4TSeIssgSvIjOkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D1U26v/T0Lc=:vGYDxyAHHQhrTtyDpF1QDd
 NFC6D8hMRY7sFvGCTDYXZEUIoX9Fy3ruXTsa4v4u/z7BsyEeN+7tTs39DNEAleMg7cVUpe1DE
 iqKDv8bCQ6QRlkr2PULHN/TP6smY6ckhpZw7BXnG3/yTy3y4hA+aad4ibbRFUz8RFfgtVLmel
 MQ92HK4/KhbVhStjLTgxQ1bOno1ivK1alDYDeKazucm7xh4KF8AIn/j+HYFdLnaLrn8ZAFBrw
 HI3Eh9OcPV1xfg5jvAmgTfdRQtyqZtS65dODXTblDFiwVdQhUUXYRo5FYhMwUSrMA5q6BE8Lx
 LHUKFWvGZhq8V8RSV7Y+9oAvvedROybewRwelMiOswXCWwJtA9kZDyQMUWvEB6hr7X0y32N2L
 6mQ1GVIuodyhr6eEqyRn4PVK/m2iae2+HYv1CvFIOjTw0BTWMO0Rgf6qoQWpawIrq4K2BFyDJ
 zhGXmYIgCNnznPiO5rRoPTYMmVKQrgYEEER5dIM2GSujuj/v5OyIyYzsTeSkGJltkSfRYEZeE
 dP/aEGeuIiQ4sDUDWOmbvjYqwOztbrpI5TrUpdrPGFwdaTBX1R4Q/ra8D0oX6pUcxLg8wI698
 9zB+/1tRtBvaevp9WMNzCbrJmjnqKXssQD3hUmEi7p4V/IQn4rPutsgRqoJngFIbA6STYp9hE
 FcyyXOv2Z9qw7qNsEVeRRaL8h6iyovUtmy5PXPhdP9WLhg2DL9YFlKmOrtGLBkERQfWK0tmHP
 7nFuLnD9FTYsv9sBnp+JqOoDX364C1g1ViPO127ORJu7Zvr0340Rt4uvANgJpK2LbBu3MHOPy
 uin5cfbEm5VILQUAnyqOzsnocqGWR/mkPxoAQ1TlYRM9AZNWzsOkAl4OyGvjKm6pfHljoeu2P
 YlyLBKRXkApEcT2jn12w==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 13, 2019 at 9:30 AM Guoyun Sun <sunguoyun@loongson.cn> wrote:

Thanks for fixing the numbers. On second look, I saw another problem:

> diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
> index c333e57..20bf4c5 100644
> --- a/arch/mips/kernel/syscall.c
> +++ b/arch/mips/kernel/syscall.c
> @@ -94,6 +94,16 @@ SYSCALL_DEFINE1(set_thread_area, unsigned long, addr)
>         return 0;
>  }
>
> +SYSCALL_DEFINE1(get_thread_area, unsigned long __user *, u_info)
> +{
> +       struct thread_info *ti = task_thread_info(current);
> +
> +       if (copy_to_user(u_info, &(ti->tp_value), sizeof(ti->tp_value)))
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +

This won't work for compat mode, when tp_value is a different size
in kernel and user space. You could either add a COMPAT_SYSCALL_DEFINE1()
variant, or handle it like

        if (in_compat_syscall())
                   return put_user(ti->tp_value, (__u32 *)u_info);
        return put_user(ti->tp_value, u_info);


      Arnd
