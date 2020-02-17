Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED85160BA7
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 08:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgBQHg2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 02:36:28 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41995 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgBQHg2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Feb 2020 02:36:28 -0500
Received: by mail-oi1-f196.google.com with SMTP id j132so15806714oih.9;
        Sun, 16 Feb 2020 23:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SuOiO3WgSyJKnxTjJOQN1meORdYh4/iYGl3q0xfpi6g=;
        b=lwVDQYb2modr4q2GgEpSvbkqRMWo1/agGejwMn+dDFAFMltLrsjz5vmrChPV/hkMsY
         M0ixASaJS2i1sUVlQWUewYPRkq73DTnyEAb6qwMbU97XXYyMBt82fqR9p6KcprVj2QP0
         SgQyan9Ltu+WjKK9I2C9oy0mys5SIWs055YAbViuz0n00Cg5ufqdRNWTLhp/unZJWEES
         mGujjexNSyIFDCE1JPJ6rLb1GscDjI4uB95Hhvcji04zk932lnvtr4g9opc3/r3eM2b3
         ZB2VUcKTGj4V4LS3aeVwG0n5O8TianOytz2cI9dpuz9wQlqXkYOYzfvuG10TZIU0eKfX
         yPrQ==
X-Gm-Message-State: APjAAAUANc/TcO2eBQ9a6eEcChfVG9nit+tIRtexncSpf04sCe34Ozfv
        /ChahXXioFsuyFzEAEf5cynxJvX8k+FvmAIbseQ=
X-Google-Smtp-Source: APXvYqxKa9A1iXEoFtvs2SQx0wwpyI+D+8O+BpCQT5TTiBwESFO3k3MigqRo69thtGMj1kz+e9do4m1f9fB6IxLYpJM=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr8802173oia.148.1581924987398;
 Sun, 16 Feb 2020 23:36:27 -0800 (PST)
MIME-Version: 1.0
References: <1581915833-21984-1-git-send-email-anshuman.khandual@arm.com> <1581915833-21984-3-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1581915833-21984-3-git-send-email-anshuman.khandual@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Feb 2020 08:36:16 +0100
Message-ID: <CAMuHMdU0DSTZMn6akY8qZR3SDxVEruEsd3Q3sYf-tn_ooXDDBw@mail.gmail.com>
Subject: Re: [PATCH 2/5] mm/vma: Make vma_is_accessible() available for
 general use
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guo Ren <guoren@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mel Gorman <mgorman@suse.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 17, 2020 at 6:04 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> Lets move vma_is_accessible() helper to include/linux/mm.h which makes it
> available for general use. While here, this replaces all remaining open
> encodings for VMA access check with vma_is_accessible().
>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/mm/fault.c    | 2 +-

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
