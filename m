Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A772419F3
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 03:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406321AbfFLB1M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 21:27:12 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41418 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406215AbfFLB1M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 21:27:12 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so8052610pff.8;
        Tue, 11 Jun 2019 18:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=CtAUnKccNVM3Ar1NimuBm5cYjQQHpUUV35G3NGl7I18=;
        b=agp8LjxgsiKUNBRzMQ6B1lsikXTP9MXAxScOYcZnsKclD0N+jlNVoUl/hzW4poyT5e
         3L5Kpn7BSqpfe4Vqr0OMLbW+npbpmydrSh4Nk6mj5SGyx5Jj6jf653H8VmcdoFa5nFlP
         PVXiNmiBrwZEiKboElbWiL4LdjFKAAbWcoG28ZIwtcy8dPhR9hlh49PJ6xikrmMZLHzP
         20qVkn6ttaCMzY1I08lsTIN5eoleBIFYn7aRuLf/OzGJBwoDwiiv7JFIo5WL8ooodEKt
         b/SI9mnoX3vTwRgRrKm2an9+aTc8TPah2tNonQDJrq5z+DrzQV1yJmuEkhrXeIPbcuOQ
         mhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=CtAUnKccNVM3Ar1NimuBm5cYjQQHpUUV35G3NGl7I18=;
        b=FzhAsGYxmBnN668L0avinUo4XrpGKzI143/f++HbbliQdoUWYL7rIB07JskNWd+DU7
         9+jmbLvpyufPPU8eq2izcCQRPo6orwcxUzTS5OUq7UHKXLLbMSF/8DIg84j79oFaTWzH
         E/Wf2FNiDzxa7xnKm9OoWDmikQTdDGdNnhVVBS6MJm6hrgiPmAba2fijUfhXxYpekJD5
         un5jWa/UL28tWsTkCFge14d0BYjkEI442PL0hQcNImY80LK60XtCruQlHxXE12hXaNrD
         TVcToHfg5GzGvJ2hFzaL1CPH0OrbIsZZwU7xYr0epJ4Xmv6eUpK9T9Zd/dtqzCSv62oS
         Ovpw==
X-Gm-Message-State: APjAAAW63NOZnX17illK661RcsXbWTv8zbb9LMRh6E+aeNPIC6DjZn8x
        UlVnDtutcFL11xnw3IiiJkk=
X-Google-Smtp-Source: APXvYqyJ4j/UPWrjvOrQasPCqbyNI8I79UTnDUErLKqAMrK1NLwjt0JJmzYLlyxhcupMkfrOP1908w==
X-Received: by 2002:a17:90a:cb87:: with SMTP id a7mr10403544pju.130.1560302831475;
        Tue, 11 Jun 2019 18:27:11 -0700 (PDT)
Received: from [10.2.189.129] ([66.170.99.2])
        by smtp.gmail.com with ESMTPSA id c10sm3547108pjq.14.2019.06.11.18.27.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 18:27:10 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
From:   Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <1560300464.nijubslu3h.astroid@bobo.none>
Date:   Tue, 11 Jun 2019 18:27:09 -0700
Cc:     Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        the arch/x86 maintainers <x86@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <0441EC80-B09F-4722-B186-E42EB6A83386@gmail.com>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-17-hch@lst.de> <1560300464.nijubslu3h.astroid@bobo.none>
To:     Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> On Jun 11, 2019, at 5:52 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
> 
> Christoph Hellwig's on June 12, 2019 12:41 am:
>> Instead of passing a set of always repeated arguments down the
>> get_user_pages_fast iterators, create a struct gup_args to hold them and
>> pass that by reference.  This leads to an over 100 byte .text size
>> reduction for x86-64.
> 
> What does this do for performance? I've found this pattern can be
> bad for store aliasing detection.

Note that sometimes such an optimization can also have adverse effect due to
stack protector code that gcc emits when you use such structs.

Matthew Wilcox encountered such a case:
https://patchwork.kernel.org/patch/10702741/
