Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B063212F
	for <lists+linux-mips@lfdr.de>; Sun,  2 Jun 2019 01:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfFAXqp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jun 2019 19:46:45 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:37574 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfFAXqp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jun 2019 19:46:45 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 12DA014FA9CFA;
        Sat,  1 Jun 2019 16:46:44 -0700 (PDT)
Date:   Sat, 01 Jun 2019 16:46:43 -0700 (PDT)
Message-Id: <20190601.164643.756724745563418604.davem@davemloft.net>
To:     hch@lst.de
Cc:     torvalds@linux-foundation.org, paul.burton@mips.com,
        jhogan@kernel.org, ysato@users.sourceforge.jp, dalias@libc.org,
        npiggin@gmail.com, khalid.aziz@oracle.com, andreyknvl@google.com,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: RFC: switch the remaining architectures to use generic GUP v2
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190601074959.14036-1-hch@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sat, 01 Jun 2019 16:46:44 -0700 (PDT)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Christoph Hellwig <hch@lst.de>
Date: Sat,  1 Jun 2019 09:49:43 +0200

> below is a series to switch mips, sh and sparc64 to use the generic
> GUP code so that we only have one codebase to touch for further
> improvements to this code.  I don't have hardware for any of these
> architectures, and generally no clue about their page table
> management, so handle with care.
> 
> Changes since v1:
>  - fix various issues found by the build bot
>  - cherry pick and use the untagged_addr helper form Andrey
>  - add various refactoring patches to share more code over architectures
>  - move the powerpc hugepd code to mm/gup.c and sync it with the generic
>    hup semantics

I will today look seriously at the sparc64 stuff wrt. tagged pointers.
