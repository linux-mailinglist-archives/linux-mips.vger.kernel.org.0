Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA7B5AC1A
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2019 17:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfF2PPi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Jun 2019 11:15:38 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34947 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfF2PPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Jun 2019 11:15:38 -0400
Received: by mail-pf1-f194.google.com with SMTP id d126so4412927pfd.2;
        Sat, 29 Jun 2019 08:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GttoCpwXZ0YnEgD480v+8xB8TagEdr3d83SlTOyEyRY=;
        b=NroLZ76Oo2crKQBJo8fp4wAzbrnPDUyi6puDLTX4qr11cTGH0bOeLepMhvdQwo020B
         6pSoWWR3kH9ARotFu1VoLKq6TSkJTxnPuTI+vnkbouCiYTmlB0siA0LLLwkSWELVY4CK
         B+AHB27xD0ZZtvlZYod6I2Kb2OBLCXiVyLpVClEMHQnK9lP8gLwCCqFYFsjv0bK9djvg
         Ip/SsNDsbNHaOhOd02uWeVmcEQMegCbYeZeUFqCm22rmEQRnUUfF69IsdbjxePKKKYqS
         xiuv7ChyahFmSIJuO7fdh+Iu669GD3DcuLWeVzI495UDhi+Douu8YoWlFVimf0oV7mWe
         xUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=GttoCpwXZ0YnEgD480v+8xB8TagEdr3d83SlTOyEyRY=;
        b=OR6vOQFMjQrzauk+EcQ8X4Se1IGWpxi+lgYBp19LU0wp4mZmudOOfquyu8mSPbLW23
         vhPgRi9ZymSVDugEcEuDrzj4i7jYKz7MJHfRB1YL84p3C6u3B9fz5VNtSv5BxmByaDZ/
         D9lBCgd9xcfLQI9TaUz2tBdlHR1ijAOiFJXg/394Yg1sx0aaNdjAnuN5pVJAqljAMQmH
         JDUQ/ssxhhK+4Fme+PgybRouJGyjBvh6vQ+SRhqh5mleONg5Ps65XzRo+KD65dD/dGoq
         05eA94iR7Yym8c+dWRuSmnui97D+ZItFUdkhb0cCBm1sssCXdJHOPBohueoBLFT7Ax3t
         f7OQ==
X-Gm-Message-State: APjAAAVkqlFkv9Z9j0WHGhFk0Zhz94BM63aDg2TQdfFxyMufC4vPJ/Iw
        Sdu81GNyJEvbtFeYkWprN+s=
X-Google-Smtp-Source: APXvYqyVpBWX0MYstsM24PSiU2G6Tv937ge94evRwlPCysvJPgEe57082Y4skMOs3eYeU4vWifx+4w==
X-Received: by 2002:a63:4e58:: with SMTP id o24mr14663917pgl.366.1561821337246;
        Sat, 29 Jun 2019 08:15:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 85sm8120381pfv.130.2019.06.29.08.15.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 08:15:36 -0700 (PDT)
Date:   Sat, 29 Jun 2019 08:15:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/16] sh: use the generic get_user_pages_fast code
Message-ID: <20190629151535.GA18067@roeck-us.net>
References: <20190625143715.1689-1-hch@lst.de>
 <20190625143715.1689-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625143715.1689-7-hch@lst.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 25, 2019 at 04:37:05PM +0200, Christoph Hellwig wrote:
> The sh code is mostly equivalent to the generic one, minus various
> bugfixes and two arch overrides that this patch adds to pgtable.h.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

sh:defconfig no longer builds with this patch applied.

mm/gup.c: In function 'gup_huge_pud':
arch/sh/include/asm/pgtable-3level.h:40:36: error:
	implicit declaration of function 'pud_pfn'; did you mean 'pte_pfn'? 

Bisect log attached.

Guenter

---
# bad: [48568d8c7f479ec45b9c3d02b4b1895f3ef61a03] Add linux-next specific files for 20190628
# good: [4b972a01a7da614b4796475f933094751a295a2f] Linux 5.2-rc6
git bisect start 'HEAD' 'v5.2-rc6'
# good: [89a77c9176fe88f68c3bf7bd255cfea6797258d4] Merge remote-tracking branch 'crypto/master'
git bisect good 89a77c9176fe88f68c3bf7bd255cfea6797258d4
# good: [2cedca636ad73ed838bd636685b245404e490c73] Merge remote-tracking branch 'security/next-testing'
git bisect good 2cedca636ad73ed838bd636685b245404e490c73
# good: [ea260819fdc2f8a64e6c87f3ad80ecc5e4015921] Merge remote-tracking branch 'char-misc/char-misc-next'
git bisect good ea260819fdc2f8a64e6c87f3ad80ecc5e4015921
# good: [aca42ca2a32eacf804ac56a33526f049debc8ec0] Merge remote-tracking branch 'rpmsg/for-next'
git bisect good aca42ca2a32eacf804ac56a33526f049debc8ec0
# good: [f4cd0c7f3c07876f7173b5306e974644c6eec141] Merge remote-tracking branch 'pidfd/for-next'
git bisect good f4cd0c7f3c07876f7173b5306e974644c6eec141
# bad: [09c57a8ab1fc3474b4a620247a0f9e3ac61c4cfe] mm/sparsemem: support sub-section hotplug
git bisect bad 09c57a8ab1fc3474b4a620247a0f9e3ac61c4cfe
# good: [aaffcf10880c363870413c5cdee5dfb6a923e9ae] mm: memcontrol: dump memory.stat during cgroup OOM
git bisect good aaffcf10880c363870413c5cdee5dfb6a923e9ae
# bad: [81d90bb2d2784258ed7c0762ecf34d4665198bad] um: switch to generic version of pte allocation
git bisect bad 81d90bb2d2784258ed7c0762ecf34d4665198bad
# bad: [dadae650472841f004882a2409aa844e37809c60] sparc64-add-the-missing-pgd_page-definition-fix
git bisect bad dadae650472841f004882a2409aa844e37809c60
# good: [d1edd06c6ac8c8c49345ff34de1c72ee571f3f7b] mm: memcg/slab: stop setting page->mem_cgroup pointer for slab pages
git bisect good d1edd06c6ac8c8c49345ff34de1c72ee571f3f7b
# good: [b1ceaacca9e63794bd3f574c928e7e6aca01bce7] mm: simplify gup_fast_permitted
git bisect good b1ceaacca9e63794bd3f574c928e7e6aca01bce7
# good: [59f238b3353caf43b118e1bb44010aa1abd56d7f] sh: add the missing pud_page definition
git bisect good 59f238b3353caf43b118e1bb44010aa1abd56d7f
# bad: [51bbf54b3f26a85217db720f4e5b01a6c4d3f010] sparc64: add the missing pgd_page definition
git bisect bad 51bbf54b3f26a85217db720f4e5b01a6c4d3f010
# bad: [be748d6e72113580af7e37ad68a0047659e60189] sh: use the generic get_user_pages_fast code
git bisect bad be748d6e72113580af7e37ad68a0047659e60189
# first bad commit: [be748d6e72113580af7e37ad68a0047659e60189] sh: use the generic get_user_pages_fast code
