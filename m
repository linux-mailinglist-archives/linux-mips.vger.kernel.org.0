Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD2A22201F
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 12:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgGPKB5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 06:01:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:38164 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbgGPKB5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 06:01:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw0iB-0008Mc-02; Thu, 16 Jul 2020 12:01:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A5E8EC080E; Thu, 16 Jul 2020 11:55:58 +0200 (CEST)
Date:   Thu, 16 Jul 2020 11:55:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Peng Fan <fanpeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mips/vdso: Fix resource leaks in genvdso.c
Message-ID: <20200716095558.GF8455@alpha.franken.de>
References: <1594729818-7859-1-git-send-email-fanpeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594729818-7859-1-git-send-email-fanpeng@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 14, 2020 at 08:30:18PM +0800, Peng Fan wrote:
> Close "fd" before the return of map_vdso() and close "out_file"
> in main().
> 
> Signed-off-by: Peng Fan <fanpeng@loongson.cn>
> ---
> 
> v2:
>   - add one missing fclose()
> 
> ---
>  arch/mips/vdso/genvdso.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
