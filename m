Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12432A587
	for <lists+linux-mips@lfdr.de>; Sat, 25 May 2019 18:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfEYQzE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 May 2019 12:55:04 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:56570 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfEYQzD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 May 2019 12:55:03 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id B527D14FA25C4;
        Sat, 25 May 2019 09:55:02 -0700 (PDT)
Date:   Sat, 25 May 2019 09:55:00 -0700 (PDT)
Message-Id: <20190525.095500.1447810293414838145.davem@davemloft.net>
To:     hch@lst.de
Cc:     torvalds@linux-foundation.org, paul.burton@mips.com,
        jhogan@kernel.org, ysato@users.sourceforge.jp, dalias@libc.org,
        npiggin@gmail.com, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] sparc64: use the generic get_user_pages_fast code
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190525133203.25853-6-hch@lst.de>
References: <20190525133203.25853-1-hch@lst.de>
        <20190525133203.25853-6-hch@lst.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sat, 25 May 2019 09:55:03 -0700 (PDT)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Christoph Hellwig <hch@lst.de>
Date: Sat, 25 May 2019 15:32:02 +0200

> The sparc64 code is mostly equivalent to the generic one, minus various
> bugfixes and two arch overrides that this patch adds to pgtable.h.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: David S. Miller <davem@davemloft.net>
