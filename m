Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8937C1E9BBC
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 04:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgFACfY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 May 2020 22:35:24 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35918 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgFACfY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 31 May 2020 22:35:24 -0400
Received: by mail-io1-f68.google.com with SMTP id y18so5406037iow.3
        for <linux-mips@vger.kernel.org>; Sun, 31 May 2020 19:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SrEp3na+e3s0qyGgUxN5S3XrGTS+kfrllxDekg0InVg=;
        b=t4jeQpAjv3IoHRbfFxASbfVQ/ERCnkBIIiNqvp44RFq30rX7/SKivM7ZozOTm8NoFp
         7PtNm4thkUs3jUY828udwIEItQ3rllvvOubnvr08lGc8lzt/h4tk4FcKDo3tZOPG6w8F
         ABQDnO7hoTKiVVO+IUpQ/tdKj4lTPGfh7SGkLp5e3EyYf4B8rtzaM/aMnvshE4ut4ZBF
         vqJ6eHSOi1JKa38Gkah59pZq4D98Qq7m12AU1UDdK8B1+n7E3MpSCo1vIyLGO2brZg9t
         uUUtLtj2SFnTpzlcJ7h1nDB6JqpNe6dkYrnrUADwyVR7ztlCE9mc2ba9/7To1YAR4aXw
         bsEg==
X-Gm-Message-State: AOAM532S74SddkQQzbGf2SJJpPbCtNSlE14TJr64m6FNSDP7j4nF2eBh
        ma0D+wfj0BnssW3Ht9XyJzwdDn0UWNa9jJ0V4xs=
X-Google-Smtp-Source: ABdhPJzMx+ImcYa9lkaug4A7h7IfBHeEs+I8f/wZe4I6hxflXT0xR+Ye9lWmr8Ll9s8M152sFSP4rCgKlHDtvN4pG9g=
X-Received: by 2002:a02:85a5:: with SMTP id d34mr18588994jai.123.1590978922278;
 Sun, 31 May 2020 19:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <1590220305-29176-1-git-send-email-chenhc@lemote.com> <alpine.LFD.2.21.2006010253080.3271@redsun52.ssa.fujisawa.hgst.com>
In-Reply-To: <alpine.LFD.2.21.2006010253080.3271@redsun52.ssa.fujisawa.hgst.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 1 Jun 2020 10:35:10 +0800
Message-ID: <CAAhV-H6Wm7wH_3J4xMf-5MTT++4jPTVA7HLX5m-4Hy8vQzAONQ@mail.gmail.com>
Subject: Re: [PATCH V2] MIPS: Tidy up CP0.Config6 bits definition
To:     "Maciej W. Rozycki" <macro@wdc.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        WANG Xuerui <git@xen0n.name>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

OK, let me fix it.

Huacai

On Mon, Jun 1, 2020 at 10:13 AM Maciej W. Rozycki <macro@wdc.com> wrote:
>
> On Sat, 23 May 2020, Huacai Chen wrote:
>
> > CP0.Config6 is a Vendor-defined register whose bits definitions are
> > different from one to another. Recently, Xuerui's Loongson-3 patch and
> > Serge's P5600 patch make the definitions inconsistency and unclear.
> >
> > To make life easy, this patch tidy the definition up:
> > 1, Add a _MTI_ infix for proAptiv/P5600 feature bits;
> > 2, Add a _LOONGSON_ infix for Loongson-3 feature bits;
> > 3, Add bit6/bit7 definition for Loongson-3 which will be used later.
>
>  What a mess!  We use *prefixes* for vendor- or processor-specific names,
> e.g.:
>
> #define R3K_ENTRYLO_G           (_ULCAST_(1) << 8)
> #define R4K_CONF_SW             (_ULCAST_(1) << 20)
> #define MTI_CONF7_PTC           (_ULCAST_(1) << 19)
>
> etc. and MIPS_ denotes a MIPS architectural (as in R1, R2, etc., i.e. not
> legacy) definition, e.g.:
>
> #define MIPS_CONF_VI            (_ULCAST_(1) <<  3)
>
>  So to be consistent these would have to be:
>
> > +/* Config6 feature bits for proAptiv/P5600 */
> > +
> >  /* Jump register cache prediction disable */
> > -#define MIPS_CONF6_JRCD              (_ULCAST_(1) << 0)
> > +#define MIPS_CONF6_MTI_JRCD          (_ULCAST_(1) << 0)
>
> #define MTI_CONF6_JRCD          (_ULCAST_(1) << 0)
>
> etc.
>
> > +/* Config6 feature bits for Loongson-3 */
> > +
> > +/* Loongson-3 internal timer bit */
> > +#define MIPS_CONF6_LOONGSON_INTIMER  (_ULCAST_(1) << 6)
>
> #define LOONGSON_CONF6_INTIMER  (_ULCAST_(1) << 6)
>
> etc.
>
>   Maciej
