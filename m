Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418FA3921A6
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 22:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbhEZUvW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 May 2021 16:51:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:56366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233669AbhEZUvS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 May 2021 16:51:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F4E0611BE;
        Wed, 26 May 2021 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1622062183;
        bh=aG3UINtyIudcCr1jcShtuROgiwkLr+yC67i/e+rJ130=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OQwH8Nh0p62kPnQVnKw9Qkv+XdO/rDpNJhqsOhVin5GIOJh/KcfPrFp+TCZ0SQxtT
         HIKBj/oMDfISR9tnVTIv3uFVdY2pchbUAk+iU7zkSYs9T5s+IHs5kuMj9oX5DSNDO7
         15hbwX00Wy9vVEFS81Q+EEpxkZp9BzNquTJXj8EU=
Date:   Wed, 26 May 2021 13:49:42 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org,
        =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default"
Message-Id: <20210526134942.2bf26d5cf5a9243583aec131@linux-foundation.org>
In-Reply-To: <20210526094335.92948-1-tsbogend@alpha.franken.de>
References: <20210526094335.92948-1-tsbogend@alpha.franken.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 26 May 2021 11:43:35 +0200 Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:

> This reverts commit f685a533a7fab35c5d069dcd663f59c8e4171a75.
> 
> MIPS cache flush logic needs to know whether the mapping was already
> established to decide how to flush caches. This is done by checking the
> valid bit in the PTE. The commit above breaks this logic by setting
> the valid in the PTE in new mappings, which causes kernel crashes.

Thanks.  I added

Fixes: f685a533a7f ("MIPS: make userspace mapping young by default")
Cc: <stable@vger.kernel.org>
