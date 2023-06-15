Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14BCA732073
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jun 2023 21:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjFOTmc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jun 2023 15:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjFOTmb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jun 2023 15:42:31 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081022959
        for <linux-mips@vger.kernel.org>; Thu, 15 Jun 2023 12:42:31 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-43f519c0888so891073137.3
        for <linux-mips@vger.kernel.org>; Thu, 15 Jun 2023 12:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686858150; x=1689450150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEzNrFy4XtnBJchIRCyudJpLzlojDK3YzlAqwYMXFT0=;
        b=lBwTUjIilesidUCNGaAvZ+xj4jRGP9ZPcdF6CpMtEeTbtwKGGC9zJYJcwMkwh5GDSj
         6TO/HyTtOMlwBDHVt0L6hSeGPFlURYJRwbR0dz4PRCJYntqmF/3cCuuu0h/v1jxKA888
         pcmBRHsiMmLRBAi8IYio5/cKlRMvzj4FcDxzkLhnj050yvQrc9Y1F2XzKmuYr5NBlcP1
         EpPbrkvpKqrj1yDytJDpzeEKUPlcQGBPnhKCW4YtvBC64iiFEdkoC0QwKJLipXFkq7wc
         jGtl3rS0rfb7Pcfqsc0daraaxrNMh7MKpbrNuhkhT76TdPMOj1SNGsX7ycRIVoJ3AQy9
         BDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686858150; x=1689450150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEzNrFy4XtnBJchIRCyudJpLzlojDK3YzlAqwYMXFT0=;
        b=evK9XcKYvby8kIu6SOmKF6x5//fgQ5KesSfu8CwK2aq4xBp/JIYE90DR0x2iKaGnOb
         shf2iO+HVgpDcjwxLIIYXr5REiTzLJMzlYHMAYegK7Y9lrsj1CQIZozm2P4ps4ZStyjc
         ejx8Ebv7uuMAcvYiU4sHroMH9BABlVlVwV5MUnIb96XcJiYjYuI69Eo7717J8Z9B6Txk
         i/MDjrxF1xK/eEY6OBy8coD6j1+TYm9OdtIkMLG7GTKAAmEhkyi1+QN4IQEZnllBry0F
         hBb5qtDpWNgYSb4Ym6+PVfVYQPI0iPREhneeLbJqvifUXlgqKEMeVFIcMYAsM+CegSLs
         mtOg==
X-Gm-Message-State: AC+VfDwNXzqF3HXlWUVmEWrjWQfhRGNFqzhaqSuYYI1/JyVzheakZgEH
        x0lG1vNjvcCnZNRuxPHdlrt54rR1AI04tGYpSN3wS4kr0uk6CBt5CEs=
X-Google-Smtp-Source: ACHHUZ4DAcb8XJ7cK5trIjfYu8JayVxt4ZPxnD/vGCWza1Eoy4aPA1/eOXTHCyXUZSdlUS0q7KBknTMFqsdih3/7QPM=
X-Received: by 2002:a67:f34d:0:b0:43b:38a5:f8a0 with SMTP id
 p13-20020a67f34d000000b0043b38a5f8a0mr494060vsm.14.1686858149899; Thu, 15 Jun
 2023 12:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230615-mips-mark-core_vpe_count-as-init-v1-1-99c124367ea8@kernel.org>
In-Reply-To: <20230615-mips-mark-core_vpe_count-as-init-v1-1-99c124367ea8@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 15 Jun 2023 15:42:16 -0400
Message-ID: <CAKwvOdndp=2h9se6ddGiYJ6S4o_ROFLD2CH5ZuW-SRa=DMapzw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Mark core_vpe_count() as __init
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     tsbogend@alpha.franken.de, trix@redhat.com,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
        llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 15, 2023 at 12:21=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> After commit 96cb8ae28c65 ("MIPS: Rework smt cmdline parameters"),
> modpost complains when building with clang:
>
>   WARNING: modpost: vmlinux.o: section mismatch in reference: core_vpe_co=
unt (section: .text) -> smp_max_threads (section: .init.data)
>
> This warning occurs when core_vpe_count() is not inlined, as it appears
> that a non-init function is referring to an init symbol. However, this
> is not a problem in practice because core_vpe_count() is only called
> from __init functions, cps_smp_setup() and cps_prepare_cpus().
>
> Resolve the warning by marking core_vpe_count() as __init, as it is only
> called in an init context so it can refer to init functions and symbols
> and have its memory freed on boot.
>
> Fixes: 96cb8ae28c65 ("MIPS: Rework smt cmdline parameters")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/mips/kernel/smp-cps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index bea6a13ea464..92575222713b 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -29,7 +29,7 @@ static DECLARE_BITMAP(core_power, NR_CPUS);
>
>  struct core_boot_config *mips_cps_core_bootcfg;
>
> -static unsigned core_vpe_count(unsigned int cluster, unsigned core)
> +static unsigned __init core_vpe_count(unsigned int cluster, unsigned cor=
e)
>  {
>         return min(smp_max_threads, mips_cps_numvps(cluster, core));
>  }
>
> ---
> base-commit: 5cad8323040bb8d47e130c10ea4dcb7175c7602a
> change-id: 20230615-mips-mark-core_vpe_count-as-init-600dc73e367d
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers
