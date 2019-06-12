Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2473C419BF
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 02:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406388AbfFLAzx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 20:55:53 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43276 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406117AbfFLAzx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 20:55:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id i189so8515090pfg.10;
        Tue, 11 Jun 2019 17:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :user-agent:message-id:content-transfer-encoding;
        bh=JNCR25wKoUF8GmXR1+h5Qxc2sputayqDi9OAgx3GkdA=;
        b=NiAwzvuW1158vo7YqCqImrGi+gOspOS5ptLbXAIoG+Z9ze7uMdcN2eGWAsbNMH7+TG
         3ZkAe/orroen/eLz2qm7eGvkJnmLfn0Ao/sWgWXpra1h3e97Fbq8GTUU6tsqNa0XX05a
         hylXtqpcRAnnO0Mj6KHPmtmbR1ePDFiDX84pGRfqnwJNRN6N/PrW6Cr39MB8mYO7MJlz
         5R3W6R2v9YZy+6iSs2yC/ugh7qMnOvJh1iKbpPuLSnT/ouMOHYhMPkWq+xopLIjw9uu9
         yeTUr5c2xq1OasjqxvVRtr5VrtPFnBVEv4hsmatE9KIsBtR0qj+CcdswIM50TMbSCQvN
         o6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:user-agent:message-id:content-transfer-encoding;
        bh=JNCR25wKoUF8GmXR1+h5Qxc2sputayqDi9OAgx3GkdA=;
        b=R5HR+XjXj44+vHeimHoFKSAZgrjD2qTGGD+MQgsUPI4z7uXaCcWDYG3h+GayoOpzuG
         nVaw5jp4rawhj5qcHlGwskh0y59Ema2P2UHD7Qh+FQs8lVS4SJ76ZawDq/bbHlKOIJYE
         jEKaKbFYoYC8dWo+F6uNDkb3pTHWZYbZOogeedxhji7S5vMLYIegdanZlVrCvC2F9iAj
         klPEufI0RO+ch8AEvfaDZBQh7tEc/PwrAFEUg5/9RKKbP1kU6K0uF1xSNIw/iupjO5Ic
         H9f50qdaOvraM4bpQCXeQlzz9IOlwaxQE2P/KGfNsGI4NOjj6yl3EWPd4pdUpAq6EZAn
         cHFQ==
X-Gm-Message-State: APjAAAXHgo2fBKJZ/cJIY1QCDao4cP0bspsylNKZIwL5kEOJ8jueygfx
        K/Kv4B/+WzgfPLrvS+5gr2U=
X-Google-Smtp-Source: APXvYqwFJLADjuhoiaHTsjm93GY2KEIrK+4logzMa1qKh7V/rBYbqMu9MhPfYO/mkPAOmVvGgW7CCQ==
X-Received: by 2002:a63:b07:: with SMTP id 7mr22723250pgl.21.1560300952204;
        Tue, 11 Jun 2019 17:55:52 -0700 (PDT)
Received: from localhost (242.60.168.202.static.comindico.com.au. [202.168.60.242])
        by smtp.gmail.com with ESMTPSA id u2sm3765259pjv.9.2019.06.11.17.55.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 17:55:51 -0700 (PDT)
Date:   Wed, 12 Jun 2019 10:52:53 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To:     Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Christoph Hellwig <hch@lst.de>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        x86@kernel.org
References: <20190611144102.8848-1-hch@lst.de>
        <20190611144102.8848-17-hch@lst.de>
In-Reply-To: <20190611144102.8848-17-hch@lst.de>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560300464.nijubslu3h.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christoph Hellwig's on June 12, 2019 12:41 am:
> Instead of passing a set of always repeated arguments down the
> get_user_pages_fast iterators, create a struct gup_args to hold them and
> pass that by reference.  This leads to an over 100 byte .text size
> reduction for x86-64.

What does this do for performance? I've found this pattern can be
bad for store aliasing detection.

Thanks,
Nick
=
