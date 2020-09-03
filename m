Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D3125BD32
	for <lists+linux-mips@lfdr.de>; Thu,  3 Sep 2020 10:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgICI1L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Sep 2020 04:27:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:50509 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbgICI1L (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Sep 2020 04:27:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kDkaL-0000I1-00; Thu, 03 Sep 2020 10:27:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 36F7FC0E85; Thu,  3 Sep 2020 10:16:14 +0200 (CEST)
Date:   Thu, 3 Sep 2020 10:16:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Nick Terrell <terrelln@fb.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] MIPS: Add support for ZSTD v3
Message-ID: <20200903081614.GA6220@alpha.franken.de>
References: <20200901142651.1165237-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901142651.1165237-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 01, 2020 at 04:26:49PM +0200, Paul Cercueil wrote:
> Hi,
> 
> This small patchset adds support for self-extracting kernels compressed
> with ZSTD.
> 
> Nick:
> I dropped your Reviewed-by on patch [1/2] since the code changed.
> 
> Cheers,
> -Paul
> 
> Paul Cercueil (2):
>   lib: decompress_unzstd: Limit output size
>   MIPS: Add support for ZSTD-compressed kernels
> 
>  arch/mips/Kconfig                      |  1 +
>  arch/mips/boot/compressed/Makefile     |  3 ++-
>  arch/mips/boot/compressed/decompress.c |  4 ++++
>  arch/mips/boot/compressed/string.c     | 17 +++++++++++++++++
>  lib/decompress_unzstd.c                |  7 ++++++-
>  5 files changed, 30 insertions(+), 2 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
