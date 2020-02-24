Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 762BD16A38D
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2020 11:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgBXKKE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Feb 2020 05:10:04 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36760 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgBXKKE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Feb 2020 05:10:04 -0500
Received: by mail-ot1-f67.google.com with SMTP id j20so8218131otq.3;
        Mon, 24 Feb 2020 02:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Om7nrQID6FlX5mnR8/K/zRP8xkeIh57Aql009khB7UA=;
        b=QwD/RMvhWiOiK4id1MLqkGh3lbx3VjXs8lj5y8sF6Wj3NZ20Wx6cWasU7F6I4mo5H0
         03PLhV/GaN2Ypp7gTSQu9ZaVs9+Z1MwMY7k9PYh1B68Ph8Zj7gQeArFlthUfczMHdcl2
         SNUG8uOc+sEDY/XX28Foia7Sxjp4hSkQqmepq39AYpi/kbFuWum0WgvmKoDVMjlijr0t
         E2iausk9rL0Cf08R/D1YBymPGkiD6BcSXaxRt9GHcYO5ZnpBKP1rlEjnaUl+qkJo93CP
         qqt8llm5dgp+Tbju8hEQ29uUWWuHKcGdIn70VtuXJg1BNCbGpUnpIhK5XhKO/Gu3uWfB
         4c9A==
X-Gm-Message-State: APjAAAWJOUl2uMmEdvUacUrUjMQKr2feoHkH3cYqT1KNca1ff8Oczsur
        tNsSX12OXRGcjTxBQbZDJl4uCF3Bb+ODPh2yKkY=
X-Google-Smtp-Source: APXvYqy+o+XiQlh0QOaMvapvhpar/cq7MfutM+nGBFLIiCFASeVH1V3juGWAUqxFnDRUGQgq4DrqTaiwZyWthqnvpxI=
X-Received: by 2002:a05:6830:1d4:: with SMTP id r20mr24550265ota.107.1582539003523;
 Mon, 24 Feb 2020 02:10:03 -0800 (PST)
MIME-Version: 1.0
References: <1582525304-32113-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1582525304-32113-1-git-send-email-anshuman.khandual@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Feb 2020 11:09:52 +0100
Message-ID: <CAMuHMdXMSTLevTH1gkM8B53LtRUQ80o=t+W27z0QT-dNKkkYgQ@mail.gmail.com>
Subject: Re: [PATCH] mm/vma: Append unlikely() while testing VMA access permissions
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-csky@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Anshuman,

Thanks for your patch!

On Mon, Feb 24, 2020 at 7:22 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> It is unlikely that an inaccessible VMA without required permission flags
> will get a page fault. Hence lets just append unlikely() directive to such

Why? Isn't it the idea that you get a page fault when the page is not
accessible?

> checks in order to improve performance while also standardizing it across
> various platforms.

Does it make a difference to add these? Have you benchmarked this?
https://lwn.net/Articles/420019/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
