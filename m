Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9EB141979F
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 17:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbhI0PVk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 11:21:40 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:42649 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234972AbhI0PVk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 11:21:40 -0400
Received: by mail-vk1-f179.google.com with SMTP id o204so7085589vko.9;
        Mon, 27 Sep 2021 08:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F5wb4ZX9gwgasne0NhWUEprI9AwQOWamOuZRWGphiLM=;
        b=kUVo7+CyhC5FEcruzclsk61G8fYYLZZzDxNpLfe1ksKxmnRk6BT2jy6oWTstcJOnra
         LzvUAObgEM4qHTh+1cPS96ntwekqquZtDEU5r3eUoKbwwfYWtZQ8lJUBW93a5dg/uvbe
         VQG377Z34yci1d09lhe4VPraD8MZmdIlltFM44M1R2DXYLKHLyuKhrvhS5nYufdZVKik
         I7Jspz4N3xepn8OKvVbQ7yKzJ7IHFYB1Kc5zQX1nDbZp6rqNFCmTBgFxEt9TqqZcWXb7
         MAGQVoblLwp4T1BYx8Xpz8uDgrSLFCew5OdqjRkzrSQAfCHO36d0SE3hgNgMyDNWyGrz
         YQrg==
X-Gm-Message-State: AOAM533y2j7ZQLsx8Rh/x/x8TduU0T0zWtL0Tktc3mJecbDmInTMhx2v
        s1KEKASZZ/hxvectbuUEMA3wnnwojDMpxFDY0Mw=
X-Google-Smtp-Source: ABdhPJxj2OeFkxklgcIGHyfFHROJ0kJKH8P7BoepnpioKOsPmd/3DG/ainzZgT/3Vd7Z0PN8a+SyRrxXemz3PM2L1AY=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr572707vkj.11.1632756001800;
 Mon, 27 Sep 2021 08:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210927150518.8607-1-david@redhat.com> <20210927150518.8607-3-david@redhat.com>
In-Reply-To: <20210927150518.8607-3-david@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Sep 2021 17:19:50 +0200
Message-ID: <CAMuHMdWuRtxwRCy-x63s9BkDKk+hkXhEfZYC5pmXomzCuDBrYg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] memblock: allow to specify flags with memblock_add_node()
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 27, 2021 at 5:05 PM David Hildenbrand <david@redhat.com> wrote:
> We want to specify flags when hotplugging memory. Let's prepare to pass
> flags to memblock_add_node() by adjusting all existing users.
>
> Note that when hotplugging memory the system is already up and running
> and we don't want to add the memory first and apply flags later: it
> should happen within one memblock call.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

>  arch/m68k/mm/mcfmmu.c            | 3 ++-
>  arch/m68k/mm/motorola.c          | 6 ++++--

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
